package com.pals.busbooking.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pals.busbooking.model.*;
import com.pals.busbooking.service.*;

@Controller
@RequestMapping("/admin")
@MultipartConfig
public class AdminController {
	@Autowired
	private IAdminService serviceObj;
	private String view;
	
	@GetMapping("/")
	public ModelAndView loginPage(HttpSession session,ModelAndView mv,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			mv.addObject("totalBuses",serviceObj.busDetails().size());
			mv.addObject("totalUsers", serviceObj.userDetails().size());
			view="admin/dashboard";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping("/validate")
	public String homePage(HttpSession session,RedirectAttributes redirectAttributes,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/";
		if(session!=null && session.getAttribute("adminId")==null)
		{
			if(loginObj.getAdminId()!=null) {
				List<AdminLoginModel> list=serviceObj.adminLoginCheck(loginObj);
				if(!list.isEmpty())
				{
					session.setAttribute("adminId", loginObj.getAdminId());
					view="admin/dashboard";
				}
				else
				{
					redirectAttributes.addFlashAttribute("loginCheck","Id/Password Wrong");
				}
			}
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/dashboard")
	public ModelAndView getDashboard(HttpSession session,ModelAndView mv,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			view="admin/dashboard";
			mv.addObject("totalBuses",serviceObj.busDetails().size());
			mv.addObject("totalUsers", serviceObj.userDetails().size());
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/allusers")
	public ModelAndView getAllUsers(HttpSession session,ModelAndView mv,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			mv.addObject("userDetails", serviceObj.userDetails());
			view="admin/view_user";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/addbus")
	public ModelAndView addBus(HttpSession session,ModelAndView mv,@ModelAttribute("BusDetailsModel") BusDetailsModel registerBusObj,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			registerBusObj=serviceObj.insertBus(registerBusObj);
			mv.addObject("busId", registerBusObj.getBusId());
			view="admin/add_bus";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/insertbus")
	public String insertBus(HttpSession session,RedirectAttributes redirectAttributes,@Valid @ModelAttribute("BusDetailsModel") BusDetailsModel registerBusObj,Errors er) {
		view="admin/";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			if(er.hasErrors() ) {
				view="admin/addbus";
			} 
			else {
				registerBusObj=serviceObj.insertBus(registerBusObj);
				if(registerBusObj.getBusId()!=null && registerBusObj.getBusName()!=null)
					redirectAttributes.addFlashAttribute("insertAck","Bus Registered Successfully");
				else
					redirectAttributes.addFlashAttribute("insertAck","Error in Registration, This Busname with same timing's is already present...");
				view="admin/addbus";
			}
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/allbus")
	public ModelAndView getAllBuses(HttpSession session,ModelAndView mv,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			mv.addObject("BusDetails", serviceObj.busDetails());
			view="admin/view_bus";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping("/editbusid={updateBusId}")
	public ModelAndView editBus(HttpSession session,ModelAndView mv,@PathVariable(value="updateBusId") String updateBusId,@Valid @ModelAttribute("BusDetailsModel") BusDetailsModel updateBusObj,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj,Errors er) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			if(er.hasErrors() ) {
				view="admin/editbusid="+updateBusObj.getBusId();
			} 
			else {
				BusDetailsModel busdetail=serviceObj.getBusbyId(updateBusId);
				mv.addObject("bus", busdetail);
				view="admin/edit_bus";
			}
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping("/updatebusdetails")
	public String updateBusDetails(HttpSession session,RedirectAttributes redirectAttributes,@Valid @ModelAttribute("BusDetailsModel") BusDetailsModel updateBusObj,Errors er) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			if(er.hasErrors() ) {
				view="admin/editbusid="+updateBusObj.getBusId();
			} 
			else {
				if(serviceObj.updateBusDetails(updateBusObj))
					redirectAttributes.addFlashAttribute("updateAck","Bus details updated successfully");
				else
					redirectAttributes.addFlashAttribute("updateAck","Error in updation, This busname with same timing's is already present...");
				view="admin/editbusid="+updateBusObj.getBusId();
			}
		}
		return "redirect:/"+view;
	}
	
	
	@RequestMapping(value= "/profile")
	public ModelAndView getProfile(HttpSession session,ModelAndView mv,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) throws UnsupportedEncodingException {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			loginObj=serviceObj.getAdminProfile((String)session.getAttribute("adminId"));
			byte[] encodeBase64 = Base64.getEncoder().encode(loginObj.getImage());
		    String base64Encoded = new String(encodeBase64, "UTF-8");
		    mv.addObject("userImage", base64Encoded);
			mv.addObject("AdminDetails", loginObj);
			view="admin/admin_profile";
		}
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping(value= "/updateprofile")
	public String updateProfile(HttpSession session,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			serviceObj.updateProfile(loginObj);
			view="admin/profile";
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/uploadimage")
	public String updateProfileImage(HttpSession session,@RequestParam("photo") MultipartFile photo) throws IOException {
		view="admin/";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			serviceObj.updateProfileImage(photo,(String)session.getAttribute("adminId"));
			view="admin/profile";
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping(value= "/passwordchange")
	public String adminPassword(HttpSession session,@ModelAttribute("AdminLoginModel") AdminLoginModel loginObj) {
		view="admin/login";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			view="admin/update_password";
		}
		return view;
	}
	
	@RequestMapping(value= "/updatepassword")
	public String updatePassword(HttpSession session,RedirectAttributes redirectAttributes,@RequestParam("current_password") String currentPass,@RequestParam("new_password") String newPass,@RequestParam("confirm_password") String confirmPass) {
		view="admin/passwordchange";
		if(session!=null && session.getAttribute("adminId")!=null)
		{
			boolean check=currentPass.equals(serviceObj.getAdminProfile((String)session.getAttribute("adminId")).getAdminPassword());
			if(newPass.equals(confirmPass)&&!currentPass.equals(newPass)&&check)
			{
				serviceObj.updatePassword((String)session.getAttribute("adminId"), newPass);
				view="admin/";
				session.invalidate();
			}
			else if(currentPass.equals(newPass))
				redirectAttributes.addFlashAttribute("passwordAck","Current and New Password Same");
			else
				redirectAttributes.addFlashAttribute("passwordAck","Current Password is Incorrect");
		}
		return "redirect:/"+view;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if(session!=null && session.getAttribute("adminId")!=null)
			session.invalidate();
		return "redirect:/admin/";
	}
}
