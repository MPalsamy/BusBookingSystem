<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="panel panel-danger" style="font-weight:bold; font-size:15px;">
							<div class="panel-heading text-center" style="font-weight:bold;">
								Register BUS
							</div>
							<div class="panel-body">
								<form:form action="insertbus" method="post" modelAttribute="BusDetailsModel">
									<div class="row">
										<div class="form-group" style="padding:10px;">
											<label>Bus ID<b style="color:red;">*</b></label>
											<form:input path="busId" value="${busId}" class="form-control" readonly="true"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>Bus Name<b style="color:red;">*</b></label>
											<form:input path="busName" placeholder="Enter Bus Name *" required="required" class="form-control" pattern="[A-Za-z\s']{1,50}" title="Bus Name should only contain letters. e.g. Speed Travels" autocomplete="off"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>Source<b style="color:red;">*</b></label>
											<form:input path="source" placeholder="Enter Source City Name *" required="required" class="form-control" pattern="[A-Za-z\s]{1,50}" title="Source should only contain letters. e.g. Chennai" autocomplete="off"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>Destination<b style="color:red;">*</b></label>
											<form:input path="destination" placeholder="Enter Destination City Name *" required="required" class="form-control" pattern="[A-Za-z\s]{1,50}" title="Destination should only contain letters. e.g. Chennai" autocomplete="off"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>Boarding Time<b style="color:red;">*</b></label>
											<form:input path="boardingTime" type="time" required="required" class="form-control"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>Arrival Time<b style="color:red;">*</b></label>
											<form:input path="arrivalTime" type="time" required="required" class="form-control"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>From<b style="color:red;">*</b></label>
											<form:input path="from" type="date" required="required" class="form-control" id="txtDate"/>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<label>To<b style="color:red;">*</b></label>
											<form:input path="to" type="date" required="required" class="form-control" id="txtDate1"/>
										</div>
										
										<div class="form-group" style="padding:10px;">
											<label>Bus Type<b style="color:red;">*</b></label>
											<form:select path="busType" class="form-control">
									            <form:option value="AC" label="AC"/>
									            <form:option value="Non-AC" label="Non-AC"/>
									        </form:select>
										</div>
										
										<div class="form-group" style="padding:10px;">
											<label>Total number of Seats<b style="color:red;">*</b></label>
											<form:input path="totalSheets" type="number" min="10" max="40" title="Seat is above 10..." placeholder="Enter Total Number of Sheets *" required="required" class="form-control" autocomplete="off"/>
											<form:errors style="color:Tomato; font-size:12px;" path="totalSheets"></form:errors>
										</div>
										
										<div class="form-group" style="padding:10px;">
											<label>Ticket Fare<b style="color:red;">*</b></label>
											<form:input path="ticketFare" type="number" min="100" title="Ticket Fare is above 100..." placeholder="Enter Ticket Fare *" required="required" class="form-control" autocomplete="off"/>
											<form:errors style="color:Tomato; font-size:12px;" path="ticketFare"></form:errors>
										</div> 
										
										<div class="form-group" style="padding:10px;">
											<form:button type="submit" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</form:button>
											<form:button type="reset" name="reset" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Clear</form:button>
										</div> 
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
		</div>
	<!-- /#wrapper -->
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
		$('#txtDate1').attr('min', maxDate);
		if("${insertAck}"!= "")
			alert("${insertAck}");
		});
	</script>
</body>
</html>