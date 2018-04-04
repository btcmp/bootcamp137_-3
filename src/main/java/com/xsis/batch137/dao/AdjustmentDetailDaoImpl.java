package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.model.AdjustmentDetail;

@Repository
public class AdjustmentDetailDaoImpl implements AdjustmentDetailDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(AdjustmentDetail adjDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(adjDetail);
		session.flush();
	}

	public void update(AdjustmentDetail adjDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(adjDetail);
		session.flush();
	}

	public void delete(AdjustmentDetail adjDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(adjDetail);
		session.flush();
	}

	public List<AdjustmentDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(AdjustmentDetail.class).list();
	}

	public AdjustmentDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(AdjustmentDetail.class, id);
	}

	public List<AdjustmentDetail> getDetailByAdjustment(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from AdjustmentDetail where adjustment = :adj";
		List<AdjustmentDetail> details = session.createQuery(hql).setParameter("adj", adjustment).list();
		return details;
	}
}
