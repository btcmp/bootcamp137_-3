package com.xsis.batch137.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.SalesOrderDao;
import com.xsis.batch137.dao.SalesOrderDetailDao;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.SalesOrder;
import com.xsis.batch137.model.SalesOrderDetail;

;

@Service
@Transactional
public class SalesOrderService {

	@Autowired
	SalesOrderDao salesOrderDao;
	
	@Autowired
	SalesOrderDetailDao salesOrderDetailDao;
	
	@Autowired
	HttpSession httpSession;
	
	public void save(SalesOrder salesOrder) {
		List<SalesOrderDetail> salesOrderDetails=salesOrder.getSalesOrderDetail();
		salesOrder.setSalesOrderDetail(null);
		salesOrderDao.save(salesOrder);
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");

		for(SalesOrderDetail sod : salesOrderDetails) {
			sod.setSalesOrder(salesOrder);
			salesOrderDetailDao.save(sod);
			salesOrderDetailDao.updateSalesOrder(sod, outlet);
		}
		
	}
	
	public void delete(SalesOrder salesOrder) {
		salesOrderDao.delete(salesOrder);
	}
	
	public void update(SalesOrder salesOrder) {
		salesOrderDao.update(salesOrder);
	}
	
	public SalesOrder getOne(Long id) {
		return salesOrderDao.getOne(id);
	}
	
	public List<SalesOrder> selectAll(){
		return salesOrderDao.selectAll();
	}	
}