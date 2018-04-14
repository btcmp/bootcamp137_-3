package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.AdjustmentDao;
import com.xsis.batch137.dao.PurchaseOrderDao;
import com.xsis.batch137.dao.SalesOrderDao;
import com.xsis.batch137.dao.TransferStockDao;
import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.TransferStock;

@Service
@Transactional
public class DashboardService {

	@Autowired
	PurchaseOrderDao pod;
	
	@Autowired
	SalesOrderDao sod;
	
	@Autowired
	AdjustmentDao ad;
	
	@Autowired
	TransferStockDao tsd;
	
	public int countApprovedPO() {
		return pod.CountApprovedPo();
	}
	
	public List<PurchaseOrder> getApprovedPO() {
		return pod.searchPOByStatus("Approved");
	}
	
	public int countSalesOrder() {
		return sod.selectAll().size();
	}
	
	public int countSubmittedAdjustment() {
		return ad.getSubmitted().size();
	}
	
	public List<Adjustment> getSubmittedAdjustment(){
		return ad.getSubmitted();
	}
	
	public int countSubmittedTs() {
		return tsd.getSubmitted().size();
	}
	
	public List<TransferStock> getSubmittedTs(){
		return tsd.getSubmitted();
	}
}
