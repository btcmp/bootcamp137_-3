package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.PurchaseRequest;

public interface PurchaseRequestDao {

	void save(PurchaseRequest pr);
	
	void update(PurchaseRequest pr);
	
	void delete(PurchaseRequest pr);
	
	List<PurchaseRequest> selectAll();
	
	PurchaseRequest getOne(PurchaseRequest pr);
	
	void ubahStatus(String status, long id);
	
	int CountPRByMonth(int month, int year);
}
