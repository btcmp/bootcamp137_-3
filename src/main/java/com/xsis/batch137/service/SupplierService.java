package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.DistrictDao;
import com.xsis.batch137.dao.ProvinceDao;
import com.xsis.batch137.dao.RegionDao;
import com.xsis.batch137.dao.SupplierDao;
import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;
import com.xsis.batch137.model.Supplier;

@Service
@Transactional
public class SupplierService {

	@Autowired
	SupplierDao supplierDao;
	
	@Autowired
	ProvinceDao provinceDao;
	
	@Autowired
	RegionDao regionDao;
	
	@Autowired
	DistrictDao districtDao;
	
	//
	public void save(Supplier sup) {
		supplierDao.save(sup);
	}
	
	public void update(Supplier sup) {
		supplierDao.update(sup);
	}
	
	public void delete(long id) {
		supplierDao.delete(id);
	}
	
	public List<Supplier> selectAll() {
		return supplierDao.selectAll();
	}
	
	public Supplier getOne(long id) {
		return supplierDao.getOne(id);
	}

	public List<Province> getAllProvince() {
		// TODO Auto-generated method stub
		return provinceDao.selectAll();
	}

	public List<Region> getRegionByProvince(long id) {
		// TODO Auto-generated method stub
		Province province = new Province();
		province.setId(id);
		return regionDao.getRegionByProvince(province);
	}

	public List<District> getDistrictByRegion(long id) {
		// TODO Auto-generated method stub
		Region region = new Region();
		region.setId(id);
		return districtDao.getDistrictByRegion(region);
	}

	public List<Supplier> searchSupplier(String search) {
		// TODO Auto-generated method stub
		return supplierDao.searchSupplier(search);
	}
	
}
