package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.RegionDao;
import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;

@Service
@Transactional
public class RegionService {

	@Autowired
	RegionDao regionDao;
	
	public List<Region> selectAll() {
		return regionDao.selectAll();
	}

	public List<Region> getRegionByProvince(long id) {
		// TODO Auto-generated method stub
		Province province = new Province();
		province.setId(id);
		return regionDao.getRegionByProvince(province);
	}
}
