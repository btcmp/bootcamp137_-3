package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ItemVariantDao;
import com.xsis.batch137.model.ItemVariant;

@Service
@Transactional
public class ItemVariantService {
	@Autowired
	ItemVariantDao itemVariantDao;
	
	public void save(ItemVariant itemVariant) {
		itemVariantDao.save(itemVariant);
	}
	public ItemVariant getOne(long id) {
		ItemVariant itemVariant=new ItemVariant();
		return itemVariantDao.getOne(itemVariant);
	}
	
	public List<ItemVariant> selectAll(){
		return itemVariantDao.selectAll();
	}
	
	public void delete (ItemVariant itemVariant) {
		itemVariantDao.delete(itemVariant);
	}
	
	public void update(ItemVariant itemVariant) {
		itemVariantDao.update(itemVariant);
	}
	
	
	public void saveAtauUpdate(ItemVariant itemVariant) {
		itemVariantDao.saveAtauUpdate(itemVariant);
	}
}
