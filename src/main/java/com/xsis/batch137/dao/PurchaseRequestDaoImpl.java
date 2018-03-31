package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.PurchaseRequest;

@Repository
public class PurchaseRequestDaoImpl implements PurchaseRequestDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(pr);
		session.flush();
	}

	public void update(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(pr);
		session.flush();
	}

	public void delete(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(pr);
		session.flush();
	}

	public List<PurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseRequest.class).list();
	}

	public PurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseRequest.class, id);
	}

	public void ubahStatus(String status, long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest set status = :status where id = :id";
		session.createQuery(hql).setParameter("status", status).setParameter("id", id).executeUpdate();
	}

	public int CountPRByMonth(int month, int year) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where MONTH(createdOn) = :month and YEAR(createdOn) = :year";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("month", month).setParameter("year", year).list();
		if(prs.isEmpty()) {
			return 0;
		}
		return prs.size();
	}

	
}
