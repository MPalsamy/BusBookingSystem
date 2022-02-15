package com.pals.busbooking.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "bususers")
public class UserEntity {
	@Id
	@Column(nullable = false,unique = true)
	private String email;
	@Column(name="username",nullable = false)
	private String userName;
	@Column(nullable = false,unique = true)
	private String mobile_no;
	private Integer age;
	private String gender;
	@Column(name="profile_image")
	private byte[] image;
	private String password;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "bus_tickets", joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "email") }, 
	inverseJoinColumns = {@JoinColumn(name = "ticket_id", referencedColumnName = "ticket_id")})
	private List<BusBookingEntity> booking;
	
	public UserEntity(String email, String userName, String mobile_no, Integer age, String gender, byte[] image,
			String password, List<BusBookingEntity> booking) {
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
	public UserEntity() {
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
	
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public List<BusBookingEntity> getBooking() {
		return booking;
	}
	public void setBooking(List<BusBookingEntity> booking) {
		this.booking = booking;
	}
	@Override
	public String toString() {
		return "UserRepositary [email=" + email + ", userName=" + userName + ", mobile_no=" + mobile_no + ", age=" + age
				+ ", gender=" + gender + ", password=" + password + "]";
	}
	
}
