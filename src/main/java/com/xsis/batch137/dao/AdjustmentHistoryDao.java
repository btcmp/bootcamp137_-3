package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.AdjustmentHistory;

public interface AdjustmentHistoryDao {

	public void save(AdjustmentHistory adjHistory);
	
	public void update(AdjustmentHistory adjHistory);
	
	public void delete(AdjustmentHistory adjHistory);
	
	public List<AdjustmentHistory> selectAll();
	
	public AdjustmentHistory getOne(long id);
}
