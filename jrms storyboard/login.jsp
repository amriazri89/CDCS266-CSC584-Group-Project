<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles for login and sign-up forms */
        body {
            background-image: url('image/pexels-njeromin-11542516.jpg'); /* Replace 'path_to_your_image.jpg' with the actual path to your image */
            background-size: cover;
        }
        .login-container {
            width: 550px;
            margin: 50px auto; /* Center the form vertically */
            padding: 80px;
            background-color: #f4f4f4;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

        }
        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border-radius: 10px; /* Rounded corners */
            border: 1px solid #ccc;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #4C779F;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #244C85;
        }
    </style>
</head>
<body >
    <nav>
        <div class="container">
            <img src="image/job.png" alt="Background Image" style="margin-left:-150px;width:100px;height:68px;">

            <h1 style="margin-left:-580px;;">Job Recruitment <span style="color:blue;font-size:12px;">by vintech</span> </h1>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="jobs.html">Jobs</a></li>
                <li><a href="login.html">Login/Signup</a></li>
                <li><a href="aboutus.html">About Us</a></li>
            </ul>
        </div>
    </nav><br><br>
    <section id="login">
        <div class="container">
            <div class="login-container">
                <img src="image/job.png" alt="Background Image" style="margin-right:95px;margin-top:-80px;float:right;width:180px;height:120px;">
<br><br>
                <center><span style="font-size: 18px;font-family: verdana;">Welcome to <strong>JRMS</strong> login portal</span>
                </center><br><hr style="border:solid blue 1px;"><form id="login-form" onsubmit="return redirectToRole()">
                        <center>
                        <input type="radio" id="candidate" name="role" value="candidate" checked>
                        Candidate &nbsp; &nbsp; &nbsp;
                        <input type="radio" id="company" name="role" value="company">
                        Company &nbsp; &nbsp; &nbsp;
                        <input type="radio" id="admin" name="role" value="admin">
                        Admin
                    </center>
                    <br>
                    <div class="form-group">
                        <label for="login-email">Email</label>
                        <input type="email" id="login-email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="login-password">Password</label>
                        <input type="password" id="login-password" name="password">
                    </div>
                    
                    <div class="form-group">
                        <button type="submit">Login</button>
                    </div>
                    <div><i>Don't have account?</i><br>
                        <a style="float:right;margin-top: -25px;" href="signup.html">register candidate.</a><br>
                        <a style="float:right;margin-top: -25px;" href="reg_company.html">register company.</a>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <script>
        function redirectToRole() {
            var role = document.querySelector('input[name="role"]:checked').value;
    
            // Here you can redirect based on role
            if (role === "candidate") {
                window.location.href = "jobs.html"; // Redirect to candidate login page
            } else if (role === "company") {
                window.location.href = "hire_candidate.html"; // Redirect to company login page
            } else if (role === "admin") {
                window.location.href = "listofcompany.html"; // Redirect to admin login page
            }
    
            return false; // Prevent form submission
        }
    </script>
    
</body>
</html>
