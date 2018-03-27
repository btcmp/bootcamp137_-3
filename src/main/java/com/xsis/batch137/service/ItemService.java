package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xsis.batch137.dao.ItemDao;
import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.dao.ItemVariantDao;
import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.ItemVariant;


@Service
@Transactional
public class ItemService {
	@Autowired
	ItemDao itemDao;

	@Autowired
	ItemVariantDao itemVariantDao;
	
	@Autowired
	ItemInventoryDao itemInventoryDao;
	

	public void save(Item item) {
		List<ItemVariant> itemVariants = item.getItemVariants();
		item.setItemVariants(null);
		itemDao.save(item);
		
		ItemInventory inventory;
		for(ItemVariant ivar : itemVariants) {
			inventory = ivar.getItemInventories().get(0);
			ivar.setItemInventories(null);
			ivar.setItem(item);
			itemVariantDao.save(ivar);
			
			inventory.setItemVariant(ivar);
			inventory.setEndingQty(inventory.getBeginning());
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
		itemDao.update(item);
		ItemInventory inventory;
		for(ItemVariant ivar : itemVariants) {
			inventory = ivar.getItemInventories().get(0);
			ivar.setItemInventories(null);
			ivar.setItem(item);
			if(ivar.getId() == null) {
				itemVariantDao.save(ivar);
				inventory.setItemVariant(ivar);
				inventory.setEndingQty(inventory.getBeginning());
				itemInventoryDao.save(inventory);
			} 
			else {
				itemVariantDao.update(ivar);
				inventory.setItemVariant(ivar);
				inventory.setEndingQty(inventory.getBeginning());
				itemInventoryDao.update(inventory);
			
			}
		}
		
	}

	public void saveAtauUpdate(Item item) {
		itemDao.saveAtauUpdate(item);
	}
}
