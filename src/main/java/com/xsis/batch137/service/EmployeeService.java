package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.EmployeeDao;
import com.xsis.batch137.dao.EmployeeOutletDao;
import com.xsis.batch137.dao.UserDao;
import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.EmployeeOutlet;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	EmployeeDao empDao;
	
	@Autowired
	EmployeeOutletDao eoDao;
	
	@Autowired
	UserDao uDao;
	
	public void save(Employee emp) {
		Employee employee = new Employee();
		employee.setId(emp.getId());
		employee.setFirstName(emp.getFirstName());
		employee.setLastName(emp.getLastName());
		employee.setEmail(emp.getEmail());
		employee.setTitle(emp.getTitle());
		employee.setHaveAccount(emp.isHaveAccount());
		employee.setActive(emp.isActive());
		employee.setEmpOutlet(emp.getEmpOutlet());
		employee.setUser(emp.getUser());
		empDao.save(employee);
		
		if(employee.getEmpOutlet()!=null) {
			for(EmployeeOutlet eo : employee.getEmpOutlet()) {
				EmployeeOutlet empOutlet = new EmployeeOutlet();
				empOutlet.setEmployee(employee);
				empOutlet.setOutlet(eo.getOutlet());
				eoDao.save(empOutlet);
			}
		}
		if(employee.getUser()!=null) {
			uDao.save(employee.getUser());
		}
		
	}
	
	public void update(Employee emp) {
		empDao.update(emp);
	}
	
	public void delete(int id) {
		Employee emp = new Employee();
		emp.setId(id);
		emp.setFirstName("aaaaa");
		emp.setLastName("aaaaa");
		emp.setHaveAccount(true);
		emp.setActive(false);
		empDao.delete(emp);
	}
	
	public List<Employee> selectAll(){
		return empDao.selectAll();
	}
	
	public Employee getOne(int id) {
		Employee emp = new Employee();
		emp.setId(id);
		emp.setFirstName("aaaaa");
		emp.setLastName("aaaaa");
		emp.setHaveAccount(true);
		emp.setActive(false);
		return empDao.getOne(emp);
	}
}
