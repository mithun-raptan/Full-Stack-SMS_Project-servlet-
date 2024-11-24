package src.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SubjectDao;
import com.dto.Subject;

@WebServlet("/delete")
public class DeleteSubjectServlet extends HttpServlet{
	//delete?subid=<%=s.getId()
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int subid = Integer.parseInt(req.getParameter("subid"));
//		System.out.println("the id is "+subid);
		
		SubjectDao dao  = new SubjectDao();
		//find Subject object
		Subject subject = dao.findSubjectByID(subid);
		
		//will pass this sid as a parameter inside sendRedirect method
		int sid = subject.getStudent().getId();

		//delete Subject from database
		dao.deleteSubject(subject);
		
		
//		resp.sendRedirect("subjectDashBoard.jsp?sid=" + sid);
		resp.getWriter().print("<h1>one subject deleted successfully</h1>");
		req.getRequestDispatcher("subjectDashBoard.jsp?sid=" + sid).include(req, resp);
	
		
	}

}
