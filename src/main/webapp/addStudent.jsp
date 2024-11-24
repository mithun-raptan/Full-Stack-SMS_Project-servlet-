<%@page import="com.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add student page</title>
</head>
<body>
	<%
	Admin admin=(Admin)session.getAttribute("admin");
	
	if(admin!=null){
		
	%>
	<form action="addstudent">
		<legend>add student form</legend>
		<fieldset>
			<label for="">Name: </label> <input type="text" name="name" id=""><br><br>
			<label for="">Email: </label> <input type="text" name="email" id=""><br><br>
			<label for="">Password: </label> <input type="text" name="pass" id=""><br><br>
			<label for="subjects">Select Subjects:</label><br>
        		<input type="checkbox" name="subjects" value="Java">Java 
       		 	<input type="checkbox" name="subjects" value="Jdbc">JDBC
        		<input type="checkbox" name="subjects" value="Hibernate">Hibernate
        		<input type="checkbox" name="subjects" value="Servlet">Servlet
        		<input type="checkbox" name="subjects" value="Web-Tech">Web-Tech<br><br>
			
			

			<button>submit</button>
			<button>cancel</button><br><br>


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