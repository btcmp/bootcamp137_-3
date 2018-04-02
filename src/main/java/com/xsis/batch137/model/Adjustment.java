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
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="adjustment")
public class Adjustment {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	
	private String notes;
	
	@Column(nullable=false)
	@Size(max=20)
	private String status;
	
	@JoinColumn(name="created_by")
	@ManyToOne
	private User createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@JoinColumn(name="modified_by")
	@ManyToOne
	private User modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;
	
	@ManyToOne
	@JoinColumn(name="outlet_id", nullable=false)
	private Outlet outlet;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "adjustment", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<AdjustmentDetail> adjustmentDetails;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "adjustment", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<AdjustmentHistory> adjustmentHistories;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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

}
