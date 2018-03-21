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

import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.NotNull;

@Entity
@Table(name = "PROVINCE")
public class Province {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;

	@NotNull
	@NotEmpty
	@Size(max = 50)
	@Column(nullable=false)
	private String name;

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

	@NotNull
	@NotEmpty
	@Column(nullable=false)
	private boolean active;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "province", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Region> regions;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "provinceId", cascade = CascadeType.ALL)
	private List<Supplier> supplier;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "provinceId", cascade = CascadeType.ALL)
	private List<Outlet> outlet;

	public List<Region> getRegions() {
		return regions;
	}

	public void setRegions(List<Region> regions) {
		this.regions = regions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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

	public List<Supplier> getSupplier() {
		return supplier;
	}

	public void setSupplier(List<Supplier> supplier) {
		this.supplier = supplier;
	}

	public List<Outlet> getOutlet() {
		return outlet;
	}

	public void setOutlet(List<Outlet> outlet) {
		this.outlet = outlet;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


}
