package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.TransferStockDetailDao;
import com.xsis.batch137.model.TransferStockDetail;

@Service
@Transactional
public class TransferStockDetailService {
	@Autowired
	TransferStockDetailDao transferStockDetailDao;
	
	public void save(TransferStockDetail transferStockDetail) {
		transferStockDetailDao.save(transferStockDetail);
	}
	public TransferStockDetail getOne(Long id) {
		TransferStockDetail transferStockDetail=new TransferStockDetail();
		transferStockDetail.setId(id);
		return transferStockDetailDao.getOne(transferStockDetail);
	}
	
	public List<TransferStockDetail> selectAll(){
		return transferStockDetailDao.selectAll();
	}
	
	public void delete (TransferStockDetail transferStockDetail) {
		transferStockDetailDao.delete(transferStockDetail);
	}
	
	public void update(TransferStockDetail transferStockDetail) {
		transferStockDetailDao.update(transferStockDetail);
	}
	
	
	public void saveAtauUpdate(TransferStockDetail transferStockDetail) {
		transferStockDetailDao.saveAtauUpdate(transferStockDetail);
	}
	
}
