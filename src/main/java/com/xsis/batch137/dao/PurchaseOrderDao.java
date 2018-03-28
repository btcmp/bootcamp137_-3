package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.PurchaseOrder;

public interface PurchaseOrderDao {

	void save(PurchaseOrder po);
	
	void update(PurchaseOrder po);
	
	void delete(PurchaseOrder po);
	
	List<PurchaseOrder> selectAll();
	
	PurchaseOrder getOne(PurchaseOrder po);
	
	void ubahStatus(String status, long id);
}
