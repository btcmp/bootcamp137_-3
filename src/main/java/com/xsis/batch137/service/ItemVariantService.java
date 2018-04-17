package com.xsis.batch137.service;

import java.util.Arrays;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.dao.ItemVariantDao;
import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.ItemVariant;

@Service
@Transactional
public class ItemVariantService {
	@Autowired
	ItemVariantDao itemVariantDao;
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	public void save(ItemVariant itemVariant) {
		itemVariantDao.save(itemVariant);
	}
	public ItemVariant getOne(Long id) {
		ItemVariant itemVariant=new ItemVariant();
		itemVariant.setId(id);
		return itemVariantDao.getOne(itemVariant);
	}
	
	public List<ItemVariant> selectAll(){
		return itemVariantDao.selectAll();
	}
	
	public void delete (ItemVariant itemVariant) {
		itemVariantDao.delete(itemVariant);
	}
	
	public void update(ItemVariant itemVariant) {
		/*temInventory invent = itemVariant.getItemInventories().get(0);
		itemVariant.setItemInventories(null);
		itemVariantDao.update(itemVariant);
		ItemInventory ivt = new ItemInventory();
		ivt.setItemVariant(itemVariant);
		invent.setItemVariant(itemVariant);
		ivt.setTransferStockQty(invent.getTransferStockQty());
		List<ItemInventory> ivFix = itemInventoryDao.searchInventoryByVariant(itemVariant);
		
		System.out.print("id="+ivt.getId()+",");
		System.out.println();
		System.out.print("id="+ivt.getTransferStockQty()+",");
		System.out.println();*/

		//ItemInventory inventory;
		//List<ItemInventory> ivFix = itemInventoryDao.searchInventoryByVariant(itemVariant);
		//for(ItemInventory iv : invent) {
			
			/*for(ItemInventory ivz : ivFix) {
				ivz.setItemVariant(itemVariant);
				System.out.print("id="+ivz.getId()+",");
				System.out.println();
				System.out.print("ts="+ivz.getTransferStockQty()+",");
				System.out.println();
				System.out.print("aqty="+ivz.getAlertAtQty()+",");
				System.out.println();
				System.out.print("="+ivz.getAdjustmentQty()+",");
				System.out.println();
			}*/
			
			
		//}
	}
	
	
	public void saveAtauUpdate(ItemVariant itemVariant) {
		itemVariantDao.saveAtauUpdate(itemVariant);
	}
	
	public List<ItemVariant> searchVariantByItem(Item item){
		return itemVariantDao.searchVariantByItem(item);
	}
	public int countSku(String sku) {
		return itemVariantDao.countSku(sku);
	}
	public void updateActiveVariant(Long id) {
		// TODO Auto-generated method stub
		itemVariantDao.updateActiveVariant(id);
	}
}
