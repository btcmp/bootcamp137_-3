package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.AdjustmentHistoryDao;
import com.xsis.batch137.model.AdjustmentHistory;

@Service
@Transactional
public class AdjustmentHistoryService {

	@Autowired
	AdjustmentHistoryDao adjHistoryDao;
	
	public void save(AdjustmentHistory adjHistory) {
		adjHistoryDao.save(adjHistory);
	}
	
	public void update(AdjustmentHistory adjHistory) {
		adjHistoryDao.update(adjHistory);
	}
	
	public void delete(long id) {
		AdjustmentHistory adjHistory = new AdjustmentHistory();
		adjHistory.setId(id);
		adjHistoryDao.delete(adjHistory);
	}
	
	public List<AdjustmentHistory> getAll() {
		return adjHistoryDao.selectAll();
	}
	
	public AdjustmentHistory getOne(long id) {
		return adjHistoryDao.getOne(id);
	}
}
