package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.xsis.batch137.model.PurchaseOrderDetail;

public class PurchaseOrderDetailDaoImpl implements PurchaseOrderDetailDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PurchaseOrderDetail pod) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(pod);
		session.flush();
	}

	public void update(PurchaseOrderDetail pod) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(pod);
		session.flush();
	}

	public void delete(PurchaseOrderDetail pod) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(pod);
		session.flush();
	}

	public List<PurchaseOrderDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseOrderDetail.class).list();
	}

	public PurchaseOrderDetail getOne(PurchaseOrderDetail pod) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseOrderDetail.class, pod.getId());
	}

}
