package com.pals.busbooking.model;

import java.sql.Date;
import java.util.*;

import org.hibernate.validator.constraints.Range;

import com.pals.busbooking.entity.BusDatesAvailable;
import com.pals.busbooking.entity.BusSheets;

public class BusDetailsModel {
	private String busId;
	private String busName;
	private String source;
	private String destination;
	private String boardingTime;
	private String arrivalTime;
	private Date from;
	private Date to;
	private String busType;
	@Range(min = 10, message = "Seats must be more then 10!!!")
	private Integer totalSheets;
	@Range(min = 100, message = "Ticket Fare must be more then 100!!!")
	private Integer ticketFare;
	private List<BusDatesAvailable> dates;
	private Set<BusSheets> sheets;
	public BusDetailsModel() {
		super();
	}
	
	public BusDetailsModel(String busId, String busName, String source, String destination, String boardingTime,
			String arrivalTime, Date from, Date to, String busType, Integer totalSheets, Integer ticketFare, List<BusDatesAvailable> dates, Set<BusSheets> sheets) {
		super();
		this.busId = busId;
		this.busName = busName;
		this.source = source;
		this.destination = destination;
		this.boardingTime = boardingTime;
		this.arrivalTime = arrivalTime;
		this.from = from;
		this.to = to;
		this.busType = busType;
		this.totalSheets = totalSheets;
		this.ticketFare = ticketFare;
		this.dates = dates;
		this.sheets = sheets;
	}

	public String getBusId() {
		return busId;
	}
	public void setBusId(String busId) {
		this.busId = busId;
	}
	public String getBusName() {
		return busName;
	}
	public void setBusName(String busName) {
		this.busName = busName;
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
	public Date getFrom() {
		return from;
	}
	public void setFrom(Date from) {
		this.from = from;
	}
	public Date getTo() {
		return to;
	}
	public void setTo(Date to) {
		this.to = to;
	}
	public Integer getTicketFare() {
		return ticketFare;
	}
	public void setTicketFare(Integer ticketFare) {
		this.ticketFare = ticketFare;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public Integer getTotalSheets() {
		return totalSheets;
	}
	public void setTotalSheets(Integer totalSheets) {
		this.totalSheets = totalSheets;
	}

	public List<BusDatesAvailable> getDates() {
		return dates;
	}

	public void setDates(List<BusDatesAvailable> dates) {
		this.dates = dates;
	}

	public Set<BusSheets> getSheets() {
		return sheets;
	}

	public void setSheets(Set<BusSheets> sheets) {
		this.sheets = sheets;
	}
	
	@Override
	public String toString() {
		return "BusDetailsEntity [busId=" + busId + ", busName=" + busName + ", source=" + source + ", destination="
				+ destination + ", boardingTime=" + boardingTime + ", arrivalTime=" + arrivalTime + ", from=" + from
				+ ", to=" + to + ", busType=" + busType + ", totalSheets=" + totalSheets + ", ticketFare=" + ticketFare
				+ ", dates=" + dates + ", sheets=" + sheets + "]";
	}
	
}
