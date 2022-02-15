package com.pals.busbooking.controller;

import java.util.Base64;
import java.util.List;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import javax.servlet.http.*;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pals.busbooking.entity.BusBookingEntity;
import com.pals.busbooking.model.BusBookingModel;
import com.pals.busbooking.model.BusDetailsModel;
import com.pals.busbooking.model.UserModel;
import com.pals.busbooking.service.IUserService;

@Controller
public class UserController {
	@Autowired
	private IUserService userServiceObj;
	private String view;
	private BusBookingModel busBookingObj;
	private BusDetailsModel busDetailsObj;
	
	@GetMapping(value= {"/","/index"})
	public ModelAndView indexPage(HttpSession session,ModelAndView mv,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusDetailsModel") BusDetailsModel searcheBusObj) {
		view="index";
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping("/validate")
	public String homePage(HttpSession session,RedirectAttributes redirectAttributes,@ModelAttribute("UserModel") UserModel loginObj) throws UnsupportedEncodingException {
		view="index";
			if(loginObj.getEmail()!=null) {
				List<UserModel> list=userServiceObj.userLoginCheckbyMail(loginObj);
				List<UserModel> list1=userServiceObj.userLoginCheckbyMobile(loginObj);
				session.setAttribute("userImage", "");
				if(!list.isEmpty())
				{
					session.setAttribute("userId", loginObj.getEmail());
					loginObj=userServiceObj.getUserbyId((String)session.getAttribute("userId"));
					if(loginObj.getImage()!=null)
					{
						byte[] encodeBase64 = Base64.getEncoder().encode(loginObj.getImage());
						String base64Encoded = new String(encodeBase64, "UTF-8");
						session.setAttribute("userImage", base64Encoded);
					}
				}
				else if(!list1.isEmpty())
				{
					session.setAttribute("userId", list1.get(0));
					loginObj=userServiceObj.getUserbyId((String)session.getAttribute("userId"));
					if(loginObj.getImage()!=null)
					{
						byte[] encodeBase64 = Base64.getEncoder().encode(loginObj.getImage());
						String base64Encoded = new String(encodeBase64, "UTF-8");
						session.setAttribute("userImage", base64Encoded);
					}
				}
				else
				{
					redirectAttributes.addFlashAttribute("loginCheck","Invalid Email/Mobile number with Password");
				}
			}
		return "redirect:/"+view;
	}
	
	@RequestMapping("/signup")
	public String signUp(HttpSession session,RedirectAttributes redirectAttributes,@Valid @ModelAttribute("UserModel") UserModel signupObj,Errors er) {
		view="index";
			if(er.hasErrors())
			{
				redirectAttributes.addFlashAttribute("error", "error");
			}
			else
			{
				if(!userServiceObj.register(signupObj))
					redirectAttributes.addFlashAttribute("signupCheck","You are already registered!!!");
			}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/profile")
	public ModelAndView getProfile(HttpSession session,ModelAndView mv,@ModelAttribute("UserModel") UserModel loginObj) throws UnsupportedEncodingException {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			loginObj=userServiceObj.getUserbyId((String)session.getAttribute("userId"));
			mv.addObject("UserDetails", loginObj);
			if(loginObj.getImage()!=null)
			{
				byte[] encodeBase64 = Base64.getEncoder().encode(loginObj.getImage());
				String base64Encoded = new String(encodeBase64, "UTF-8");
				session.setAttribute("userImage", base64Encoded);
			}
			view="profile";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/updateprofile")
	public String updateProfile(HttpSession session,@ModelAttribute("UserModel") UserModel loginObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			userServiceObj.updateProfile(loginObj);
			view="profile";
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/uploadimage")
	public String uploadimage(HttpSession session,RedirectAttributes redirectAttributes,@RequestParam("photo") MultipartFile photo) throws IOException {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			if(photo.getSize()<500000)
				userServiceObj.updateProfileImage(photo,(String)session.getAttribute("userId"));
			else
				redirectAttributes.addFlashAttribute("image_size", "size less than 500kb");
			view="profile";
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/searchbus")
	public ModelAndView viewSearchBus(HttpSession session,ModelAndView mv,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusDetailsModel") BusDetailsModel searcheBusObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			if(searcheBusObj.getSource()!=null&&searcheBusObj.getDestination()!=null&&searcheBusObj.getFrom()!=null)
			{
				mv.addObject("searchdetails",userServiceObj.getSearchDetails(searcheBusObj));
				session.setAttribute("selectedsource",searcheBusObj.getSource());
				session.setAttribute("selecteddestination",searcheBusObj.getDestination());
				session.setAttribute("selecteddate",searcheBusObj.getFrom());
				view="searchbus";
			}
			else if(session.getAttribute("selectedsource")!=null)
			{
				searcheBusObj.setSource((String)session.getAttribute("selectedsource"));
				searcheBusObj.setDestination((String)session.getAttribute("selecteddestination"));
				searcheBusObj.setFrom((Date)session.getAttribute("selecteddate"));
				mv.addObject("searchdetails",userServiceObj.getSearchDetails(searcheBusObj));
				view="searchbus";
			}
		}
		mv.setViewName(view);
		return mv;
	}
	
	@GetMapping(value= "/viewseats={busDate}")
	public ModelAndView viewSeats(HttpSession session,ModelAndView mv,@PathVariable(value="busDate") String busDate,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusBookingModel") BusBookingModel busBookObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			String[] bus_date=busDate.split("_");
			mv.addObject("busDetails", userServiceObj.getBusById(busDate));
			mv.addObject("seats",userServiceObj.getBookingSeats(busDate));
			mv.addObject("date", bus_date[1]);
			view="viewseats";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/booking_summary")
	public ModelAndView bookingSummary(HttpSession session,ModelAndView mv,@RequestParam("busid") String busid,@RequestParam("date") String date,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusBookingModel") BusBookingModel busBookObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			long millis=System.currentTimeMillis();  
	        java.sql.Date curr_date=new java.sql.Date(millis);
			busDetailsObj=userServiceObj.getBusById(busid);
			mv.addObject("busDetails", busDetailsObj);
			mv.addObject("passangers", busBookObj.getPassangers());
			mv.addObject("basefare", busDetailsObj.getTicketFare()*busBookObj.getPassangers().size());
			mv.addObject("date", date);
			mv.addObject("curr_date", curr_date);
			mv.addObject("gst", ((busDetailsObj.getTicketFare()*busBookObj.getPassangers().size())*(0.05)));
			view="bookingsummary";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/book_ticket")
	public String bookTickets(HttpSession session,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusBookingModel") BusBookingModel busBookObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			busBookObj.setUserId((String)session.getAttribute("userId"));
			userServiceObj.booking(busBookObj);
			view="my_bookings";
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/my_bookings")
	public ModelAndView myBookings(HttpSession session,ModelAndView mv,@ModelAttribute("UserModel") UserModel loginObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			List<BusBookingEntity> myBookings=userServiceObj.myBookings((String)session.getAttribute("userId"),true);
			mv.addObject("mybookings", myBookings);
			List<BusBookingEntity> myCancels=userServiceObj.myBookings((String)session.getAttribute("userId"),false);
			mv.addObject("mycancels", myCancels);
			view="mybookings";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@GetMapping(value= "/ticketid={ticketId}")
	public ModelAndView ticketView(HttpSession session,ModelAndView mv,@PathVariable(value="ticketId") String ticketId,@ModelAttribute("UserModel") UserModel loginObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			busBookingObj=userServiceObj.getTicketById(ticketId);
			mv.addObject("ticket", busBookingObj);
			mv.addObject("status", busBookingObj.isStatus());
			view="printticket";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/cancel_ticket={ticketId}")
	public String cancelTicket(HttpSession session,@PathVariable(value="ticketId") String ticketId,@ModelAttribute("UserModel") UserModel loginObj) {
		view="index";
		if(session!=null && session.getAttribute("userId")!=null)
		{
			userServiceObj.cancelBooking(ticketId);
			view="my_bookings";
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/otp={id}")
	public String forgetPassword(RedirectAttributes redirectAttributes,@PathVariable("id") String id,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusDetailsModel") BusDetailsModel searcheBusObj) {
		view="index";
		if(userServiceObj.getUserbyId(id+".com").getEmail()!=null)
		{
			long otp=userServiceObj.otp(id+".com");
			redirectAttributes.addFlashAttribute("otp", otp);
			redirectAttributes.addFlashAttribute("forget_mail", id+".com");
		}
		else
			redirectAttributes.addFlashAttribute("user_exist", "User doesn't exist, Please Register...");
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/updatepassword")
	public String updatePassword(RedirectAttributes redirectAttributes,@ModelAttribute("UserModel") UserModel loginObj,@ModelAttribute("BusDetailsModel") BusDetailsModel searcheBusObj) {
		view="index";
		if(loginObj.getEmail()!=null)
		{
			userServiceObj.updatePassword(loginObj);
			redirectAttributes.addFlashAttribute("loginCheck", "Password updated successfully...");
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if(session!=null && session.getAttribute("userId")!=null)
			session.invalidate();
		return "redirect:/";
	}
}
