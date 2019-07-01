package daofiles;	
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import Classes.DoctorWrapper;

public class Doctordao {
	
	public static Boolean check(String email,String password)
	 {
			String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
			
		 try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn=DriverManager.getConnection(url,username,pass);
		 PreparedStatement st=conn.prepareStatement("select * from doctor where email=? and password=?");
		st.setString(1, email);
		st.setString(2, password);
		 ResultSet rs=st.executeQuery();
		 if(rs.next())
		 {
			 return true;
		 }
		 }
		 
		 catch(Exception e) {
		 
		 e.printStackTrace();
		 }
		 
		 return false;
	 }
	
	 public static int save(DoctorWrapper dw)
	 {  
	        int status=0;  

			String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
			String sql="insert into doctor (docname,email,password,speciality,contact,id) values(?,?,?,?,?,id);" ;

	        try{  
	        	 Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection(url,username,pass);
PreparedStatement ps=conn.prepareStatement(sql);  
ps.setString(1,dw.getDocname());
ps.setString(2,dw.getEmail());
ps.setString(3,dw.getPassword());              
ps.setString(4,dw.getSpeciality());  
ps.setString(5,dw.getContact());
status=ps.executeUpdate();  
	              
	            conn.close();
	        }catch(Exception ex)
	        {ex.printStackTrace();}  
	          
	        return status;  
	    }

	    public static int update(DoctorWrapper doc){  
	        int status=0; 
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try
	        {  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection conn=DriverManager.getConnection(url,username,pass); 
	            PreparedStatement ps=conn.prepareStatement(  
	                         "update doctor set docname=?,password=?,contact=? where email=?");  
	            ps.setString(1,doc.getDocname()); 
	            ps.setString(2,doc.getPassword());   
	            ps.setString(3,doc.getContact());
	            ps.setString(4,doc.getEmail());  
	            status=ps.executeUpdate();  
	              
	            conn.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }  
	    public static int delete(int id){  
	        int status=0; 
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try{  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection conn=DriverManager.getConnection(url,username,pass); 
	            PreparedStatement ps=conn.prepareStatement("delete from doctor where id=?");  
	            ps.setInt(1,id);  
	            status=ps.executeUpdate();  
	              
	            conn.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }  
	    public static DoctorWrapper getDoctor(int id,String email){  
	        DoctorWrapper dbe=new DoctorWrapper();  
	          
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try{  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection con=DriverManager.getConnection(url,username,pass); 
	            PreparedStatement ps=con.prepareStatement("select * from doctor where id=? and email=?");  
	            ps.setInt(1,id);  
	            ps.setString(2,email);
	            
	            ResultSet rs=ps.executeQuery();  
	            if(rs.next()){  
	              
	                dbe.setDocname(rs.getString(1));  
	                dbe.setEmail(rs.getString(2));  
	                dbe.setPassword(rs.getString(3));
	                dbe.setSpeciality(rs.getString(4));  
	                dbe.setContact(rs.getString(5));
	                dbe.setId(rs.getInt(6));  

	            }  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return dbe;  
	    }  
	    public static List<DoctorWrapper> getAllDoctors(){  
	        List<DoctorWrapper> list=new ArrayList<DoctorWrapper>();  
	          
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try{  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection con=DriverManager.getConnection(url,username,pass);  
	            PreparedStatement ps=con.prepareStatement("select * from doctor ");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                DoctorWrapper db=new DoctorWrapper();  
	               
	                db.setDocname(rs.getString(1));  
 	                db.setEmail(rs.getString(2));
   			        db.setPassword(rs.getString(3)); 	
	                db.setSpeciality(rs.getString(4));
    				db.setContact(rs.getString(5)); 
	                db.setId(rs.getInt(6));  

	                list.add(db);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }  
	    
	    
}

	
