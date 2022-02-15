package com.pals.busbooking.model;

public class AdminLoginModel {
	private String adminId;
	private String name;
	private String mobile_no;
	private String email;
	private Integer age;
	private String gender;
	private byte[] image;
	private String adminPassword;
	
	public AdminLoginModel() {
		super();
	}
	
	public AdminLoginModel(String adminId, String adminPassword) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
	}

	public AdminLoginModel(String adminId, String name, String mobile_no, String email, Integer age, String gender,
			byte[] image, String adminPassword) {
		super();
		this.adminId = adminId;
		this.name = name;
		this.mobile_no = mobile_no;
		this.email = email;
		this.age = age;
		this.gender = gender;
		this.image = image;
		this.adminPassword = adminPassword;
	}

	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "AdminLoginEntity [adminId=" + adminId + ", name=" + name + ", mobile_no=" + mobile_no + ", email="
				+ email + ", age=" + age + ", gender=" + gender + ", adminPassword=" + adminPassword + "]";
	}
	
}