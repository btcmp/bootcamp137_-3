package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Supplier;

public interface SupplierDao {
//
	public void save(Supplier sup);
	
	public void delete(long id);
	
	public void update(Supplier sup);
	
	public List<Supplier> selectAll();
	
	public Supplier getOne(long id);

	public List<Supplier> searchSupplier(String search);

	public int countName(String name);

	public int countEmail(String email);
}
