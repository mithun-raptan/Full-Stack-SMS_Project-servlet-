<%@page import="com.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add subject page</title>
</head>
<body>

		<%
		Admin admin=(Admin)session.getAttribute("admin");
		
		if(admin!=null){
		
			int studentid = Integer.parseInt(request.getParameter("studentid"));
			request.getSession().setAttribute("studentid", studentid);
		
		%>
		
		
	<form action="addSubject">
			
			<legend>Add Subject</legend>
			<fieldset>
			
			<label for="subjects">Select Subjects:</label><br>
        		<input type="checkbox" name="subjects" value="Java">Java 
       		 	<input type="checkbox" name="subjects" value="Jdbc">JDBC
        		<input type="checkbox" name="subjects" value="Hibernate">Hibernate
        		<input type="checkbox" name="subjects" value="Servlet">Servlet
        		<input type="checkbox" name="subjects" value="Web-Tech">Web-Tech<br><br>
			
			<button>ADD</button> 
			<button>CANCEL</button>
			
			
			
			
			</fieldset>
	
	
	</form>
	<%
	}else{
		response.getWriter().print("<h1>admin login first</h1>");
		request.getRequestDispatcher("login.jsp").include(request, response);
	
		
	}
		%>

</body>
</html>