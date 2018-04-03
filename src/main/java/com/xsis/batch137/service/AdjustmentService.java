package com.xsis.batch137.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.AdjustmentDao;
import com.xsis.batch137.dao.AdjustmentDetailDao;
import com.xsis.batch137.dao.AdjustmentHistoryDao;
import com.xsis.batch137.dao.ItemInventoryDao;
import com.xsis.batch137.dao.OutletDao;
import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.model.AdjustmentDetail;
import com.xsis.batch137.model.AdjustmentHistory;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;

@Service
@Transactional
public class AdjustmentService {

	@Autowired
	AdjustmentDao adjustmentDao;
	
	@Autowired
	ItemInventoryDao inventoryDao;
	
	@Autowired
	OutletDao outletDao;
	
	@Autowired
	AdjustmentDetailDao detailDao;
	
	@Autowired
	AdjustmentHistoryDao historyDao;
	
	public void save(Adjustment adjustment) {
		Adjustment adjust = new Adjustment();
		adjust.setOutlet(adjustment.getOutlet());
		adjust.setStatus(adjustment.getStatus());
		adjust.setNotes(adjustment.getNotes());
		adjust.setCreatedOn(new Date());
		adjustmentDao.save(adjust);
		
		/*for(AdjustmentDetail det : adjustment.getAdjustmentDetails()) {
			AdjustmentDetail detail =  new AdjustmentDetail();
			detail.setActualStock(det.getActualStock());
			detail.setInStock(det.getInStock());
			detail.setVariant(det.getVariant());
			detail.setAdjustment(adjust);
			detailDao.save(detail);
		}*/
		
		
		/*AdjustmentHistory history = new AdjustmentHistory();
		history.setAdjustment(adjust);
		history.setStatus(getStatus());
		historyDao.save(history);*/
			
	}
	
	public void update(Adjustment adjustment) {
		adjustmentDao.update(adjustment);
	}
	
	public void delete(long id) {
		Adjustment adjustment = new Adjustment();
		adjustment.setId(id);
		adjustmentDao.delete(adjustment);
	}
	
	public List<Adjustment> getAll() {
		return adjustmentDao.selectAll();
	}
	
	public Adjustment getOne(long id) {
		return adjustmentDao.getOne(id);
	}

	public List<Outlet> getOutletForAdjustment() {
		// TODO Auto-generated method stub
		return outletDao.selectActive();
	}

	//search item
	public List<ItemInventory> searchItem(String search) {
		// TODO Auto-generated method stub
		return inventoryDao.searchItemInventoryByItemName(search);
	}

	public List<ItemInventory> getInventory() {
		// TODO Auto-generated method stub
		return inventoryDao.selectAll();
	}
}
