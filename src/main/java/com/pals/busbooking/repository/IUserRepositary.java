package com.pals.busbooking.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.entity.BookingPassangersEntity;
import com.pals.busbooking.entity.BusBookingEntity;
import com.pals.busbooking.entity.BusDetailsEntity;
import com.pals.busbooking.model.BusBookingModel;
import com.pals.busbooking.model.BusDetailsModel;
import com.pals.busbooking.model.UserModel;

public interface IUserRepositary {
	public List<UserModel> userLoginCheckbyMail(UserModel loginObj);
	public List<UserModel> userLoginCheckbyMobile(UserModel loginObj);
	public UserModel getUserProfile(String userId);
	public void updateProfile(UserModel loginObj);
	public BusDetailsModel getBusById(String busId);
	public void updatePassword(UserModel userObj);
	public List<BusDetailsEntity> getSearchDetails(BusDetailsModel busSearchObj);
	public String register(UserModel userObj);
	public String booking(BusBookingModel bookingObj,List<BookingPassangersEntity> passangerList);
	public boolean ticketIdCheck(String ticketId);
	public boolean passangerIdCheck(String passangerId);
	public List<String> getBookingSeats(String busDate);
	public List<BusBookingEntity> myBookings(String userId,boolean status);
	public BusBookingModel getTicketById(String ticketId);
	public void cancelBooking(String ticketId);
	public boolean getUserbyId(UserModel userObj);
	void updateProfileImage(MultipartFile photo, String adminId) throws IOException;
}
