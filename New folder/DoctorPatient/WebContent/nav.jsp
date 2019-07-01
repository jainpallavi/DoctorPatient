<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<style>


        ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  font-family: forte;

}

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .login:hover .dropbtn {
  background-color: grey;
}

li.login {
  display: inline-block;
}

.login-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.login-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.login-content a:hover {background-color: #f1f1f1;}

.login:hover .login-content {
  display: block;
}
	 
</style>
</head>
<body>
	
	<ul>
		<li><a href="Homepage.jsp">Home</a> </li>
		<li class="login">
         <a href="javascript:void(0)"class="dropbtn">Login</a>
    <div class="login-content">
      <a href="Admin.jsp">Admin Login</a>
      <a href="PatientLogin.jsp">Patient Login</a>
      <a href="DoctorLogin.jsp">Doctor Login</a>
    </div>
  </li>
	</ul>

</body>
</html>