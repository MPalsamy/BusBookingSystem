<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bus Booking System</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		.eye {
			  float: right;
			  margin-left: -25px;
			  margin-top: 42px;
			  position: relative;
			  z-index: 2;
			  margin-right:10px;
		}
		.eye2 {
			  float: right;
			  margin-left: -25px;
			  margin-top: 42px;
			  position: relative;
			  z-index: 2;
			  margin-right:10px;
		}
		.message {
			width: 100%;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
			font-size: 14px;
			color: red;
		}
		#verified{
			display:none;
		}
		#passcheck{
			font-size: 13px;
			font-style: italic;
		}
	</style>
</head>
	<body>
	
	<jsp:include page="header.jsp" />
	<div class="limiter" id="login">
		<div class="container-login100" style="background-image:url(assets/img/bg.jpg)">
			<div class="container">
				<div class="row">
				<form:form action="searchbus" method="post" modelAttribute="BusDetailsModel">
					<div class="search-div">
						<div class="logo">
							<img src="assets/img/logo.png">
						</div>
						<div class="title">
							Book Ticket
						</div>
						<div class="fields">
							<div class="source">
								<i class="fas fa-building"></i>
								<form:input path="source" placeholder="Source *" required="required" class="source-input" pattern="[A-Za-z\s]{1,50}" title="Source should only contain letters. e.g. Chennai" autocomplete="off"/>
							</div>
							<div class="destination">
								<i class="fas fa-bus"></i>
								<form:input path="destination" placeholder="Destination *" required="required" class="destination-input" pattern="[A-Za-z\s]{1,50}" title="Source should only contain letters. e.g. Chennai" autocomplete="off"/>
							</div>
							<div class="destination">
								<i class="fas fa-calendar-o"></i>
								<form:input path="from" type="date" required="required" class="txtDate" id="txtDate"/>
							</div>
						</div>
						<form:button type="submit" class="search-button"> Search</form:button>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-danger">
				<div class="panel-heading text-center">
					<h3 style="font-weight:bold;">WHY BOOK WITH US</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-body text-center">
					<i class="fas fa-user-shield" style="font-size:70px; color:;"></i><br/>
					<h5 style="font-weight:bold;">SAFETY +</h5><br/>
					<p class="text-justify" style="padding:10px 10px 10px 10px">With Safety+ we have brought in a set of measures like Sanitized buses, mandatory masks etc. to ensure you travel safely.</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-body text-center">
					<i class="fas fa-cogs" style="font-size:70px; color:;"></i><br/>
					<h5 style="font-weight:bold;">SUPERIOR CUSTOMER SERVICE</h5><br/>
					<p class="text-justify" style="padding:10px 10px 10px 10px">We put our experience and relationships to good use and are available to solve your travel issues.</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-body text-center">
					<i class="fas fa-rupee-sign" style="font-size:70px; color:;"></i><br/>
					<h5 style="font-weight:bold;">LOWEST PRICES</h5><br/>
					<p class="text-justify" style="padding:10px 10px 10px 10px">We always give you the lowest price with the best partner offers.</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center" style="font-weight:bold;">THE NUMBERS ARE GROWING!</h3>
		</div>
		
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-body text-center">
					<h1 class="text-danger" style="font-weight:bold;">36M</h1><br/>
					<p>We are trusted by over 36 million happy customers globally</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="panel panel-default"> 
				<div class="panel-body text-center">
					<h1 class="text-danger" style="font-weight:bold;">3500</h1><br/>
					<p>network of over 3500 bus operators worldwide</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-body text-center">
					<h1 class="text-danger" style="font-weight:bold;">220+ M</h1><br/>
					<p>Over 220 million trips booked using redBus</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="text-center" style="font-weight:bold; color:#333;">Covid-19 Travel Advisory While Traveling in India</h4>
					<h3 class="text-center text-danger" style="font-weight:bold;">Key Points to Keep in Mind for Travel Safety</h3>
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			 <ul class="list-group">
				<li class="list-group-item" style="border:none;"><i class="fas fa-suitcase-rolling" style="padding-left:40px; font-size:40px;"></i> Check out travel restrictions that apply to your source and destination.</li>
				<li class="list-group-item" style="border:none;"><i class="fas fa-pump-soap" style="padding-left:40px; font-size:40px;"></i> Carry your personal hygiene items like hand sanitizer, tissues, and soap.</li>
				<li class="list-group-item" style="border:none;"><i class="fas fa-tshirt" style="padding-left:30px; font-size:40px;"></i> Buses may not be providing you a linen or blanket, so make sure to pack yours during a long trip.</li>
			</ul>
		</div>
		
		<div class="col-md-6">
			 <ul class="list-group">
				<li class="list-group-item" style="border:none;"><i class="fas fa-bus" style="padding-left:40px; font-size:40px;"></i> Book bus tickets online in advance to avoid any physical contact.</li>
				<li class="list-group-item" style="border:none;"><i class="fas fa-head-side-mask" style="padding-left:40px; font-size:40px;"></i> Wear a mask all the time while you are on the bus.</li>
				<li class="list-group-item" style="border:none;"><i class="fas fa-clock" style="padding-left:40px; font-size:40px;"></i> Due to temperature checks and precautionary measures, buses may get delayed.</li>
			</ul>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12 text-center">
			<img src="assets/img/guidlines.png" class="img-thumbnail img-responsive" alt="Guide Lines">
		</div>
	</div>
	
	 <!-- Login Modal -->
		  <div class="modal fade" id="login_modal" role="dialog">
			<div class="modal-dialog">
			  <!-- Modal content-->
			  <div>
				<div>
					<div class="row main-content bg-success text-center">
						<div class="col-md-4 text-center company__info">
							<span class="company__logo"><img src="assets/img/logo.png"></span>
						</div>
						
					<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
						<div class="container-fluid">
							<div class="row">
								<button type="button" class="close" data-dismiss="modal" style="margin-top:10px;">&times;</button>
								<h2 style="font-weight:bold; font-size:35px; font-style:italic; font-family:Tw Cen MT;">Login</h2>
							</div>
							<div class="row">
								<form:form class="form-group" action="validate" method="post" modelAttribute="UserModel">
									<c:if test="${loginCheck != null}">
									<p class="message">
						    			${loginCheck}
						    		</p>
						    		</c:if>
									<div class="row">
										<form:input path="email" id="username" class="form__input" placeholder="E-mail/Mobile Number" required="required" autocomplete="off"/>
									</div>
									<div class="row">
										<form:input path="password" type="password" name="password" id="password" class="form__input" placeholder="Password" required="required"/>
										<span onclick="pw();" class="glyphicon glyphicon-eye-open eye"></span>
									</div>
									
									<div class="row">
										<input type="submit" name="login" value="Submit" class="btn">
									</div>
								</form:form>
							</div>
							
							<div class="row">
								<p><a href="#" data-toggle="modal" data-target="#forget_password_modal" data-dismiss="modal">Forgot Password?</a></p>
							</div> 
						</div>
					</div>
				</div>	 
				</div>
			  </div>
			</div>
		  </div>  
		  
		   <!-- Signup Modal -->
		  <div class="modal fade" id="signup_modal" role="dialog">
			<div class="modal-dialog">
			
			  <!-- Modal content-->
			  <div>
				<div>
					<div class="row main-content bg-success text-center">
						<div class="col-md-4 text-center company__info">
							<span class="company__logo"><img src="assets/img/logo.png"></span>
						</div>
						
					<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
						<div class="container-fluid">
							<div class="row">
								<button type="button" class="close" data-dismiss="modal" style="margin-top:10px;">&times;</button>
								<h2 style="font-weight:bold; font-size:35px; font-style:italic; font-family:Tw Cen MT;">Signup</h2>
							</div>
							<div class="row">
								<form:form class="form-group" action="signup" method="post" modelAttribute="UserModel">
									<c:if test="${signupCheck != null}">
										<p class="message">
							    			${signupCheck}
							    		</p>
						    		</c:if>
						    		<c:if test="${user_exist != null}">
										<p class="message">
							    			${user_exist}
							    		</p>
						    		</c:if>
									<div class="row">
										<form:input path="userName" id="name" class="form__input" placeholder="Enter Your Name" required="required" autocomplete="off" pattern="[A-Za-z ]{1,32}" title="Username should only contain letters. e.g. John cena"/>
										<form:errors style="color:Tomato;" path="userName"></form:errors>
									</div>
									
									<div class="row">
										<form:input path="mobile_no" id="mobile" class="form__input" placeholder="Enter Your Mobile Number" required="required" autocomplete="off" pattern="[6-9]{1}[0-9]{9}" title="Phone number with 6-9 and remaing 9 digit with 0-9"/>
										<form:errors style="color:Tomato;" path="mobile_no"></form:errors>
									</div>
									
									<div class="row">
										<form:input path="email" id="email" class="form__input" placeholder="Enter your E-mail" required="required" autocomplete="off" pattern="[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,5}$" title="Enter Valid Email ID e.g. abc@gmail.com"/>
										<form:errors style="color:Tomato;" path="email"></form:errors>
									</div>
									
									<div class="row">
										<form:input path="password" type="password" id="password1" class="form__input" placeholder="Enter Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"/>
										<span onclick="pw1();" class="glyphicon glyphicon-eye-open eye"></span>
										<form:errors style="color:Tomato;" path="password"></form:errors>
									</div>
									
									<div class="row">
										<input type="submit" name="login" value="Register" class="btn">
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>	 
				</div>
			  </div>
			</div>
		  </div>
		  
		  <!-- Forget Password model -->
		  <div class="modal fade" id="forget_password_modal" role="dialog">
			<div class="modal-dialog">
			  <!-- Modal content-->
			  <div>
				<div>
					<div class="row main-content bg-success text-center">
						<div class="col-md-4 text-center company__info">
							<span class="company__logo"><img src="assets/img/logo.png"></span>
						</div>
					<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
						<div class="container-fluid">
							<div class="row">
								<button type="button" class="close" data-dismiss="modal" style="margin-top:10px;">&times;</button>
								<h2 style="font-weight:bold; font-size:35px; font-style:italic; font-family:Tw Cen MT;">Forget Password</h2>
							</div>
							<div class="row">
								<form:form class="form-group" method="POST" action="updatepassword" modelAttribute="UserModel">
										<p class="message" id="message"></p>
									<div class="row">
										<div class="col-md-12">
										<c:if test="${otp == null}">
											<input type="email" name="email" id="forget_mail" class="form__input" placeholder="E-mail" required autocomplete="off" pattern="[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,5}$" title="Enter Valid Email ID e.g. abc@gmail.com">
										</c:if>
										<c:if test="${otp != null}">
											<form:input type="email" path="email" id="forget_mail" class="form__input" value="${forget_mail}" readonly="readonly" required="required"/>
										</c:if>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
										<input type="number" name="otp" id="otp" class="form__input" placeholder="OTP" required>
										</div>
										<div class="col-md-6" style="margin-top:8px;">
										<c:if test="${otp == null}">
											<input type="button" name="get_otp" value="Get Otp" class="btn" onclick="verifyemail();">
										</c:if>
										<c:if test="${otp != null}">
											<input type="button" name="verify_otp" id="verify_btn" value="Verify" class="btn" onclick="verifyotp();">
										</c:if>
										</div>
									</div>
									<div id="verified">
										<div class="row">
											<div class="col-md-12">
											<form:input type="password" path="password" id="np" class="form__input" placeholder="New Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"/>
											<span onclick="pw2();" class="glyphicon glyphicon-eye-open eye"></span>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
											<input type="password" name="re_enter_password" id="cp" class="form__input" placeholder="Re-enter Password" required>
											<span onclick="pw3();" class="glyphicon glyphicon-eye-open eye"></span>
											</div>
										</div>
										<p id="passcheck"></p>
									</div>
									<div class="row">
										<input type="submit" name="login" value="Submit" class="btn" onclick="return passwordCheck()">
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>	 
				</div>
				
			  </div>
			  
			</div>
		  </div> 
    <jsp:include page="footer.jsp" />
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
		var userid="${userId}";
		if(userid==""&&"${error}"!="error"&&"${signupCheck}" == ""&&"${user_exist}" == ""&&"${otp}" == ""){
			$('#login_modal').modal();}
		if("${error}"=="error"||"${signupCheck}" != ""||"${user_exist}" != ""){
			$('#signup_modal').modal();}
		if("${otp}" != ""){
			document.getElementById("message").innerText="Check your mail, OTP send...";
			$('#forget_password_modal').modal();}
		});
		function pw() {
		  var x = document.getElementById("password");
		  if (x.type === "password") {
			x.type = "text";
		  } else {
			x.type = "password";
		  }
		}
		function pw1() {
		  var x = document.getElementById("password1");
		  if (x.type === "password") {
			x.type = "text";
		  } else {
			x.type = "password";
		  }
		}
		function verifyotp() {
			if("${otp}" == document.getElementById('otp').value){
				document.getElementById("otp").readOnly = true;
				document.getElementById("verify_btn").style.display = "none";
				document.getElementById("message").innerText="Validation successful...";
				document.getElementById("verified").style.display = "block";
			}
			else{
				document.getElementById("message").innerText="Invalid OTP...";
			}
			}
		function verifyemail(){
			if (document.getElementById("forget_mail").value.trim() == "") {
				alert("Email Id is must...")
			}
			else{
				window.location = "/BusBookingSystem/otp="+document.getElementById("forget_mail").value;
			}
		}
		function pw2() {
			  var x = document.getElementById("np");
			  if (x.type === "password") {
				x.type = "text";
			  } else {
				x.type = "password";
			  }
			}
		function pw3() {
			  var x = document.getElementById("cp");
			  if (x.type === "password") {
				x.type = "text";
			  } else {
				x.type = "password";
			  }
			}
		$('#np, #cp').on('keyup', function () {
			  if ($('#np').val() == $('#cp').val()) {
			    $('#passcheck').html('Matching').css('color', 'green');
			  } else 
			    $('#passcheck').html('Not Matching').css('color', 'red');
			});
		function passwordCheck(){
			if(document.getElementById("#np").value==document.getElementById("#cp").value)
				return true;
			else
				return false;
		}
	</script>
	</body>
	</html>