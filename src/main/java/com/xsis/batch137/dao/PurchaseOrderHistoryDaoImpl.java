package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseOrderHistory;
import com.xsis.batch137.model.PurchaseRequestHistory;

@Repository
public class PurchaseOrderHistoryDaoImpl implements PurchaseOrderHistoryDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PurchaseOrderHistory po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(po);
		session.flush();
	}

	public void update(PurchaseOrderHistory po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(po);
		session.flush();
	}

	public void delete(PurchaseOrderHistory po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(po);
		session.flush();
	}

	public List<PurchaseOrderHistory> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseOrderHistory.class).list();
	}

	public PurchaseOrderHistory getOne(PurchaseOrderHistory po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseOrderHistory.class, po.getId());
	}

	public void ubahStatus(String status, long id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrderHistory set status = :status where id = :id";
		session.createQuery(hql).setParameter("status", status).setParameter("id", id).executeUpdate();
	}

	public List<PurchaseOrderHistory> selectByPO(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<PurchaseOrderHistory> pohs = session.createCriteria(PurchaseOrderHistory.class)
				.add(Restrictions.eq("purchaseOrder.id", po.getId())).addOrder(Order.asc("createdOn")).list(); 
 		if(pohs.isEmpty()) {
 			return null;
 		}else {
 			return pohs;
 		}
	}

}
