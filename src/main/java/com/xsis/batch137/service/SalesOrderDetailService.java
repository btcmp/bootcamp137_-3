package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.SalesOrderDetailDao;
import com.xsis.batch137.model.SalesOrderDetail;

@Service
@Transactional
public class SalesOrderDetailService {

	@Autowired
	SalesOrderDetailDao salesOrderDetailDao;
	
	public void save (SalesOrderDetail salesOrderDetail) {
		salesOrderDetailDao.save(salesOrderDetail);
	}
	
	public void delete (SalesOrderDetail salesOrderDetail) {
		salesOrderDetailDao.delete(salesOrderDetail);
	}
	
	public void update (SalesOrderDetail salesOrderDetail) {
		salesOrderDetailDao.update(salesOrderDetail);
	}
	
	public SalesOrderDetail getOne(String id) {
		return salesOrderDetailDao.getOne(id);
	}
	
	public List<SalesOrderDetail> selectAll(){
		return salesOrderDetailDao.selectAll();
	}

	public List<SalesOrderDetail> getSodBySoId(Long id) {
		// TODO Auto-generated method stub
		return salesOrderDetailDao.getSodBySoId(id);
	}
	
}