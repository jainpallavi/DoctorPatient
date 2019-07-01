package daofiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Classes.Appointment;
import Classes.Patient;

public class AppointmentDao {
		
	 public static int save(Appointment ab)
	 {
	 String username = "root";
		String pass = "rat";
		String url = "jdbc:mysql://localhost:3306/doctorappointment"; {  
	        int status=0;  
	        try{  
	        	 Class.forName("com.mysql.jdbc.Driver");
                 Connection con=DriverManager.getConnection(url,username,pass);  		//	Sequence = appoint 
	            PreparedStatement ps=con.prepareStatement(  				//Table =appointment
	                         "insert into appointment(ap_id,name,email,contact,age,appointmentdate,speciality,description,docname,slot,d_id) values(ap_id,?,?,?,?,?,?,?,?,?,?)");  
	            
	            ps.setString(1,ab.getName()); 
	            ps.setString(2,ab.getEmail());
	            ps.setString(3,ab.getContact());
	            ps.setInt(4, ab.getAge());
	            ps.setString(5, ab.getDay());
	            ps.setString(6,ab.getSpeciality());  
	            ps.setString(7,ab.getDescription());
	            ps.setString(8, ab.getDocname());
	            ps.setString(9, ab.getSlot());
	            ps.setString(10, ab.getDocid());
	            
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception ex)
	        {ex.printStackTrace();}  
	          
	        return status;  
	    } 
	 }
	 public static ArrayList<Appointment> getAppointmentbyemail(String email)
	 {
		 String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment";
	 	ArrayList<Appointment> list=new ArrayList<Appointment>();
	 	try{  
       	 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(url,username,pass);
	 		PreparedStatement ps=con.prepareStatement("select * from appointment where email=? order by appointmentdate");
	 		ps.setString(1,email);
	 		ResultSet rs=ps.executeQuery();
	 		while (rs.next()) {
	 			Appointment ap=new Appointment();
	 				ap.setApid(rs.getInt(1));
	 			  	ap.setName(rs.getString(2));  
	                ap.setEmail(rs.getString(3));  
	                ap.setContact(rs.getString(4));
	                ap.setAge(rs.getInt(5));
	                ap.setDay(rs.getString(6));
	                ap.setSpeciality(rs.getString(7));
	                ap.setDescription(rs.getString(8));
	                ap.setDocname(rs.getString(9));
	                ap.setSlot(rs.getString(10));

	 			list.add(ap);
	 		}
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
	 	return list;
	 }

	
	 
	 public static ArrayList<Appointment> getAppointById(int ap)
	 {
	 	ArrayList<Appointment> list=new ArrayList<>();
	 	String username = "root";
		String pass = "rat";
		String url = "jdbc:mysql://localhost:3306/doctorappointment";
		try{  
	       	 Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,username,pass);
	 		PreparedStatement ps=con.prepareStatement("select * from appointment where ap_id=? order by appointmentdate");
	 		ps.setInt(1,ap);
	 		ResultSet rs=ps.executeQuery();
	 		while (rs.next()) {
	 			Appointment app=new Appointment();
	 				app.setApid(rs.getInt(1));
	 			  	app.setName(rs.getString(2));  
	                app.setEmail(rs.getString(3));  
	                app.setContact(rs.getString(4));
	                app.setAge(rs.getInt(5));
	                app.setDay(rs.getString(6));
	                app.setSpeciality(rs.getString(7));
	                app.setDescription(rs.getString(8));
	                app.setDocname(rs.getString(9));
	                app.setSlot(rs.getString(10));
	         
	                
	 			list.add(app);
	 		}
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
	 	return list;
	 }
	  public static int cancel(int apid){  
	        int status=0;  
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment";
	        try{  
	          	 Class.forName("com.mysql.jdbc.Driver");
	   Connection con=DriverManager.getConnection(url,username,pass);
	            PreparedStatement ps=con.prepareStatement("delete from appointment where ap_id=?");  
	            ps.setInt(1,apid);  
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }
	  
	   public static List<Appointment> getAllAppointments(){  
	        List<Appointment> list=new ArrayList<Appointment>();  
	          
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try{  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection con=DriverManager.getConnection(url,username,pass);  
	            PreparedStatement ps=con.prepareStatement("select * from appointment ORDER BY ap_id");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Appointment db=new Appointment();  
	               
	                 
	                
	                db.setApid(rs.getInt(1));
	 			  	db.setName(rs.getString(2));  
	                db.setEmail(rs.getString(3));  
	                db.setContact(rs.getString(4));
	                db.setAge(rs.getInt(5));
	                db.setDay(rs.getString(6));
	                db.setSpeciality(rs.getString(7));
	                db.setDescription(rs.getString(8));
	                db.setDocname(rs.getString(9));
	                db.setSlot(rs.getString(10));
		 			list.add(db);

	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }

}
