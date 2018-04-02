package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.PurchaseRequestDetail;

public interface PurchaseRequestDetailDao {

	void save(PurchaseRequestDetail prd);
	
	void update(PurchaseRequestDetail prd);
	
	void delete(PurchaseRequestDetail prd);
	
	List<PurchaseRequestDetail> selectAll();
	
	PurchaseRequestDetail getOne(long id);
	
	List<PurchaseRequestDetail> selectDetailByPr(PurchaseRequest pr);
}
