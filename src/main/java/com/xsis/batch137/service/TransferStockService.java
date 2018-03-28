package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.TransferStockDao;
import com.xsis.batch137.model.TransferStock;
///
@Service
@Transactional
public class TransferStockService {
	@Autowired
	TransferStockDao transferStockDao;
	
	public void save(TransferStock transferStock) {
		transferStockDao.save(transferStock);
	}
	public TransferStock getOne(Long id) {
		TransferStock transferStock=new TransferStock();
		transferStock.setId(id);
		return transferStockDao.getOne(transferStock);
	}
	
	public List<TransferStock> selectAll(){
		return transferStockDao.selectAll();
	}
	
	public void delete (TransferStock transferStock) {
		transferStockDao.delete(transferStock);
	}
	
	public void update(TransferStock transferStock) {
		transferStockDao.update(transferStock);
	}
	
	
	public void saveAtauUpdate(TransferStock transferStock) {
		transferStockDao.saveAtauUpdate(transferStock);
	}
	
}
