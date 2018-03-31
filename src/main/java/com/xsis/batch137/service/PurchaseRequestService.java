package com.xsis.batch137.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.PurchaseRequestDao;
import com.xsis.batch137.dao.PurchaseRequestDetailDao;
import com.xsis.batch137.dao.PurchaseRequestHistoryDao;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.PurchaseRequestDetail;
import com.xsis.batch137.model.PurchaseRequestHistory;

@Service
@Transactional
public class PurchaseRequestService {

	@Autowired
	PurchaseRequestDao prDao;
	
	@Autowired
	PurchaseRequestDetailDao prdDao;
	
	@Autowired
	PurchaseRequestHistoryDao prhDao;
	
	public void save(PurchaseRequest pr) {
		PurchaseRequest pureq = new PurchaseRequest();
		pureq.setId(pr.getId());
		pureq.setOutlet(pr.getOutlet());
		pureq.setPrNo(pr.getPrNo());
		pureq.setReadyTime(pr.getReadyTime());
		pureq.setStatus(pr.getStatus());
		pureq.setNotes(pr.getNotes());
		
		if(pureq.getId()!=0) {
			pureq.setModifiedOn(new Date());
			PurchaseRequest pure = prDao.getOne(pureq.getId());
			pureq.setCreatedOn(pure.getCreatedOn());
		}else {
			pureq.setCreatedOn(new Date());
		}
		
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
		pureq.setPrNo(prNo);
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
				puReqDet.setCreatedOn(pureq.getCreatedOn());
				prdDao.save(puReqDet);
			}
		}
		
		if(pr.getId() != 0 && pr.getStatus()=="created") {
			
		}else {
			PurchaseRequestHistory prh = new PurchaseRequestHistory();
			prh.setPurchaseReq(pureq);
			prh.setStatus(pureq.getStatus());
			prh.setCreatedOn(pureq.getCreatedOn());
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
				if(prds.isEmpty()) {
					
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
		prDao.approve(id);
		PurchaseRequest pr = prDao.getOne(id);
		PurchaseRequestHistory prh = new PurchaseRequestHistory();
		prh.setPurchaseReq(pr);
		prh.setStatus(pr.getStatus());
		prhDao.save(prh);
	}
	
	public void reject(long id) {
		prDao.reject(id);
		PurchaseRequest pr = prDao.getOne(id);
		PurchaseRequestHistory prh = new PurchaseRequestHistory();
		prh.setPurchaseReq(pr);
		prh.setStatus(pr.getStatus());
		prhDao.save(prh);
	}
	
	public void createPo(long id) {
		prDao.createPo(id);
		PurchaseRequest pr = prDao.getOne(id);
		PurchaseRequestHistory prh = new PurchaseRequestHistory();
		prh.setPurchaseReq(pr);
		prh.setStatus(pr.getStatus());
		prhDao.save(prh);
	}
}
