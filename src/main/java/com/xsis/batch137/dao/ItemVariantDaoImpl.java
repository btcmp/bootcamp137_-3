package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;
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

	@Override
	public int countSku(String sku) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ItemVariant where lower(sku) = :sku";
		List<ItemVariant> ivt = session.createQuery(hql).setParameter("sku", sku.toLowerCase()).list();
		if(ivt.isEmpty()) {
			return 0;
		}
		else{
			return ivt.size();
		}
	}

	@Override
	public void updateActiveVariant(Long id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update ItemVariant set active = 0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}
}
