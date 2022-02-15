<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<nav class="navbar navbar-inverse navbar navbar-fixed-top">
  <c:if test="${userId == null}">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index">Bus Booking System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        	<li><a href="#" data-toggle="modal" data-target="#signup_modal"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        	<li><a href="#" data-toggle="modal" data-target="#login_modal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
  </c:if>
  <c:if test="${userId != null}">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index">Bus Booking System</a>
    </div>
  <div class="action">
	<div class="profile" onclick="menuToggle();">
		<c:if test = "${userImage ne ''}">
			<img src="data:image/jpeg;base64,${userImage}" alt="Profile"/>
		</c:if>
		<c:if test = "${userImage eq ''}">
			<img src="assets/img/profile.jpg" alt="Profile"/>
		</c:if>
	</div>
	<div class="menu">
		<h3>${UserDetails.userName}</h3>
		<ul>
			<li><i class="fa fa-home" aria-hidden="true"></i><a href="index">Home</a></li>
			<li><i class="fa fa-user" aria-hidden="true"></i><a href="profile">Profile</a></li>
			<li><i class="fa fa-server" aria-hidden="true"></i><a href="my_bookings">My Bookings</a></li>
			<li><span class="glyphicon glyphicon-log-out"></span><a href="logout">Logout</a></li>
		</ul>
		</div>
	  </div>
	  </div>
	</c:if>
</nav>
<script>
function menuToggle(){
	const toggleMenu = document.querySelector('.menu');
	toggleMenu.classList.toggle('active');
}
</script>
</body>
</html>