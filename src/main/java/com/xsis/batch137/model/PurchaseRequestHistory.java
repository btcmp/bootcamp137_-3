package com.xsis.batch137.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PurchaseRequestHistory {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
}
