package com.xsis.batch137.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.xsis.batch137.model.User;

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
	
	@Autowired
	HttpSession httpSession;
	
	public void save(Outlet outlet) {
		User userLogin = (User) httpSession.getAttribute("userLogin");
		outlet.setCreatedBy(userLogin);
		outlet.setCreatedOn(new Date());
		outlet.setActive(true);
		outletDao.save(outlet);
	}
	
	public void update(Outlet outlet) {
		User userLogin = (User) httpSession.getAttribute("userLogin");
		Outlet out = outletDao.getOne(outlet.getId());
		out.setAddress(outlet.getAddress());
		out.setDistrict(outlet.getDistrict());
		out.setEmail(outlet.getEmail());
		out.setModifiedOn(new Date());
		out.setName(outlet.getName());
		out.setPhone(outlet.getPhone());
		out.setProvince(outlet.getProvince());
		out.setRegion(outlet.getRegion());
		out.setPostalCode(outlet.getPostalCode());
		out.setModifiedBy(userLogin);
		outletDao.update(out);
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

	public int countName(String name) {
		// TODO Auto-generated method stub
		return outletDao.getName(name);
	}

	public int countEmail(String email) {
		// TODO Auto-generated method stub
		return outletDao.countEmail(email);
	}
}
