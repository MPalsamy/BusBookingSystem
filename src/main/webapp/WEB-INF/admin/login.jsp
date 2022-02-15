<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Login</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    body {
        color: #333;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
	}
	.form-control {
		box-shadow: none;
		border-color: #ddd;
	}
	.form-control:focus {
		border-color: #4aba70; 
	}
	.login-form {
		margin-top:10px;
        width: 350px;
		margin: 0 auto;
		padding: 30px 0;
	}
    .login-form form {
        color: #434343;
		border-radius: 1px;
    	margin-bottom: 15px;
        background: #fff;
		border: 1px solid #f3f3f3;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
	}
	.login-form h4 {
		text-align: center;
		font-size: 22px;
        margin-bottom: 20px;
	}
    .login-form .avatar {
        color: #fff	;
		margin: 0 auto 30px;
        text-align: center;
		width: 100px;
		height: 100px;
		border-radius:50%;
		z-index: 9;
		background:#2980b9;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
    .login-form .avatar i {
        font-size: 62px;
    }
    .login-form .form-group {
        margin-bottom: 20px;
    }
	.login-form .form-control, .login-form .btn {
		min-height: 40px;
		border-radius: 2px;
        transition: all 0.5s;
	}
	.login-form .close {
        position: absolute;
		top: 15px;
		right: 15px;
	}
	.login-form .btn {
		border: none;
		line-height: normal;
	}
    .login-form .checkbox-inline {
        float: left;
    }
    .login-form input[type="checkbox"] {
        margin-top: 2px;
    }
    .login-form .forgot-link {
        float: right;
		color:#2980b9;
    }
    .login-form .small {
        font-size: 13px;
    }
    .login-form a {
        color: #4aba70;
    }
	.glyphicon-eye-open {
			  float: right;
			  margin-left: -25px;
			  margin-top: -30px;
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
</style>
</head>
<body>
<div class="login-form" style="margin-top:80px;">
    <form:form action="validate" method="post" modelAttribute="AdminLoginModel">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
    	<h4 class="modal-title">Admin login</h4>
    	<c:if test="${loginCheck != null}">
    		<div class="message">
    			${loginCheck}
    		</div>
    	</c:if>
        <div class="form-group">
        	<form:input path="adminId" placeholder="Username" required="required" class="form-control"/>
        </div>
        <div class="form-group">
        	<form:input path="adminPassword" type="password" placeholder="Password" required="required" class="form-control" id="pw"/>
			<span onclick="pw();" class="glyphicon glyphicon-eye-open"></span>
        </div>
        <div class="form-group small clearfix">
         
            <a href="../index" class="forgot-link"><i class="glyphicon glyphicon-arrow-left"></i> Go Home</a>
        </div> 
        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login" name="submit">              
    </form:form>			
</div>
	<script>
			function pw() {
			  var x = document.getElementById("pw");
			  if (x.type === "password") {
				x.type = "text";
			  } else {
				x.type = "password";
			  }
			}
	</script>
</body>
</html>