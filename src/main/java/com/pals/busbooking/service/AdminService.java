package com.pals.busbooking.service;

import java.io.IOException;
import java.sql.*;
import java.time.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.entity.BusDatesAvailable;
import com.pals.busbooking.entity.BusDetailsEntity;
import com.pals.busbooking.entity.BusSheets;
import com.pals.busbooking.entity.UserEntity;
import com.pals.busbooking.model.*;
import com.pals.busbooking.repository.*;


@Service
public class AdminService implements IAdminService{
	@Autowired
	private IAdminRepository repositoryObj;
	private BusDatesAvailable busDateObj;
	private BusSheets busSheetObj;
	
	@Override
	public List<AdminLoginModel> adminLoginCheck(AdminLoginModel loginObj)
	{
		List<AdminLoginModel> list=repositoryObj.adminLoginCheck(loginObj);
		return list;
	}
	
	@Override
	public AdminLoginModel getAdminProfile(String adminId)
	{
		return repositoryObj.getAdminProfile(adminId);
	}
	
	@Override
	public void updateProfile(AdminLoginModel loginModelObj)
	{
		repositoryObj.updateProfile(loginModelObj);
	}
	
	@Override
	public void updateProfileImage(MultipartFile photo,String adminId) throws IOException
	{
		repositoryObj.updateProfileImage(photo,adminId);
	}
	
	@Override
	public boolean updatePassword(String adminId,String updatedPassword)
	{
		return repositoryObj.updatePassword(adminId, updatedPassword);
	}
	
	@Override
	public BusDetailsModel insertBus(BusDetailsModel busModelObj)
	{	
		boolean check=true;
		String randomBusId=null;
		if(busModelObj.getBusId()==null)
		{
			while(check)
			{
				randomBusId="BID"+(int)(Math.random()*(9999-1000+1)+1000);
				check=repositoryObj.busIdCheck(randomBusId);
			}
			busModelObj.setBusId(randomBusId);
			return busModelObj;
		}
		else
		{
			Date from=busModelObj.getFrom();
			List<BusDatesAvailable> dates=new ArrayList<BusDatesAvailable>();
			Set<BusSheets> sheets=new HashSet<BusSheets>();
			while(from.compareTo(busModelObj.getTo())!=0)
			{
				busDateObj=new BusDatesAvailable(from);
				dates.add(busDateObj);
				busSheetObj=new BusSheets((busModelObj.getBusId()+"_"+from),from);
				sheets.add(busSheetObj);
				OffsetDateTime odtFromJavaSqlDate = new java.util.Date(from.getTime()).toInstant().atOffset(ZoneOffset.UTC); 
				OffsetDateTime odt = odtFromJavaSqlDate.plusDays(2).with(LocalTime.MIN);
				LocalDate date = odt.toLocalDate();
				from=Date.valueOf(date);
			}
			busDateObj=new BusDatesAvailable(busModelObj.getTo());
			dates.add(busDateObj);
			busModelObj.setDates(dates);
			busSheetObj=new BusSheets((busModelObj.getBusId()+"_"+busModelObj.getTo()),busModelObj.getTo());
			sheets.add(busSheetObj);
			busModelObj.setSheets(sheets);
			busModelObj.setSource(busModelObj.getSource().toLowerCase());
			busModelObj.setDestination(busModelObj.getDestination().toLowerCase());
			if(repositoryObj.insertBus(busModelObj).equals(busModelObj.getBusId()))
				return busModelObj;
			else
				return new BusDetailsModel();
		}
	}
	
	@Override
	public List<BusDetailsEntity> busDetails()
	{
        return repositoryObj.busDetails();
	}
	
	@Override
	public List<UserEntity> userDetails()
	{
		return repositoryObj.userDetails();
	}
	
	@Override
	public BusDetailsModel getBusbyId(String busId)
	{
		return repositoryObj.getBusbyId(busId);
	}
	
	@Override
	public boolean updateBusDetails(BusDetailsModel updateBusDetails)
	{
		updateBusDetails.setSource(updateBusDetails.getSource().toLowerCase());
		updateBusDetails.setDestination(updateBusDetails.getDestination().toLowerCase());
		return repositoryObj.updateBusDetails(updateBusDetails);
	}
}
