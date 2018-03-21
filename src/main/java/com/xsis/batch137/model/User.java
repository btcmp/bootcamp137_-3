package com.xsis.batch137.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_137")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
}
