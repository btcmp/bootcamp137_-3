package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.CategoryDao;
import com.xsis.batch137.dao.ItemDao;
import com.xsis.batch137.model.Category;
import com.xsis.batch137.model.Item;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ItemDao itemDao;
	
	//
	public void save(Category category) {
		categoryDao.save(category);
	}
	
	public void update(Category category) {
		categoryDao.update(category);
	}
	
	public void delete(long id) {
		Category category = new Category();
		category.setId(id);
		category.setName("Yos");
		category.setActive(false);
		categoryDao.delete(category);
	}
	//
	public List<Category> selectAll() {
		List<Category> categories = categoryDao.selectAll();
		for(Category category : categories) {
			List<Item> items = itemDao.getItemByCategory(category);
			if (items == null) {
				category.setItemStock(0);
			}
			else {
				category.setItemStock(items.size());
			}
		}
		return categories;
	}
	
	public Category getOne(long id) {
		return categoryDao.getOne(id);
	}
}
