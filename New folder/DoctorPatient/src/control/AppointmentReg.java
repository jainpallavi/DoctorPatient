package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daofiles.AppointmentDao;
import Classes.Appointment;

/**
 * Servlet implementation class AppointmentReg
 */
@WebServlet("/AppointmentReg")
public class AppointmentReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentReg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		   out.println("<html>");
		   out.println("<head>");
	       out.println("<title>Book Appointment</title>");
	       out.println("</head>");
	       out.print("<body>");  	
	  	       
			String name =request.getParameter("name");
			String email=request.getParameter("email");
			String contact =request.getParameter("contact");
			int age=Integer.parseInt(request.getParameter("age"));
			String appointmentdate=request.getParameter("appointmentdate");
			String speciality =request.getParameter("speciality");
			String description=request.getParameter("description");
			String docname=request.getParameter("docname");
			String slot=request.getParameter("slot");
			
			
			String[] idAndName = docname.split(";");
			String doc_id=idAndName[0];
			docname = idAndName[1];
			Appointment ab =new Appointment();
			ab.setName(name);
			ab.setEmail(email);
			ab.setContact(contact);
			ab.setAge(age);
			ab.setDay(appointmentdate);
			ab.setSpeciality(speciality);
			ab.setDescription(description);
			ab.setDocname(docname);
			ab.setSlot(slot);
			ab.setDocid(doc_id);
			
		    int status=AppointmentDao.save(ab);  
		        if(status>0){  
		            request.getRequestDispatcher("ViewAppointment.jsp").forward(request, response);  
		        }else{  
		            out.println("Sorry! unable to save record");  
		        }  
		          
		        out.close();  
		    			
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
