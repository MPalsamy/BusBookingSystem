<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Bus Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
	<jsp:include page="header.jsp" />
	<body>
			<div id="page-wrapper">
				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div class="panel panel-danger" style="font-weight:bold; font-size:15px;">
								<div class="panel-heading text-center" style="font-weight:bold;">
									Update Bus Details
								</div>
								<div class="panel-body">
									<form:form action="updatebusdetails" method="post" modelAttribute="BusDetailsModel">
										<div class="row">
											<div class="form-group" style="padding:10px;">
												<label>Bus ID<b style="color:red;">*</b></label>
												<form:input path="busId" value="${bus.busId}" class="form-control" readonly="true"/>
											</div> 
											
											<div class="form-group" style="padding:10px;">
												<label>Bus Name<b style="color:red;">*</b></label>
												<form:input path="busName" value="${bus.busName}" placeholder="Enter Bus Name *" required="required" class="form-control" pattern="[A-Za-z\s']{1,50}" title="Bus Name should only contain letters. e.g. Speed Travels"/>
											</div>
											
											<div class="form-group" style="padding:10px;">
												<label>Source<b style="color:red;">*</b></label>
												<form:input path="source" value="${bus.source}" placeholder="Enter Source City Name *" required="required" class="form-control" pattern="[A-Za-z\s]{1,50}" title="Source should only contain letters. e.g. Chennai"/>
											</div> 
											
											<div class="form-group" style="padding:10px;">
												<label>Destination<b style="color:red;">*</b></label>
												<form:input path="destination" value="${bus.destination}" placeholder="Enter Destination City Name *" required="required" class="form-control" pattern="[A-Za-z\s]{1,50}" title="Destination should only contain letters. e.g. Chennai"/>
											</div>
											
											<div class="form-group" style="padding:10px;">
												<label>Boarding Time<b style="color:red;">*</b></label>
												<form:input path="boardingTime" value="${bus.boardingTime}" type="time" required="required" class="form-control"/>
											</div> 
											
											<div class="form-group" style="padding:10px;">
												<label>Arrival Time<b style="color:red;">*</b></label>
												<form:input path="arrivalTime" value="${bus.arrivalTime}" type="time" required="required" class="form-control"/>
											</div>
											
											<div class="form-group" style="padding:10px;">
												<label>Bus Type<b style="color:red;">*</b></label>
												<form:select path="busType" id="bustype" class="form-control">
										            <form:option value="AC" label="AC"/>
										            <form:option value="Non-AC" label="Non-AC"/>
										        </form:select>
											</div>
											
											<div class="form-group" style="padding:10px;">
												<label>Total number of Seats<b style="color:red;">*</b></label>
												<form:input path="totalSheets" value="${bus.totalSheets}" placeholder="Enter Total Number of Sheets *" required="required" class="form-control"/>
												<form:errors style="color:Tomato; font-size:12px;" path="totalSheets"></form:errors>
											</div>
											
											<div class="form-group" style="padding:10px;">
												<label>Ticket Fare<b style="color:red;">*</b></label>
												<form:input path="ticketFare" value="${bus.ticketFare}" placeholder="Enter Ticket Fare *" required="required" class="form-control"/>
												<form:errors style="color:Tomato; font-size:12px;" path="ticketFare"></form:errors>
											</div> 
											
											<div class="form-group" style="padding:10px;">
												<form:button type="submit" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i> Update</form:button>
												<form:button type="button" class="btn btn-danger" onclick="location.href='allbus'"><i class="fa fa-ban" aria-hidden="true"></i> Cancel</form:button>
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
		<script type="text/javascript">
			$("#bustype").val("${bus.busType}").change();
			$(document).ready(function () {
				if("${updateAck}"!= "")
					alert("${updateAck}");
				});
		</script>
	</body>
</html>