package com.xsis.batch137.dao;
//
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Supplier;

@Repository
public class SupplierDaoImpl implements SupplierDao{

	@Autowired
	SessionFactory sessionFactory;

	public void save(Supplier sup) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(sup);
		session.flush();
	}

	public void delete(Supplier sup) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(sup);
		session.flush();
	}

	public void update(Supplier sup) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(sup);
		session.flush();
	}

	public List<Supplier> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Supplier.class).list();
	}

	public Supplier getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Supplier.class, id);
	}
}
