package com.xsis.batch137.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.NotNull;

@Entity
@Table(name = "pos_item_inventory")
public class ItemInventory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;

	@NotNull
	@NotEmpty
	private int beginning;

	@Column(name = "purchase_qty")
	private int purchaseQty;

	@Column(name = "sales_order_qty")
	private int salesOrderQty;

	@Column(name = "transfer_stock_qty")
	private int transferStockQty;

	@Column(name = "adjustment_qty")
	private int adjustmentQty;

	@Column(name = "ending_qty")
	@NotNull
	@NotEmpty
	private int endingQty;

	@Column(name = "alert_at_qty")
	@NotNull
	@NotEmpty
	private int alertAtQty;

	@ManyToOne
	@JoinColumn(name = "created_by")
	private User createdBy;

	@Column(name = "created_on")
	private Date createdOn;

	@ManyToOne
	@JoinColumn(name = "modified_by")
	private User modifiedBy;

	@Column(name = "modified_on")
	private Date modifiedOn;

	@ManyToOne
	private ItemVariant itemVariant;

	@ManyToOne
	@NotNull
	@NotEmpty
	private Outlet outlet;

	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
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

	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public User getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(User modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

}
