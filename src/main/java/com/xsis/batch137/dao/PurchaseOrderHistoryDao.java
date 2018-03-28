package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.PurchaseOrderHistory;

public interface PurchaseOrderHistoryDao {

	void save(PurchaseOrderHistory poh);
	
	void update(PurchaseOrderHistory poh);
	
	void delete(PurchaseOrderHistory poh);
	
	List<PurchaseOrderHistory> selectAll();
	
	PurchaseOrderHistory getOne(PurchaseOrderHistory poh);
	
	void ubahStatus(String status, long id);
}
