<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search BUS</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<style>
		#apply_button{
			background:#22a7f0;
			color:#fff;
			padding:6px;
			width:70px;
			border:none;
			border-radius:20px;
			font-weight:bold;
		}
		#clear_button{
			background:#d64541;
			color:#fff;
			padding:6px;
			width:70px;
			border:none;
			border-radius:20px;
			font-weight:bold;
		}
		.zero-buses
		{
			margin-top: 0px;
		}
		.zero-buses p
		{
			margin-top: 20px;
			font-size: 24px;
			color: #95a5a6;
		}
	</style>
	<script>
		$(document).ready(function () {
		var dtToday = new Date();
		var month = dtToday.getMonth() + 1;
		var day = dtToday.getDate();
		var year = dtToday.getFullYear();
		if(month < 10)
			month = '0' + month.toString();
		if(day < 10)
			day = '0' + day.toString();
		var maxDate = year + '-' + month + '-' + day;
		$('#txtDate').attr('min', maxDate);
		if ("${loginCheck}" != ''){
			$('#login_modal').modal();
		}
		});
	</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-default" style="margin-top:40px;">
			<div class="panel-body" style="padding:20px;">
				<form:form action="searchbus" method="post" modelAttribute="BusDetailsModel">
					<div class="col-md-3">
						<label>Source</label>
						<form:input path="source" value="${selectedsource}" placeholder="Source *" required="required" class="form-control" pattern="[A-Za-z\s]{1,50}" title="Source should only contain letters. e.g. Chennai" autocomplete="off"/>
					</div>
					
					<div class="col-md-3">
						<label>Destination</label>
						<form:input path="destination" value="${selecteddestination}" placeholder="Destination *" required="required" class="form-control" pattern="[A-Za-z\s]{1,50}" title="Source should only contain letters. e.g. Chennai" autocomplete="off"/>
					</div>
					
					<div class="col-md-3">
						<label>Date</label>
						<form:input path="from" type="date" value="${selecteddate}" required="required" name="date" class="form-control txtDate" id="txtDate"/>
					</div>

					<div class="col-md-3">
						<button type="submit" class="btn btn-danger" name="search">Modify Search</button>
					</div>
				</form:form>						
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-3">
		<div class="panel panel-default" style="margin-top:-15px; border-top:none;">
			<div class="panel-body">
				<form action="" method="POST">
				
					<button type="submit" id="apply_button">Filter</button>
					<button type="reset" id="clear_button">Clear</button>
					<br/><hr/>
					
					<label class="text-success">BUS TYPES</label>
						<div class="checkbox">
						  <label><input type="checkbox" value="">Ac</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">Non-Ac</label>
						</div>
						<hr/>
						
						<label class="text-success">ARRIVAL TIME</label>
						<div class="checkbox">
						  <label><input type="checkbox" value="">Before 6 am</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">6 am to 12 pm</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">12 pm to 6 pm</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">After 6 pm</label>
						</div>
						<hr/>
						
						<label class="text-success">DEPARTURE TIME</label>
						<div class="checkbox">
						  <label><input type="checkbox" value="">Before 6 am</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">6 am to 12 pm</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">12 pm to 6 pm</label>
						</div>
						
						<div class="checkbox">
						  <label><input type="checkbox" value="">After 6 pm</label>
						</div>
						<hr/>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col-md-9" style="margin-top:-15px;">
		<div class="panel panel-default" style="border:none;">
			<div class="panel-body">
				<div class="table-responsive">
					<c:if test="${fn:length(searchdetails) == 0}">
						<div class="zero-buses" style="text-align:center;">
							<img src="assets/img/bus.gif"/>
							<p>Oops!!! No Bus running in this Route</p>
							<p>Please check the Source and Destination</p>
						</div>
					</c:if>
					<c:if test="${fn:length(searchdetails) > 0}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">Bus Name
								<th class="text-center">Boarding Time
								<th class="text-center">Arrival Time
								<th class="text-center">Date of Journey
								<th class="text-center">Bus Type
								<th class="text-center">Ticket Fare
								<th class="text-center">Book
							</tr>
						</thead>
						<tbody>
						<c:forEach var="bus" items="${searchdetails}">
							<tr>
								<th style="padding:20px; color:#f62459;" class="text-center">${bus.busName }
								<th style="padding:20px;" class="text-center text-danger">${bus.boardingTime}
								<th style="padding:20px;" class="text-center text-danger">${bus.arrivalTime}
								<th style="padding:20px;" class="text-center text-info">${selecteddate}
								<th style="padding:20px;" class="text-center text-warning">${bus.busType}
								<th style="padding:20px;" class="text-center text-success">${bus.ticketFare}
								<th style="padding:20px;" class="text-center text-primary"><button type="button" style="margin-top:-10px;" class="btn btn-danger" name="view" onclick="location.href = '/BusBookingSystem/viewseats=${bus.busId}_${selecteddate}';">View</button>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var start = "${bus.boardingTime}";
   s = start.split(':');
   if(s[0]>12){
	var currentDate = new Date(new Date("${selecteddate}") + 24 * 60 * 60 * 1000);
	var day = currentDate.getDate()+1
	var month = currentDate.getMonth()+1
	var year = currentDate.getFullYear()
	start=year+"-"+month+"-"+day}									
    var diff =  Math.abs(new Date(start + " ${bus.arrivalTime}") - new Date("${selecteddate}" + " ${bus.boardingTime}"));
	var seconds = Math.floor(diff/1000); //ignore any left over units smaller than a second
	var minutes = Math.floor(seconds/60); 
	seconds = seconds % 60;
	var hours = Math.floor(minutes/60);
	minutes = minutes % 60;
	document.getElementById("traveltime").innerHTML = hours + "h " + minutes +"m";
</script>
<jsp:include page="footer.jsp" />
</body>
</html>