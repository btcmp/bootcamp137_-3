package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.DistrictDao;
import com.xsis.batch137.model.District;

@Service
@Transactional
public class DistrictService {

	@Autowired
	DistrictDao districtDao;
	
	public List<District> selectAll() {
		return districtDao.selectAll();
	}
}
