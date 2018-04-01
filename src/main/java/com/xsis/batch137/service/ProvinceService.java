package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ProvinceDao;
import com.xsis.batch137.model.Province;



@Service
@Transactional
public class ProvinceService {

	@Autowired
	ProvinceDao provinceDao;
	
	
	public List<Province> selectAll(){
		return provinceDao.selectAll();
	}
	
}
