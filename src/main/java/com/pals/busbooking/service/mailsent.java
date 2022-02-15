package com.pals.busbooking.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailsent {
	public static void main(String[] args)
	{
		String content="";
		content=content.concat("<div style=\"border: 1px red solid;\"><div style=\"display:flex;\"><div style=\"flex:1;\"><p>Travel's name</p><p>Boarding Time | place</p><p>Journey date : </p></div><div style=\"margin-left: 10px;\"><p>Ticket ID : </p><p>Arrival Time | place</p><p>Boarding Point : </p></div></div><div style=\"margin-top:20px;\"><h4 style=\"color:blue\">Passenger Information</h4><table><tr><th>Name<th style=\"padding-left: 50px;\">Age<th style=\"padding-left: 50px;\">Gender<th style=\"padding-left: 50px;\">Seat</tr><tr><td>");
		for(int i=0;i<4;i++)
		{
			content=content.concat("pals");
			if(i!=3)
				content=content.concat("<td style=\"padding-left: 50px;\">");
		}
		content=content.concat("</tr></div><div style=\"display:flex;\"><div style=\"flex:1;float:left;\"></div><div><p>Base Fare : </p><p>Booking Fees : </p><p>GST(5%) : </p><p>Total Amount : </p></div></div></div>");
		String to = "palsamy1998@gmail.com";

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
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
	}
}
