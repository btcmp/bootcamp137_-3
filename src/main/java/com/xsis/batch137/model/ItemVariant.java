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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.NotNull;



@Entity
@Table(name="pos_item_variant")
public class ItemVariant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private Long id;
	@Size(max=255)
	@NotNull
	private String name;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "variant", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<AdjustmentDetail> adjustmentDetail;
	
	@ManyToMany(mappedBy = "variantId")
	private List<PurchaseRequestDetail> prds;

	@Size(max=50)
	@NotNull
	private String sku;
	
	@NotNull
	private float price;
	
	@ManyToOne
	@JoinColumn(name = "created_by")
	private User createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name = "modified_by")
	private User modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;
	
	@NotNull
	private Boolean active;
	
	//relate to item
	@ManyToOne
	@NotNull
	private Item item;
	
	//relate to intemInvetory
	@OneToMany(fetch=FetchType.LAZY,mappedBy="itemVariant",cascade=CascadeType.ALL,orphanRemoval=true)
	public List<ItemInventory> itemInventories;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Long getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(Long modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}



	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
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
	
	
}
