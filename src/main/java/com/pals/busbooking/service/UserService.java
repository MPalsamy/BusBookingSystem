package com.pals.busbooking.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.pals.busbooking.entity.BookingPassangersEntity;
import com.pals.busbooking.entity.BusBookingEntity;
import com.pals.busbooking.entity.BusDetailsEntity;
import com.pals.busbooking.model.BookingPassangersModel;
import com.pals.busbooking.model.BusBookingModel;
import com.pals.busbooking.model.BusDetailsModel;
import com.pals.busbooking.model.UserModel;
import com.pals.busbooking.repository.*;

@Service
public class UserService implements IUserService{
	@Autowired
	private IUserRepositary userRepositoryObj;
	
	@Override
	public List<UserModel> userLoginCheckbyMail(UserModel loginObj)
	{
		return userRepositoryObj.userLoginCheckbyMail(loginObj);
	}
	
	@Override
	public List<UserModel> userLoginCheckbyMobile(UserModel loginObj)
	{
		return userRepositoryObj.userLoginCheckbyMobile(loginObj);
	}
	
	@Override
	public UserModel getUserbyId(String userId)
	{
		return userRepositoryObj.getUserProfile(userId);
	}
	
	@Override
	public void updateProfile(UserModel loginObj)
	{
		userRepositoryObj.updateProfile(loginObj);
	}
	
	@Override
	public void updateProfileImage(MultipartFile photo,String userId) throws IOException
	{
		userRepositoryObj.updateProfileImage(photo,userId);
	}
	
	@Override
	public void updatePassword(UserModel userObj)
	{
		userRepositoryObj.updatePassword(userObj);
	}
	
	@Override
	public List<BusDetailsEntity> getSearchDetails(BusDetailsModel busSearchObj)
	{
		busSearchObj.setSource(busSearchObj.getSource().toLowerCase());
		busSearchObj.setDestination(busSearchObj.getDestination().toLowerCase());
		return userRepositoryObj.getSearchDetails(busSearchObj);
	}
	
	@Override
	public boolean register(UserModel userObj)
	{
		userObj.setEmail(userObj.getEmail().toLowerCase());
		String id=userRepositoryObj.register(userObj);
		
		if(id.equals(userObj.getEmail()))
		{
			String content="<h3>Hi "+userObj.getUserName()+",</h3>&ensp;Thank you for registering with us. You are one of our valuable customer.<br><br>Username : "+userObj.getEmail()+".";
			String to = id;

	        // Sender's email ID needs to be mentioned
	        String from = "ncgreems2k218@gmail.com";

	        // Assuming you are sending email from through gmails smtp
	        String host = "smtp.gmail.com";

	        // Get system properties
	        Properties properties = System.getProperties();

	        // Setup mail server
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", "465");
	        properties.put("mail.smtp.ssl.enable", "true");
	        properties.put("mail.smtp.auth", "true");

	        // Get the Session object.// and pass username and password
	        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("ncgreems2k21@gmail.com", "pals1998");
	            }
	        });

	        // Used to debug SMTP issues
	        session.setDebug(true);

	        try {
	            // Create a default MimeMessage object.
	            MimeMessage message = new MimeMessage(session);
	            // Set From: header field of the header.
	            message.setFrom(new InternetAddress(from));
	            // Set To: header field of the header.
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            // Set Subject: header field
	            message.setSubject("Welcome to Bus Booking System");
	            message.setContent(content,"text/html");
	            System.out.println("sending...");
	            // Send message
	            Transport.send(message);
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	        }
	        return true;
	    }
		return false;
	}
	
	@Override
	public long otp(String id)
	{
			long otp=(long)(Math.random()*(99999-10000+1)+10000);
			String content="<h3>Hi there,</h3>&ensp;"+otp+" is your OTP(One Time Password) for resetting our password on Bus Booking System.<br><br>OTP :&nbsp;"+otp+"<br><br>Please do not share this OTP with anyone for security reasons.<br><br>Thank you";
			String to = id;

	        // Sender's email ID needs to be mentioned
	        String from = "ncgreems2k218@gmail.com";

	        // Assuming you are sending email from through gmails smtp
	        String host = "smtp.gmail.com";

	        // Get system properties
	        Properties properties = System.getProperties();

	        // Setup mail server
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", "465");
	        properties.put("mail.smtp.ssl.enable", "true");
	        properties.put("mail.smtp.auth", "true");

	        // Get the Session object.// and pass username and password
	        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("ncgreems2k21@gmail.com", "pals1998");
	            }
	        });

	        // Used to debug SMTP issues
	        session.setDebug(true);

	        try {
	            // Create a default MimeMessage object.
	            MimeMessage message = new MimeMessage(session);
	            // Set From: header field of the header.
	            message.setFrom(new InternetAddress(from));
	            // Set To: header field of the header.
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            // Set Subject: header field
	            message.setSubject("OTP for Password recovery");
	            message.setContent(content,"text/html");
	            Transport.send(message);
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	        }
	        return otp;
	}

	@Override
	public BusDetailsModel getBusById(String busId)
	{
		String[] bus_date=busId.split("_");
		return userRepositoryObj.getBusById(bus_date[0]);
	}
	
	@Override
	public void booking(BusBookingModel bookingObj)
	{
		boolean check=true;
		String randomId="";
		while(check)
		{
			randomId="Ticket"+(int)(Math.random()*(9999-1000+1)+1000);
			check=userRepositoryObj.ticketIdCheck(randomId);
		}
		bookingObj.setTicketId(randomId);
		int i=0;
		List<BookingPassangersEntity> passangerList=new ArrayList<BookingPassangersEntity>();
		for(BookingPassangersModel passanger:bookingObj.getPassangers()) {
			check=true;
			while(check)
			{
				randomId="pass"+(int)(Math.random()*(9999-1000+1)+1000);
				check=userRepositoryObj.passangerIdCheck(randomId);
			}
			passanger.setId(randomId);
			passangerList.add(i, new BookingPassangersEntity(passanger.getId(),passanger.getName(),passanger.getAge(),passanger.getGender(),passanger.getSeatNo(),true));
			i++;
		}
		String status=userRepositoryObj.booking(bookingObj,passangerList);
		if(status.equals(bookingObj.getTicketId()))
		{
			String content="";
			content=content.concat("<div style=\"border: 1px red solid;\"><div style=\"display:flex;\"><div style=\"flex:1;\"><p>"+bookingObj.getBusName()+"</p><p>"+bookingObj.getBoardingTime()+"| "+bookingObj.getSource()+"</p><p>Journey date : "+bookingObj.getJourneyDate()+"</p></div><div style=\"margin-left: 10px;\"><p>Ticket ID : "+bookingObj.getTicketId()+"</p><p>"+bookingObj.getArrivalTime()+" | "+bookingObj.getDestination()+"</p><p>Boarding Point : "+bookingObj.getSource()+"</p></div></div><div style=\"margin-top:20px;\"><h4 style=\"color:blue\">Passenger Information</h4><table><tr><th>Name<th style=\"padding-left: 50px;\">Age<th style=\"padding-left: 50px;\">Gender<th style=\"padding-left: 50px;\">Seat</tr>");
			for(BookingPassangersModel passanger:bookingObj.getPassangers())
			{
				content=content.concat("<tr><td>");
				for(int j=0;j<4;j++) {
					if(j==0)
						content=content.concat(passanger.getName()+"<td style=\"padding-left: 50px;\">");
					else if(j==1)
						content=content.concat(passanger.getAge()+"<td style=\"padding-left: 50px;\">");
					else if(j==2)
						content=content.concat(passanger.getGender()+"<td style=\"padding-left: 50px;\">");
					else
						content=content.concat(passanger.getSeatNo());
				}
				content=content.concat("</tr>");
			}
			content=content.concat("</div><div style=\"display:flex;\"><div style=\"flex:1;float:left;\"></div><div><p>Base Fare : "+bookingObj.getBaseFare()+"</p><p>Booking Fees : "+bookingObj.getBookingFee()+"</p><p>GST(5%) : "+bookingObj.getGst()+"</p><p>Total Amount : "+bookingObj.getTotalFare()+"</p></div></div></div>");
			String to = bookingObj.getUserId();

	        // Sender's email ID needs to be mentioned
	        String from = "ncgreems2k218@gmail.com";

	        // Assuming you are sending email from through gmails smtp
	        String host = "smtp.gmail.com";

	        // Get system properties
	        Properties properties = System.getProperties();

	        // Setup mail server
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", "465");
	        properties.put("mail.smtp.ssl.enable", "true");
	        properties.put("mail.smtp.auth", "true");

	        // Get the Session object.// and pass username and password
	        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("ncgreems2k21@gmail.com", "pals1998");
	            }
	        });

	        // Used to debug SMTP issues
	        session.setDebug(true);

	        try {
	            // Create a default MimeMessage object.
	            MimeMessage message = new MimeMessage(session);
	            // Set From: header field of the header.
	            message.setFrom(new InternetAddress(from));
	            // Set To: header field of the header.
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            // Set Subject: header field
	            message.setSubject("Ticket");
	            message.setContent(content,"text/html");
	            // Send message
	            Transport.send(message);
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	        }
	    }
	}
	
	@Override
	public List<String> getBookingSeats(String busDate)
	{
		return userRepositoryObj.getBookingSeats(busDate);
	}
	
	@Override
	public List<BusBookingEntity> myBookings(String userId,boolean status)
	{
		return userRepositoryObj.myBookings(userId,status);
	}
	
	@Override
	public BusBookingModel getTicketById(String ticketId)
	{
		return userRepositoryObj.getTicketById(ticketId);
	}
	
	@Override
	public void cancelBooking(String ticketId) {
		userRepositoryObj.cancelBooking(ticketId);
	}
}

