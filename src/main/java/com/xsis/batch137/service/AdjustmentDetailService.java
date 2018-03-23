package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.AdjustmentDetailDao;
import com.xsis.batch137.model.AdjustmentDetail;

@Service
@Transactional
public class AdjustmentDetailService {

	@Autowired
	AdjustmentDetailDao adjDetailDao;
	
	public void save(AdjustmentDetail adjDetail) {
		adjDetailDao.save(adjDetail);
	}
	
	public void update(AdjustmentDetail adjDetail) {
		adjDetailDao.update(adjDetail);
	}
	
	public void delete(long id) {
		AdjustmentDetail adjDetail = new AdjustmentDetail();
		adjDetail.setId(id);;
		adjDetailDao.save(adjDetail);
	}
	
	public List<AdjustmentDetail> getAll() {
		return adjDetailDao.selectAll();
	}
	
	public AdjustmentDetail getOne(long id) {
		return adjDetailDao.getOne(id);
	}
}
