package com.xsis.batch137.service;

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
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.PurchaseRequestDetail;
import com.xsis.batch137.model.PurchaseRequestHistory;

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
}
