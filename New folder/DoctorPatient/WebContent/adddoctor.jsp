<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Doctor</title>
<style type="text/css">
body{
background-image: url("images/doctor1.png");
  background-color: #cccccc;
  background-repeat: no-repeat;
    background-size: cover;
  height: 500px;
  background-blend-mode: lighten;
 

}
.container {
	/* border-radius: 20px;
   background-color: #f2f2f2;
	//box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29); */
	padding: 10px;
	widht: 14px;
}
.container th {
	width: 140px;
	height: 25px;
	font-size: 20px;
}
.container td {
	text-align: center;
	font-size: 20px;
}

	.roundbox 	{
    	display: inline-block;
    	height: 30px;
    	background-color: #9C9E9E;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
        color:yellow;
    }
  .welcome	{
   		display: inline-block;
   		float: right;
   		width: 365px;
		line-height: 40px;
   		border-radius:30px;
  	 	cursor: pointer;
   }
.reg table {

	width: 400px;
	height: 400px;
	
	border-style: 50px;
	border-radius:15px;
	
	
	}
.reg input[type="tel"], input[type="email"], input[type="number"], input[type="text"],
	input[type="password"], input[type="date"],select {
	width: 300px;
	height: 35px;
}
.reg option	{
      	font-size:20px;
      	font-family: cursive;
}
.reg input[type="submit"] {
	width: 300px;
	border-radius:30px;
	height: 35px;
	border-bottom: 2px solid black;
}
</style>
</head>
<body bgcolor="#ADD8E6">
	<jsp:include page="header.jsp" />
	<br>
	<div class="container">
		<ul style="width: 910px; height: 94px; ">
		<a href="AdminHome.jsp"><li class="roundbox">Doctor's Details</li></a>
		<a href="adddoctor.jsp"><li class="roundbox">Add Doctor</li></a>
		<a href="AddPatientDetails.jsp"><li class="roundbox">Patient Details</li></a>
		<a href="logout.jsp"><li class="roundbox">Logout</li></a>
		<li class="welcome"><marquee>
		<% 

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
        response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("email")==null){
					response.sendRedirect("Admin.jsp");
					}
			       else if(session!=null)	{
					String email=(String) session.getAttribute("email");
					out.println("Hello ,  "+email);
					}
%>
</marquee></li>
	</ul>
       <center>
			<h1>Add Doctor</h1></center>
	<form action="DoctorRegistration" method="post" >
			<div class="reg">
			<center>
				<table style="width: 500px; ">
				<tr>
						<td>Doctor Name:</td>
						<td><input type="text" name="docname" placeholder="Full Name"
							required></td>
					</tr>
					<tr>
						<td>Email Id:</td>
						<td><input type="email" name="email"
							placeholder="xyz@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
							 required></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input type="password" name="password"
							placeholder="*******" required></td>
					</tr>
					<tr><td>Speciality:</td><td><select name="speciality">
					<option disabled="disabled">---Select---</option>
			    	<option value="Cardiology">Cardiology</option>
			    	<option value="Dentistry">Dentistry</option>
			    	<option value="Gynaecology">Gynaecology</option>
			       	<option value="Neurology">Neurology</option>
			    	<option value="Radiology">Radiology</option>
			    	<option value="Orthology">Orthology</option>
			    	<option value="Obstetrics">Obstetrics</option>
			    	<option value="Gastroenterology">Gastroenterology</option>
			    	<option value="Dermatology">Dermatology</option>
			    	<option value="Plastic Surgery">Plastic Surgery</option>
			    	<option value="Physician">Rheumatology</option></select></td></tr>
					<tr>
						<td>Contact No:</td>
						<td><input type="tel" name="contact" placeholder="xxxxxxxxx"
							pattern="^\d{10}$" required></td>
					</tr>
					</div>
						</table>
						</center>
</form>
<center><input type="submit" value="Submit" style="width: 100px;"></center>
</body>
</html>