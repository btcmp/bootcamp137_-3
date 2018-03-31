package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Outlet;

public interface OutletDao {
	//
	public void save(Outlet outlet);
	
	public void update(Outlet outlet);
	
	public void delete(long id);
	
	public List<Outlet> selectAll();
	
	public Outlet getOne(long id);
	
	public List<Outlet> selectActive();

	public List<Outlet> searchOutlet(String search);

}
