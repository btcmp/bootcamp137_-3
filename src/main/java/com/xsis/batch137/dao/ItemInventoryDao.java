package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;

public interface ItemInventoryDao {
	public void save(ItemInventory itemInventory);
	public List<ItemInventory> selectAll();
	public ItemInventory getOne(ItemInventory itemInventory);
	public void delete(ItemInventory itemInventory);
	public void update(ItemInventory itemInventory);
	public void saveAtauUpdate(ItemInventory itemInventory);
	public List<ItemInventory> searchInventoryByItem(Item item);
	public List<ItemInventory> searchItemInventoryByItemName(String search);
}
