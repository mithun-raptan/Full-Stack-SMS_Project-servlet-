package src.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dto.Student;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("sid"));
		
		StudentDao dao = new StudentDao();
		//find student object through id
		Student student = dao.findStudentById(id);
		
		dao.deleteStudentById(student);
		
		resp.getWriter().print("<h1>"+student.getId()+" deleted successfully </h1>");
		req.getRequestDispatcher("allStudent.jsp").include(req, resp);
	}

}
