<%@page import="com.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminDashBoard page</title>

<style>


			p{
			
				position:fixed;
				text-align: center;
				bottom: 100px;
				left:78%;
				color:green;
				font-size:22px; 
			
			}
			
			h1{
					 text-align: center; 
					 position:relative;
					 margin:0px;          
   					 top: 22px;                   
    				 font-size: 30px;              
  					  
			}
			#logout{
					position: fixed;
					top: 40px;
					right:5%;
			}
			button{
			
					margin: 10px;
					top:300px;
					
			}




</style>

</head>
<body>
	<%
	Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); 
	
	Admin admin=(Admin)session.getAttribute("admin");
	
	if(admin!=null){
		
	%>
	
		<%
			if(loginSuccess==true){
		%>	
				
				<p id="loginmsgdiv">admin  <%=admin.getName() %> succesfully login</p>
				
				<h1>Welcome <%=admin.getName() %></h1>
				
		<%} %>
	
	
		<a href="allStudent.jsp" ><button>Find All Student</button></a>
		<a href="addStudent.jsp"><button>Add Student</button></a><br><br><br>
		<a href="AdminSignup.jsp"><button>Create New Admin</button></a><br><br><br>
		<a href="logout"><button id="logout">LOGOUT</button></a>
			
	
	<%
	}else{
		request.getRequestDispatcher("login.jsp");
	} 
	%>
	
	
	
	
	<script>
	
	const p = document.querySelector('#loginmsgdiv');
	
	 setTimeout(() => {
         p.style.display = "none";  // Hide the div by setting display to "none"
		 //console.log("Delayed for 3 second.");
     }, 3000); 
	
	
	</script>

</body>
</html>