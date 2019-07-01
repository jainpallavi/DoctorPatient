<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () 
            		{
                $("#datepicker").datepicker({dateFormat: 'yy/mm/dd',minDate: 0 });
  
               
            });
            </script>
            <script language="javascript" type="text/javascript">  
      var xmlHttp;
      var xmlHttp;
      var doc_id;
      function showState(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="doctor.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function setdoc(doc_id)
      {
    	 // alert(doc_id);
    	  this.doc_id=doc_id;
    	  
    	  
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("docname").innerHTML=xmlHttp.responseText   
      }   
      }
      
      
     
         function showDate(str,str1){
        	  //String date=document.getElementById("appointmentdate");
        	  //String doc=document.getElementById("docname");

              if (typeof XMLHttpRequest != "undefined"){
              xmlHttp= new XMLHttpRequest();
              }
              else if (window.ActiveXObject){
              xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
              }
              if (xmlHttp==null){
              alert("Browser does not support XMLHTTP Request")
              return;
              } 
              var url="slot.jsp";
              url +="?count=" +str + "&count1="+str1 ;
              xmlHttp.onreadystatechange = stateChange2;
              xmlHttp.open("GET", url, true);
              xmlHttp.send(null);
              
              
             
              }

              function stateChange2(){   
              if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
              document.getElementById("slot").innerHTML=xmlHttp.responseText   
              }   
              }
            
         
      
      
      
      </script>  
          
            
            
       
     <title>Book An Appointment</title>
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
	border-radius: 50px;

	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
	padding: 2px;
}
	.roundbox 	{
    	display: inline-block;
    	height: 40px;
    	background-color: #9C9E9E;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	color:yellow;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
		color:yellow;
	}
			
	 .reg td	{
   		text-align: center;
   		font-size:20px ;
  		   }
  	

  	   
	.welcome	{
  		display: inline-block;
    	float: right;
       	width: 370px;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
       }
    .reg table{
        width: 500px; height: 425px; border-style:50px;border-radius:20px;
        }    
    .reg input[type="text"],input[readonly="readonly"],input[type="number"],input[type="text"],input[type="password"],input[type="date"],select {	
      width: 300px; height: 35px; 
       }
      .reg input[readonly="readonly"]	{
      	background-color: #E2EAEA;
      } 
    .reg textarea   {
    	width: 300px;
    	height: 50px;
    	resize:none;
    }
    .reg input[type="submit"]{
      width: 300px; height: 35px;  border-bottom: 2px solid black;
      border-radius:30px;
      }
      
      option	{
      	font-size:20px;
      	font-family: cursive;
      }
</style>
</head>
<body bgcolor="#ADD8E6">
<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />

	
	<br>
	<div class="container">
	<ul>
			<a href="patienthome.jsp"> <li class="roundbox">Book An Appointment</li></a>
			<a href="PatientUpdate.jsp"> <li class="roundbox">Update Profile</li></a>
			<a href="ViewAppointment.jsp"><li class="roundbox">View Appointment</li></a>
			<a href="logout.jsp"><li class="roundbox">Logout</li></a>
<!-- 			 			<a href="DoctorList.jsp" target="_blank"> <h2>Doctor List</h2> </a> 
 --> 			
            <li class="welcome"><marquee> 

 						 
 			
 			 

	
		<%  
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("email")==null)
			       {
 					response.sendRedirect("PatientLogin.jsp");
 					}
 			       else if(session!=null)	{
 					String email=(String) session.getAttribute("email");
 					out.println("Hello ,  "+email);
 					
 			       
 			       
				%>
	}
	</marquee>
		</ul>
		<center>	
		<h1>Book An Appointment</h1>
		<div class="reg">
		<form action="AppointmentReg" method="get">
		<table>
		<tr><td></td></tr>
		<tr><td>Name:*</td><td><input type="text" name="name" placeholder="Name" required></td></tr>
		
		<tr><td>Email:</td><td><input readonly="readonly"  name="email" value="<%out.print(email);}
		%>"></td></tr>
	
		<tr><td>Contact No:*</td><td><input type="text" name="contact" pattern="^\d{10}$"  placeholder="xxxxxxxxx"  required   ></td></tr>
		
		<tr><td>Age:*</td><td><input type="number" name="age" min="1" max="100" required></td> </tr>
		<tr><td>Speciality:*</td><td> <select name='speciality' onchange="showState(this.value)">  
		<option value="none">Select specialisation</option>  
		<%
		 Class.forName("com.mysql.jdbc.Driver").newInstance();  
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorappointment","root","rat");  
		 Statement stmt = con.createStatement();  
		 ResultSet rs = stmt.executeQuery("Select distinct speciality from doctor");
           
            while(rs.next()){
		%>
		<option value="<%=rs.getString("speciality")%>"><%=rs.getString("speciality") %></option>
		<%
            }
		%>
		</select>
    	</td></tr> 

    <tr><td>Doctor:*</td><td><select name="docname"  id="docname"  onchange="setdoc(this.value)"required> 
     <option value='-1'>Select doctor</option>
      
    
      </select>
      </td>
      </tr>
            
       
	           
        
		<tr><td>Appointment Date:*</td><td><input type="text" id=datepicker name="appointmentdate" autocomplete="off" onchange="showDate(this.value,doc_id)" ></td></tr>
		
		<tr><td>Choose Time Slot:*</td><td><select name="slot" id=slot>
		<option value='-1'>Select Time</option>
		<!-- <option>Select time</option>
		<option value="6:00-6:15PM">6:00-6:15PM</option>
    	<option value="6:15-6:30PM">6:15-6:30PM</option>
    	<option value="6:30-6:45PM">6:30-6:45PM</option>
       	<option value="6:45-7:00PM">6:45-7:00PM</option>
    	<option value="7:00-7:15PM">7:00-7:15PM</option>
    	<option value="7:15-7:30PM">7:15-7:30PM</option>
    	<option value="7:30-7:45PM">7:30-7:45PM</option>
    	<option value="7:45-8:00PM">7:45-8:00PM</option>
 -->    
    </select></td></tr>
		
		
		<tr><td>Description     :*</td><td><textarea name="description" placeholder="Enter Your Health Status.." required="required"></textarea></td></tr>
		
		<tr><td><td><input type="submit" value="Submit"></td></tr>
		
	</table>
	<div style="position: absolute; bottom: 20x; background-color: red; text-align:right">
    * All fields are required.
    </div>
	</form>
	</div>
	</center>
	
	<br></div>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        