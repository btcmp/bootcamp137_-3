package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ItemDao;
import com.xsis.batch137.model.Item;

@Service
@Transactional
public class ItemService {
	@Autowired
	ItemDao itemDao;
	
	public void save(Item item) {
		itemDao.save(item);
	}
	public Item getOne(long id) {
		Item item=new Item();
		return itemDao.getOne(item);
	}
	
	public List<Item> selectAll(){
		return itemDao.selectAll();
	}
	
	public void delete (Item item) {
		itemDao.delete(item);
	}
	
	public void update(Item item) {
		itemDao.update(item);
	}
	
	
	public void saveAtauUpdate(Item item) {
		itemDao.saveAtauUpdate(item);
	}
}
