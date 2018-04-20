package com.xsis.batch137.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xsis.batch137.dao.ItemDao;
import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.dao.ItemVariantDao;
import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.ItemVariant;
import com.xsis.batch137.model.User;


@Service
@Transactional
public class ItemService {
	@Autowired
	ItemDao itemDao;

	@Autowired
	ItemVariantDao itemVariantDao;
	
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	@Autowired
	HttpSession httpSession;

	public void save(Item item) {
		List<ItemVariant> itemVariants = item.getItemVariants();
		item.setItemVariants(null);
		User usr = (User) httpSession.getAttribute("userLogin");
		//System.out.println(usr.getId());
		item.setCreatedBy(usr);
		item.setModifiedBy(usr);
		item.setCreatedOn(new Date());
		item.setModifiedOn(new Date());
		itemDao.save(item);
		ItemInventory inventory;
		
		for(ItemVariant ivar : itemVariants) {
			inventory = ivar.getItemInventories().get(0);
			
			ivar.setItemInventories(null);
			ivar.setItem(item);
			ivar.setCreatedBy(usr);
			ivar.setModifiedBy(usr);
			ivar.setModifiedOn(new Date());
			ivar.setCreatedOn(new Date());
			itemVariantDao.save(ivar);
			
			inventory.setItemVariant(ivar);
			inventory.setEndingQty(inventory.getBeginning());
			inventory.setCreatedBy(usr);
			inventory.setModifiedBy(usr);
			inventory.setCreatedOn(new Date());
			inventory.setModifiedOn(new Date());
			itemInventoryDao.save(inventory);
		}
		
		
/*		Item itm = new Item();
		itm.setActive(item.getActive());
		itm.setCategory(item.getCategory());
		itm.setName(item.getName());
		itemDao.save(itm);

		// object itemVariant
		for (ItemVariant iv : item.getItemVariants()) {
			ItemVariant iVar = new ItemVariant();
			iVar.setName(iv.getName());
			iVar.setActive(iv.getActive());
			iVar.setPrice(iv.getPrice());
			iVar.setSku(iv.getSku());
			iVar.setItem(itm);
			itemVariantDao.save(iVar);
			
			for (ItemInventory ivt : iv.getItemInventories()) {
				ItemInventory ivtor = new ItemInventory();
				ivtor.setBeginning(ivt.getBeginning());
				ivtor.setAlertAtQty(ivt.getAlertAtQty());
				ivtor.setItemVariant(iVar);
				itemInventoryDao.save(ivtor);
			}

		}*/
		
		
	}

	public Item getOne(Long id) {
		Item item = new Item();
		item.setId(id);
		return itemDao.getOne(item);
	}

	public List<Item> selectAll() {
		return itemDao.selectAll();
	}

	public void delete(Item item) {
		itemDao.delete(item);
	}

	public void update(Item item) {
	List<ItemVariant> itemVariants = item.getItemVariants();
		item.setItemVariants(null);
		User usr = (User) httpSession.getAttribute("userLogin");
		Item itemGetCreatedBy = itemDao.getOne(item);
		item.setCreatedBy(itemGetCreatedBy.getCreatedBy());
		item.setModifiedBy(usr);
		item.setCreatedOn(itemGetCreatedBy.getCreatedOn());
		item.setModifiedOn(new Date());
		itemDao.update(item);
		ItemInventory inventory;
		for(ItemVariant ivar : itemVariants) {
			inventory = ivar.getItemInventories().get(0);
			ivar.setItemInventories(null);
			ivar.setItem(item);
			if(ivar.getId() == null) {
				ivar.setCreatedBy(usr);
				ivar.setModifiedBy(usr);
				ivar.setCreatedOn(new Date());
				ivar.setModifiedOn(new Date());
				itemVariantDao.save(ivar);
				inventory.setItemVariant(ivar);
				inventory.setEndingQty(inventory.getBeginning());
				inventory.setCreatedBy(usr);
				inventory.setModifiedBy(usr);
				inventory.setCreatedOn(new Date());
				inventory.setModifiedOn(new Date());
				itemInventoryDao.save(inventory);
			} 
			else {
				ItemVariant variant = itemVariantDao.getOne(ivar);
				ivar.setCreatedBy(variant.getCreatedBy());
				ivar.setModifiedBy(usr);
				ivar.setCreatedOn(variant.getCreatedOn());
				ivar.setModifiedOn(new Date());
				itemVariantDao.update(ivar);
				ItemInventory invent = itemInventoryDao.getOne(inventory);
				inventory.setCreatedBy(invent.getCreatedBy());
				inventory.setCreatedOn(invent.getCreatedOn());
				inventory.setModifiedBy(usr);
				inventory.setModifiedOn(new Date());
				inventory.setItemVariant(ivar);
				itemInventoryDao.update(inventory);
			
			}
		}
		
	}

	public void saveAtauUpdate(Item item) {
		itemDao.saveAtauUpdate(item);
	}
}
