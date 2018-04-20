package com.xsis.batch137.dao;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.ItemVariant;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.model.TransferStockDetail;
import com.xsis.batch137.model.User;
//
@Repository
public class TransferStockDetailDaoImpl implements TransferStockDetailDao {
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	HttpSession httpSession;
	
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

	public List<TransferStockDetail> getTransferStockDetailByTransferStockId(Long search) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from TransferStockDetail td where td.transferStock.id = :search";
		List<TransferStockDetail> transferStockDetails=session.createQuery(hql).setParameter("search", search).list();
		if(transferStockDetails.isEmpty()) {
			return null;
		}
		
		return transferStockDetails;
	}
	
	public void updateInventory(ItemVariant iv, TransferStock ts, TransferStockDetail tsd) {
		Session session=sessionFactory.getCurrentSession(); 
		List<ItemInventory> itemInventories = session.createCriteria(ItemInventory.class).list();
		Date modifiedOn = new Date();
		User usr = (User) httpSession.getAttribute("userLogin");
		int aa = 0;
		for(ItemInventory ivz : itemInventories) {
			
			if(ivz.getItemVariant() == iv && ivz.getOutlet() == ts.getToOutlet()) {
				aa = 1;
			}
		}
		
		String hql="update ItemInventory set modifiedOn= :modifiedOn, modifiedBy= :modifiedBy, transferStockQty=transferStockQty + :tsQty, endingQty=endingQty - :eQty where itemVariant=:iv and outlet = :fromOutlet";
		session.createQuery(hql).setParameter("modifiedBy", usr).setParameter("modifiedOn", modifiedOn).setParameter("tsQty",tsd.getTransferQty()).setParameter("eQty", tsd.getTransferQty()).setParameter("fromOutlet", ts.getFromOutlet()).setParameter("iv", iv).executeUpdate();
		
		if(aa == 1) {
			String hql2 = "update ItemInventory set modifiedOn= :modifiedOn, modifiedBy= :modifiedBy, endingQty = endingQty + :tsQty2 where itemVariant=:iv2 and outlet = :toOutlet";
			session.createQuery(hql2).setParameter("modifiedBy", usr).setParameter("modifiedOn", modifiedOn).setParameter("tsQty2", tsd.getTransferQty()).setParameter("iv2",iv).setParameter("toOutlet", ts.getToOutlet()).executeUpdate();
		}
		
		else {
			ItemInventory ivNoData = new ItemInventory();
			ivNoData.setAlertAtQty(0);
			ivNoData.setBeginning(tsd.getTransferQty());
			ivNoData.setEndingQty(tsd.getTransferQty());
			ivNoData.setItemVariant(iv);
			ivNoData.setOutlet(ts.getToOutlet());
			ivNoData.setCreatedBy(usr);
			ivNoData.setModifiedBy(usr);
			ivNoData.setCreatedOn(new Date());
			ivNoData.setModifiedOn(new Date());
			ivNoData.setTransferStockQty(0);
			session.save(ivNoData);
			session.flush();
		}
		
		
				
	}
	

}
