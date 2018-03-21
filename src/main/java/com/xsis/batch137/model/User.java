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

@Entity
@Table(name="user_137")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	
	@Size(max=50)
	@Column(nullable=false)
	private String username;
	
	@Column(nullable=false)
	@Size(max=250)
	private String password;
	
	@ManyToOne
	@JoinColumn(name="role_id", nullable=false)
	private Role role;
	
	@OneToOne
	@JoinColumn(name="employee_id", nullable=false)
	private Employee employee;
	
	//crated by
	@ManyToOne
	@JoinColumn(name="created_by", nullable=true)
	private User createdBy;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<User> createdUser;
	
	@Temporal(TemporalType.DATE)
	@Column(name="created_on", nullable=true)
	private Date createdOn;
	
	//modified by
	@ManyToOne
	@JoinColumn(name="modified_by", nullable=true)
	private User modifiedBy;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<User> modifiedUser;
	
	@Temporal(TemporalType.DATE)
	@Column(name="modified_on", nullable=true)
	private Date modifiedOn;
	
	@Column(nullable=false)
	private boolean active;
	//

	//list Role
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Role> createdRole;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<Role> modifiedRole;
	
	// list employee
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Employee> createdEmp;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<Employee> modifiedEmp;
	
	//list category
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Category> createdCategory;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<Category> modifiedCategory;
	
	//list district
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<District> createdDistrict;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<District> modifiedDistrict;
	
	// list Item
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Item> createdItem;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<Item> modifiedItem;
	
	// list Item Inventory
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<ItemInventory> createdItemInventory;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "modifiedBy", cascade = CascadeType.ALL)
	private List<ItemInventory> modifiedItemInventory;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<User> getCreatedUser() {
		return createdUser;
	}

	public void setCreatedUser(List<User> createdUser) {
		this.createdUser = createdUser;
	}

	public List<User> getModifiedUser() {
		return modifiedUser;
	}

	public void setModifiedUser(List<User> modifiedUser) {
		this.modifiedUser = modifiedUser;
	}

	public List<Role> getCreatedRole() {
		return createdRole;
	}

	public void setCreatedRole(List<Role> createdRole) {
		this.createdRole = createdRole;
	}

	public List<Role> getModifiedRole() {
		return modifiedRole;
	}

	public void setModifiedRole(List<Role> modifiedRole) {
		this.modifiedRole = modifiedRole;
	}

	public List<Employee> getCreatedEmp() {
		return createdEmp;
	}

	public void setCreatedEmp(List<Employee> createdEmp) {
		this.createdEmp = createdEmp;
	}

	public List<Employee> getModifiedEmp() {
		return modifiedEmp;
	}

	public void setModifiedEmp(List<Employee> modifiedEmp) {
		this.modifiedEmp = modifiedEmp;
	}

	public List<Category> getCreatedCategory() {
		return createdCategory;
	}

	public void setCreatedCategory(List<Category> createdCategory) {
		this.createdCategory = createdCategory;
	}

	public List<Category> getModifiedCategory() {
		return modifiedCategory;
	}

	public void setModifiedCategory(List<Category> modifiedCategory) {
		this.modifiedCategory = modifiedCategory;
	}

	public List<District> getCreatedDistrict() {
		return createdDistrict;
	}

	public void setCreatedDistrict(List<District> createdDistrict) {
		this.createdDistrict = createdDistrict;
	}

	public List<District> getModifiedDistrict() {
		return modifiedDistrict;
	}

	public void setModifiedDistrict(List<District> modifiedDistrict) {
		this.modifiedDistrict = modifiedDistrict;
	}
	
	//sesuatu
}
