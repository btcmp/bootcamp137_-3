package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.DistrictDao;
import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Region;

@Service
@Transactional
public class DistrictService {

	@Autowired
	DistrictDao districtDao;
	
	public List<District> selectAll() {
		return districtDao.selectAll();
	}

	public List<District> getDistrictByRegion(long id) {
		// TODO Auto-generated method stub
		Region region = new Region();
		region.setId(id);
		return districtDao.getDistrictByRegion(region);
	}
}
