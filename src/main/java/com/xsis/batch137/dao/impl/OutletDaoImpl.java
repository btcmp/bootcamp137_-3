package com.xsis.batch137.dao.impl;

import java.util.List;

import com.xsis.batch137.dao.OutletDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Outlet;

@Repository
public class OutletDaoImpl implements OutletDao {

	@Autowired
	SessionFactory sessionFactory;

	public void save(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(outlet);
		session.flush();
	}

	public void update(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(outlet);
		session.flush();
	}

	public void delete(long	id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Outlet set active = 0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
		session.flush();
	}

	public List<Outlet> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Outlet.class).list();
	}

	public Outlet getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Outlet.class, id);
	}

	public List<Outlet> selectActive() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Outlet where active = 1";
		List<Outlet> outlets = session.createQuery(hql).list();
		if(outlets == null) {
			return null;
		}
		return outlets;
	}

	public List<Outlet> searchOutlet(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Outlet where active = 1 and lower(name) like :out";
		List<Outlet> outlets = session.createQuery(hql).setParameter("out", "%"+search+"%").list();
		if(outlets.isEmpty()) {
			return null;
		}
		else {
			return outlets;
		}
	}

	@Override
	public int getName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Outlet where active = 1 and name = :nama";
		List<Outlet> outlets = session.createQuery(hql).setParameter("nama", name).list();
		if(outlets.isEmpty()) {
			return 0;
		}
		else {
			return outlets.size();
		}
	}

	@Override
	public int countEmail(String email) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Outlet where active = 1 and email = :emial";
		List<Outlet> outs = session.createQuery(hql).setParameter("emial", email).list();
		if(outs.isEmpty()) {
			return 0;
		}
		else {
			return outs.size();
		}
	}


	
	

	
}
