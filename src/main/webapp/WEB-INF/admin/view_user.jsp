<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Users</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<!-- Datatable -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap.min.css"> 
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
									View Users
								</div>
								<div class="panel-body">
									<table class="table table-striped table-bordered table-hover" id="myTable">
										<thead>
											<tr>
												<th class="text-center">#
												<th class="text-center">User Name
												<th class="text-center">Email
												<th class="text-center">Mobile Number
												<th class="text-center">Age
												<th class="text-center">Gender
											</tr>
										</thead>
										
										<tbody>
											<c:forEach var="user" items="${userDetails}" varStatus="loop">
											<tr>
												<td><c:set var="index" value="${loop.index}" /><c:set var="index" value="${index + 1}" /><c:out value="${index}"/></td>
												<td><c:out value="${user.userName}" /></td>
												<td><c:out value="${user.email}" /></td>
												<td><c:out value="${user.mobile_no}" /></td>
												<td><c:out value="${user.age}" /></td>
												<td><c:out value="${user.gender}" /></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
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