package src.com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdminDao;
import com.dao.StudentDao;
import com.dao.SubjectDao;
import com.dto.Admin;
import com.dto.Student;
import com.dto.Subject;

@WebServlet("/addstudent")
public class AddStudentServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch the value coming from addstudent.jsp
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("pass");
		String[] subjectArray=req.getParameterValues("subjects");
		
		
		//fetch the admin object from session
		Admin admin = (Admin)req.getSession().getAttribute("admin");
		
		//now get the admin object from database
		AdminDao dao = new AdminDao();
		Admin admin1 = dao.findAdminBYEmail(admin.getEmail());
		
		//store the data into student object
		Student student  = new Student();
		student.setName(name);
		student.setEmail(email);
		student.setPassword(password);
		
		///////////////
		//creating one empty list
		List<Subject> subjectList = new ArrayList<Subject>();
		if(subjectArray!=null) {
			for(String subjectName: subjectArray) {
				//creating subject object and setting the subject name
				Subject subject = new Subject();
				subject.setName(subjectName);
				
				//mapping--> setting student into each subject
				subject.setStudent(student);
				
				//adding to the list
				subjectList.add(subject);
			}
		}
		
		
		
		//mapping
		student.setAdmin(admin1);
		admin1.setStudents(Arrays.asList(student));
		
		//setting Subjects into Student
		student.setSubjects(subjectList);
		
		
		
		//store object into database
		dao.mergeAdminObject(admin1); //merge because already admin record is there at the time of sign up, 
										//now we are adding students into it thats why
		StudentDao dao1 = new StudentDao();
		dao1.saveStudent(student);
		

		
		resp.getWriter().print("<h1>student added successfully</h1>");
		req.getRequestDispatcher("allStudent.jsp").include(req, resp);
		

		
		
		
		
		
		
	}
	
	

}
