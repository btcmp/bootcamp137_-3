package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.TransferStockDetail;

public interface TransferStockDetailDao {
	
	public void save(TransferStockDetail transferStockDetail);
	
	public List<TransferStockDetail> selectAll();
	
	public TransferStockDetail getOne(TransferStockDetail transferStockDetail);
	
	public void delete(TransferStockDetail transferStockDetail);
	
	public void update(TransferStockDetail transferStockDetail);
	
	public void saveAtauUpdate(TransferStockDetail transferStockDetail);
	
}
