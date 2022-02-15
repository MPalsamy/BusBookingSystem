<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style>
			.view_bus_user{
				cursor: pointer;
			}
		</style>
	</head>
	
	<body>
		<jsp:include page="header.jsp"/>
			
			<div id="page-wrapper">
				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="row">
						<div class="col-md-3 view_bus_user" onclick="location.href='allbus'">
							<div class="panel panel-danger">
								<div class="panel-heading text-center" style="font-weight:bold;">
									Total Buses
								</div>
								<div class="panel-body">
									<i class="fa fa-bus text-danger" aria-hidden="true" style="font-size:80px;"></i>
									<p style="float:right; font-size:60px; padding-right:60px; font-family:Trebuchet MS;">${totalBuses}</p>
								</div>
							</div>
						</div>
						
						<div class="col-md-3 view_bus_user" onclick="location.href='allusers'">	
							<div class="panel panel-danger">
								<div class="panel-heading text-center" style="font-weight:bold;">
									Total Users
								</div>
								<div class="panel-body">
									<i class="fa fa-users text-danger" aria-hidden="true" style="font-size:80px;"></i>
									<p style="float:right; font-size:60px; padding-right:60px; font-family:Trebuchet MS;">${totalUsers}</p>
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
	</body>
</html>