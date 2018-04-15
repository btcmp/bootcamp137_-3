package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import com.xsis.batch137.model.Adjustment;

public interface AdjustmentDao {

	public void save(Adjustment adjustment);
	
	public void update(Adjustment adjustment);
	
	public void delete(Adjustment adjustment);
	
	public List<Adjustment> selectAll();
	
	public Adjustment getOne(long id);

	public List<Adjustment> searchAdjustmentByDate(Date startDate, Date endDate);
	
	public List<Adjustment> getSubmitted();
}
