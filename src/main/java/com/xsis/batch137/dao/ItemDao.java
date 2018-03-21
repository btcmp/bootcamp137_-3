package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Item;

public interface ItemDao {
	public void save(Item item);
	public List<Item> selectAll();
	public Item getOne(Item item);
	public void delete(Item item);
	public void update(Item item);
	public void saveAtauUpdate(Item item);
}
