<%@page import="com.dao.StudentDao"%>
<%@page import="com.dto.Subject"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.Student"%>
<%@page import="com.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject Dashboard page</title>
</head>
<body>
	<%
	Admin admin = (Admin) session.getAttribute("admin");
	if(admin!=null){
		int id = Integer.parseInt(request.getParameter("sid"));
		//find Student object by id
		StudentDao dao = new StudentDao();
		Student student = dao.findStudentById(id);
		List<Subject> listofsubjects=student.getSubjects();
		
		
	%>
	
	<table border="1px solid black" cellspacing="2px" cellpadding="2px" width="100%">
	
		<tr>
		
			<th>S_NO</th>
			<th>SUBJECT_ID</th>
			<th>SUBJECT_NAME</th>
			<th>DELETE</th>
		
		</tr>
		<%
		int i = 1;
		for(Subject s: listofsubjects){
		%>
		
		<tr>
		<td><%=i++%></td>
		<td><%=s.getId()%></td>
		<td><%=s.getName()%></td>
		<td><a href="delete?subid=<%=s.getId()%>"><button>Delete</button></a></td>
		
		</tr>
		
		
		<%
			} 
		%>
	
	
	</table><br><br>
	
	<a href="addSubject.jsp?studentid=<%=student.getId()%>"><button>Add Subject</button></a> <br><br>
	<a href="allStudent.jsp"><button>GO Back</button></a>
	<a href="logout"><button>LOGOUT</button></a>
	
	<%
	
	
		}else{
			response.getWriter().print("<h1>Admin login first<h1/>");
			request.getRequestDispatcher("login.jsp").include(request, response);
			
		}
	%>

</body>
</html>