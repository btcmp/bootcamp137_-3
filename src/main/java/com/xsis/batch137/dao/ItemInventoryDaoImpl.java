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
		session.clear();
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

	public List<Object> getQtyByItemVariantAndOutlet(ItemVariant iv, Outlet ou) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String hql="select endingQty from ItemInventory where itemVariant = :iv and outlet = :ou";
		List<Object> itemInventories = session.createQuery(hql).setParameter("iv", iv).setParameter("ou", ou).list();
		if(itemInventories.isEmpty()) {
			return null;
		}else {
			return itemInventories;
		}
	}

	public void updateTransferStock(ItemInventory invent) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		ItemInventory ivt = session.get(ItemInventory.class, invent.getId());
		//ItemInventory ivtX = session.get(ItemInventory.class,ivt.getItemVariant().getId());
		//System.out.println(ivtX.getId());
		int currentQty = ivt.getEndingQty()-invent.getTransferStockQty();
		int transferStock = ivt.getTransferStockQty() + invent.getTransferStockQty();
		Long toOutletId = invent.getOutlet().getId();
		List<ItemInventory> ivtss = session.createCriteria(ItemInventory.class).list();
		
		int aa=0;
		int currentQty2 = 0;
		String hql = "update ItemInventory set transferStockQty = :invent, endingQty= :endingQty where id = :id";
		session.createQuery(hql).setParameter("invent", transferStock).setParameter("endingQty", currentQty).setParameter("id", invent.getId()).executeUpdate();
		
		for(ItemInventory ivz : ivtss) {
			if(ivz.getItemVariant().getId() == ivt.getItemVariant().getId() && ivz.getOutlet().getId() == invent.getOutlet().getId()) {
				aa = 1;
				currentQty2=ivz.getEndingQty()+invent.getTransferStockQty();
				//System.out.println(aa);
			}
		}
		
		System.out.println(currentQty2);
		
		if (aa == 1) {
			int currentQty2Fix = currentQty2 + invent.getTransferStockQty();
			String hql2 = "update ItemInventory ivt set endingQty = :eQty where ivt.itemVariant.id = :id and outlet.id = :outId";
			session.createQuery(hql2).setParameter("eQty", currentQty2).setParameter("id", ivt.getItemVariant().getId()).setParameter("outId", toOutletId).executeUpdate();
		}
		
		else {
			ItemInventory ivNoData = new ItemInventory();
			ivNoData.setAlertAtQty(0);
			ivNoData.setBeginning(invent.getTransferStockQty());
			ivNoData.setEndingQty(invent.getTransferStockQty());
			ivNoData.setItemVariant(ivt.getItemVariant());
			ivNoData.setOutlet(invent.getOutlet());
			ivNoData.setTransferStockQty(0);
			session.save(ivNoData);
			session.flush();
		}	
	}
	
	public List<ItemInventory> searchInventoryByVariant(Long search){
		Session session=sessionFactory.getCurrentSession();
		/*String hql="from ItemInventory itemInventory right outer join ItemVariant itemVariant on itemInventory.itemVariant.id=itemVariant.id "
				+ "where itemVariant.item = :item" ;*/
		String hql="from ItemInventory i where i.itemVariant.id = :search";
		List<ItemInventory> itemInventories=session.createQuery(hql).setParameter("search", search).list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		
		return itemInventories;
	}

	@Override
	public List<ItemInventory> getItemInvetoryByOutlet(Long search, Long id) {
		Session session=sessionFactory.getCurrentSession();
		/*String hql="from ItemInventory itemInventory right outer join ItemVariant itemVariant on itemInventory.itemVariant.id=itemVariant.id "
				+ "where itemVariant.item = :item" ;*/
		String hql="from ItemInventory i where i.itemVariant.item.id = :search and i.outlet.id= :outId";
		List<ItemInventory> itemInventories=session.createQuery(hql).setParameter("search", search).setParameter("outId", id).list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		
		return itemInventories;
	}

	@Override
	public List<ItemInventory> listInventoryByOutlet(Long search) {
		Session session=sessionFactory.getCurrentSession();
		/*String hql="from ItemInventory itemInventory right outer join ItemVariant itemVariant on itemInventory.itemVariant.id=itemVariant.id "
				+ "where itemVariant.item = :item" ;*/
		String hql="from ItemInventory i where i.outlet.id = :search";
		List<ItemInventory> itemInventories=session.createQuery(hql).setParameter("search", search).list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		
		return itemInventories;
	}

	@Override
	public void updateSalesOrder(ItemInventory itemInventory) {
		Session session = sessionFactory.getCurrentSession();
		ItemInventory invent = session.get(ItemInventory.class, itemInventory.getId());
		int currentQty = invent.getEndingQty() - itemInventory.getSalesOrderQty();
		System.out.println(currentQty);
		String hql = "update ItemInventory ivt set endingQty = :endingQty where id = :id and ivt.outlet.id = :outId";
		session.createQuery(hql).setParameter("endingQty", currentQty).setParameter("id", itemInventory.getId()).setParameter("outId",itemInventory.getOutlet().getId()).executeUpdate();
		
		}

	@Override
	public List<ItemInventory> getItemInventoryByOutletLogin(long outId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ItemInventory i where i.outlet.id = :outId";
		List<ItemInventory> itemInventories=session.createQuery(hql).setParameter("outId", outId).list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		
		return itemInventories;
		
	}
	
	public List<ItemInventory> searchItemInventoryByItemNameAndOutlet(String search, Outlet outlet) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ItemInventory iv where (lower(iv.itemVariant.item.name) like :itemName or "
				+ "lower(iv.itemVariant.name) like :itemName or "
				+ "lower(concat(iv.itemVariant.item.name, '-', iv.itemVariant.name)) like :itemName) and outlet.id = :outlet";
		List<ItemInventory> itemInventories = session.createQuery(hql).setParameter("itemName", "%"+search.toLowerCase()+"%").setParameter("outlet", outlet.getId()).list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		else {
			return itemInventories;
		}
	}
	
	@Override
	public List<ItemInventory> searchInventoryByOutlet(String search, long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ItemInventory invent where invent.outlet.id = :id and lower(invent.itemVariant.item.name) like :search "
				+ "or lower(invent.itemVariant.name) like :search "
				+ "or lower(concat(invent.itemVariant.item.name, '-' ,invent.itemVariant.name)) like :search";
		List<ItemInventory> invents = session.createQuery(hql).setParameter("id", id).setParameter("search", "%"+search.toLowerCase()+"%").list();
		if(invents.isEmpty()) {
			return null;
		}
		else {
			return invents;
		}
	}

	@Override
	public void setPurchaseQty(int qty, long variant, long outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update ItemInventory set purchaseQty = purchaseQty + :qty where itemVariant.id = :variant and outlet.id = :outlet";
		session.createQuery(hql).setParameter("qty", qty).setParameter("variant", variant).setParameter("outlet", outlet).executeUpdate();
		session.flush();
	}
}



