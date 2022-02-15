package com.pals.busbooking.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "passanger_details")
public class BookingPassangersEntity {
	@Id
	private String id;
	private String name;
	private Integer age;
	private String gender;
	private String seatNo;
	private boolean status;
	
	public BookingPassangersEntity() {
		super();
	}
	
	public BookingPassangersEntity(String id, String name, Integer age, String gender, String seatNo, boolean status) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.seatNo = seatNo;
		this.status = status;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BookingPassangersEntity [id=" + id + ", name=" + name + ", age=" + age + ", gender=" + gender
				+ ", seatNo=" + seatNo + ", status=" + status + "]";
	}
	
	
}
