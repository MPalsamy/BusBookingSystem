<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Bookings</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="row" style="margin-top:70px;">
<div class="col-md-1"></div>
<div class="col-md-10">
	<div class="panel panel-danger">
		<div class="panel-body">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">My Bookings</a></li>
				<li><a data-toggle="tab" href="#menu1">Cancelled</a></li>
			</ul>
	
			<div class="tab-content" style="padding:5px;">
				<div id="home" class="tab-pane fade in active">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">Source
								<th class="text-center">Destination
								<th class="text-center">Boarding Time
								<th class="text-center">Arrival Time
								<th class="text-center">Journey Date
								<th class="text-center">Booked Date
								<th class="text-center">Action
							</tr>
						</thead>
						<c:forEach var="book" items="${mybookings}">
						<tbody>
							<tr>
								<td style="text-transform:capitalize;" class="text-center">${book.source }
								<td style="text-transform:capitalize;" class="text-center">${book.destination }
								<td class="text-center">${book.boardingTime }
								<td class="text-center">${book.arrivalTime }
								<td class="text-center">${book.journeyDate }
								<td class="text-center">${book.bookingDate }
								<td class="text-center">
									<a href="<c:url value='ticketid=${book.ticketId}'/>" target="_blank" style="text-decoration:none;" class="text-danger"><i style="font-size:20px;" class="fa fa-eye" aria-hidden="true"></i></a>
									<a href="<c:url value='cancel_ticket=${book.ticketId}'/>" style="text-decoration:none;" class="text-danger" onclick = "return confirmation();"><i style="font-size:20px; margin-left:5px;" class="fa fa-close" aria-hidden="true"></i></a>
								</td>	
								</tr>
							</tbody>
						</c:forEach>
						</table>
					</div>
					
					<div id="menu1" class="tab-pane fade">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center">Source
									<th class="text-center">Destination
									<th class="text-center">Boarding Time
									<th class="text-center">Arrival Time
									<th class="text-center">Journey Date
									<th class="text-center">Booked Date
									<th class="text-center">Action
								</tr>
							</thead>
							<c:forEach var="cancel" items="${mycancels}">
							<tbody>
								<tr>
									<td style="text-transform:capitalize;" class="text-center">${cancel.source }
									<td style="text-transform:capitalize;" class="text-center">${cancel.destination }
									<td class="text-center">${cancel.boardingTime }
									<td class="text-center">${cancel.arrivalTime }
									<td class="text-center">${cancel.journeyDate }
									<td class="text-center">${cancel.bookingDate }
									<td><a href="<c:url value='ticketid=${cancel.ticketId}'/>" target="_blank" style="text-decoration:none;" class="text-danger"><i style="font-size:20px; margin-left:50px;'" class="fa fa-eye" aria-hidden="true"></i></a>
								</tr>
							</tbody>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<jsp:include page="footer.jsp" />
<script>
function confirmation() {
   var answer = confirm("You want to Cancel this Booking?");
   if (answer){
      return true;
   }
   else{
      return false;
   }
}
</script>
</body>
</html>