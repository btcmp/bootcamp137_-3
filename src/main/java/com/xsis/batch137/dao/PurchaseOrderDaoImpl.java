package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Outlet;
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
		session.clear();
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

	public PurchaseOrder getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		return session.get(PurchaseOrder.class, id);
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
	
	public void approve(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder set status='Approved' where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	public void reject(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder set status='Rejected' where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}
	
	public void process(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder set status='Processed' where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	public List<PurchaseOrder> searchPO(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where lower(poNo) like :search or lower(status) like :search or lower(notes) like :search";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("search", "%"+search.toLowerCase()+"%").list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}

	public List<PurchaseOrder> searchPOByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where createdOn >= :start AND createdOn <= :end";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("start", startDate)
				.setParameter("end", endDate).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}

	public List<PurchaseOrder> searchPOByStatus(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where status = :status";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("status", search).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}

	@Override
	public List<PurchaseOrder> searchPOByOneDate(Date date) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder where to_char(createdOn, 'YYYY/MM/DD') = to_char(:date, 'YYYY/MM/DD')";
		List<PurchaseOrder> pos = session.createQuery(hql).setParameter("date", date).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}

	@Override
	public List<PurchaseOrder> getPOByOutlet(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<PurchaseOrder> pos = session.createCriteria(PurchaseOrder.class).add(Restrictions.eq("outlet", outlet)).list();
		if(pos.isEmpty()) {
			return null;
		}else {
			return pos;
		}
	}	
}

