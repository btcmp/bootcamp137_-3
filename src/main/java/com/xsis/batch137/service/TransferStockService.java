package com.xsis.batch137.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.TransferStockDao;
import com.xsis.batch137.dao.TransferStockDetailDao;
import com.xsis.batch137.dao.TransferStockHistoryDao;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.model.TransferStockDetail;
import com.xsis.batch137.model.TransferStockHistory;
import com.xsis.batch137.model.User;
///
@Service
@Transactional
public class TransferStockService {
	@Autowired
	TransferStockDao transferStockDao;
	
	@Autowired
	TransferStockDetailDao transferStockDetailDao;
	
	@Autowired
	TransferStockHistoryDao transferStockHistoryDao;
	
	@Autowired
	HttpSession httpSession;
	
	
	public void save(TransferStock transferStock) {
		List<TransferStockDetail> transferStockDetails=transferStock.getTransferStockDetail();
		transferStock.setTransferStockDetail(null);
		User usr = (User) httpSession.getAttribute("userLogin");
		transferStock.setCreatedBy(usr);
		transferStock.setModifiedBy(usr);
		transferStockDao.save(transferStock);	
		
		for(TransferStockDetail tsd: transferStockDetails) {
			tsd.setTransferStock(transferStock);
			tsd.setCreatedBy(usr);
			tsd.setModifiedBy(usr);
			transferStockDetailDao.save(tsd);
		}
		
		TransferStockHistory tsh = new TransferStockHistory();
		tsh.setStatus(transferStock.getStatus());
		tsh.setTransferStock(transferStock);
		tsh.setCreatedBy(usr);
		transferStockHistoryDao.save(tsh);
		
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
		TransferStockHistory tsh = new TransferStockHistory();
		tsh.setStatus(transferStock.getStatus());
		User usr = (User) httpSession.getAttribute("userLogin");
		tsh.setCreatedBy(usr);
		tsh.setTransferStock(transferStock);
		transferStockHistoryDao.save(tsh);
	}
	public List<TransferStock> getTransferStockByOutletId(Long search) {
		// TODO Auto-generated method stub
		return transferStockDao.getTransferStockByOutletId(search);
	}
	public List<TransferStock> getTransferStockByOutletIdLogin(long outletId) {
		// TODO Auto-generated method stub
		return transferStockDao.getTransferStockByOutletIdLogin(outletId);
	}
	
	
}
