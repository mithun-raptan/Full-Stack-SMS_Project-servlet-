package src.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdminDao;
import com.dto.Admin;
@WebServlet("/adminsignup")
public class AdminSignupServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//adminsignup?name=Mithun&email=m%40g.com&pass=1234
		
		String name= req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("pass");
		 
		//need Admin class object to set the value
		Admin admin = new Admin();
		admin.setName(name);
		admin.setEmail(email);
		admin.setPassword(password);
		
		//storing admin email into session
//		req.getSession().setAttribute("admin", admin);
		
		//store the admin object into database
		AdminDao dao = new AdminDao();
		dao.saveAdminObject(admin);
		
		//resp.getWriter().print("<h1>admin signup successfull</h1>");
		//req.getRequestDispatcher("login.jsp").include(req, resp);
		req.setAttribute("isSignUp", true);
		req.getRequestDispatcher("login.jsp").include(req, resp);
		
		
		
	}
	

}
