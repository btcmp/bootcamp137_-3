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
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Employee {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	
	@Size(min=1, max = 50, message="Harus 1-50 karakter")
	@Column(name="first_name", nullable=false)
	@NotNull
	@NotEmpty
	private String firstName;
	
	@Size(min=1, max=50, message="Harus 1-50 karakter")
	@Column(name="last_name", nullable=false)
	@NotNull
	@NotEmpty
	private String lastName;
	
	@Email
	@Size(min=1, max=50, message="Harus 1-50 karakter")
	@Column(nullable=true)
	private String email;
	
	@Column(nullable=true)
	@Size(min=1, max=50, message="Harus 1-50 karakter")
	private String title;
	
	@Column(name="have_account", nullable=false)
	@NotNull
	private boolean haveAccount;
	
	@Temporal(TemporalType.DATE)
	@Column(name="created_on", nullable=true)
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name="created_by", nullable=true)
	private User createdBy;
	
	@ManyToOne
	@JoinColumn(name="modified_by", nullable=true)
	private User modifiedBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="modified_on", nullable=true)
	private Date modifiedOn;
	
	@Column(nullable=false)
	@NotNull
	private boolean active;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval=true)
	private List<EmployeeOutlet> empOutlet;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isHaveAccount() {
		return haveAccount;
	}

	public void setHaveAccount(boolean haveAccount) {
		this.haveAccount = haveAccount;
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

	public List<EmployeeOutlet> getEmpOutlet() {
		return empOutlet;
	}

	public void setEmpOutlet(List<EmployeeOutlet> empOutlet) {
		this.empOutlet = empOutlet;
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
