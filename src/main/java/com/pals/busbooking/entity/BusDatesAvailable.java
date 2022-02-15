package com.pals.busbooking.entity;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name="busdates")
public class BusDatesAvailable {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer id;
	private Date dates;

	public BusDatesAvailable() {
		super();
	}

	public BusDatesAvailable(Date dates) {
		super();
		this.dates = dates;
	}

	public Date getDates() {
		return dates;
	}

	public void setDates(Date dates) {
		this.dates = dates;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "BusDatesAvailable [id=" + id + ", dates=" + dates + "]";
	}

	
	
}
