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

	public void delete(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Supplier set active = 0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
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
		String hql = "from Supplier where active = 1";
		List<Supplier> suppliers = session.createQuery(hql).list();
		if(suppliers == null) {
			return null;
		}
		else {
			return suppliers;
		}
	}

	public Supplier getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Supplier.class, id);
	}

	public List<Supplier> searchSupplier(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Supplier where active = 1 and lower(name) like :sup";
		List<Supplier> sups = session.createQuery(hql).setParameter("sup","%"+search.toLowerCase()+"%").list();
		if(sups.isEmpty()) {
			return null;
		}
		else {
			return sups;
		}
	}

	@Override
	public int countName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Supplier where lower(name) = nama";
		List<Supplier> sups = session.createQuery(hql).setParameter("nama", name).list();
		if (sups.isEmpty()) {
			return 0;
		}
		else {
			return sups.size();
		}
	}

	@Override
	public int countEmail(String email) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Supplier where lower(email) = emails";
		List<Supplier> sups = session.createQuery(hql).setParameter("emails", email).list();
		if (sups.isEmpty()) {
			return 0;
		}
		else {
			return sups.size();
		}
	}
}
