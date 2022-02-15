package com.pals.busbooking.model;

public class BookingPassangersModel {
	private String id;
	private String name;
	private Integer age;
	private String gender;
	private String seatNo;
	
	
	public BookingPassangersModel() {
		super();
	}
	public BookingPassangersModel(String id, String name, Integer age, String gender, String seatNo) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.seatNo = seatNo;
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
	@Override
	public String toString() {
		return "BookingPassangers [id=" + id + ", name=" + name + ", Age=" + age + ", gender=" + gender + ", seatNo="
				+ seatNo + "]";
	}
	
}
