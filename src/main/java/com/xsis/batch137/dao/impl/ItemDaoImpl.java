package com.xsis.batch137.dao.impl;

import java.util.List;

import com.xsis.batch137.dao.ItemDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Category;
import com.xsis.batch137.model.Item;

@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired
	SessionFactory sessionFactory;

	public void save(Item item) {
		Session session=sessionFactory.getCurrentSession();
		session.save(item);
		session.flush();
	}

	public List<Item> selectAll() {
		Session session=sessionFactory.getCurrentSession();
		return session.createCriteria(Item.class).list();
	}
	
	public Item getOne(Item item) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(Item.class, item.getId());
	}

	public void delete(Item item) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(item);
		session.flush();
	}

	public void update(Item item) {
		Session session=sessionFactory.getCurrentSession();
		session.clear();
		session.update(item);
		session.flush();
	}

	public void saveAtauUpdate(Item item) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(item);
		session.flush();
	}

	public List<Item> getItemByCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Item where category = :id and active = 1";
		List<Item> items = session.createQuery(hql).setParameter("id", category).list();
		if (items.isEmpty()) {
			return null;
		}
		return items;
	}
}
