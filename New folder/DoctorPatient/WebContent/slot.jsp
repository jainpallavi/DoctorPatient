<%-- <%@page import="java.sql.*"%>


   <%@page import ="java.util.ArrayList"%>
<%
ArrayList<String> slot=new ArrayList<String>();  
slot.add("6:00-6:15PM");
slot.add("6:15-6:30PM");
slot.add("6:30-6:45PM");
slot.add("6:45-7:00PM");
slot.add("7:00-7:15PM");
slot.add("7:15-7:30PM");
slot.add("7:30-7:45PM");
slot.add("7:45-8:00PM");

ArrayList<String> Appslot=new ArrayList<String>();  



String date=request.getParameter("count1");  
String docname=request.getParameter("count2");  
 String buffer="<select name='slot' ><option value='-1'>Select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorappointment","root","rat");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select slot from appointment where docname='"+docname+"' and appointmentdate='"+date+"'");  
   while(rs.next()){
	   
	   
	   Appslot.add(rs.getString("slot"));

 
   }  
   
   for(int i=0;i<slot.size();i++)
   {
	   if(!Appslot.contains(slot.get(i)))
			   {
		 
		  
	buffer=buffer+"<option value='"+slot.get(i)+"'>"+slot.get(i)+"</option>";
		  
		  
			   }
   }


 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %> --%>



<%-- <%@page import="java.sql.*"%>
<%@page import ="java.util.ArrayList"%>
<%
ArrayList<String> slot=new ArrayList<String>();  
slot.add("6:00-6:15PM");
slot.add("6:15-6:30PM");
slot.add("6:30-6:45PM");
slot.add("6:45-7:00PM");
slot.add("7:00-7:15PM");
slot.add("7:15-7:30PM");
slot.add("7:30-7:45PM");
slot.add("7:45-8:00PM");

ArrayList<String> Appslot=new ArrayList<String>();  


String time=request.getParameter("count");  
 String buffer="<select name='slot' ><option value='-1'>Select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorappointment","root","rat");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from appointment where slot='"+time+"'");  
   while(rs.next())
   {
   buffer=buffer+"<option value='"+Appslot.add(rs.getString("slot"))+"'>"+Appslot.add(rs.getString("slot"))+"</option>";  
   }  
   for(int i=0;i<slot.size();i++)
   {
	   if(!Appslot.contains(slot.get(i)))
			   {
		 
		  
	buffer=buffer+"<option value='"+slot.get(i)+"'>"+slot.get(i)+"</option>";
		  
		  
			   }
   }
 buffer=buffer+"</select>";  
 
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %> --%>

<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<String> slot = new ArrayList<String>();
	slot.add("6:00-6:15PM");
	slot.add("6:15-6:30PM");
	slot.add("6:30-7:00PM");
	slot.add("7:00-7:30PM");
	slot.add("7:30-7:45PM");
	slot.add("7:45-8:00PM");
	//slot.add("7:30-7:45PM");
	//slot.add("7:45-8:00PM");
	ArrayList<String> Appslot = new ArrayList<String>();
	ArrayList<String> availableSlot = new ArrayList<String>();

	String date=request.getParameter("count");  
	String doc_id=request.getParameter("count1").split(";")[0];
	String buffer = "<select name='slot' ><option value='-1'>Select</option>";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorappointment", "root",
				"rat");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("Select distinct slot from appointment where appointmentdate='"+date+"'and d_id='"+doc_id+"'");
		//ResultSet rs1 = stmt.executeQuery("Select distinct slot from appointment where docname='"+docname+"'");  

		while (rs.next()) {
			Appslot.add(rs.getString("slot"));
			// Appslot.add(rs1.getString("slot"));

		}
		
		for (int i = 0; i < slot.size(); i++) {
			System.out.print(slot.get(i));
			System.out.print(Appslot.contains(slot.get(i)));
			//buffer = buffer + "<option value='" + slot.get(i) + "'>" + slot.get(i) + " - "+Appslot.contains(slot.get(i)) + "</option>";
			if (!Appslot.contains(slot.get(i))) {
				availableSlot.add(slot.get(i));
			}
		}
				
		for (String s : availableSlot) {
			buffer = buffer + "<option value='" + s + "'>" + s + "</option>";
		}
		buffer = buffer + "</select>";

		response.getWriter().println(buffer);
	 
	}catch (Exception e) {
		System.out.println(e);
	}
%>
