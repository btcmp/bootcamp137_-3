package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.ItemVariant;
import com.xsis.batch137.model.Outlet;

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
		session.saveOrUpdate(itemInventory);
		session.flush();
	}

	public void saveAtauUpdate(ItemInventory itemInventory) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(itemInventory);
		session.flush();
	}
	
	public List<ItemInventory> searchInventoryByItem(Item item){
		Session session=sessionFactory.getCurrentSession();
		/*String hql="from ItemInventory itemInventory right outer join ItemVariant itemVariant on itemInventory.itemVariant.id=itemVariant.id "
				+ "where itemVariant.item = :item" ;*/
		String hql="from ItemInventory i where i.itemVariant.item = :item";
		List<ItemInventory> itemInventories=session.createQuery(hql).setParameter("item", item).list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		
		return itemInventories;
	}

	public List<ItemInventory> searchItemInventoryByItemName(String search) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ItemInventory iv where lower(iv.itemVariant.item.name) like :itemName or "
				+ "lower(iv.itemVariant.name) like :itemName or "
				+ "lower(concat(iv.itemVariant.item.name, '-', iv.itemVariant.name)) like :itemName";
		List<ItemInventory> itemInventories = session.createQuery(hql).setParameter("itemName", "%"+search.toLowerCase()+"%").list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		
		else {
			return itemInventories;
		}
	}

	public List<ItemInventory> searchItemInventoryByItemVariantAndOutlet(ItemVariant iv, Outlet ou) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String hql="from ItemInventory where itemVariant = :iv and outlet = :ou";
		List<ItemInventory> itemInventories = session.createQuery(hql).setParameter("iv", iv).setParameter("ou", ou).list();
		if(itemInventories.isEmpty()) {
			return null;
		}else {
			return itemInventories;
		}
	}
}

