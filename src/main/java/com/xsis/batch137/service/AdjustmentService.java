package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.AdjustmentDao;
import com.xsis.batch137.model.Adjustment;

@Service
@Transactional
public class AdjustmentService {

	@Autowired
	AdjustmentDao adjustmentDao;
	
	public void save(Adjustment adjustment) {
		adjustmentDao.save(adjustment);
	}
	
	public void update(Adjustment adjustment) {
		adjustmentDao.update(adjustment);
	}
	
	public void delete(long id) {
		adjustmentDao.delete(id);
	}
	
	public List<Adjustment> getAll() {
		return adjustmentDao.selectAll();
	}
	
	public Adjustment getOne(long id) {
		return adjustmentDao.getOne(id);
	}
}
