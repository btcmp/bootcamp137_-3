package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.SalesOrder;

public interface SalesOrderDao {

	public void save(SalesOrder salesOrder);
	
	public void delete(SalesOrder salesOrder);
	
	public void update(SalesOrder salesOrder);
	
	public SalesOrder getOne(Long id);
	
	public List<SalesOrder> selectAll();
}