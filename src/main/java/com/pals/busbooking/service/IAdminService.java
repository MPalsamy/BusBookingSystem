package com.pals.busbooking.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.entity.BusDetailsEntity;
import com.pals.busbooking.entity.UserEntity;
import com.pals.busbooking.model.AdminLoginModel;
import com.pals.busbooking.model.BusDetailsModel;

public interface IAdminService {
	public List<AdminLoginModel> adminLoginCheck(AdminLoginModel loginObj);
	public AdminLoginModel getAdminProfile(String adminId);
	public void updateProfile(AdminLoginModel loginModelObj);
	public boolean updatePassword(String adminId,String updatedPassword);
	public BusDetailsModel insertBus(BusDetailsModel busModelObj);
	public List<BusDetailsEntity> busDetails();
	public BusDetailsModel getBusbyId(String busId);
	public boolean updateBusDetails(BusDetailsModel updateBusDetails);
	public List<UserEntity> userDetails();
	public void updateProfileImage(MultipartFile photo, String adminId) throws IOException;
}
