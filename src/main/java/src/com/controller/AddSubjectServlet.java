package src.com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;

import com.dto.Student;
import com.dto.Subject;

@WebServlet("/addSubject")
public class AddSubjectServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		int studentid=(int)req.getSession().getAttribute("studentid");
//		System.out.println("the student id comming from addstudent.jsp "+studentid);
		String[] listofsubject=req.getParameterValues("subjects");
		
		StudentDao dao = new StudentDao();
		Student student = dao.findStudentById(studentid);
		

		List<Subject> subjectlist = new ArrayList<Subject>();
		
		for(String subjectname: listofsubject) {
			Subject subject = new Subject();
			subject.setName(subjectname);
			//mapping student into subject
			subject.setStudent(student);
			
			subjectlist.add(subject);
		}
		
		//mapping student and subjects
		student.setSubjects(subjectlist);
		
		//store it into database(means newly added subject)
		dao.addSubject(student); //i am passing student object and if i merge student object automatically all the subjects will be merged or updated into db (subject table)
								//i used cascade in student table so thats why it is working finely
		
		resp.getWriter().print("<h1>subject added successfully</h1>");
		req.getRequestDispatcher("subjectDashBoard.jsp?sid="+studentid).include(req, resp);
		
		
		
		
	}

}
