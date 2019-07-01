<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DoctorLogin</title>
</head>
<style>
body{
background-image: url("images/doctor1.png");
  background-color: #cccccc;
  background-repeat: no-repeat;
    background-size: cover;
  height: 500px;
  background-blend-mode: lighten;
 

}
.login input[type=email],input[type=password]
{
width: 300px;
	height: 30px;
	padding: 10px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
	border-radius:15px; 
}
input[type=email]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}
.button {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 10px 2px;
  border-radius: 15px;
  cursor: pointer;
  width:100%
  
}
.button :hover {
  box-shadow: 0 8px 15px 0 rgba(255,0,0,0.3), 0 6px 20px 0 rgba(255,0,0,0.3);
}


</style>

<body bgcolor="#ee82ee">
<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />

<center>
<h1>Doctor Login</h1>
<hr>
<div class="login">
<form action="DoctorLogin" method="post">
<table>
<tr>
<td><b>Email</b></td>
<td><input type="email" placeholder="Enter Email" name="email"required></td>
</tr>
<tr>
<td><b>Password</b></td>
<td><input type="password" placeholder="Enter Password"name="password" required id="mypassword"></td>
</tr>
<tr>
<td></td>
<td><button class=" button login" type="submit">Login</button></td>
</tr>
<tr>
<td></td>
<td> <a href="DoctorRegister.jsp">Click Here</a> New User</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>