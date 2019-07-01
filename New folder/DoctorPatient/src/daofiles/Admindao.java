package daofiles;
import java.sql.*;
import java.sql.DriverManager;
public class Admindao 
 
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
	 PreparedStatement st=conn.prepareStatement("select * from adminlogin where email=? and password=?");
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
 
}
