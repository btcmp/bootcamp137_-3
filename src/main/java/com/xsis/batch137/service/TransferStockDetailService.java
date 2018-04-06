package com.xsis.batch137.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.OutletDao;
import com.xsis.batch137.dao.TransferStockDao;
import com.xsis.batch137.dao.TransferStockDetailDao;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.model.TransferStockDetail;

@Service
@Transactional
public class TransferStockDetailService {
	@Autowired
	TransferStockDetailDao transferStockDetailDao;
	//
	
	@Autowired
	OutletDao outletDao;
	
	@Autowired
	TransferStockDao transferStockDao;
	
	@Autowired
	HttpSession httpSession;
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
	public List<TransferStockDetail> getTransferStockDetailByTransferStockId(Long search) {
		// TODO Auto-generated method stub
		return transferStockDetailDao.getTransferStockDetailByTransferStockId(search);
	}
	public List<TransferStockDetail> updateInventoryData(Long search) {
		List<TransferStockDetail> tsd = transferStockDetailDao.getTransferStockDetailByTransferStockId(search);
		TransferStock ts = transferStockDao.getTransferStockById(search);
		
		for (TransferStockDetail tsd2 : tsd) {
			//Outlet out = ts.getFromOutlet();
			transferStockDetailDao.updateInventory(tsd2.getItemVariant(), ts, tsd2);
		}
		
		
		return tsd;
	}
	

}
