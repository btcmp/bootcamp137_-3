package com.xsis.batch137.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.TransferStockHistory;

@Repository
public class TransferStockHistoryDaoImpl implements TransferStockHistoryDao {
	@Autowired
	SessionFactory sessionFactory;
	@Override
	public void save(TransferStockHistory tsh) {
		Session session = sessionFactory.getCurrentSession();
		session.save(tsh);
		session.flush();
	}

}
