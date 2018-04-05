package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.TransferStockHistoryDao;
import com.xsis.batch137.model.TransferStockHistory;

@Service
@Transactional
public class TransferStockHistoryService {

	@Autowired
	TransferStockHistoryDao transferStockHistoryDao;
	
	public List<TransferStockHistory> getTransferStockHistoryByTransferStockId(Long search) {
		// TODO Auto-generated method stub
		return transferStockHistoryDao.getTransferStockHistoryByTransferStockId(search);
	}

}
