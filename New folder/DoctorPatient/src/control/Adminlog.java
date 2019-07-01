package control;

import java.io.IOException;

import java.io.PrintWriter;

import daofiles.Admindao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Adminlog
 */
@WebServlet("/AdminLogin")
public class Adminlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public  Adminlog() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub			
		PrintWriter out=response.getWriter();
		 response.setContentType("text/html");
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<title>AdminDocReg</title>");
	        out.println("</head>");
	        out.print("<body>");
	        String email=request.getParameter("email");  
	        String password=request.getParameter("password");  
	       
	        Admindao dao=new Admindao();    
	        if(dao.check(email,password))
	        {  
	           
	            out.println("Welcome"+email);
	            HttpSession session=request.getSession(true);
	            session.setAttribute("email",email);
	           
	            response.sendRedirect("AdminHome.jsp");
	        }  
	        else{  
	        	
	        	  RequestDispatcher rd=request.getRequestDispatcher("error.jsp");  
		            rd.forward(request,response);  
	        }  
	              
	        out.close(); 
	        
	        out.print("</body>");
	        out.print("</html>");
   }
}
	

