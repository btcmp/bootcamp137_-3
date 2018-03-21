package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.model.ItemInventory;

@Service
@Transactional
public class ItemInventoryService {
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	public void save(ItemInventory itemInventory) {
		itemInventoryDao.save(itemInventory);
	}
	public ItemInventory getOne(long id) {
		ItemInventory itemInventory=new ItemInventory();
		return itemInventoryDao.getOne(itemInventory);
	}
	
	public List<ItemInventory> selectAll(){
		return itemInventoryDao.selectAll();
	}
	
	public void delete (ItemInventory itemInventory) {
		itemInventoryDao.delete(itemInventory);
	}
	
	public void update(ItemInventory itemInventory) {
		itemInventoryDao.update(itemInventory);
	}
	
	
	public void saveAtauUpdate(ItemInventory itemInventory) {
		itemInventoryDao.saveAtauUpdate(itemInventory);
	}
}
