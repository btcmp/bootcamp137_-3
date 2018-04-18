package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Outlet;
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
	
	public List<PurchaseRequest> searchPRByOutlet(String search, Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where (lower(prNo) like :search or lower(status) like :search or lower(notes) like :search) and outlet = :outlet";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("search", "%"+search.toLowerCase()+"%").setParameter("outlet", outlet).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
	
	public List<PurchaseRequest> searchPRByDate(Date startDate, Date endDate){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where createdOn BETWEEN :start AND  :end";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("start", startDate)
				.setParameter("end", endDate).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
	
	public List<PurchaseRequest> searchPRByDateAndOutlet(Date startDate, Date endDate, Outlet outlet){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where (createdOn BETWEEN :start AND :end) and outlet = :outlet";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("start", startDate)
				.setParameter("end", endDate).setParameter("outlet", outlet).list();
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

	public List<PurchaseRequest> searchPRByStatusAndOutlet(String search, Outlet outlet){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where status = :status and outlet = :outlet";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("status", search).setParameter("outlet", outlet).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
	
	public int CountPrByPrNo(String prNo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where prNo = :prNo";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("prNo", prNo).list();
		if(prs.isEmpty()) {
			return 0;
		}
		return prs.size();
	}

	@Override
	public List<PurchaseRequest> searchPRByOneDate(Date date) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where createdOn = :date";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("date", date).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}

	public List<PurchaseRequest> searchPRByOneDateAndOutlet(Date date, Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where (where createdOn = :date) and outlet = :outlet";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("date", date).setParameter("outlet", outlet).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
	
	@Override
	public List<PurchaseRequest> searchPRByOutlet(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<PurchaseRequest> prs = session.createCriteria(PurchaseRequest.class).add(Restrictions.eq("outlet", outlet)).list();
		if(prs.isEmpty()) {
			return null;
		}else {
			return prs;
		}
	}
}
