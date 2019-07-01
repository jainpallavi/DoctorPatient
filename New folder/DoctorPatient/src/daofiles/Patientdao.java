package daofiles;	
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import Classes.Patient;

public class Patientdao 
{
	
	public static Boolean check(String email,String password)
	 {
			String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
			
		 try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn=DriverManager.getConnection(url,username,pass);
		 PreparedStatement st=conn.prepareStatement("select * from patient where email=? and password=?");
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
	
	 public static int save(Patient pb)
	 {
	 int status=0;
	 String username = "root";
		String pass = "rat";
		String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
		
		 try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn=DriverManager.getConnection(url,username,pass);
			PreparedStatement ps=conn.prepareStatement("insert into patient(P_id,name,dob,address,gender,contact,email,password) values(P_id,?,?,?,?,?,?,?)");
		
	        ps.setString(1,pb.getName());
	        ps.setString(2,pb.getDob());
	        ps.setString(3,pb.getAddress());          
	        ps.setString(4,pb.getGender());  
	        ps.setString(5,pb.getContact());
	        ps.setString(6,pb.getEmail());
	        ps.setString(7,pb.getPassword());   
	          
	        status=ps.executeUpdate();  
	          
	        conn.close();  
			}
		catch(Exception e)	{
			e.printStackTrace();
		}
		return status;
	 }
		
		public static Patient getPatient(int id,String email){  
	        Patient p=new Patient();  
	          
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try{  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection con=DriverManager.getConnection(url,username,pass); 
	            PreparedStatement ps=con.prepareStatement("select * from patient where P_id=? and email=?");  
	            ps.setInt(1,id);  
	            ps.setString(2,email);
	            ResultSet rs=ps.executeQuery();  
	            if(rs.next()){  
	            	p.setId(rs.getInt(1));  
	                p.setName(rs.getString(2));  
	                p.setDob(rs.getString(3));  
	                p.setAddress(rs.getString(4));
	                p.setGender(rs.getString(5));  
	                p.setContact(rs.getString(6));
	                p.setEmail(rs.getString(7));
	                p.setPassword(rs.getString(8));
	                

	            }  
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return p;  
	    }  
	    public static List<Patient> getAllPatient(){  
	        List<Patient> list1=new ArrayList<Patient>();  
	          
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
	        try{  
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection con=DriverManager.getConnection(url,username,pass);  
	            PreparedStatement ps=con.prepareStatement("select * from patient ORDER BY P_id");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Patient db=new Patient();  
	               
	                db.setId(rs.getInt(1));  
	                db.setName(rs.getString(2));  
	                db.setDob(rs.getString(3));  
	                db.setAddress(rs.getString(4));
	                db.setGender(rs.getString(5));  
	                db.setContact(rs.getString(6));
	                db.setEmail(rs.getString(7));
	                db.setPassword(rs.getString(8));

	                list1.add(db);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list1;  
	    }
	    
	    
	    public static int update(Patient up){  
	        int status=0;  
	        String username = "root";
			String pass = "rat";
			String url = "jdbc:mysql://localhost:3306/doctorappointment"; 
			
		 try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection(url,username,pass);  
	            PreparedStatement ups=con.prepareStatement(  
	                         "update patient set name=?,address=?,contact=?,password=? where email=?");  
	            ups.setString(1,up.getName()); 
	            ups.setString(2,up.getAddress());
	            ups.setString(3,up.getContact()); 
	            ups.setString(4,up.getPassword()); 
	            ups.setString(5,up.getEmail());
	            
	            status=ups.executeUpdate();  
	              
	            con.close();  
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
	            PreparedStatement ps=conn.prepareStatement("delete from patient where P_id=?");  
	            ps.setInt(1,id);  
	            status=ps.executeUpdate();  
	              
	            conn.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }  
	    
	}

	    