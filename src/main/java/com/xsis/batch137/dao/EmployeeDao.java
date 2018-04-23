package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Employee;

public interface EmployeeDao {

	void save(Employee emp);
	
	void update(Employee emp);
	
	void delete(Employee emp);
	
	List<Employee> selectAll();
	
	Employee getOne(long id);

	void nonaktif(long id);
	
	Employee getEmployeeByEmail(String email);
	
	int countEmployeeByEmail(String email);
	
	Employee getEmpByUsername(String username);
}
