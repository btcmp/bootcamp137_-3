package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseRequest;

public interface PurchaseOrderDao {

	void save(PurchaseOrder po);
	
	void update(PurchaseOrder po);
	
	void delete(PurchaseOrder po);
	
	List<PurchaseOrder> selectAll();
	
	PurchaseOrder getOne(PurchaseOrder po);
	
	void ubahStatus(String status, long id);
	
	int CountPOByMonth(int month, int year);
	
	List<PurchaseOrder> searchPO(String search);
	
	List<PurchaseOrder> searchPOByDate(Date startDate, Date endDate);
	
	List<PurchaseOrder> searchPOByStatus(String search);
}
