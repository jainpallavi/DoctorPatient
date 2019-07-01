<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Error</title>
</head>
<body>
<center><p style="color:black; text-align:justify; font-size:20px; font-family:forte">     Sorry, your record is not available.</p></center>
<%
getServletContext().getRequestDispatcher("/Homepage.jsp").include(request, response);
%>
</body>
</html>