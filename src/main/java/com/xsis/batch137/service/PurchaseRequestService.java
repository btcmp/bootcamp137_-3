package com.xsis.batch137.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.dao.PurchaseOrderDao;
import com.xsis.batch137.dao.PurchaseOrderDetailDao;
import com.xsis.batch137.dao.PurchaseOrderHistoryDao;
import com.xsis.batch137.dao.PurchaseRequestDao;
import com.xsis.batch137.dao.PurchaseRequestDetailDao;
import com.xsis.batch137.dao.PurchaseRequestHistoryDao;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseOrderDetail;
import com.xsis.batch137.model.PurchaseOrderHistory;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.PurchaseRequestDetail;
import com.xsis.batch137.model.PurchaseRequestHistory;
import com.xsis.batch137.model.User;

@Service
@Transactional
public class PurchaseRequestService {

	@Autowired
	PurchaseRequestDao prDao;
	
	@Autowired
	PurchaseRequestDetailDao prdDao;
	
	@Autowired
	PurchaseRequestHistoryDao prhDao;
	
	@Autowired
	PurchaseOrderDao poDao;
	
	@Autowired
	PurchaseOrderDetailDao podDao;
	
	@Autowired
	PurchaseOrderHistoryDao pohDao;
	
	@Autowired
	ItemInventoryDao iDao;
	
	@Autowired
	HttpSession httpSession;
	
	public void save(PurchaseRequest pr) {
		User user = (User)httpSession.getAttribute("userLogin");
		
		PurchaseRequest pureq = new PurchaseRequest();
		pureq.setId(pr.getId());
		pureq.setOutlet(pr.getOutlet());
		pureq.setPrNo(pr.getPrNo());
		pureq.setReadyTime(pr.getReadyTime());
		pureq.setStatus(pr.getStatus());
		pureq.setNotes(pr.getNotes());
		
		Calendar cal = Calendar.getInstance();
		int thn = cal.get(Calendar.YEAR);
		int bln = cal.get(Calendar.MONTH)+1;
		String bulan;
		if(bln < 10) {
			bulan = "0"+bln;
		} else {
			bulan = Integer.toString(bln);
		}
		int no = prDao.CountPRByMonth(bln, thn)+1;
		String nomor;
		
		if(no < 10) {
			nomor = "00"+no;
		} else if(no < 100) {
			nomor = "0"+no;
		} else {
			nomor = Integer.toString(no);
		}
		
		String prNo = "PR"+thn+bulan+nomor;
		int unique = 0;
		while(unique == 0) {
			prNo = "PR"+thn+bulan+nomor;
			int unik = prDao.CountPrByPrNo(prNo);
			if(unik == 0) {
				unique = 1;
			}else {
				int number = Integer.parseInt(nomor);
				number++;
				if(number < 10) {
					nomor = "00"+number;
				} else if(number < 100) {
					nomor = "0"+number;
				} else {
					nomor = Integer.toString(no);
				}
			}
		}
		
		if(pureq.getId()!=0) {
			pureq.setModifiedOn(new Date());
			PurchaseRequest pure = prDao.getOne(pureq.getId());
			pureq.setCreatedOn(pure.getCreatedOn());
			pureq.setCreatedBy(pure.getCreatedBy());
			pureq.setPrNo(pure.getPrNo());
			pureq.setModifiedBy(user);
		}else {
			pureq.setCreatedOn(new Date());
			pureq.setPrNo(prNo);
			pureq.setCreatedBy(user);
		}
		
		prDao.save(pureq);
		
		List<PurchaseRequestDetail> prds = prdDao.selectDetailByPr(pureq);
		if(prds == null) {
			
		}else {
			for(PurchaseRequestDetail prd : prds) {
				prdDao.delete(prd);
			}
		}
		
		if(pr.getDetail()!=null) {
			for(PurchaseRequestDetail prd : pr.getDetail()) {
				PurchaseRequestDetail puReqDet = new PurchaseRequestDetail();
				puReqDet.setId(prd.getId());
				puReqDet.setCreatedOn(pureq.getCreatedOn());
				puReqDet.setModifiedOn(pureq.getModifiedOn());
				puReqDet.setPurchaseReq(pureq);
				puReqDet.setVariant(prd.getVariant());
				puReqDet.setRequestQty(prd.getRequestQty());
				puReqDet.setCreatedBy(pureq.getCreatedBy());
				puReqDet.setModifiedBy(pureq.getModifiedBy());
				prdDao.save(puReqDet);
			}
		}
		
		if(pr.getId() != 0 && pr.getStatus().equals("Created")) {
			
		}else {
			PurchaseRequestHistory prh = new PurchaseRequestHistory();
			prh.setPurchaseReq(pureq);
			prh.setStatus(pureq.getStatus());
			prh.setCreatedOn(pureq.getCreatedOn());
			prh.setCreatedBy(user);
			prhDao.save(prh);
		}
		
	} // end fungsi save
	
	public List<PurchaseRequest> selectAll(){
		List<PurchaseRequest> prs = prDao.selectAll();
		if(prs.isEmpty()) {
			return null;
		}else {
			for(PurchaseRequest pr : prs) {
				List<PurchaseRequestDetail> prds = prdDao.selectDetailByPr(pr);
				if(prds == null) {
					
				}else {
					pr.setDetail(prds);
				}
			}
			return prs;
		}
		 
	}
	
	public List<PurchaseRequest> selectByOutlet(){
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		List<PurchaseRequest> prs = prDao.searchPRByOutlet(outlet);
		if(prs.isEmpty()) {
			return null;
		}else {
			for(PurchaseRequest pr : prs) {
				List<PurchaseRequestDetail> prds = prdDao.selectDetailByPr(pr);
				if(prds == null) {
					
				}else {
					pr.setDetail(prds);
				}
			}
			return prs;
		}
	}

	public PurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		PurchaseRequest pr = prDao.getOne(id);
		List<PurchaseRequestDetail> prds = prdDao.selectDetailByPr(pr);
		List<PurchaseRequestHistory> prhs = prhDao.selectByPR(pr);
		if(prds.isEmpty()) {
			
		}else {
			pr.setDetail(prds);
		}
		if(prhs.isEmpty()) {
			
		}else {
			pr.setHistory(prhs);
		}
		return pr;
	}
	
	public void approve(long id) {
		User user = (User)httpSession.getAttribute("userLogin");
		prDao.approve(id);
		PurchaseRequest pr = prDao.getOne(id);
		PurchaseRequestHistory prh = new PurchaseRequestHistory();
		prh.setCreatedOn(new Date());
		prh.setPurchaseReq(pr);
		prh.setStatus(pr.getStatus());
		prh.setCreatedBy(user);
		prhDao.save(prh);
	}
	
	public void reject(long id) {
		User user = (User)httpSession.getAttribute("userLogin");
		prDao.reject(id);
		PurchaseRequest pr = prDao.getOne(id);
		PurchaseRequestHistory prh = new PurchaseRequestHistory();
		prh.setCreatedOn(new Date());
		prh.setPurchaseReq(pr);
		prh.setStatus(pr.getStatus());
		prh.setCreatedBy(user);
		prhDao.save(prh);
	}
	
	public void createPo(long id) {
		prDao.createPo(id);
		User user = (User)httpSession.getAttribute("userLogin");
		PurchaseRequest pr = prDao.getOne(id);
		
		List<PurchaseRequestDetail> prds = prdDao.selectDetailByPr(pr);
		
		if(prds.isEmpty()) {
			
		}else {
			pr.setDetail(prds);
		}
		
		PurchaseRequestHistory prh = new PurchaseRequestHistory();
		prh.setCreatedOn(new Date());
		prh.setPurchaseReq(pr);
		prh.setStatus(pr.getStatus());
		prh.setCreatedBy(user);
		prhDao.save(prh);
		
		Calendar cal = Calendar.getInstance();
		int thn = cal.get(Calendar.YEAR);
		int bln = cal.get(Calendar.MONTH)+1;
		String bulan;
		if(bln < 10) {
			bulan = "0"+bln;
		} else {
			bulan = Integer.toString(bln);
		}
		int no = poDao.CountPOByMonth(bln, thn)+1;
		String nomor;
		
		if(no < 10) {
			nomor = "00"+no;
		} else if(no < 100) {
			nomor = "0"+no;
		} else {
			nomor = Integer.toString(no);
		}
		
		String poNo = "PO"+thn+bulan+nomor;
		
		PurchaseOrder po = new PurchaseOrder();
		po.setCreatedOn(new Date());
		po.setNotes(pr.getNotes());
		po.setPoNo(poNo);
		po.setPurchaseReq(pr);
		po.setStatus("Created");
		po.setOutlet(pr.getOutlet());
		po.setCreatedBy(user);
		poDao.save(po);
		if(pr.getDetail() == null) {
			
		}else {
			for(PurchaseRequestDetail prd : pr.getDetail()) {
				PurchaseOrderDetail pod = new PurchaseOrderDetail();
				pod.setCreatedOn(po.getCreatedOn());
				pod.setCreatedBy(po.getCreatedBy());
				pod.setPurchaseOrder(po);
				pod.setRequestQty(prd.getRequestQty());
				pod.setVariant(prd.getVariant());
				podDao.save(pod);
			}
		}
		
		PurchaseOrderHistory poh = new PurchaseOrderHistory();
		poh.setCreatedOn(po.getCreatedOn());
		poh.setCreatedBy(po.getCreatedBy());
		poh.setPurchaseOrder(po);
		poh.setStatus(po.getStatus());
		pohDao.save(poh);
	}
	
	public List<Object> getInventoryByVariantDanOutlet(long idPrd, long idPr){
		PurchaseRequest pr = prDao.getOne(idPr);
		PurchaseRequestDetail prd = prdDao.getOne(idPrd);
		return iDao.getQtyByItemVariantAndOutlet(prd.getVariant(), pr.getOutlet());
	}
	
	public List<PurchaseRequest> getPRByStatus(String status){
		return prDao.searchPRByStatus(status);
	}
	
	public List<PurchaseRequest> getPRByDate(Date awal, Date akhir){
		Date startDate = awal;
		Calendar c = Calendar.getInstance(); 
		c.setTime(startDate); 
		c.add(Calendar.DATE, -1);
		startDate = c.getTime();
		
		Date endDate = akhir;
		Calendar c2 = Calendar.getInstance(); 
		c2.setTime(endDate); 
		c2.add(Calendar.DATE, 1);
		endDate = c2.getTime();
		return prDao.searchPRByDate(startDate, endDate);
	}
	
	public List<PurchaseRequest> searchGlobal(String search){
		return prDao.searchPR(search);
	}
	
	public List<PurchaseRequest> getPRByOneDate(Date date){
		return prDao.searchPRByOneDate(date);
	}
}
