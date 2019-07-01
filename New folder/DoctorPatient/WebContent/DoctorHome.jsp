<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="daofiles.Doctordao,daofiles.AppointmentDao,Classes.*,java.util.ArrayList"%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DoctorHome</title>

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
    	height: 40px;
    	color: yellow;
    	background-color: #9C9E9E;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
	color:yellow;
	}
	
	.container th {
	width: 140px;
	height: 25px;
	font-size: 20px
	}
	.container td	{
  		   		text-align: center;
  		   		font-size:20px ;
  		   }
  	.container input[type="number"] {
	width: 300px;
	height: 35px;
}
  		   
  	.container input[type="submit"] {
	width: 300px;
	border-radius:30px;
	height: 35px;
	border-bottom: 2px solid black;
	}	   
	.welcome	{
  		display: inline-block;
    	float: right;
       	width: 50%;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
       }
</style>
</head>
<body bgcolor="#ee82ee">
	<jsp:include page="header.jsp" />
		
	
	<br>
	<div class="container">
<ul>
<a href="DoctorHome.jsp"> <li class="roundbox">My Appointment</li></a>
<a href="DoctorUpdate.jsp"> <li class="roundbox">Update Profile</li></a>

<a href="logout.jsp"><li class="roundbox">Logout</li></a>
 <li class="welcome"><marquee>
		<%  
                    if(session.getAttribute("email")==null)
                    {
 					response.sendRedirect("DoctorLogin.jsp");
 					}
 			        else if(session!=null)	
 			        {
 					String email=(String) session.getAttribute("email");
 					out.println("Hello ,  "+email);
 					}
		%>
		</marquee></li> 
		</ul>
		<center>
		<table border="1px solid black">
			<tr>
				<th>Patient Name</th>
				<th>Email</th>
				<th>Contact</th>
	       		<th>Age</th>
	       		<th>AppointmentDate</th>
	            <th>Description</th>
	       		<th>slot</th>
	        </tr>
		<%	
			try
					{
				int doid=0;
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost/doctorappointment";
					String username="root";
					String password="rat";
					String Email=(String)session.getAttribute("email");
					String query="select * from doctor where email=?";
					Connection conn=DriverManager.getConnection(url,username,password);
					PreparedStatement st=conn.prepareCall(query);
					st.setString(1,Email);
					ResultSet rs=st.executeQuery();
					while(rs.next())
					{		
					%> 
	               
	                <%
	       			doid =rs.getInt("id");
	               
	       			
					}
					%>
<%        			
  String sql="select appointment.name,appointment.email,appointment.contact,appointment.age,appointment.appointmentdate,appointment.description,appointment.slot from appointment inner join doctor on appointment.d_id=doctor.id where d_id="+doid+"";
 // PreparedStatement stmt1=conn.prepareCall(sql);
  //stmt1.setInt(0,doid);
Statement stmt1=conn.createStatement();
ResultSet rs1=stmt1.executeQuery(sql);
  //ResultSet rs1=stmt1.executeQuery();
		
				
					
			while(rs1.next())
			{
	%>
	       	<tr>
			<td><%=rs1.getString("name")%></td>
			<td><%=rs1.getString("email") %></td>
			<td><%=rs1.getString("contact")%></td>
			<td><%=rs1.getInt("age")%></td>
			<td><%=rs1.getString("appointmentdate")%></td>
			<td><%=rs1.getString("description")%></td>
		    <td><%=rs1.getString("slot")%></td>
		<%			
		    }
	    %>
 		</tr>  
		</table>
		</center>
	    <%
							    rs.close();
		 						rs1.close();	
							    st.close();
							    stmt1.close();
							    conn.close();
							    }
							    catch(Exception e)
							    {
							    e.printStackTrace();
							    }
				%>
	
	
	
		
</div>
</body>
</html>


