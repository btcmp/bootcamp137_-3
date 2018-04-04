package com.xsis.batch137.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.NotNull;
import com.sun.istack.Nullable;

@Entity
@Table(name="pos_item_inventory")
public class ItemInventory {

	public ItemInventory() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private Long id;
	@NotNull
	private int beginning;
	@Column(name="purchase_qty")
	private int purchaseQty;
	@Column(name="sales_order_qty")
	private int salesOrderQty;
	@Column(name="transfer_stock_qty")
	private int transferStockQty;
	@Column(name="adjustment_qty")
	private int adjustmentQty;
	@Column(name="ending_qty")
	/*@NotNull
	@NotEmpty*/
	private int endingQty;
	@Column(name="alert_at_qty")
	@NotNull
	private int alertAtQty;
	@Column(name="created_by")
	private Long createdBy;
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="modified_by")
	private Long modifiedBy;
	@Column(name="modified_on")
	private Date modifiedOn;

	@ManyToOne
	private ItemVariant itemVariant;
	
	@ManyToOne
	private Outlet outlet;
	
	//save data qty sementara
	@Transient
	private int qtySalesOrder;
	

	public int getQtySalesOrder() {
		return qtySalesOrder;
	}

	public void setQtySalesOrder(int qtySalesOrder) {
		this.qtySalesOrder = qtySalesOrder;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getBeginning() {
		return beginning;
	}

	public void setBeginning(int beginning) {
		this.beginning = beginning;
	}

	public int getPurchaseQty() {
		return purchaseQty;
	}

	public void setPurchaseQty(int purchaseQty) {
		this.purchaseQty = purchaseQty;
	}

	public int getSalesOrderQty() {
		return salesOrderQty;
	}

	public void setSalesOrderQty(int salesOrderQty) {
		this.salesOrderQty = salesOrderQty;
	}

	public int getTransferStockQty() {
		return transferStockQty;
	}

	public void setTransferStockQty(int transferStockQty) {
		this.transferStockQty = transferStockQty;
	}

	public int getAdjustmentQty() {
		return adjustmentQty;
	}

	public void setAdjustmentQty(int adjustmentQty) {
		this.adjustmentQty = adjustmentQty;
	}

	public int getEndingQty() {
		return endingQty;
	}

	public void setEndingQty(int endingQty) {
		this.endingQty = endingQty;
	}

	public int getAlertAtQty() {
		return alertAtQty;
	}

	public void setAlertAtQty(int alertAtQty) {
		this.alertAtQty = alertAtQty;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Long getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(Long modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public ItemVariant getItemVariant() {
		return itemVariant;
	}

	public void setItemVariant(ItemVariant itemVariant) {
		this.itemVariant = itemVariant;
	}

	public Outlet getOutlet() {
		return outlet;
	}

	public void setOutlet(Outlet outlet) {
		this.outlet = outlet;
	}
	
	
	
	
}