package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.PurchaseOrderDao;
import com.xsis.batch137.model.PurchaseOrder;

@Service
@Transactional
public class DashboardService {

	@Autowired
	PurchaseOrderDao pod;
	
	public int countApprovedPO() {
		return pod.CountApprovedPo();
	}
	
	public List<PurchaseOrder> getApprovedPO() {
		return pod.searchPOByStatus("Approved");
	}
}
