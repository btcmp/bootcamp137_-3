package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.SupplierDao;
import com.xsis.batch137.model.Supplier;

@Service
@Transactional
public class SupplierService {

	@Autowired
	SupplierDao supplierDao;
	
	public void save(Supplier sup) {
		supplierDao.save(sup);
	}
	
	public void update(Supplier sup) {
		supplierDao.update(sup);
	}
	
	public void delete(long id) {
		Supplier sup = new Supplier();
		sup.setId(id);
		sup.setName("Yos");
		sup.setActive(false);
		supplierDao.delete(sup);
	}
	
	public List<Supplier> selectAll() {
		return supplierDao.selectAll();
	}
	
	public Supplier getOne(long id) {
		return supplierDao.getOne(id);
	}
}
