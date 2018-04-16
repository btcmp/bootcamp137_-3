package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.ItemVariant;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.SalesOrderDetail;

public interface SalesOrderDetailDao {

	public void save(SalesOrderDetail salesOrderDetail);
	
	public void delete(SalesOrderDetail salesOrderDetail);
	
	public void update(SalesOrderDetail salesOrderDetail);
	
	public SalesOrderDetail getOne(String id);
	
	public List<SalesOrderDetail> selectAll();
	
	public void updateSalesOrder(SalesOrderDetail sd, Outlet ot);

	public List<SalesOrderDetail> getSodBySoId(Long id);

}