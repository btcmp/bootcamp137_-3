package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Outlet;

public interface OutletDao {
	//
	public void save(Outlet outlet);
	
	public void update(Outlet outlet);
	
	public void delete(Outlet outlet);
	
	public List<Outlet> selectAll();
	
	public Outlet getOne(long id);

}
