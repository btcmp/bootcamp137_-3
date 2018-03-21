package com.xsis.batch137.model;

import java.sql.Date;
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
@Table(name = "pos_item_variant")
public class ItemVariant {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;

	@Size(max = 255)
	@NotNull
	@NotEmpty
	private String name;

	@Size(max = 50)
	@NotNull
	@NotEmpty
	private String sku;

	@NotNull
	@NotEmpty
	private float price;

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
	private boolean active;

	// relate to item
	@ManyToOne
	@NotNull
	@NotEmpty
	private Item item;

	// relate to intemInvetory
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "itemVariant", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<ItemInventory> itemInventories;

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

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
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

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public List<ItemInventory> getItemInventories() {
		return itemInventories;
	}

	public void setItemInventories(List<ItemInventory> itemInventories) {
		this.itemInventories = itemInventories;
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
