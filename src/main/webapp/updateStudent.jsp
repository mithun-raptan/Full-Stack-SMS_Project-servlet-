<%@page import="com.dao.StudentDao"%>
<%@page import="com.dto.Admin"%>
<%@page import="com.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update student page</title>
</head>
<body>
	<%  
	 
	Admin admin = (Admin)session.getAttribute("admin");
	
	if(admin!=null){
	
	int sid = Integer.parseInt(request.getParameter("sid"));
	StudentDao dao = new StudentDao();
	Student student = dao.findStudentById(sid);
	%>

	<form action="update">
		<legend>update student</legend>
		<fieldset>
			id: <input type="text" name="id" value="<%=student.getId()%>" readonly="readonly">
			name: <input type="text" name="name"  value="<%=student.getName()%>" ><br> <br>
			email: <input type="email" name="email"  value="<%=student.getEmail()%>"><br> <br>
			password: <input type="password" name="pass"  value="<%=student.getPassword()%>"><br> <br>

			<button>update</button>
			<button>cancel</button>
		</fieldset>
	</form>
	
	<a href="logout"><button>LOGOUT</button></a>

	<%
	}else{
		response.getWriter().print("<h1>admin login first</h1>");
		request.getRequestDispatcher("login.jsp").include(request, response);
	}
	
	%>

</body>
</html>