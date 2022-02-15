package com.pals.busbooking.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.entity.BusBookingEntity;
import com.pals.busbooking.entity.BusDetailsEntity;
import com.pals.busbooking.model.BusBookingModel;
import com.pals.busbooking.model.BusDetailsModel;
import com.pals.busbooking.model.UserModel;

public interface IUserService {
	public List<UserModel> userLoginCheckbyMail(UserModel loginObj);
	public List<UserModel> userLoginCheckbyMobile(UserModel loginObj);
	public void updatePassword(UserModel userObj);
	public UserModel getUserbyId(String userId);
	public void updateProfile(UserModel loginObj);
	public List<BusDetailsEntity> getSearchDetails(BusDetailsModel busSearchObj);
	public boolean register(UserModel userObj);
	public BusDetailsModel getBusById(String busId);
	public void booking(BusBookingModel bookingObj);
	public List<String> getBookingSeats(String busDate);
	public List<BusBookingEntity> myBookings(String userId,boolean status);
	public BusBookingModel getTicketById(String ticketId);
	public void cancelBooking(String ticketId);
	public void updateProfileImage(MultipartFile photo, String adminId) throws IOException;
	public long otp(String id);
}
