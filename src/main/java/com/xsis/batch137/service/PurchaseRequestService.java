package com.xsis.batch137.service;

import java.util.Calendar;
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
		Calendar cal = Calendar.getInstance();
		int thn = cal.get(Calendar.YEAR);
		int bln = cal.get(Calendar.MONTH)+1;
		String bulan;
		if(bln < 10) {
			bulan = "0"+bln;
		}else {
			bulan = Integer.toString(bln);
		}
		int no = prDao.CountPRByMonth(bln, thn)+1;
		String nomor;
		if(no<10) {
			nomor = "00"+no;
		}else if(no<100) {
			nomor = "0"+no;
		}else {
			nomor = Integer.toString(no);
		}
		PurchaseRequest pureq = new PurchaseRequest();
		pureq.setId(pr.getId());
		pureq.setOutlet(pr.getOutlet());
		pureq.setPrNo(pr.getPrNo());
		pureq.setReadyTime(pr.getReadyTime());
		pureq.setStatus(pr.getStatus());
		pureq.setNotes(pr.getNotes());
		String prNo = "PR"+thn+bulan+nomor;
		pureq.setPrNo(prNo);
		prDao.save(pureq);
		
		if(pr.getDetail()!=null) {
			for(PurchaseRequestDetail prd : pr.getDetail()) {
				PurchaseRequestDetail puReqDet = new PurchaseRequestDetail();
				puReqDet.setId(prd.getId());
				puReqDet.setPurchaseReq(pureq);
				puReqDet.setVariant(prd.getVariant());
				puReqDet.setRequestQty(prd.getRequestQty());
				prdDao.save(puReqDet);
			}
		}
		
		if(pr.getId() != 0 && pr.getStatus()=="created") {
			
		}else {
			PurchaseRequestHistory prh = new PurchaseRequestHistory();
			prh.setPurchaseReq(pureq);
			prh.setStatus(pureq.getStatus());
			prhDao.save(prh);
		}
		
	}
	
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
}
