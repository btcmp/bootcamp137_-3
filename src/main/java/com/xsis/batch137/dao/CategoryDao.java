package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Category;

public interface CategoryDao {
//
	public void save(Category category);
	
	public void update(Category category);
	
	public void delete(Category category);
	
	public List<Category> selectAll();
	
	public Category getOne(String id);
}
