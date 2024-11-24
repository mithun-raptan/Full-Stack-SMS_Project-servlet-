<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.dto.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all student page</title>
</head>
<body>

	<%
	//getting the object from session
	Admin admn = (Admin) session.getAttribute("admin");
	
	//getting the object from database
	AdminDao dao = new AdminDao();
	Admin admin = dao.findAdminBYEmail(admn.getEmail());

	if (admin != null) {
		List<Student> listofstudents = admin.getStudents();
	%>

	<table border="1px solid black" cellspacing="2px" cellpadding="2px"
		width="100%">
		<tr>
			<th>S_NO</th>
			<th>S_ID</th>
			<th>NAME</th>
			<th>EMAIL</th>
			<th>PASSWORD</th>
			<th>SUBJECTS</th>
			<th>UPDATE</th>
			<th>DELETE</th>
		</tr>

		<%
		int i = 1;
		for (Student s : listofstudents) {
		%>

		<tr>

			<td><%=i++%></td>
			<td><%=s.getId()%></td>
			<td><%=s.getName()%></td>
			<td><%=s.getEmail()%></td>
			<td><%=s.getPassword()%></td>
			<td><a href="subjectDashBoard.jsp?sid=<%=s.getId()%>"><button>All Subjects</button></a></td>
			<td><a href="updateStudent.jsp?sid=<%=s.getId()%>"><button>Update</button></a></td>
			<td><a href="deleteStudent?sid=<%=s.getId()%>"><button>Delete</button></a></td>


		</tr>

		<%
		}
		%>


	</table>
	
	<a href="addStudent.jsp"><button>Add Student</button></a><br><br><br>
	<a href="logout"><button>LOGOUT</button></a>



	<%
	} else {
		response.getWriter().print("<h1>admin login first</h1>");
		request.getRequestDispatcher("login.jsp").include(request, response);
	}
	%>





</body>
</html>