package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.PurchaseRequestHistory;

@Repository
public class PurchaseRequestHistoryDaoImpl implements PurchaseRequestHistoryDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PurchaseRequestHistory prh) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(prh);
		session.flush();
	}

	public void update(PurchaseRequestHistory prh) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(prh);
		session.flush();
		
	}

	public void delete(PurchaseRequestHistory prh) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(prh);
		session.flush();
	}

	public List<PurchaseRequestHistory> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseRequestHistory.class).list();
	}

	public PurchaseRequestHistory getOne(PurchaseRequestHistory prh) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseRequestHistory.class, prh.getId());
	}

	
}
