package com.xsis.batch137.dao;

import java.util.Date;
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
		session.clear();
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

	public void approve(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest set status='Approved' where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	public void reject(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest set status='Rejected' where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	public void createPo(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest set status='PO Created' where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	public List<PurchaseRequest> searchPR(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where lower(prNo) like :search or lower(status) like :search or lower(notes) like :search";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("search", "%"+search.toLowerCase()+"%").list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
	
	public List<PurchaseRequest> searchPRByDate(Date startDate, Date endDate){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where createdOn >= :start AND createdOn <= :end";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("start", startDate)
				.setParameter("end", endDate).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
	
	public List<PurchaseRequest> searchPRByStatus(String search){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where status = :status";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("status", search).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
}
