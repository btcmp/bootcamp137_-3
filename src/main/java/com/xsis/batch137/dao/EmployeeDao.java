package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Employee;

public interface EmployeeDao {

	void save(Employee emp);
	
	void update(Employee emp);
	
	void delete(Employee emp);
	
	List<Employee> selectAll();
	
	Employee getOne(Employee emp);

	void nonaktif(long id);
}
