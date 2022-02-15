package com.pals.busbooking.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="booking_details")
public class BusBookingEntity {
	@Id
	@Column(name="ticket_id",nullable = false,unique = true)
	private String ticketId;
	@Column(name="bus_id",nullable = false)
	private String busId;
	@Column(name="user_id",nullable = false)
	private String userId;
	@Column(name="busname",nullable = false)
	private String busName;
	@Column(nullable = false)
	private String source;
	@Column(nullable = false)
	private String destination;
	@Column(name="bookingdate",nullable = false)
	private Date bookingDate;
	@Column(name="journeydate",nullable = false)
	private Date journeyDate;
	@Column(name="boardingtime",nullable = false)
	private String boardingTime;
	@Column(name="arrivaltime",nullable = false)
	private String arrivalTime;
	@Column(name="basefare",nullable = false)
	private float baseFare;
	@Column(name="bookingfee",nullable = false)
	private Integer bookingFee;
	@Column(name="gst",nullable = false)
	private float gst;
	@Column(name="totalfare",nullable = false)
	private float totalFare;
	@Column(columnDefinition = "boolean default true")
	private boolean status;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "user_passangers", joinColumns = {@JoinColumn(name = "ticket_id", referencedColumnName = "ticket_id") }, 
	inverseJoinColumns = {@JoinColumn(name = "passanger_id", referencedColumnName = "id")})
	private List<BookingPassangersEntity> passangers;
	
	
	public BusBookingEntity() {
		super();
	}

	public BusBookingEntity(String ticketId, String busId, String userId, String busName, String source,
			String destination, Date bookingDate, Date journeyDate, String boardingTime, String arrivalTime,
			float baseFare, Integer bookingFee, float gst, float totalFare,boolean status, List<BookingPassangersEntity> passangers) {
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
		this.passangers = passangers;
		this.status = status;
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
	public List<BookingPassangersEntity> getPassangers() {
		return passangers;
	}
	public void setPassangers(List<BookingPassangersEntity> passangers) {
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
		return "BusBookingEntity [ticketId=" + ticketId + ", busId=" + busId + ", userId=" + userId + ", busName="
				+ busName + ", source=" + source + ", destination=" + destination + ", bookingDate=" + bookingDate
				+ ", journeyDate=" + journeyDate + ", boardingTime=" + boardingTime + ", arrivalTime=" + arrivalTime
				+ ", baseFare=" + baseFare + ", bookingFee=" + bookingFee + ", gst=" + gst + ", totalFare=" + totalFare
				+ ", status=" + status + ", passangers=" + passangers + "]";
	}
	
	
}
