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
		adjust.setStatus("Submitted");
		adjust.setCreatedOn(new Date());
		adjustmentDao.save(adjust); //dapat id adjustment sepertinya dari sini
		
		for(AdjustmentDetail det : adjustment.getAdjustmentDetails()) {
			AdjustmentDetail detail =  new AdjustmentDetail();
			detail.setActualStock(det.getActualStock());
			detail.setInStock(det.getInStock());
			detail.setVariant(det.getVariant());
			detail.setCreatedOn(new Date());
			detail.setAdjustment(adjust); //ternyata dia sudah punya id adjustment
			
		System.out.println("Detail Variant: "+detail.getVariant().getId());
		System.out.println("Detail Adjustment: "+detail.getAdjustment().getId());
			detailDao.save(detail);
		}
		
		
		AdjustmentHistory history = new AdjustmentHistory();
		history.setAdjustment(adjust);
		history.setCreatedOn(new Date());
		history.setStatus(adjust.getStatus());
		historyDao.save(history);
			
	}
	
	//Update di sini ketika done di Adjustment Detail
	public List<AdjustmentHistory> update(Adjustment adjustment) {
		adjustment.setModifiedOn(new Date());
		adjustmentDao.update(adjustment);
		AdjustmentHistory history = new AdjustmentHistory();
		history.setAdjustment(adjustment);
		history.setCreatedOn(new Date());
		history.setStatus(adjustment.getStatus());
		historyDao.save(history);
		return historyDao.getHistoryByAdjustment(adjustment);
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
		Adjustment adjustment = adjustmentDao.getOne(id);
		List<AdjustmentDetail> details = detailDao.getDetailByAdjustment(adjustment);
		List<AdjustmentHistory> histories = historyDao.getHistoryByAdjustment(adjustment);
		adjustment.setAdjustmentDetails(details);
		adjustment.setAdjustmentHistories(histories);
		/*adjustment.getAdjustmentDetails();
		adjustment.getAdjustmentHistories();*/
		return adjustment;
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
