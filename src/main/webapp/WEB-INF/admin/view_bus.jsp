<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			.table a i{
				font-size: 20px;
				margin-left: 7px;
			}
		</style>
	</head>
	
	<body>
		<jsp:include page="header.jsp" />
			
			<div id="page-wrapper">
				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-danger">
								<div class="panel-heading text-center" style="font-weight:bold;">
									View Buses
								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover" id="myTable">
											<thead>
												<tr>
													<th class="text-center">#
													<th class="text-center">Bus ID
													<th class="text-center">Bus Name
													<th class="text-center">Source
													<th class="text-center">Destination
													<th class="text-center">Available Dates
													<th class="text-center">Boarding Time
													<th class="text-center">Arrival Time
													<th class="text-center">Bus Type
													<th class="text-center">Total Sheets
													<th class="text-center">Ticket Fare
													<th class="text-center">Action
												</tr>
											</thead>
											
											<tbody>
												<c:forEach var="bus" items="${BusDetails}" varStatus="loop">
												<tr>
													<td><c:set var="index" value="${loop.index}" /><c:set var="index" value="${index + 1}" /><c:out value="${index}"/></td>
													<td><c:out value="${bus.busId}" /></td>
													<td><c:out value="${bus.busName}" /></td>
													<td><c:out value="${bus.source}" /></td>
													<td><c:out value="${bus.destination}" /></td>
													<td><c:out value="${bus.from} to ${bus.to}" /></td>
													<td><c:out value="${bus.boardingTime}" /></td>
													<td><c:out value="${bus.arrivalTime}" /></td>
													<td><c:out value="${bus.busType}" /></td>
													<td><c:out value="${bus.totalSheets}" /></td>
													<td><c:out value="${bus.ticketFare}" /></td>
													<td><a href="<c:url value='editbusid=${bus.busId}'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
													<!--<a href="<c:url value='deletebus/${bus.busId}'/>"><i class="fa fa-trash" aria-hidden="true"></i></a>-->
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
		<!-- /#wrapper -->
	</body>
	
	<!-- DATA TABLE SCRIPTS -->
	<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap.min.js"></script>
	<!-- -->
	<script>
		$(document).ready( function () {
			$('#myTable').DataTable();
		} );
	</script>
</html>