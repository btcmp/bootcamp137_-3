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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="pos_t_pr")
public class PurchaseRequest {

	public PurchaseRequest() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	
	@ManyToOne
	@JoinColumn(name="outlet_id", nullable=false)
	private Outlet outlet;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy="purchaseReq")
	private List<PurchaseRequestHistory> history;
	
	@Column(name="ready_time")
	@Temporal(TemporalType.DATE)
	private Date readyTime;
	
	@Column(name="pr_no")
	@Size(max=20)
	private String prNo;
	
	@Size(max=255)
	private String notes;
	
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
	
	@OneToMany(mappedBy="purchaseReq", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<PurchaseRequestDetail> detail;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy="purchaseReq", cascade = CascadeType.ALL)
	@JsonManagedReference
	private PurchaseOrder order;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getReadyTime() {
		return readyTime;
	}

	public void setReadyTime(Date readyTime) {
		this.readyTime = readyTime;
	}

	public String getPrNo() {
		return prNo;
	}

	public void setPrNo(String prNo) {
		this.prNo = prNo;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
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

	public Outlet getOutlet() {
		return outlet;
	}

	public void setOutlet(Outlet outlet) {
		this.outlet = outlet;
	}

	public List<PurchaseRequestHistory> getHistory() {
		return history;
	}

	public void setHistory(List<PurchaseRequestHistory> history) {
		this.history = history;
	}

	public List<PurchaseRequestDetail> getDetail() {
		return detail;
	}

	public void setDetail(List<PurchaseRequestDetail> detail) {
		this.detail = detail;
	}

	public PurchaseOrder getOrder() {
		return order;
	}

	public void setOrder(PurchaseOrder order) {
		this.order = order;
	}
	

}
