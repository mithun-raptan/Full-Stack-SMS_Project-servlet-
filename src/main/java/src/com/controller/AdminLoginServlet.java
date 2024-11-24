package src.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdminDao;
import com.dto.Admin;

@WebServlet("/Adminlogin")
public class AdminLoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			//login?email=m%40g.com&pass=1234
		
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
			
			//find the admin using email from database
			AdminDao dao = new AdminDao();
			Admin admin = dao.findAdminBYEmail(email);
			
			
			
			//here we should write the logic to validate
			
			if(admin!=null) {
				if(admin.getPassword().equals(pass)) {
					//store admin object into session 
					req.getSession().setAttribute("admin", admin);
					req.setAttribute("loginSuccess", true);
					req.getRequestDispatcher("AdminDashBoard.jsp").include(req, resp);
				}
				else {
					req.setAttribute("message", true);
					req.getRequestDispatcher("login.jsp").include(req, resp);
					}
				
			}
			else {
				//resp.getWriter().print("<h1> sign-up first</h1>");
				//req.getRequestDispatcher("AdminSignup.jsp").include(req, resp);
				
				req.setAttribute("isnotcorrectemail", true);
				req.getRequestDispatcher("login.jsp").include(req, resp);
				
			}
			
			
		
		
		
		
	}

}
