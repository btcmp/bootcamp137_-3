package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Category;
import com.xsis.batch137.model.TransferStock;

public interface TransferStockDao {
	

	
	public void save(TransferStock transferStock);
	
	public List<TransferStock> selectAll();
	
	public TransferStock getOne(TransferStock transferStock);
	
	public void delete(TransferStock transferStock);
	
	public void update(TransferStock transferStock);
	//
	public void saveAtauUpdate(TransferStock transferStock);

	public List<TransferStock> getTransferStockByOutletId(Long search);

	public List<TransferStock> getTransferStockByOutletIdLogin(long outletId);

	public TransferStock getTransferStockById(Long search);
	
	public List<TransferStock> getSubmitted();
	
}
