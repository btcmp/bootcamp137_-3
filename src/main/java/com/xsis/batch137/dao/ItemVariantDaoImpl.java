package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemVariant;

@Repository
public class ItemVariantDaoImpl implements ItemVariantDao {
	@Autowired
	SessionFactory sessionFactory;

	public void save(ItemVariant itemVariant) {
		Session session=sessionFactory.getCurrentSession();
		session.save(itemVariant);
		session.flush();
	}

	public List<ItemVariant> selectAll() {
		Session session=sessionFactory.getCurrentSession();
		return session.createCriteria(ItemVariant.class).list();
	}
	
	public ItemVariant getOne(ItemVariant itemVariant) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(ItemVariant.class, itemVariant.getId());
	}

	public void delete(ItemVariant itemVariant) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(itemVariant);
		session.flush();
	}

	public void update(ItemVariant itemVariant) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(itemVariant);
		session.flush();
	}

	public void saveAtauUpdate(ItemVariant itemVariant) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(itemVariant);
		session.flush();
	}
	
	public List<ItemVariant> searchVariantByItem(Item item){
		Session session=sessionFactory.getCurrentSession();
		String hql="from ItemVariant itemVariant where itemVariant.item= :item";
		List<ItemVariant> itemVariants=session.createQuery(hql).setParameter("item", item).list();
		if(itemVariants.isEmpty()) {
			return null;
		}
		
		return itemVariants;
	}
}
