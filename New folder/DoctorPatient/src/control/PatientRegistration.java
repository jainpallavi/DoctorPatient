package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Classes.Patient;
import daofiles.Patientdao;

/**
 * Servlet implementation class PatientRegistration
 */
@WebServlet("/PatientRegistration")
public class PatientRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		   out.println("<html>");
		   out.println("<head>");
	       out.println("<title>Book Your Doctor</title>");
	       out.println("</head>");
	       out.print("<body>");
	       
			String name =request.getParameter("name");
			String dob=request.getParameter("dob");
			String address=request.getParameter("address");
			String gender=request.getParameter("gender");
			String contact =request.getParameter("contact");
			String email =request.getParameter("email");
			String password =request.getParameter("password");
			
			Patient pb=new Patient();
			pb.setName(name);
			pb.setDob(dob);
			pb.setAddress(address);
			pb.setGender(gender);
			pb.setContact(contact);
			pb.setEmail(email);
			pb.setPassword(password);
			
			  int status=Patientdao.save(pb);  
		        if(status>0){  
		            out.println("<h3>Registered successfully!</h3>");
		            out.print("<br>");
		            request.getRequestDispatcher("PatientLogin.jsp").include(request, response);  
		        }else{  
		        	RequestDispatcher rd=request.getRequestDispatcher("error.jsp");  
		        	rd.forward(request, response);
			        }  
		          
		        out.close();  
		    
			
			out.print("<br"
					+ "></body>");
			out.print("</html>");
		
	
  
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		   out.println("<html>");
		   out.println("<head>");
	       out.println("<title>Book your Dctor </title>");
	       out.println("</head>");
	       out.print("<body>");
	       
			String name =request.getParameter("name");
			String address=request.getParameter("address");
			String contact =request.getParameter("contact");
			String email =request.getParameter("email");
			String password =request.getParameter("password");
			
			Patient up=new Patient();
			up.setName(name);
			up.setAddress(address);
			up.setContact(contact);
			up.setEmail(email);
			up.setPassword(password);
			
			  int status=Patientdao.update(up);  
		        if(status>0){  
		            out.println("<center><h3>update successfully!</h3></center>");  
		            request.getRequestDispatcher("PatientUpdate.jsp").include(request, response);  
		        }else{  
		        	
		        	out.println("Sorry! unable to update record");  
		        }  
		          
		        out.close();  
		    
			
			out.print("<br></body>");
			out.print("</html>");
		
	
	}
}






