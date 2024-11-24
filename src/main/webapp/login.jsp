<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login Form</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f0f4f8;
	display: flex;
	flex-direction: column; justify-content : center;
	align-items: center;
	height: 100vh;
	margin: 0;
	justify-content: center;
}

form {
	background-color: #ffffff;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
	width: 300px;
}

legend {
	font-size: 1.5em;
	color: #4a90e2;
	text-align: center;
}

fieldset {
	border: none;
}

input[type="email"], input[type="password"] {
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border-radius: 5px;
	border: 1px solid #ddd;
	box-sizing: border-box;
	margin-bottom: 0px;
}

input:focus {
	border-color: #4a90e2;
	outline: none;
	box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
}

button {
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	background-color: #4a90e2;
	color: white;
	font-size: 1em;
}

button:hover {
	background-color: #357abd;
}

p {
	margin-top: 1px;
	color: red;
	text-align: center;
	font-size: 14px;
	margin-bottom: 0px;
}

h3 {
	color: green;
}
</style>

</head>
<body>
					
	<%
					//sign up successfull part			
	
	Boolean isSignUp = (Boolean) request.getAttribute("isSignUp"); //Boolean-->wrapper class --> i used this just to handle incase the values come as "null"
	if (isSignUp != null && isSignUp) { // i can use "boolean" also--but in this cse if value come as "null" it'll throw an exception
	%>

	<h3>Sign-Up Successfull.</h3>
	<%
	}
	%>



	<%
					//logout part (one alert mesage come)
	
        // Check if the "alertMessage" attribute is set in the request
        String alertMessage = (String) request.getAttribute("alertMessage");
        if (alertMessage != null) {
    %>
       <script>
            // Show the alert after the page loads
            function showAlert(message) {
                if (message) {
                    alert(message);  // Display the alert with the message
                }
            }

            // Call the function with the message
            showAlert("<%= alertMessage %>");
        </script>
    <%
        }
    %>





	<form action="Adminlogin" id="loginForm">
		<legend>Admin login</legend>
		<fieldset>
			Email: <input type="email" name="email"><br>
			<%
						//email not correct part
			
			Boolean isnotcorrectemail = (Boolean) request.getAttribute("isnotcorrectemail"); //Boolean-->wrapper class --> i used this just to handle incase the values come as "null"
			if (isnotcorrectemail != null && isnotcorrectemail) { // i can use "boolean" also--but in this cse if value come as "null" it'll throw an exception
			%>

			<p>Please Enter Valid Email</p>
			<%
			}
			%>
			<br> Password: <input type="password" name="pass">
			<%
						//password not correct part
			
			Boolean message = (Boolean) request.getAttribute("message"); //Boolean-->wrapper class --> i used this just to handle incase the values come as "null"
			if (message != null && message) { // i can use "boolean" also--but in this cse if value come as "null" it'll throw an exception
			%>

			<p>Password Incorrect. Please try again...</p>
			<%
			}
			%>
			<br>
			<button type="submit">Submit</button>
			<button type="button" id="cancelBtn">Cancel</button>

		</fieldset>
	</form>

	<script>
		// JavaScript for Cancel button to clear the form
		document.getElementById('cancelBtn').addEventListener('click',
				function() {
					document.getElementById('loginForm').reset();
				});

		// JavaScript to add validation before form submission
		document
				.getElementById('loginForm')
				.addEventListener(
						'submit',
						function(event) {
							let email = document
									.querySelector('input[name="email"]').value;
							let password = document
									.querySelector('input[name="pass"]').value;

							if (!email || !password) {
								alert('Both fields are required!');
								event.preventDefault();
							}
						});
	</script>

</body>
</html>


