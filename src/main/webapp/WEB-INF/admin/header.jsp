<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<div id="throbber" style="display:none; min-height:120px;"></div>
		<div id="noty-holder"></div>
		<div id="wrapper">
			<!-- Navigation -->
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="dashboard.html" style="font-weight:bold; padding-top:15px; color:#fff; font-style:italic;">
						Bus Booking System
					</a>
				</div>
				<!-- Top Menu Items -->
				<ul class="nav navbar-right top-nav">
						   
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <b class="fa fa-angle-down"></b></a>
						<ul class="dropdown-menu">
							<li><a href="profile"><i class="fa fa-fw fa-user"></i> Profile</a></li>
							<li class="divider"></li>
							<li><a href="logout"><i class="fa fa-fw fa-power-off"></i> Logout</a></li>
						</ul>
					</li>
				</ul>
				
				<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav side-nav">
						<li>
							<a href="dashboard"><i class="fa fa-fw fa-tachometer"></i> Dashboard</a>
						</li>
						<li>
							<a href="allusers"><i class="fa fa-fw fa-users"></i> Users</a>
						</li>
						<li>
							<a href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-fw fa-bus"></i> Manage Bus<i class="fa fa-fw fa-angle-down pull-right"></i></a>
							<ul id="submenu-1" class="collapse">
								<li><a href="addbus"><i class="fa fa-angle-double-right"></i> Add</a></li>
								<li><a href="allbus"><i class="fa fa-angle-double-right"></i> View</a></li>
							</ul>
						</li>
						<li>
							<a href="profile"><i class="fa fa-fw fa fa-user"></i> Profile</a>
						</li>
						<li>
							<a href="passwordchange"><i class="fa fa-fw fa fa-key"></i> Change Password</a>
						</li>
						<li>
							<a href="logout"><i class="fa fa-fw fa-power-off"></i> Logout</a>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
	<script type="text/javascript">
		$(function(){
			$('[data-toggle="tooltip"]').tooltip();
			$(".side-nav .collapse").on("hide.bs.collapse", function() {                   
				$(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
			});
			$('.side-nav .collapse').on("show.bs.collapse", function() {                        
				$(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");        
			});
		})    
	</script>
</body>
</html>