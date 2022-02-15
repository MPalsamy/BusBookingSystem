<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Summary</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.form-control{
		border:none;
	}
	.bill{
		width: 100px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
<form:form action="book_ticket" method="post" modelAttribute="BusBookingModel">
<div class="row" style="margin-top:70px;">
			<div class="col-md-1"></div>
			
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel panel-heading" style="font-weight:bold; font-family:Tw Cen MT; font-size:20px;">
						Journey Details
					</div>
					<input type="hidden" class="form-control" name="busId" value="${busDetails.busId}" required readonly>
					<div class="panel-body">	
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>Bus Name
									<td><input type="text" class="form-control" name="busName" value="${busDetails.busName}" required readonly>
								</tr>
								
								<tr>
									<th>Source
									<td><input type="text" class="form-control" style="text-transform:capitalize;" name="source" value="${busDetails.source}" required readonly>
								</tr>
								
								<tr>
									<th>Destination
									<td><input type="text" class="form-control" style="text-transform:capitalize;" name="destination" value="${busDetails.destination}" required readonly>
								</tr>
								
								<tr>
									<th>Departure Time
									<td><input type="text" class="form-control" name="boardingTime" value="${busDetails.boardingTime}" required readonly>
								</tr>
								
								<tr>
									<th>Arrival Time
									<td><input type="text" class="form-control" name="arrivalTime" value="${busDetails.arrivalTime}" required readonly>
								</tr>
								
								<tr>
									<th>Journey date
									<td><input type="text" class="form-control" name="journeyDate" value="${date}" required readonly>
								</tr>
								
								<tr>
									<th>Booking date
									<td><input type="text" class="form-control" name="bookingDate" value="${curr_date}" required readonly>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel panel-heading" style="font-weight:bold; font-family:Tw Cen MT; font-size:20px;">
						Ticket Summary
					</div>
					
					<div class="panel-body">	
						<table class="table table-stripped">
							<thead>
								<tr>
									<th>Base Fare  (in Rs.)
									<td><input type="text" class="form-control bill" name="baseFare" value="${basefare}" required readonly>
								</tr>
								<tr>
									<th>Booking Fee (in Rs.)
									<td><input type="text" class="form-control bill" name="bookingFee" value="15" required readonly>
								</tr>
								<tr>
									<th>GST(5%)
									<td><input type="text" class="form-control bill" name="gst" value="${gst}" required readonly>
								</tr>
								<tr>
									<th>Net Amount (in Rs.)
									<td><input type="text" class="form-control bill" name="totalFare" value="${basefare + 15 + gst}" required readonly>
								</tr>
								<tr>
									<td><button type="submit" class="btn btn-success" name="book">Book Ticket</button>
									<td><button type="button" class="btn" name="cancel" onclick="location.href = '/BusBookingSystem/searchbus';">Cancel</button>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel panel-heading" style="font-weight:bold; font-family:Tw Cen MT; font-size:20px;">
						Passenger Details
					</div>
					
					<div class="panel-body">	
						<table class="table table-stripped">
							<thead>
								<tr>
									<th>Name
									<th>Age
									<th>Gender
									<th>Seat no
								</tr>
							</thead>
							<tbody>
							<c:forEach var="passanger" items="${passangers}" varStatus="i">
								<tr>
									<td><input type="text" name="passangers[${i.index}].name" value="${passanger.name}" class='form-control' readonly>
									<td><input type="text" name="passangers[${i.index}].age" value="${passanger.age}" class='form-control' readonly>
									<td><input type="text" name="passangers[${i.index}].gender" value="${passanger.gender}" class='form-control' readonly>
									<td><input type="text" name="passangers[${i.index}].seatNo" value="${passanger.seatNo}" class='form-control' readonly>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</form:form>
<jsp:include page="footer.jsp" />
</body>
</html>