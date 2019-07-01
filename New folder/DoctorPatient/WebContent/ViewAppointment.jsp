<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Appointment</title>
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
	border-radius: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
	background-color: #f2f2f2;
	padding: 2px;
}
	.roundbox 	{
    	display: inline-block;
    	color:yellow;
    	height: 40px;
    	background-color: #9C9E9E;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
	}
	 .container th	{
	     	width: 140px;
	     	height: 30px;
	     	font-size: 20px;
	     	background-color: #2874A6;
	     	color: white;
  		   }
	
	.container td	{
	   		text-align: center;
	   		font-size:20px ;
	   }
	.container tr:nth-child(even)	{
		background-color: white;
		}	
	   
	   
	.welcome	{
  		display: inline-block;
    	float: right;
       	width: 370px;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
       }
   
</style>

</head>
<body bgcolor="#ADD8E6">
		<%@page import="daofiles.*,Classes.*,java.util.ArrayList" %>
		<jsp:include page="header.jsp" />
	<br>
		<form action="AppointmentReg" method="post">
	
	<div class="container">

		<ul>
			<a href="patienthome.jsp"> <li class="roundbox">Book An Appointment</li></a>
			<a href="PatientUpdate.jsp"> <li class="roundbox">Update Profile</li></a>
			<a href="ViewAppointment.jsp"><li class="roundbox">View Appointment</li></a>
			
			<a href="logout.jsp"><li class="roundbox">Logout</li></a>
 			<li class="welcome"><marquee> 
  			<%
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("email")==null){
 					response.sendRedirect("PatientLogin.jsp");
 					}
 			       else if(session!=null)	{
 					String email=(String) session.getAttribute("email");
 					out.println("Hello ,  "+email);
 					
 			       }
		
				%> </marquee></li> 
	</ul>		
			<% 
				String email=(String)session.getAttribute("email");
			ArrayList<Appointment> list=AppointmentDao.getAppointmentbyemail(email);
				
			%>
		<center>
		<table border="1px solid black">
			<tr>
				<th>Patient Name</th>
				<th>Email</th>
				<th>Contact</th>
	       		<th>Age</th>
	       		<th>AppointmentDate</th>
	       		<th>Speciality</th>
	       		<th>Description</th>
	       		<th>Docname</th>
	       		<th>slot</th>
	       		<th>Cancel</th>
	       	</tr>
			<%for(Appointment app:list)	{ %>
			<tr>
			<td><%=app.getName()%></td>
			<td><%=app.getEmail() %></td>
			<td><%=app.getContact() %></td>
			<td><%=app.getAge() %></td>
			<td><%=app.getDay() %></td>
			<td><%=app.getSpeciality() %></td>
			<td><%=app.getDescription() %></td>
			<td><%=app.getDocname() %></td>
			<td><%=app.getSlot() %></td>
			<td><a href="CancelApp?id=<%=app.getApid()%>">Cancel</a></td> 	
			<%
			}
			%>
 			</tr>  
		</table>
		</center>
		<br>
	</div>
	
</body>
</html>