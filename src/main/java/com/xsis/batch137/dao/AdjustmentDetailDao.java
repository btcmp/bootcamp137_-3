package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.model.AdjustmentDetail;


public interface AdjustmentDetailDao {

	public void save(AdjustmentDetail adjDetail);
	
	public void update(AdjustmentDetail adjDetail);
	
	public void delete(AdjustmentDetail adjDetail);
	
	public List<AdjustmentDetail> selectAll();

	public List<AdjustmentDetail> getDetailByAdjustment(Adjustment adjustment);
}
