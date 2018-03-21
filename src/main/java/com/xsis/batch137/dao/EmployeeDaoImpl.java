package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(emp);
		session.flush();
	}

	public void update(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(emp);
		session.flush();
	}

	public void delete(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(emp);
		session.flush();
	}

	public List<Employee> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Employee.class).list();
	}

	public Employee getOne(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Employee.class, emp.getId());
	}

	
}
