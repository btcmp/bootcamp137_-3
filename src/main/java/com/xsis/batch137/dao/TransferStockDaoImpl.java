package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.TransferStock;
//
@Repository
public class TransferStockDaoImpl implements TransferStockDao {
	@Autowired
	SessionFactory sessionFactory;

	public void save(TransferStock transferStock) {
		Session session=sessionFactory.getCurrentSession();
		session.save(transferStock);
		session.flush();
	}

	public List<TransferStock> selectAll() {
		Session session=sessionFactory.getCurrentSession();
		return session.createCriteria(TransferStock.class).list();
	}
	
	public TransferStock getOne(TransferStock transferStock) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(TransferStock.class, transferStock.getId());
	}

	public void delete(TransferStock transferStock) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(transferStock);
		session.flush();
	}

	public void update(TransferStock transferStock) {
		Session session=sessionFactory.getCurrentSession();
		session.update(transferStock);
		session.flush();
	}

	public void saveAtauUpdate(TransferStock transferStock) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(transferStock);
		session.flush();
	}

	@Override
	public List<TransferStock> getTransferStockByOutletId(Long search) {
		Session session=sessionFactory.getCurrentSession();
		String hql = "from TransferStock ts where ts.toOutlet.id = :search";
		List<TransferStock> transferStocks=session.createQuery(hql).setParameter("search", search).list();
		if(transferStocks.isEmpty()) {
			return null;
		}
		
		return transferStocks;
		
	}

	@Override
	public List<TransferStock> getTransferStockByOutletIdLogin(long outletId) {
		Session session=sessionFactory.getCurrentSession();
		String hql = "from TransferStock ts where ts.fromOutlet.id = :outId";
		List<TransferStock> transferStocks=session.createQuery(hql).setParameter("outId", outletId).list();
		if(transferStocks.isEmpty()) {
			return null;
		}
		
		return transferStocks;
	}

	@Override
	public TransferStock getTransferStockById(Long search) {
		Session session=sessionFactory.getCurrentSession();
		String hql = "from TransferStock ts where id = :id";
		
		//String hql="from Employee emp where emp.id = :empid";
		List<TransferStock> ts = session.createQuery(hql).setParameter("id", search).list();
		TransferStock tStock = ts.get(0);
			
		if(ts.isEmpty()) {
			return null;
		}
		else {
			return tStock;
		}
		
	
	}



	

}
