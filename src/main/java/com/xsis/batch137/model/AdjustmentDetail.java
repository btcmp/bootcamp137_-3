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

@Entity
@Table(name="adjustment_detail")
public class AdjustmentDetail {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	@Column(name="in_stock")
	private int inStock;
	@Column(name="actual_stock")
	private int actualStock;
	@ManyToOne
	@JoinColumn(name="created_by")
	private User createdBy;
	@Column(name="created_on")
	private Date createdOn;
	@ManyToOne
	@JoinColumn(name="modified_by")
	private User modifiedBy;
	@Column(name="modified_on")
	private Date modifiedOn;
	@ManyToOne
	private Adjustment adjustment;
	@ManyToOne
	private ItemVariant variant;
	
	//
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getInStock() {
		return inStock;
	}
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}
	public int getActualStock() {
		return actualStock;
	}
	public void setActualStock(int actualStock) {
		this.actualStock = actualStock;
	}
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public User getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(User modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public Adjustment getAdjustment() {
		return adjustment;
	}
	public void setAdjustment(Adjustment adjustment) {
		this.adjustment = adjustment;
	}
	public ItemVariant getVariant() {
		return variant;
	}
	public void setVariant(ItemVariant variant) {
		this.variant = variant;
	}
	
}
