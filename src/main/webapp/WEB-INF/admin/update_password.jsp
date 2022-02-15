<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Update</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style>
			.glyphicon-eye-open {
			  float: right;
			  margin-left: -25px;
			  margin-top: -25px;
			  position: relative;
			  z-index: 2;
			  margin-right:10px;
		}
		.ack {
			width: 50%;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
			font-size: 14px;
			color: red;
		}
		#message{
			font-size: 13px;
			font-style: italic;
			padding-top: 2px;
		}
		</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="page-wrapper">
<div class="container-fluid">
<!-- Page Heading -->
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="panel panel-danger" style="margin-top:50px;">
			<div class="panel-heading text-center" style="font-weight:bold;">
				Change Password
			</div>
			<div class="ack">
    			${passwordAck}
    		</div>
			<div class="panel-body">
				<form action="updatepassword" method="POST">
					<div class="form-group" style="padding:10px;">
						<label>Current Password<b style="color:red;">*</b></label>
						<input type="password" class="form-control" name="current_password" placeholder="Enter Current Password" id="op" required>
						<span onclick="op();" class="glyphicon glyphicon-eye-open"></span>
					</div> 
					
					<div class="form-group" style="padding:10px;">
						<label>New Password<b style="color:red;">*</b></label>
						<input type="password" class="form-control" name="new_password" placeholder="Enter New Password" id="np" required>
						<span onclick="np();" class="glyphicon glyphicon-eye-open"></span>
					</div> 
					
					<div class="form-group" style="padding:10px;">
						<label>Confirm Password<b style="color:red;">*</b></label>
						<input type="password" class="form-control" name="confirm_password" placeholder="Enter Confirm Password" id="cp" required>
						<span onclick="cp();" class="glyphicon glyphicon-eye-open"></span>
						<p id="message"></p>
					</div> 
					
					<div class="form-group" style="padding:10px;">
						<button type="submit" name="change_password" class="btn btn-success" onclick="return passwordCheck()"><i class="fa fa-pencil" aria-hidden="true"></i> Change</button>
						<button type="reset" name="reset" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Clear</button>
					</div> 
						
				</form>
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

<script type="text/javascript">
function op() {
  var x = document.getElementById("op");
  if (x.type === "password") {
	x.type = "text";
  } else {
	x.type = "password";
  }
}

function cp() {
  var x = document.getElementById("cp");
  if (x.type === "password") {
	x.type = "text";
  } else {
	x.type = "password";
  }
}

function np() {
  var x = document.getElementById("np");
  if (x.type === "password") {
	x.type = "text";
  } else {
	x.type = "password";
  }
}
$('#np, #cp').on('keyup', function () {
  if ($('#np').val() == $('#cp').val()) {
    $('#message').html('Matching').css('color', 'green');
  } else 
    $('#message').html('Not Matching').css('color', 'red');
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