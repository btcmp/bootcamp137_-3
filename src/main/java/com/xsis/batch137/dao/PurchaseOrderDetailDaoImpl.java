package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseOrderDetail;
import com.xsis.batch137.model.PurchaseRequestDetail;

@Repository
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

	public PurchaseOrderDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseOrderDetail.class, id);
	}

	public List<PurchaseOrderDetail> selectDetailByPO(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<PurchaseOrderDetail> detail = session.createCriteria(PurchaseOrderDetail.class).add(Restrictions.eq("purchaseOrder.id", po.getId())).list(); 
 		if(detail.isEmpty()) {
 			return null;
 		}else {
 			return detail;
 		}
	}

}
