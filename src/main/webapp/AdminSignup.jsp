<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Signup Page</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        form legend {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        fieldset {
            border: none;
        }

        label {
            font-size: 1rem;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }

        button.cancel {
            background-color: #6c757d;
        }

        button.cancel:hover {
            background-color: #5a6268;
        }

        p {
            text-align: center;
            margin-top: 10px;
        }

        p a {
            color: #007bff;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            form {
                padding: 20px;
            }

            legend {
                font-size: 1.2rem;
            }

            button {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

    <form action="adminsignup" id="loginForm" onsubmit="return validateForm()">
        <legend>Admin Signup</legend>

        <fieldset>
            <label for="">Name: </label> 
            <input type="text" name="name" id="name">

            <label for="">Email: </label> 
            <input type="text" name="email" id="email">

            <label for="">Password: </label> 
            <input type="text" name="pass" id="pass">

            <button type="submit">Submit</button>
            <button type="button" id="cancelBtn">Cancel</button>
        </fieldset>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
    </form>


    <script>
        function validateForm() {
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const pass = document.getElementById("pass").value;

            if (!name || !email || !pass) {
                alert("Please fill in all the fields.");
                return false;
            }

            // Add more validation logic if needed
            return true;
        }

     // JavaScript for Cancel button to clear the form
		document.getElementById('cancelBtn').addEventListener('click',
				function() {
					document.getElementById('loginForm').reset();
				});
    </script>

</body>
</html>
