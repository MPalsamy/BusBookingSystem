<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_profile.css">
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
		
		.edit_photo
		{
			margin-top:20px;
			margin-left: 23px;
			border-radius:20px;
			font-weight:bold;
			color:#fff;
			background-color:#1a242f;
			font-style:italic;
			width: 100px;
			border: none;
		}
		
		#image_size{
			margin-top: 10px;
			margin-left: 10px;
			color: red;
			font-size: 12px;
		}
</style>
</head>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="page-wrapper">
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<form action="uploadimage" method="post" enctype="multipart/form-data">
									<div id="profile-container">
										<img id="profileImage" src="data:image/jpeg;base64,${userImage}" alt="Profile"/>
									</div>
									<input id="imageUpload" type="file" name="photo" placeholder="Photo" required="required">
									<p id="image_size"></p>
									<input type="submit" value="Upload" class="edit_photo" onclick="return Filevalidation()">
								</form>
							</div> 
							
							<div class="col-md-4">
								<h3>${AdminDetails.name}</h3>
								<h5>${AdminDetails.email}</h5>
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
											<td>${AdminDetails.name}
										</tr>
										<tr>
											<th>Mobile
											<td>${AdminDetails.mobile_no}
										</tr>
										<tr>
											<th>Email
											<td>${AdminDetails.email}
										</tr>
										<tr>
											<th>Gender
											<td>${AdminDetails.gender}
										</tr>
										<tr>
											<th>Age
											<td>${AdminDetails.age}
										</tr>
									</tbody>
								</table>
							</div>
						</div>
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

<!-- Modal -->
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
								<form:form class="form-group" action="updateprofile" method="post" modelAttribute="AdminLoginModel">
									<div class="row">
										<form:input path="adminId" value="${AdminDetails.adminId}" class="form__input" readonly="true"/>
									</div>
									
									<div class="row">
										<form:input path="name" value="${AdminDetails.name}" class="form__input"/>
									</div>
									
									<div class="row">
										<form:input path="mobile_no" value="${AdminDetails.mobile_no}" class="form__input"/>
									</div>
									
									<div class="row">
										<form:input path="email" value="${AdminDetails.email}" class="form__input"/>
									</div>
									
									<div class="row">
										<form:input path="age" value="${AdminDetails.age}" class="form__input"/>
									</div>
									
									<div class="row">
										<form:select path="gender" class="form__input" id="gender">
								            <form:option value="Male" label="Male"/>
								            <form:option value="Female" label="Female"/>
								            <form:option value="Others" label="Others"/>
								        </form:select>
									</div>
										
									<div class="row">
										<input type="submit" value="Update" class="btn">
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
	$("#gender").val("${AdminDetails.gender}").change();
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
</body>
</html>