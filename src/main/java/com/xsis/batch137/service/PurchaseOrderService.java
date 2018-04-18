package com.xsis.batch137.service;

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
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseOrderDetail;
import com.xsis.batch137.model.PurchaseOrderHistory;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.PurchaseRequestHistory;
import com.xsis.batch137.model.User;

@Service
@Transactional
public class PurchaseOrderService {

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
	
	public List<PurchaseOrder> selectAll(){
		return poDao.selectAll();
	}
	
	public List<PurchaseOrder> getByOutlet(){
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		return poDao.getPOByOutlet(outlet);
	}

	public PurchaseOrder getOne(long id) {
		// TODO Auto-generated method stub
		PurchaseOrder po = poDao.getOne(id);
		List<PurchaseOrderDetail> pods = podDao.selectDetailByPO(po);
		List<PurchaseOrderHistory> pohs = pohDao.selectByPO(po);
		if(pods == null) {
			
		}else {
			po.setDetail(pods);
		}
		if(pohs == null) {
			
		}else {
			po.setHistory(pohs);
		}
		return po;
	}

	public List<Object> getInventoryByVariantDanOutlet(long idPod, long idPo) {
		// TODO Auto-generated method stub
		PurchaseOrder po = poDao.getOne(idPo);
		PurchaseOrderDetail pod = podDao.getOne(idPod);
		return iDao.getQtyByItemVariantAndOutlet(pod.getVariant(), po.getOutlet());
	}

	public void update(PurchaseOrder po) {
		// TODO Auto-generated method stub
		User user = (User)httpSession.getAttribute("userLogin");
		PurchaseOrder purOrd = new PurchaseOrder();
		purOrd.setId(po.getId());
		purOrd.setOutlet(po.getOutlet());
		purOrd.setPoNo(po.getPoNo());
		purOrd.setStatus(po.getStatus());
		purOrd.setNotes(po.getNotes());
		purOrd.setModifiedOn(new Date());
		purOrd.setModifiedBy(user);
		PurchaseOrder puro = poDao.getOne(purOrd.getId());
		purOrd.setCreatedOn(puro.getCreatedOn());
		purOrd.setCreatedBy(puro.getCreatedBy());
		purOrd.setPoNo(puro.getPoNo());
		purOrd.setSupplier(po.getSupplier());
		purOrd.setGrandTotal(po.getGrandTotal());
		purOrd.setPurchaseReq(puro.getPurchaseReq());
		poDao.update(purOrd);
		
		List<PurchaseOrderDetail> pods = podDao.selectDetailByPO(purOrd);
		if(pods == null) {
			
		}else {
			for(PurchaseOrderDetail pod : pods) {
				podDao.delete(pod);
			}
		}
		
		if(po.getDetail()!=null) {
			for(PurchaseOrderDetail pod : po.getDetail()) {
				PurchaseOrderDetail purOrDet = new PurchaseOrderDetail();
				purOrDet.setId(pod.getId());
				purOrDet.setCreatedOn(purOrd.getCreatedOn());
				purOrDet.setCreatedBy(purOrd.getCreatedBy());
				purOrDet.setModifiedBy(purOrd.getModifiedBy());
				purOrDet.setModifiedOn(purOrd.getModifiedOn());
				purOrDet.setPurchaseOrder(purOrd);
				purOrDet.setVariant(pod.getVariant());
				purOrDet.setRequestQty(pod.getRequestQty());
				purOrDet.setSubTotal(pod.getSubTotal());
				purOrDet.setUnitCost(pod.getUnitCost());
				podDao.save(purOrDet);
			}
		}
		
		if(po.getStatus().equals("Submitted")) {
			PurchaseOrderHistory poh = new PurchaseOrderHistory();
			poh.setCreatedOn(new Date());
			poh.setCreatedBy(user);
			poh.setPurchaseOrder(purOrd);
			poh.setStatus(po.getStatus());
			pohDao.save(poh);
		}
	}
	
	public void approve(long id) {
		poDao.approve(id);
		User user = (User)httpSession.getAttribute("userLogin");
		PurchaseOrder pr = poDao.getOne(id);
		PurchaseOrderHistory poh = new PurchaseOrderHistory();
		poh.setCreatedOn(new Date());
		poh.setCreatedBy(user);
		poh.setPurchaseOrder(pr);
		poh.setStatus(pr.getStatus());
		pohDao.save(poh);
	}
	
	public void reject(long id) {
		poDao.reject(id);
		User user = (User)httpSession.getAttribute("userLogin");
		PurchaseOrder pr = poDao.getOne(id);
		PurchaseOrderHistory poh = new PurchaseOrderHistory();
		poh.setCreatedOn(new Date());
		poh.setCreatedBy(user);
		poh.setPurchaseOrder(pr);
		poh.setStatus(pr.getStatus());
		pohDao.save(poh);
	}
	
	public void process(long id) {
		poDao.process(id);
		User user = (User)httpSession.getAttribute("userLogin");
		PurchaseOrder pr = poDao.getOne(id);
		PurchaseOrderHistory poh = new PurchaseOrderHistory();
		poh.setCreatedOn(new Date());
		poh.setCreatedBy(user);
		poh.setPurchaseOrder(pr);
		poh.setStatus(pr.getStatus());
		pohDao.save(poh);
		List<PurchaseOrderDetail> pods =  podDao.selectDetailByPO(pr);
		for(PurchaseOrderDetail pod : pods) {
			iDao.setPurchaseQty(pod.getRequestQty(), pod.getVariant().getId(), pr.getOutlet().getId());
		}
	}
	
	public List<PurchaseOrder> getPOByStatus(String status){
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		return poDao.searchPOByStatusAndOutlet(status, outlet);
	}
	
	public List<PurchaseOrder> getPOByDate(Date awal, Date akhir){
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		//Date startDate = awal;
		Calendar c = Calendar.getInstance(); 
		c.setTime(awal); 
		c.add(Calendar.DATE, -1);
		awal = c.getTime();
		
		//Date endDate = akhir;
		Calendar c2 = Calendar.getInstance(); 
		c2.setTime(akhir); 
		c2.add(Calendar.DATE, 1);
		akhir = c2.getTime();
		return poDao.searchPOByDateAndOutlet(awal, akhir, outlet);
	}
	
	public List<PurchaseOrder> searchGlobal(String search){
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		return poDao.searchPOByOutlet(search, outlet);
	}
}
