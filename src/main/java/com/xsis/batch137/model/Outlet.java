package com.xsis.batch137.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.NotNull;

@Entity
@Table(name = "OUTLET")
public class Outlet {

	@Id
	private long id;

	@NotNull
	@NotEmpty
	@Size(max = 50)
	private String name;

	private String address;

	@Email
	@Size(max = 50)
	private String email;

	@Size(max = 16)
	private String phone;

	@Column(name = "province_id")
	private long provinceId;

	@Column(name = "region_id")
	private long regionId;

	@Column(name = "district_id")
	private long districtId;

	@Column(name = "postal_code")
	@Size(max = 6)
	private String postalCode;

	@Column(name = "created_by")
	private long createdBy;

	@Column(name = "created_on")
	private Date createdOn;

	@Column(name = "modified_by")
	private long modifiedBy;

	@Column(name = "modified_on")
	private Date modifiedOn;

	@NotNull
	@NotEmpty
	private boolean active;

	// relasi ke emp outlet
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "outlet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<EmployeeOutlet> empOutlet;

	// relate to itemInveroty
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "outlet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ItemInventory> itemInventories;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public long getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(long provinceId) {
		this.provinceId = provinceId;
	}

	public long getRegionId() {
		return regionId;
	}

	public void setRegionId(long regionId) {
		this.regionId = regionId;
	}

	public long getDistrictId() {
		return districtId;
	}

	public void setDistrictId(long districtId) {
		this.districtId = districtId;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public long getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(long modifiedBy) {
		this.modifiedBy = modifiedBy;
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

	public List<ItemInventory> getItemInventories() {
		return itemInventories;
	}

	public void setItemInventories(List<ItemInventory> itemInventories) {
		this.itemInventories = itemInventories;
	}

}
