	package com.xsis.batch137.dao;
	
	import java.util.List;
	
	import com.xsis.batch137.model.Item;
	import com.xsis.batch137.model.ItemInventory;
	import com.xsis.batch137.model.ItemVariant;
	import com.xsis.batch137.model.Outlet;
	
	public interface ItemInventoryDao {
		public void save(ItemInventory itemInventory);
		public List<ItemInventory> selectAll();
		public ItemInventory getOne(ItemInventory itemInventory);
		public void delete(ItemInventory itemInventory);
		public void update(ItemInventory itemInventory);
		public void saveAtauUpdate(ItemInventory itemInventory);
		public List<ItemInventory> searchInventoryByItem(Item item);
		public List<ItemInventory> searchItemInventoryByItemName(String search);
		public void updateTransferStock(ItemInventory invent);
		public List<ItemInventory> searchInventoryByVariant(Long search);
		public List<Object> getQtyByItemVariantAndOutlet(ItemVariant iv, Outlet ou);
		public List<ItemInventory> getItemInvetoryByOutlet(Long search, Long id);
		public List<ItemInventory> listInventoryByOutlet(Long search);
		public void updateSalesOrder(ItemInventory itemInventory);
		public List<ItemInventory> getItemInventoryByOutletLogin(long outId);
	//a
	}
