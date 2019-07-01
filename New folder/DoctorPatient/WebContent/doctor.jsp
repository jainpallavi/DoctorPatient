 <%@page import="java.sql.*"%>
<%
String speciality=request.getParameter("count");  
 String buffer="<select name='docname' ><option value='-1'>Select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorappointment","root","rat");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from doctor where speciality='"+speciality+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString("id")+";"+rs.getString("docname")+"'>"+rs.getString("docname")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>