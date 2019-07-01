<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Registration</title>
<script>
            $(function date() 
            		{
                $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
  
               
            });
            </script>
            
            
            <script>
		function myFunction() {
    	var x = document.getElementById("mypassword");
    	if (x.type === "password") {
        x.type = "text";
    	} else {
        x.type = "password";
    }
}
</script>
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

</style>
<body bgcolor="#ee82ee">
	<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
	
<hr>
<center>
<h1>Patient Registration</h1>
	<form action="PatientRegistration" method="post">
	<div class="reg">
	<table cellspacing="15px">
<tr><td></td></tr>
<tr>
<td>Full Name:*</td><td><input  type="text" name="name" placeholder="Full Name" required="required"></td>
</tr>
<tr>
<td>D.O.B:*</td><td><input type="date" name="dob" id=datepicker ></td>
</tr>
<tr>
<td>Address:*</td><td><textarea rows="4" cols="40" name="address" placeholder="Enter your full address ............" required="required"></textarea></td>
</tr>
<tr>
<td>Gender:*</td><td><input type="radio" name="gender" value="Male" required="required">Male
<input type="radio" name="gender" value="Female" required="required">Female
<input type="radio" name="gender" value="Other" required="required">Other</td>
</tr>
<tr>
<td>Contact No:*</td><td><input type="tel" name="contact"  pattern="^\d{10}$" placeholder="xxxxxxxxx"  required="required"></td>
</tr>
<tr>
<td>Email Id:*</td><td><input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" placeholder="xyz@gmail.com" ></td>
</tr>
<tr>
<td>Password :*</td><td><input type="password" name="password" placeholder="****" required="required" id="mypassword"></td>
</tr>
<center><tr>
<td><input type="reset"><td><input type="submit" name="submit" value="Submit"></td></td>
</tr></center>
<tr><td></td><td><input type="checkbox" onclick="myFunction()">Show Password</td></tr>
<tr><td></td>
</tr>
	</table>
	<div style="position: absolute; bottom: 20x; background-color: red; text-align:right">
    * All fields are required.
    </div>
	</div>
	</form>
	</center>
</body>
</html>