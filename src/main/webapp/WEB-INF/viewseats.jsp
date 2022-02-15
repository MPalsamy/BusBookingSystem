<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Seats</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
	/* Main Classes */
			.myinput[type="checkbox"]:before {
			  position: relative;
			  display: block;
			  width: 11px;
			  height: 11px;
			  border: 1px solid #808080;
			  content: "";
			  background: #FFF;
			}

			.myinput[type="checkbox"]:after {
			  position: relative;
			  display: block;
			  left: 2px;
			  top: -11px;
			  width: 7px;
			  height: 7px;
			  border-width: 1px;
			  border-style: solid;
			  border-color: #B3B3B3 #dcddde #dcddde #B3B3B3;
			  content: "";
			  background-image: linear-gradient(135deg, #B1B6BE 0%, #FFF 100%);
			  background-repeat: no-repeat;
			  background-position: center;
			}

			.myinput[type="checkbox"]:disabled:after {
			  -webkit-filter: opacity(0.4);
			}

			.myinput[type="checkbox"]:not(:disabled):hover:after {
			  background-image: linear-gradient(135deg, #8BB0C2 0%, #FFF 100%);
			  border-color: #85A9BB #92C2DA #92C2DA #85A9BB;
			}

			.myinput[type="checkbox"]:not(:disabled):hover:before {
			  border-color: #3D7591;
			}

			/* Large checkboxes */
			.myinput.large {
			  height: 22px;
			  width: 22px;
			}

			.myinput.large[type="checkbox"]:before {
			  width: 20px;
			  height: 20px;
			}

			.myinput.large[type="checkbox"]:after {
			  top: -20px;
			  width: 16px;
			  height: 16px;
			}

			/* Custom checkbox */
			.myinput.large.custom[type="checkbox"]:checked:after {
				background-image: url('assets/img/seat.png'), linear-gradient(135deg, #8BB0C2 0%, #FFF 100%);
			}

			.myinput.large.custom[type="checkbox"]:not(:disabled):checked:hover:after {
			  background-image: url('assets/img/seat.png'), linear-gradient(135deg, #8BB0C2 0%, #FFF 100%);
			}
		</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="row" style="margin-top:50px;">
	<div class="col-md-12">	
		<div class="panel panel-danger">
			<div class="panel-body">
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic;" class="col-md-2 text-center">${busDetails.busName }</div>
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic; text-transform:capitalize;" class="col-md-2 text-center text-success">${busDetails.source }</div>
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic; text-transform:capitalize;" class="col-md-2 text-center text-danger">${busDetails.destination }</div>
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic;" class="col-md-2 text-center text-info">${busDetails.boardingTime }</div>
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic;" class="col-md-1 text-center text-warning">${busDetails.arrivalTime }</div>
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic;" class="col-md-2 text-center text-success">${date }</div>
				<div style="font-weight:bold; font-family:Tw Cen MT; font-size:22px; padding:2px; font-style:italic;" class="col-md-1 text-center text-success">${busDetails.ticketFare }</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-3">	
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<img src="assets/img/driver.png" style="float:right; height:40px; width:70px;">
				</div>
			</div>
			<hr>
			
				<div class="row">
				<c:forEach var = "i" begin = "1" end = "${busDetails.totalSheets}">
					<div class="col-md-2">
						<div class="checkbox" style="padding-left:10px;">
							<label><input type="checkbox" class="seat myinput large custom" value="S${i }" id="S${i }"></label>
						</div>	
					</div>
					
						<c:if test="${i % 2 ==0}">  
							<c:if test = "${i % 4 !=0}">
						    	<div class="col-md-4"></div>
						    </c:if>
						</c:if>
					</c:forEach>
				</div>
			
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 text-center"><button type="button" onclick="check();" class="btn btn-success">Add</button></div>
			<div class="col-md-4"></div>
		</div>
	</div>
</div>

<div class="col-md-8">
	<div class="panel panel-default">
		<div class="panel-body">
			<form:form action="booking_summary" method="post" modelAttribute="BusBookingModel">
			<input type="hidden" name="busid" value="${busDetails.busId }" class="form-control" readonly="readonly"/>
			<input type="hidden" name="date" value="${date }" class="form-control" readonly="readonly"/>
				<table class="table table-stripped">
					<tbody>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>
</div>
</div>
<jsp:include page="footer.jsp" />
<script>
const checkedValue = [];
function check(){
	var j1=0;
	var inputElements = document.getElementsByClassName('seat');
	for(var i=0; inputElements[i]; ++i){
		if(inputElements[i].checked && !inputElements[i].disabled){
			j1++;
		}
	}
	tableBody = $("tr td");
	tableBody.remove();
	var j=0;
	if(j1<5){
		for(var i=0; inputElements[i]; ++i){
			if(inputElements[i].checked && !inputElements[i].disabled){
				markup="<tr><td><input type='text' name='passangers["+j+"].name' class='form-control' placeholder='Name' required autocomplete='off'><td><input type='text' name='passangers["+j+"].age' class='form-control' placeholder='Age' required autocomplete='off'><td><select name='passangers["+j+"].gender' class='form-control'><option value='Male'>Male</option><option value='FeMale'>FeMale</option></select><td><input type='text' name='passangers["+j+"].seatNo' class='form-control' value="+inputElements[i].value+" required readonly></tr>";
				tableBody = $("table tbody");
				tableBody.append(markup);
				j++;
			}
		}
		markup="<tr><td><input type='submit' class='btn' value='Confirm'/></td></tr>";
		tableBody.append(markup);
	}
	else{
		alert("Only 4 Seats can be selected at a time");
	}
}

$(document).ready(function(){
	var seats="${seats}";
	seats=seats.replace('[','');
	seats=seats.replace(']','');
	var seatArr = seats.split(", ");
	var totalseats="${busDetails.totalSheets}";
	for(var i=0;totalseats[i];++i)
	{
		for(var j=0;seatArr[j];++j)
		{
			document.getElementById(seatArr[j]).disabled = true;
			document.getElementById(seatArr[j]).checked = true;
		}
	}
});
</script>
</body>
</html>