package com.xsis.batch137.dao;

import java.util.Date;
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
		if(adjustment.getStatus().equals("Rejected")) {
			String hql = "update Adjustment set status = 'Rejected', modifiedOn = :date where id = :id";
			session.createQuery(hql).setParameter("id", adjustment.getId()).setParameter("date", adjustment.getModifiedOn()).executeUpdate();
		}
		else {
			String hql = "update Adjustment set status = 'Approved', modifiedOn = :date where id = :id";
			session.createQuery(hql).setParameter("id", adjustment.getId()).setParameter("date", adjustment.getModifiedOn()).executeUpdate();
		}
		System.out.println(adjustment.getStatus());
		session.flush();
	}

	public void delete(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(adjustment);
		session.flush();
	}

	public List<Adjustment> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Adjustment.class).list();
	}

	public Adjustment getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Adjustment.class, id);
	}

	@Override
	public List<Adjustment> searchAdjustmentByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Adjustment where createdOn >= :start AND createdOn <= :end";
		List<Adjustment> adjustments = session.createQuery(hql).setParameter("start", startDate).setParameter("end", endDate).list();
		if(adjustments.isEmpty()) {
			return null;
		}
		else {
			return adjustments;
		}
	}

	@Override
	public List<Adjustment> getSubmitted() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Adjustment where status = 'Submitted'";
		List<Adjustment> adjs = session.createQuery(hql).list();
		if(adjs.isEmpty()) {
			return null;
		}else {
			return adjs;
		}
	}
	
	
}
