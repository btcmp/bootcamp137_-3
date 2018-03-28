package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.PurchaseRequestHistory;

public interface PurchaseRequestHistoryDao {

	void save(PurchaseRequestHistory prh);
	
	void update(PurchaseRequestHistory prh);
	
	void delete(PurchaseRequestHistory prh);
	
	List<PurchaseRequestHistory> selectAll();
	
	PurchaseRequestHistory getOne(PurchaseRequestHistory prh);
}
