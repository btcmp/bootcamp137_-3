package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.TransferStockDetail;
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
	
	@Override
	public List<TransferStockHistory> getTransferStockHistoryByTransferStockId(Long search) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from TransferStockHistory th where th.transferStock.id = :search order by th.createdOn desc";
		List<TransferStockHistory> transferStockHistory=session.createQuery(hql).setParameter("search", search).list();
		if(transferStockHistory.isEmpty()) {
			return null;
		}
		
		return transferStockHistory;
	}

}
