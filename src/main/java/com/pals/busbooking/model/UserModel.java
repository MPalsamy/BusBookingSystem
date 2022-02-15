package com.pals.busbooking.model;


import java.util.List;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

public class UserModel {
	@Pattern(regexp = "[A-Za-z0-9._-]+@[A-Za-z0-9.-]+.[A-Za-z]+" , message = "Email format wrong!!!")
	private String email;
	@Pattern(regexp = "[a-zA-Z ]+", message = "Name must be word!!!")
	private String userName;
	@Pattern(regexp = "[6-9]+[0-9]+", message = "Mobile Number format wrong!!!")
	@Size(min = 10, max = 10 , message = "Mobile Number length must be 10 !!!")
	private String mobile_no;
	@Range(min = 1, max = 100, message = " value must be more then 0 and less then 100 required!!!")
	private Integer age;
	private String gender;
	private byte[] image;
	@Pattern(regexp = "[a-zA-Z@#$_&*0-9]+", message = "Password is weak!!!")
	private String password;
	private List<BusBookingModel> booking;
	
	
	public UserModel(
			@Pattern(regexp = "[A-Za-z0-9._-]+@[A-Za-z0-9.-]+.[A-Za-z]+", message = "Email format wrong!!!") String email,
			@Pattern(regexp = "[a-zA-Z ]+", message = "Name must be word!!!") String userName,
			@Pattern(regexp = "[6-9]+[0-9]+", message = "Mobile Number format wrong!!!") @Size(min = 10, max = 10, message = "Mobile Number length must be 10 !!!") String mobile_no,
			@Range(min = 1, max = 100, message = " value must be more then 0 and less then 100 required!!!") Integer age,
			String gender, byte[] image,
			@Pattern(regexp = "[a-zA-Z@#$_&*0-9]+", message = "Password is weak!!!") String password,
			List<BusBookingModel> booking) {
		super();
		this.email = email;
		this.userName = userName;
		this.mobile_no = mobile_no;
		this.age = age;
		this.gender = gender;
		this.image = image;
		this.password = password;
		this.booking = booking;
	}
	public UserModel() {
		super();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<BusBookingModel> getBooking() {
		return booking;
	}
	public void setBooking(List<BusBookingModel> booking) {
		this.booking = booking;
	}
	
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "UserModel [email=" + email + ", userName=" + userName + ", mobile_no=" + mobile_no + ", age=" + age
				+ ", gender=" + gender + ", password=" + password + ", booking=" + booking + "]";
	}
	
}
