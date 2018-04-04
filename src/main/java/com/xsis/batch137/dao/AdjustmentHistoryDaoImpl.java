package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.model.AdjustmentHistory;

@Repository
public class AdjustmentHistoryDaoImpl implements AdjustmentHistoryDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(AdjustmentHistory adjHistory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(adjHistory);
		session.flush();
	}

	public void update(AdjustmentHistory adjHistory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(adjHistory);
		session.flush();
	}

	public void delete(AdjustmentHistory adjHistory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(adjHistory);
		session.flush();
	}

	public List<AdjustmentHistory> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(AdjustmentHistory.class).list();
	}

	public AdjustmentHistory getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(AdjustmentHistory.class, id);
	}

	public List<AdjustmentHistory> getHistoryByAdjustment(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from AdjustmentHistory where adjustment = :adj";
		List<AdjustmentHistory> histories = session.createQuery(hql).setParameter("adj", adjustment).list();
		return histories;
	}
}
