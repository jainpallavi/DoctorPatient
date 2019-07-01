<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body>
<form action="logout" method="post">

<center><h3 style="text-align : justify">You have been successfully logout</h3></center>
 <% session.invalidate();
 getServletContext().getRequestDispatcher("/Homepage.jsp").include(request, response);
 %> 
 
</form>
</body>

</html>