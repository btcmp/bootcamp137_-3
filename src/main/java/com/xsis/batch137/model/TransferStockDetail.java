package com.xsis.batch137.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="pos_t_transfer_stock_detail")
public class TransferStockDetail {
	//
	public TransferStockDetail() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	//@NotNull
	@ManyToOne
	@JoinColumn(name="transfer_stock")
	private TransferStock transferStock;
	@Column(name="in_stock")
	private int inStock;
	@NotNull
	@ManyToOne
	@JoinColumn(name="item_variant")
	private ItemVariant itemVariant;
	@NotNull
	@Column(name="transfer_qty")
	private int transferQty;
	
	@Column(name="created_on")
	private Date createdOn;

	@Column(name="modified_on")
	private Date modifiedOn;

	@JoinColumn(name="created_by")
	@ManyToOne
	private User createdBy;
	
	@JoinColumn(name="modfied_by")
	@ManyToOne
	private User modifiedBy;
	
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
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public TransferStock getTransferStock() {
		return transferStock;
	}
	public void setTransferStock(TransferStock transferStock) {
		this.transferStock = transferStock;
	}
	public int getInStock() {
		return inStock;
	}
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}
	public ItemVariant getItemVariant() {
		return itemVariant;
	}
	public void setItemVariant(ItemVariant itemVariant) {
		this.itemVariant = itemVariant;
	}
	public int getTransferQty() {
		return transferQty;
	}
	public void setTransferQty(int transferQty) {
		this.transferQty = transferQty;
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
	
	
	
}
