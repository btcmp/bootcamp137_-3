package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.xsis.batch137.model.TransferStockDetail;

@Repository
public class TransferStockDetailDaoImpl implements TransferStockDetailDao {
	@Autowired
	SessionFactory sessionFactory;

	public void save(TransferStockDetail transferStockDetail) {
		Session session=sessionFactory.getCurrentSession();
		session.save(transferStockDetail);
		session.flush();
	}

	public List<TransferStockDetail> selectAll() {
		Session session=sessionFactory.getCurrentSession();
		return session.createCriteria(TransferStockDetail.class).list();
	}
	
	public TransferStockDetail getOne(TransferStockDetail transferStockDetail) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(TransferStockDetail.class, transferStockDetail.getId());
	}

	public void delete(TransferStockDetail transferStockDetail) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(transferStockDetail);
		session.flush();
	}

	public void update(TransferStockDetail transferStockDetail) {
		Session session=sessionFactory.getCurrentSession();
		session.update(transferStockDetail);
		session.flush();
	}

	public void saveAtauUpdate(TransferStockDetail transferStockDetail) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(transferStockDetail);
		session.flush();
	}

}
