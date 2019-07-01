<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor list</title>
<style>
body{
background-image: url("images/doctor1.png");
  background-color: #cccccc;
  background-repeat: no-repeat;
    background-size: cover;
  height: 500px;
  background-blend-mode: lighten;
 

}
table {
		border-collapse: collapse;
    	border-spacing: 0;
    	width: 90%;
    	border: 1px solid #ddd;
}
th	{
		width: 140px;
	    height: 25px;
	    font-size: 20px;
	    background-color: #2874A6;
	    color: white;
}
td{
		width: 140px;
	    height: 25px;
	    font-size: 20px;
		text-align: center;
}
tr:nth-child(even) {
		background-color: yellow;
}
mark {
		background: orange;
  		color: black;
}
.text-block {
		position: absolute;
    	bottom: 490px;
    	right:100px;
    	background-color: lightgreen;
    	color: white;
    	padding-left: 80px;
    	padding-right: 80px;
    	border-radius:30px;
    	font-size: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/mark.js/7.0.0/jquery.mark.min.js"></script>

</head>
<body bgcolor="#ADD8E6">
	<%@page import="Classes.DoctorWrapper,daofiles.Doctordao,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<center><h1>Doctor List</h1></center>
<hr>
<h2><p>Patient can choose DOCTOR ID for there Appointment</p></h2>
<script>
$(function() {
$("input").on("input.highlight", function() {
	    // Determine specified search term
	    var searchTerm = $(this).val();
	    // Highlight search term inside a specific context
$("#context").unmark().mark(searchTerm);
	  }).trigger("input.highlight").focus();
	});
</script>
<div class="text-block">
<table style="width: 20px; height: 30px; border: 0;">
<tr><td style="font-size: 40px;color: black;">Search </td><td><input type="text" placeholder="search for specialty"></td></tr></table>
</div>

		<%  
			List<DoctorWrapper> list=Doctordao.getAllDoctors();  
			request.setAttribute("list",list);  
		%>  
<div id="context">
<center><table >
  <tr>
    <th>Id</th>
    <th>First Name</th>
    <th>Specialization</th>
    <th>Timing</th>
    <th>Fees</th>
  </tr>
  	<c:forEach items="${list}" var="d">  
			<tr>
			<td>${d.getId()}</td>
			<td>${d.getDocname()}</td>
			<td>${d.getSpeciality()}</td>
			<td>6:00 PM to 8:00 PM</td>
			<td>200/-</td>
			</tr>  
			</c:forEach>  	
</table></center>
</div>






</body>
</html>