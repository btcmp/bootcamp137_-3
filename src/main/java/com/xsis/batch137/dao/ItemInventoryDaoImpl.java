package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.ItemInventory;

@Repository
public class ItemInventoryDaoImpl implements ItemInventoryDao {
	@Autowired
	SessionFactory sessionFactory;

	public void save(ItemInventory itemInventory) {
		Session session=sessionFactory.getCurrentSession();
		session.save(itemInventory);
		session.flush();
	}

	public List<ItemInventory> selectAll() {
		Session session=sessionFactory.getCurrentSession();
		return session.createCriteria(ItemInventory.class).list();
	}
	
	public ItemInventory getOne(ItemInventory itemInventory) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(ItemInventory.class, itemInventory.getId());
	}

	public void delete(ItemInventory itemInventory) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(itemInventory);
		session.flush();
	}

	public void update(ItemInventory itemInventory) {
		Session session=sessionFactory.getCurrentSession();
		session.update(itemInventory);
		session.flush();
	}

	public void saveAtauUpdate(ItemInventory itemInventory) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(itemInventory);
		session.flush();
	}
}