<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home</title>
<style>
 body{
background-image: url("images/doctor1.png");
  background-color: #cccccc;
  background-repeat: no-repeat;
    background-size: cover;
  height: 500px;
  
  
  
 
}

 
.cent {
	position: relative;
	text-align: center;
	transform-style: preserve-3d;
  transition: all 1s ease-in-out;
  width: 100%;
}
.cent:hover {
  transform: rotateY(180deg);
}
.cent .side {
  backface-visibility: hidden;
  border-radius: 6px;
  height: 100%;
  position: absolute;
  overflow: hidden;
  width: 100%;
}
.cent .back {
  background: #eaeaed;
  color: #0087cc;
  line-height: 150px;
  text-align: center;
  transform: rotateY(180deg);
}


.text-block {
font-family: forte;
 text-align: center;
  position: absolute;
  bottom: 100%;
  top: 100%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: black;
}

	

 blink {
           color:red;
           -webkit-animation: blink 1s step-end infinite;
           animation: blink 1s step-end infinite
         }
 @keyframes blink {
         67% { opacity: 0 }
        }
        

	 
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
	
	
<marquee style="font-size: 30px; font-family:Forte;" onmouseover="this.stop();" onmouseout="this.start();"><blink> &#9733</blink>  Need an appointment ?  <a href="Register.jsp" style="color: black; font-family:Forte;"> Get Registered</a>
	</marquee>
	
	
	<div class="cent">
	
	
		<alt="Book Your Doctor" style="width: 12px; height: 375px;"></alt>
		
		      <div class="text-block">
			  <h1 style="font-size:50px">Let's Make You An <br>Appointment !!</h1>
		</div>
</div>

</body>

</html>