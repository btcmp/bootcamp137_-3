package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.TransferStockDetail;
import com.xsis.batch137.model.TransferStockHistory;

public interface TransferStockHistoryDao {

	public void save(TransferStockHistory tsh);
	public List<TransferStockHistory> getTransferStockHistoryByTransferStockId(Long search);
	
}
