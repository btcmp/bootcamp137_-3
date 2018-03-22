package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.EmployeeOutlet;

public interface EmployeeOutletDao {

	void save(EmployeeOutlet eo);
	
	void update(EmployeeOutlet eo);
	
	void delete(EmployeeOutlet eo);
	
	List<EmployeeOutlet> selectAll();
	
	EmployeeOutlet getOne(EmployeeOutlet eo);
}
