package com.pals.busbooking.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.entity.BusDetailsEntity;
import com.pals.busbooking.entity.UserEntity;
import com.pals.busbooking.model.AdminLoginModel;
import com.pals.busbooking.model.BusDetailsModel;

public interface IAdminRepository {
	public List<AdminLoginModel> adminLoginCheck(AdminLoginModel loginModelObj);
	public AdminLoginModel getAdminProfile(String adminId);
	public void updateProfile(AdminLoginModel loginModelObj);
	public boolean updatePassword(String adminId,String updatedPassword);
	public boolean busIdCheck(String busId);
	public String insertBus(BusDetailsModel busModelObj);
	public List<BusDetailsEntity> busDetails();
	public BusDetailsModel getBusbyId(String busId);
	public boolean updateBusDetails(BusDetailsModel updateBusDetais);
	public List<UserEntity> userDetails();
	public boolean checkBusDetails(BusDetailsEntity busEnityObj);
	public void updateProfileImage(MultipartFile photo, String adminId) throws IOException;
}
