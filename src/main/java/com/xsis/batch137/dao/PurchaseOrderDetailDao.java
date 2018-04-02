package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseOrderDetail;

public interface PurchaseOrderDetailDao {

	void save(PurchaseOrderDetail pod);
	
	void update(PurchaseOrderDetail pod);
	
	void delete(PurchaseOrderDetail pod);
	
	List<PurchaseOrderDetail> selectAll();
	
	PurchaseOrderDetail getOne(long id);

	List<PurchaseOrderDetail> selectDetailByPO(PurchaseOrder po);
}
