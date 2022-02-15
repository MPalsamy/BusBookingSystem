package com.pals.busbooking.repository;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.sql.Date;  

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.pals.busbooking.model.*;
import com.pals.busbooking.entity.*;

@Repository
public class UserRepositary implements IUserRepositary {
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;
	private UserEntity userEntityObj;
	private UserModel userModelObj;
	private BusDetailsEntity busEntityObj;
	private BusDetailsModel busModelObj;
	private BusBookingEntity bookingEntityObj;
	private BusBookingModel bookingModelObj;
	
	@Override
	@Transactional
	public List<UserModel> userLoginCheckbyMail(UserModel loginObj)
	{
		session=sessionFactory.getCurrentSession();
		Query query=session.createNativeQuery("select email from bususers where email = ? and password = ?");
		query.setParameter(1, loginObj.getEmail());
		query.setParameter(2, loginObj.getPassword());
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<UserModel> userLoginCheckbyMobile(UserModel loginObj)
	{
		session=sessionFactory.getCurrentSession();
		Query query=session.createNativeQuery("select email from bususers where mobile_no = ? and password = ?");
		query.setParameter(1, loginObj.getEmail());
		query.setParameter(2, loginObj.getPassword());
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public UserModel getUserProfile(String userId)
	{
		session=sessionFactory.getCurrentSession();
		userEntityObj=session.get(UserEntity.class, userId);
		userModelObj=new UserModel();
		if(userEntityObj!=null)
			BeanUtils.copyProperties(userEntityObj, userModelObj);
		return userModelObj;
	}
	
	@Override
	@Transactional
	public void updateProfile(UserModel loginObj)
	{
		session=sessionFactory.getCurrentSession();
		BeanUtils.copyProperties(loginObj, userEntityObj,getNullPropertyNames(loginObj));
		session.update(userEntityObj);
	}
	
	@Override
	@Transactional
	public void updateProfileImage(MultipartFile photo,String userId) throws IOException
	{
		session=sessionFactory.getCurrentSession();
		byte[] photoBytes = photo.getBytes();
		Query query=session.createNativeQuery("update bususers set profile_image = ? where email = ?");
		query.setParameter(1, photoBytes);
		query.setParameter(2, userId);
		query.executeUpdate();
	}
	
	@Override
	@Transactional
	public void updatePassword(UserModel userObj)
	{
		session=sessionFactory.getCurrentSession();
		Query query=session.createNativeQuery("update bususers set password = ? where email = ?");
		query.setParameter(1, userObj.getPassword());
		query.setParameter(2, userObj.getEmail());
		query.executeUpdate();
	}
	
	@Override
	@Transactional
	public List<BusDetailsEntity> getSearchDetails(BusDetailsModel busSearchObj)
	{
		session=sessionFactory.getCurrentSession();
		List<BusDetailsEntity> list=new ArrayList<BusDetailsEntity>();
		Query query=session.createNativeQuery("select id from busdetails where source = ? and destination = ?");
		query.setParameter(1, busSearchObj.getSource());
		query.setParameter(2, busSearchObj.getDestination());
		List<BusDetailsModel> templist=query.getResultList();
		for(Object busid: templist)
		{
			query=session.createNativeQuery("select date_id from bus_available_dates where bus_id = ?");
			query.setParameter(1, busid);
			for(Object dateid:query.getResultList())
			{
				query=session.createNativeQuery("select * from busdates where id = ? and dates= ?");
				query.setParameter(1, dateid);
				query.setParameter(2, busSearchObj.getFrom());
				if(query.getResultList().size()!=0)
				{
					list.add(session.get(BusDetailsEntity.class, (String)busid));
				}
			}
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<String> getBookingSeats(String busDate)
	{
		session=sessionFactory.getCurrentSession();
		List<String> seats=new ArrayList<String>();
		String[] bus_date=busDate.split("_");
		Query query=session.createNativeQuery("select ticket_id from booking_details where bus_id = ? and journeydate = ?");
		query.setParameter(1, bus_date[0]);
		query.setParameter(2, Date.valueOf(bus_date[1]));
		for(Object ticketid : query.getResultList())
		{
			bookingEntityObj=session.get(BusBookingEntity.class, (String)ticketid);
			for(BookingPassangersEntity passanger:bookingEntityObj.getPassangers())
			{
				if(passanger.isStatus())
					seats.add(passanger.getSeatNo());
			}
		}
		return seats;
	}
	
	@Override
	@Transactional
	public String register(UserModel userObj)
	{
		session=sessionFactory.getCurrentSession();
		userEntityObj=new UserEntity();
		BeanUtils.copyProperties(userObj, userEntityObj,getNullPropertyNames(userObj));
		if(getUserbyId(userObj))		
			return (String)session.save(userEntityObj);
		return "";
	}
	
	@Override
	@Transactional
	public boolean getUserbyId(UserModel userObj)
	{
		session=sessionFactory.getCurrentSession();
		Query query=session.createNativeQuery("select * from bususers where email = ? or mobile_no = ?");
		query.setParameter(1, userObj.getEmail());
		query.setParameter(2, userObj.getMobile_no());
		if(query.getResultList().isEmpty())
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public BusDetailsModel getBusById(String busId)
	{
		session=sessionFactory.getCurrentSession();
		busModelObj=new BusDetailsModel();
		busEntityObj=session.get(BusDetailsEntity.class, busId);
		BeanUtils.copyProperties(busEntityObj, busModelObj);
		return busModelObj;
	}
	
	@Override
	@Transactional
	public boolean ticketIdCheck(String ticketId)
	{
		session=sessionFactory.getCurrentSession();
		bookingEntityObj=session.get(BusBookingEntity.class, ticketId);
		if(bookingEntityObj!=null)
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public boolean passangerIdCheck(String passangerId)
	{
		session=sessionFactory.getCurrentSession();
		BookingPassangersEntity passangerObj=session.get(BookingPassangersEntity.class, passangerId);
		if(passangerObj!=null)
			return true;
		return false;
	}
	
	@Override
	@Transactional
	public String booking(BusBookingModel bookingObj,List<BookingPassangersEntity> passangerList)
	{
		session=sessionFactory.getCurrentSession();
		bookingEntityObj=new BusBookingEntity();
		BeanUtils.copyProperties(bookingObj, bookingEntityObj,getNullPropertyNames(bookingObj));
		bookingEntityObj.setStatus(true);
		bookingEntityObj.setPassangers(passangerList);
		return (String)session.save(bookingEntityObj);
	}
	
	@Override
	@Transactional
	public List<BusBookingEntity> myBookings(String userId,boolean status)
	{
		session=sessionFactory.getCurrentSession();
		List<BusBookingEntity> myBookingList=new ArrayList<BusBookingEntity>();
		Query query=session.createNativeQuery("select ticket_id from booking_details where user_id=? ORDER BY bookingdate DESC");
		query.setParameter(1, userId);
		for(Object ticketid : query.getResultList())
		{
			bookingEntityObj=session.get(BusBookingEntity.class, (String)ticketid);
			if(status==bookingEntityObj.isStatus())
				myBookingList.add(bookingEntityObj);
		}
		return myBookingList;
	}
	
	@Override
	@Transactional
	public BusBookingModel getTicketById(String ticketId)
	{
		session=sessionFactory.getCurrentSession();
		bookingModelObj=new BusBookingModel();
		bookingEntityObj=session.get(BusBookingEntity.class, ticketId);
		BeanUtils.copyProperties(bookingEntityObj, bookingModelObj);
		return bookingModelObj;
	}
	
	@Override
	@Transactional
	public void cancelBooking(String ticketId)
	{
		session=sessionFactory.getCurrentSession();
		List<BookingPassangersEntity> passangerList=new ArrayList<BookingPassangersEntity>();
		bookingEntityObj=session.get(BusBookingEntity.class, ticketId);
		for(BookingPassangersEntity passanger:bookingEntityObj.getPassangers())
		{
			passanger.setStatus(false);
			passangerList.add(passanger);
		}
		bookingEntityObj.setStatus(false);
		session.saveOrUpdate(bookingEntityObj);
	}
	
	public static String[] getNullPropertyNames(UserModel source) {
	    final BeanWrapper src = new BeanWrapperImpl(source);
	    PropertyDescriptor[] pds = src.getPropertyDescriptors();

	    Set<String> emptyNames = new HashSet<String>();
	    for (PropertyDescriptor pd : pds) {
	        Object srcValue = src.getPropertyValue(pd.getName());
	        if (srcValue == null||srcValue.equals("")&&pd.getName()!="password")
	            emptyNames.add(pd.getName());
	    }
	    String[] result = new String[emptyNames.size()];
	    return emptyNames.toArray(result);
	}
	
	public static String[] getNullPropertyNames(BusBookingModel source) {
	    final BeanWrapper src = new BeanWrapperImpl(source);
	    PropertyDescriptor[] pds = src.getPropertyDescriptors();

	    Set<String> emptyNames = new HashSet<String>();
	    for (PropertyDescriptor pd : pds) {
	        Object srcValue = src.getPropertyValue(pd.getName());
	        if (srcValue == null||srcValue.equals(""))
	            emptyNames.add(pd.getName());
	    }
	    String[] result = new String[emptyNames.size()];
	    return emptyNames.toArray(result);
	}
}

