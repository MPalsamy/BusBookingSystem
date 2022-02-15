<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		body{
			background-color:#f2f1ef;
			 -webkit-print-color-adjust: exact !important;
		}
		.container {
			margin-top: 50px;
			box-shadow: 0 0 20px #333;
			padding:2px 2px 2px 1px;
			border-radius:5px;
		}
		.col-md-6{
			padding-top:5px;
			font-size:16px;
			font-weight:bold;
		}
	</style>
</head>
<body onload="window.print();">
<div class="container">
<div class="row main_row" style="margin-top:20px;">
	<div class="col-md-12">
		<div class="panel panel-default shadow-lg p-3 mb-5 bg-white rounded">
			<div class="panel-body">
				<div class="row">
					<div class="col-md-6">
						<p>${ticket.busName}</p>
					</div>
					<div class="col-md-6 text-right">
						<p>Ticket ID : ${ticket.ticketId}</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<p style="text-transform:uppercase;">${ticket.boardingTime} | ${ticket.source}</p>
					</div>
					<div class="col-md-6 text-right">
						<p style="text-transform:uppercase;">${ticket.arrivalTime} | ${ticket.destination}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<c:if test = "${status eq 'true'}">
							<p style="text-transform:uppercase;">STATUS : <b class="text-success">BOOKED</b></p>
						</c:if>
						<c:if test = "${status eq 'false'}">
							<p style="text-transform:uppercase;">STATUS : <b class="text-danger">CANCELLED</b></p>
						</c:if>
					</div>
					<div class="col-md-6 text-right">
						<p>Boarding Point : <b style="text-transform:uppercase;">${ticket.source}</b></p>
					</div>
				</div>
				
				<div class="row" style="margin-top:50px;">
					<div class="col-md-12" style="font-weight:bold; font-size:18px;">
						<p style="color:tomato;">Passenger Information</p>
					</div>
					
					<div class="col-md-6" style="font-weight:bold; font-size:18px;">
						<table class="table table-hover">
							<tbody>
							<c:forEach var="passanger" items="${ticket.passangers}">
							<tr>
								<td>${passanger.name }
								<td>${passanger.age }
								<td>${passanger.gender }
								<td>${passanger.seatNo }
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6" style="font-weight:bold; font-size:18px;">
						<p style="color:tomato;">Booking details</p>
						
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>Ticket ID
									<td>${ticket.ticketId}
								</tr>
								<tr>
									<th>Booked on
									<td>${ticket.bookingDate}
								</tr>
								<tr>
									<th>Journey date
									<td>${ticket.journeyDate}
								</tr>
								<tr>
									<th>Boarding from
									<td>${ticket.source}
								</tr>
							</tbody>
						</table>
						
					</div>
					<div class="col-md-6" style="font-weight:bold; font-size:18px;">
						<p style="color:tomato;">Payment details</p>
							
							<table class="table table-hover">
								<tbody>
									<tr>
										<th>Base Fare
										<td>Rs. ${ticket.baseFare}/-
									</tr>
									<tr>
										<th>Booking Fees
										<td>Rs. ${ticket.bookingFee}/-
									</tr>
									<tr>
										<th>GST (5%)
										<td>Rs. ${ticket.gst}/-
									</tr>
									<tr>
										<th>Total Amount Paid
										<td>Rs. ${ticket.totalFare}/-
									</tr>
								</tbody>
							</table>
						</div>
					</div>			
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>