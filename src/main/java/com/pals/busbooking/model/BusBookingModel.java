package com.pals.busbooking.model;

import java.sql.Date;
import java.util.List;

public class BusBookingModel {
	private String ticketId;
	private String busId;
	private String userId;
	private String busName;
	private String source;
	private String destination;
	private Date bookingDate;
	private Date journeyDate;
	private String boardingTime;
	private String arrivalTime;
	private float baseFare;
	private Integer bookingFee;
	private float gst;
	private float totalFare;
	private boolean status;
	private List<BookingPassangersModel> passangers;
	
	
	public BusBookingModel() {
		super();
	}

	public BusBookingModel(String ticketId, String busId, String userId, String busName, String source,
			String destination, Date bookingDate, Date journeyDate, String boardingTime, String arrivalTime,
			float baseFare, Integer bookingFee, float gst, float totalFare,boolean status, List<BookingPassangersModel> passangers) {
		super();
		this.ticketId = ticketId;
		this.busId = busId;
		this.userId = userId;
		this.busName = busName;
		this.source = source;
		this.destination = destination;
		this.bookingDate = bookingDate;
		this.journeyDate = journeyDate;
		this.boardingTime = boardingTime;
		this.arrivalTime = arrivalTime;
		this.baseFare = baseFare;
		this.bookingFee = bookingFee;
		this.gst = gst;
		this.totalFare = totalFare;
		this.status = status;
		this.passangers = passangers;
	}

	
	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	public String getBusName() {
		return busName;
	}
	public void setBusName(String busName) {
		this.busName = busName;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public Date getJourneyDate() {
		return journeyDate;
	}
	public void setJourneyDate(Date journeyDate) {
		this.journeyDate = journeyDate;
	}
	public String getBoardingTime() {
		return boardingTime;
	}
	public void setBoardingTime(String boardingTime) {
		this.boardingTime = boardingTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public float getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(float totalFare) {
		this.totalFare = totalFare;
	}
	public List<BookingPassangersModel> getPassangers() {
		return passangers;
	}
	public void setPassangers(List<BookingPassangersModel> passangers) {
		this.passangers = passangers;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public float getBaseFare() {
		return baseFare;
	}

	public void setBaseFare(float baseFare) {
		this.baseFare = baseFare;
	}

	public Integer getBookingFee() {
		return bookingFee;
	}

	public void setBookingFee(Integer bookingFee) {
		this.bookingFee = bookingFee;
	}

	public float getGst() {
		return gst;
	}

	public void setGst(float gst) {
		this.gst = gst;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BusBookingModel [ticketId=" + ticketId + ", busId=" + busId + ", userId=" + userId + ", busName="
				+ busName + ", source=" + source + ", destination=" + destination + ", bookingDate=" + bookingDate
				+ ", journeyDate=" + journeyDate + ", boardingTime=" + boardingTime + ", arrivalTime=" + arrivalTime
				+ ", baseFare=" + baseFare + ", bookingFee=" + bookingFee + ", gst=" + gst + ", totalFare=" + totalFare
				+ ", passangers=" + passangers + "]";
	}
	
	
}
