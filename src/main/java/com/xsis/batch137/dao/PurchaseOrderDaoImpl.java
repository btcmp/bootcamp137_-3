package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseRequest;

@Repository
public class PurchaseOrderDaoImpl implements PurchaseOrderDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(po);
		session.flush();
	}

	public void update(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(po);
		session.flush();
	}

	public void delete(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(po);
		session.flush();
	}

	public List<PurchaseOrder> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseOrder.class).list();
	}

	public PurchaseOrder getOne(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseOrder.class, po.getId());
	}

	public void ubahStatus(String status, long id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder set status = :status where id = :id";
		session.createQuery(hql).setParameter("status", status).setParameter("id", id).executeUpdate();
	}

	public int CountPOByMonth(int month, int year) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where MONTH(createdOn) = :month and YEAR(createdOn) = :year";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("month", month).setParameter("year", year).list();
		if(pos.isEmpty()) {
			return 0;
		}
		return pos.size();
	}
	
	public List<PurchaseOrder> searchPO(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where prNo = :search or status = :search";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("search", search).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}
	
	public List<PurchaseOrder> searchPOByDate(Date startDate, Date endDate){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where createdOn BETWEEN :start AND :end";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("start", startDate)
				.setParameter("end", endDate).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}
	
	public List<PurchaseOrder> searchPOByStatus(String search){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where status = :status";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("status", search).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}
}
