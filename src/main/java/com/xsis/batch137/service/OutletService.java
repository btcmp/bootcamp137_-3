package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.OutletDao;
import com.xsis.batch137.model.Outlet;

@Service
@Transactional
public class OutletService {

	@Autowired
	OutletDao outletDao;
	
	public void save(Outlet outlet) {
		outletDao.save(outlet);
	}
	
	public void update(Outlet outlet) {
		outletDao.update(outlet);
	}
	
	public void delete(long id) {
		Outlet outlet = new Outlet();
		outlet.setId(id);
		outlet.setName("Yos");
		outlet.setActive(false);
		outletDao.delete(outlet);
	}
	
	public List<Outlet> selectAll() {
		return outletDao.selectAll();
	}
	
	public Outlet getOne(long id) {
		return outletDao.getOne(id);
	}
	
}
