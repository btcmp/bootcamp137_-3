package com.xsis.batch137.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.dao.PurchaseOrderDao;
import com.xsis.batch137.dao.PurchaseOrderDetailDao;
import com.xsis.batch137.dao.PurchaseOrderHistoryDao;
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseOrderDetail;
import com.xsis.batch137.model.PurchaseOrderHistory;

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
	
	public List<PurchaseOrder> selectAll(){
		return poDao.selectAll();
	}

	public PurchaseOrder getOne(long id) {
		// TODO Auto-generated method stub
		PurchaseOrder po = poDao.getOne(id);
		List<PurchaseOrderDetail> pods = podDao.selectDetailByPO(po);
		List<PurchaseOrderHistory> pohs = pohDao.selectByPO(po);
		if(pods.isEmpty()) {
			
		}else {
			po.setDetail(pods);
		}
		if(pohs.isEmpty()) {
			
		}else {
			po.setHistory(pohs);
		}
		return po;
	}

	public List<Object> getInventoryByVariantDanOutlet(long idPod, long idPo) {
		// TODO Auto-generated method stub
		PurchaseOrder po = poDao.getOne(idPo);
		PurchaseOrderDetail pod = podDao.getOne(idPod);
		return iDao.searchItemInventoryByItemVariantAndOutlet(pod.getVariant(), po.getOutlet());
	}

	public void update(PurchaseOrder po) {
		// TODO Auto-generated method stub
		PurchaseOrder purOrd = new PurchaseOrder();
		purOrd.setId(po.getId());
		purOrd.setOutlet(po.getOutlet());
		purOrd.setPoNo(po.getPoNo());
		purOrd.setStatus(po.getStatus());
		purOrd.setNotes(po.getNotes());
		purOrd.setModifiedOn(new Date());
		PurchaseOrder puro = poDao.getOne(purOrd.getId());
		purOrd.setCreatedOn(puro.getCreatedOn());
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
				purOrDet.setModifiedOn(purOrd.getModifiedOn());
				purOrDet.setPurchaseOrder(purOrd);
				purOrDet.setVariant(pod.getVariant());
				purOrDet.setRequestQty(pod.getRequestQty());
				purOrDet.setSubTotal(pod.getSubTotal());
				purOrDet.setUnitCost(pod.getUnitCost());
				podDao.save(purOrDet);
			}
		}
	}
}
