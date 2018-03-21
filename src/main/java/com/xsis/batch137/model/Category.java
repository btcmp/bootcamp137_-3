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
@Table(name = "CATEGORY")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;
	
	@NotNull
	@NotEmpty
	@Size(max = 50)
	private String name;
	
	@Column(name = "created_on")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name = "created_by", nullable=true)
	private User createdBy;
	
	@ManyToOne
	@JoinColumn(name = "modified_by", nullable=true)
	private User modifiedBy;
	
	@Column(name = "modified_on")
	private Date modifiedOn;
	
	@NotNull
	@NotEmpty
	private boolean active;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Item> items;

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

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
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
