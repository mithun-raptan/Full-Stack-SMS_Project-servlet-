package src.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dto.Student;

@WebServlet("/update")
public class UpdateStudentServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("pass");
			
			StudentDao dao = new StudentDao();
			Student student = dao.findStudentById(id);
			student.setName(name);
			student.setEmail(email);
			student.setPassword(password);
			
			//update it into database
			dao.updateStudent(student);
			
			resp.getWriter().print("<h1>"+student.getId()+" updated successfully </h1>");
			req.getRequestDispatcher("allStudent.jsp").include(req, resp);
			
			
			
			
		}
}
