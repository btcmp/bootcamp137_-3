package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Adjustment;

@Repository
public class AdjustmentDaoImpl implements AdjustmentDao{

	@Autowired
	SessionFactory sessionFactory;

	public void save(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(adjustment);
		session.flush();
	}

	public void update(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(adjustment);
		session.flush();
	}

	public void delete(long	id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Adjustment set active = 0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
		session.flush();
	}

	public List<Adjustment> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Adjustment where active=1";
		List<Adjustment> adjustments = session.createQuery(hql).list();
		return adjustments;
	}

	public Adjustment getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Adjustment.class, id);
	}
	
	
}
