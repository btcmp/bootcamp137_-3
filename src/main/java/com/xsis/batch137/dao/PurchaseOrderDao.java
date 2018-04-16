package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseRequest;

public interface PurchaseOrderDao {

	void save(PurchaseOrder po);
	
	void update(PurchaseOrder po);
	
	void delete(PurchaseOrder po);
	
	List<PurchaseOrder> selectAll();
	
	PurchaseOrder getOne(long id);
	
	void ubahStatus(String status, long id);
	
	int CountPOByMonth(int month, int year);
	
	int CountPOByMonthAndOutlet(int month, int year, Outlet outlet);
	
	List<PurchaseOrder> searchPO(String search);
	
	List<PurchaseOrder> searchApprovedPO(String search);
	
	List<PurchaseOrder> searchPOByOutlet(String search, Outlet outlet);
	
	List<PurchaseOrder> searchPOByDate(Date startDate, Date endDate);
	
	List<PurchaseOrder> searchApprovedPOByDate(Date startDate, Date endDate);
	
	List<PurchaseOrder> searchPOByDateAndOutlet(Date startDate, Date endDate, Outlet outlet);
	
	List<PurchaseOrder> searchPOByStatus(String search);
	
	List<PurchaseOrder> searchPOByStatusAndOutlet(String search, Outlet outlet);
	
	void approve(long id);
	
	void reject(long id);
	
	void process(long id);
	
	List<PurchaseOrder> searchPOByOneDate(Date date);
	
	List<PurchaseOrder> searchApprovedPOByOneDate(Date date);
	
	List<PurchaseOrder> searchPOByOneDateAndOutlet(Date date, Outlet outlet);
	
	List<PurchaseOrder> getPOByOutlet(Outlet outlet);
	
	int CountApprovedPo();
}
