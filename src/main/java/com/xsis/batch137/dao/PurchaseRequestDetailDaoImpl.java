package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.EmployeeOutlet;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.PurchaseRequestDetail;

@Repository
public class PurchaseRequestDetailDaoImpl implements PurchaseRequestDetailDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(PurchaseRequestDetail prd) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(prd);
		session.flush();
	}

	public void update(PurchaseRequestDetail prd) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(prd);
		session.flush();
	}

	public void delete(PurchaseRequestDetail prd) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(prd);
		session.flush();
	}

	public List<PurchaseRequestDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseRequestDetail.class).list();
	}

	public PurchaseRequestDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseRequestDetail.class, id);
	}

	public List<PurchaseRequestDetail> selectDetailByPr(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<PurchaseRequestDetail> detail = session.createCriteria(PurchaseRequestDetail.class).add(Restrictions.eq("purchaseReq.id", pr.getId())).list(); 
 		if(detail.isEmpty()) {
 			return null;
 		}else {
 			return detail;
 		}
	}

}
