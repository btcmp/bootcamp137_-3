package com.xsis.batch137.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.CategoryDao;
import com.xsis.batch137.dao.ItemDao;
import com.xsis.batch137.model.Category;
import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.User;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ItemDao itemDao;
	
	@Autowired
	HttpSession httpSession;
	
	//
	public void save(Category category) {
		User userLogin = (User) httpSession.getAttribute("userLogin");
		category.setCreatedBy(userLogin);
		category.setActive(true);
		category.setCreatedOn(new Date());
		categoryDao.save(category);
	}
	
	public void update(Category category) {
		User userLogin = (User) httpSession.getAttribute("userLogin");
		category.setModifiedBy(userLogin);
		category.setModifiedOn(new Date());
		categoryDao.update(category);
	}
	
	public void delete(long id) {
		categoryDao.delete(id);
	}
	//
	public List<Category> selectAll() {
		List<Category> categories = categoryDao.selectAll();
		if (categories == null) {
			return null;
		}else {
			for(Category category : categories) {
				List<Item> items = itemDao.getItemByCategory(category);
				if (items == null) {
					category.setItemStock(0);
				}
				else {
					category.setItemStock(items.size());
					//System.out.println(items.size());
				}
				System.out.println(category.getName() + " has " + category.getItemStock() + " Item");
			}
		}
		return categories;
	}
	
	public Category getOne(long id) {
		return categoryDao.getOne(id);
	}

	public List<Category> searchCategory(String search) {
		// TODO Auto-generated method stub
		List<Category> cats = categoryDao.searchCategory(search);
		//Cara yang gagal mengambil itemStock
		/*if(cats == null) {
			return null;
		}
		else {
			for(Category cat : cats) {
				List<Item> items = itemDao.getItemByCategory(cat);
				if(items.isEmpty()) {
					cat.setItemStock(0);
				}
				else {
					cat.setItemStock(items.size());
				}
				//System.out.println(cat.getName() + " has " + cat.getItemStock() + " Item");
			}
		}*/
		return cats;
	}

	public int getItemStock(long id) {
		// TODO Auto-generated method stub
		Category cat = new Category();
		cat.setId(id);
		List<Item> items = itemDao.getItemByCategory(cat);
		if(items == null) {
			return 0;
		}
		else {
			int itemStock = items.size();
			return itemStock;
		}
	}

	public int countCategory(String name) {
		// TODO Auto-generated method stub
		return categoryDao.countCategory(name);
	}
	
}
