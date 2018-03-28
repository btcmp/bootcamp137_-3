package com.xsis.batch137.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class PurchaseOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;
	
	@OneToOne
	@JoinColumn(name="pr_id")
	@JsonBackReference
	private PurchaseRequest prId;
	
	@ManyToOne
	@JoinColumn(name="outlet_id")
	private Outlet outletId;
	
	@ManyToOne
	@JoinColumn(name="supplier_id")
	private Supplier supplierId;
	
	@Column(name="po_no")
	@Size(max=20)
	private String poNo;
	
	@Size(max=250)
	private String notes;
	
	@Column(name="grand_total")
	private float grandTotal;
	
	@Size(max=20)
	private String status;
	
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
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "poId", cascade = CascadeType.ALL)
	private List<PurchaseOrderDetail> pods;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PurchaseRequest getPrId() {
		return prId;
	}

	public void setPrId(PurchaseRequest prId) {
		this.prId = prId;
	}

	public Outlet getOutletId() {
		return outletId;
	}

	public void setOutletId(Outlet outletId) {
		this.outletId = outletId;
	}

	public Supplier getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Supplier supplierId) {
		this.supplierId = supplierId;
	}

	public String getPoNo() {
		return poNo;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public List<PurchaseOrderDetail> getPods() {
		return pods;
	}

	public void setPods(List<PurchaseOrderDetail> pods) {
		this.pods = pods;
	}
	
	
}
