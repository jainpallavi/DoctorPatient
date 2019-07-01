package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.oracle.webservices.internal.api.EnvelopeStyle.Style;

import daofiles.AppointmentDao;
import daofiles.Doctordao;
import Classes.Appointment;
import Classes.DoctorWrapper;

/**
 * Servlet implementation class AppCheck
 */
@WebServlet("/AppCheck")
public class AppCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		   out.println("<html>");
		   out.println("<head><title>My Appointments</title></head>");
	       out.print("<body bgcolor='#ADD8E6'>");
	      
	     response.setContentType("text/html");
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
         response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
         response.setHeader("Expires", "0");  	//	Proxies 	
         
					HttpSession session=request.getSession(true);
		            		           
			       if(session.getAttribute("email")==null){
 					response.sendRedirect("DoctorLogin.jsp");
 					}
 			       else if(session!=null)	{
 					String email=(String) session.getAttribute("email");
 					out.println("Hello ,  "+email);
 					}
		
		  
	       String email=(String) session.getAttribute("email");
	       int id=Integer.parseInt(request.getParameter("id"));
	       out.print("<center> <h1 style='background-color:lightgreen' >My Appointments</h1>");
	       out.print("<table border='1px solid black' height='10%' width='70%'><tr>");
	       out.print("<th style='background-color:#2874A6', text-color:'red'>Patient Name</th>	<th style='background-color:#2874A6'>Email</th> 	<th style='background-color:#2874A6'>Contact</th>");
	       out.print("<th style='background-color:#2874A6'>Age</th> 	<th style='background-color:#2874A6'>Date</th>" );		//<th style='background-color:#2874A6'>Specialty</th>");
	       out.print("<th style='background-color:#2874A6'>Description</th>   <th style='background-color:#2874A6'>Slot</th></tr>");
	       
	       DoctorWrapper dbe = Doctordao.getDoctor(id,email);
	       if(id==dbe.getId()||email==dbe.getEmail())	{
	       ArrayList<Appointment> list=AppointmentDao.getAppointById(id);
	       for (Appointment apps : list) {
	    	   out.print("<tr style='background-color:white'><td>"+apps.getName()+"</td><td>"+apps.getEmail()+"</td>");
		       out.print("<td>"+apps.getContact()+"</td><td>"+apps.getAge()+"</td>");
		       out.print("<td>"+apps.getDay()+"</td><td>"+apps.getSpeciality() +"</td>");
		       out.print("<td>"+apps.getDescription()+"</td>");
		       out.print("<td>"+apps.getSlot()+"</td>");}
		       //out.print("<td><a href='CancelAppointment?id="+apps.getApid()+"'>Cancel</a></td></tr>");
	       } 
	       else	{
	    	   out.print("<h3> Please Enter your Correct Id </h3>");
	       }
		   out.print("</table>");
		  
		   out.print("</div></center>");
		  
	       out.print("</body>");
	   	   out.print("</html>");
	   	
	   	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
