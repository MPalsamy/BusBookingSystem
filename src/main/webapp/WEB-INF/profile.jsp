<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user_profile.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		#imageUpload
		{
			display: none;
		}

		#profileImage
		{
			cursor: pointer;
		}

		#profile-container {
			width: 150px;
			height: 150px;
			overflow: hidden;
			-webkit-border-radius: 50%;
			-moz-border-radius: 50%;
			-ms-border-radius: 50%;
			-o-border-radius: 50%;
			border-radius: 50%;
		}

		#profile-container img {
			width: 150px;
			height: 150px;
		}
		
		.profile_image_btn{
			width: 50%;
			margin-left: 10px;
		}
		
		#image_size{
			margin-top: 10px;
			margin-left: 10px;
			color: red;
			font-size: 12px;
		}
	</style>
</head>
<body>
<jsp:include page="header.jsp" />
<a href="index"><i class="fa fa-home" aria-hidden="true"></i></a>
<div class="row" style="margin-top:10px;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-danger">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<form action="uploadimage" method="post" enctype="multipart/form-data">
									<div id="profile-container">
										<c:if test = "${userImage ne ''}">
											<img id="profileImage" src="data:image/jpeg;base64,${userImage}" alt="Profile"/>
										</c:if>
										<c:if test = "${userImage eq ''}">
											<img id="profileImage" src="assets/img/profile.jpg" alt="Profile"/>
										</c:if>
									</div>
									<input id="imageUpload" type="file" name="photo" placeholder="Photo" required="required">
									<p id="image_size"></p>
									<input type="submit" value="Upload" class="btn profile_image_btn" onclick="return Filevalidation()">
								</form>
							</div> 
							
							<div class="col-md-4">
								<h3>${UserDetails.userName}</h3>
								<h5>${UserDetails.email}</h5>
							</div>
							
							<div class="col-md-2">
								<button class="edit_profile" name="edit_profile" data-toggle="modal" data-target="#update_profile">Edit Profile</button>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<h4><b>About</b></h4>
								
								<table class="table table-hover">
									<tbody>
										<tr>
											<th>Name
											<td>${UserDetails.userName}
										</tr>
										<tr>
											<th>Mobile
											<td>${UserDetails.mobile_no}
										</tr>
										<tr>
											<th>Email
											<td>${UserDetails.email}
										</tr>
										<tr>
											<th>Gender
											<td>${UserDetails.gender}
										</tr>
										<tr>
											<th>Age
											<td>${UserDetails.age}
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="update_profile" role="dialog">
			<div class="modal-dialog">
			  <!-- Modal content-->
				<div>
					<div>
						<div class="row main-content bg-success text-center">
							<div class="col-md-4 text-center company__info">
								<i class="fa fa-fw fa-user" style="font-size:150px;"></i>						
							</div>
							
							<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
								<div class="container-fluid">
									<div class="row">
										<button type="button" class="close" data-dismiss="modal" style="margin-top:10px;">&times;</button>
										<h2 style="font-weight:bold; font-size:35px; font-style:italic; font-family:Tw Cen MT;">Update Profile</h2>
									</div>
									<div class="row">
										<form:form class="form-group" action="updateprofile" method="post" modelAttribute="UserModel">
											<div class="row">
												<form:input path="email" value="${UserDetails.email}" placeholder="Email" class="form__input" readonly="true" id="user_id" required="required"/>
											</div>
											
											<div class="row">
												<form:input path="userName" value="${UserDetails.userName}" placeholder="Name" class="form__input" id="name" required="required"/>
											</div>
											
											<div class="row">
												<form:input path="mobile_no" value="${UserDetails.mobile_no}" placeholder="Mobile Number" class="form__input" readonly="true" id="mobile" required="required"/>
											</div>
											
											<div class="row">
												<form:input path="age" value="${UserDetails.age}" placeholder="Age" class="form__input" id="age" required="required"/>
											</div>
											
											<div class="row">
												<form:select path="gender" class="form__input" id="gender">
										            <form:option value="Male" label="Male"/>
										            <form:option value="Female" label="Female"/>
										            <form:option value="Others" label="Others"/>
										        </form:select>
											</div>
												
											<div class="row">
												<input type="submit" name="update" value="Update" class="btn">
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
<script type="text/javascript">
		$("#gender").val("${UserDetails.gender}").change();
		$("#profileImage").click(function(e) {
			$("#imageUpload").click();
		});

		function fasterPreview( uploader ) {
			if ( uploader.files && uploader.files[0] ){
				  $('#profileImage').attr('src', 
					 window.URL.createObjectURL(uploader.files[0]) );
			}
		}

		$("#imageUpload").change(function(){
			fasterPreview( this );
		});
		
		Filevalidation = () => {
	        const fi = document.getElementById('imageUpload');
	        // Check if any file is selected.
	        if (fi.files.length > 0) {
	            for (const i = 0; i <= fi.files.length - 1; i++) {
	  
	                const fsize = fi.files.item(i).size;
	                const file = Math.round((fsize / 1024));
	                // The size of the file.
	                if (file >= 400) {
	                	document.getElementById("image_size").innerText="File size less than 400KB";
	                    return false;
	                }
	                else
                	{
                		return true;
                	}
	            }
	        }
	    }
</script>
<jsp:include page="footer.jsp" />
</body>
</html>