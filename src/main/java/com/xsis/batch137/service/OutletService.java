package com.xsis.batch137.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.DistrictDao;
import com.xsis.batch137.dao.OutletDao;
import com.xsis.batch137.dao.ProvinceDao;
import com.xsis.batch137.dao.RegionDao;
import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;

@Service
@Transactional
public class OutletService {

	@Autowired
	OutletDao outletDao;
	
	@Autowired
	ProvinceDao provinceDao;
	
	@Autowired
	RegionDao regionDao;
	
	@Autowired
	DistrictDao districtDao;
	
	public void save(Outlet outlet) {
		outletDao.save(outlet);
	}
	
	public void update(Outlet outlet) {
		outletDao.update(outlet);
	}
	
	public void delete(long id) {
		outletDao.delete(id);
	}
	
	public List<Outlet> selectAll() {
		return outletDao.selectActive();
	}
	
	public Outlet getOne(long id) {
		/*List<Object> list = new ArrayList<Object>();*/
		Outlet outlet = outletDao.getOne(id);
		/*List<Province> provinces = provinceDao.selectAll(); //Gak perlu pake province karena sudah ada di awal
		List<Region> regions = regionDao.getRegionByProvince(outlet.getProvince());
		List<District> districts = districtDao.getDistrictByRegion(outlet.getRegion());
		list.add(outlet);
		list.add(provinces);
		list.add(regions);
		list.add(districts);*/
		return outlet;
	}
	
	public List<Outlet> selectActive(){
		return outletDao.selectActive();
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

	public List<Outlet> searchOutlet(String search) {
		// TODO Auto-generated method stub
		return outletDao.searchOutlet(search);
	}
}
