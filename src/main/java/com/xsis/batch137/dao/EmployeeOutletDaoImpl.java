package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.EmployeeOutlet;

@Repository
public class EmployeeOutletDaoImpl implements EmployeeOutletDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(EmployeeOutlet eo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(eo);
		session.flush();
	}

	public void update(EmployeeOutlet eo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(eo);
		session.flush();
	}

	public void delete(EmployeeOutlet eo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(eo);
		session.flush();
	}

	public List<EmployeeOutlet> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(EmployeeOutlet.class).list();
	}

	public EmployeeOutlet getOne(EmployeeOutlet eo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(EmployeeOutlet.class, eo.getId());
	}

	
}
