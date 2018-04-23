package com.xsis.batch137.service;

import java.util.Calendar;
import java.util.Date;
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
import com.xsis.batch137.model.SalesOrder;
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
	
	/// PO
	
	public int countApprovedPO() {
		return pod.CountApprovedPo();
	}
	
	public List<PurchaseOrder> getApprovedPO() {
		return pod.searchPOByStatus("Approved");
	}
	
	public List<PurchaseOrder> searchApprovedPO(String search){
		return pod.searchApprovedPO(search);
	}
	
	public List<PurchaseOrder> searchApprovedPOByDate(Date awal, Date akhir){
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
		return pod.searchApprovedPOByDate(awal, akhir);
	}
	
	public List<PurchaseOrder> searchApprovedPOByOneDate(Date date){
		return pod.searchApprovedPOByOneDate(date);
	}
	
	// SO
	
	public int countSalesOrder() {
		List<SalesOrder> so = sod.selectAll();
		if(so == null) {
			return 0;
		}else {
			return so.size();
		} 
	}
	
	// Adj
	
	public int countSubmittedAdjustment() {
		List<Adjustment> adj = ad.getSubmitted(); 
		if(adj == null) {
			return 0;
		}else {
			return adj.size();
		}
	}
	
	public List<Adjustment> getSubmittedAdjustment(){
		return ad.getSubmitted();
	}
	
	// TS
	
	public int countSubmittedTs() {
		List<TransferStock> ts = tsd.getSubmitted(); 
		if(ts == null) {
			return 0;
		}else {
			return ts.size();
		}
	}
	
	public List<TransferStock> getSubmittedTs(){
		return tsd.getSubmitted();
	}
	
	// SO
	
	public List<SalesOrder> getSO(){
		return sod.selectAll();
	}
}
