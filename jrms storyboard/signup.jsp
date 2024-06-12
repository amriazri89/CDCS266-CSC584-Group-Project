<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Sign Up</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles for login and sign-up forms */
        body {
            background-image: url('image/pexels-njeromin-11542516.jpg'); /* Replace 'path_to_your_image.jpg' with the actual path to your image */
            background-size: cover;
        }
        .signup-container {
            width: 550px;
            margin: 50px auto; /* Center the form vertically */
            padding: 80px;
            background-color: #f4f4f4;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .signup-container h2 {
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
        .form-group input,
        .form-group textarea {
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
<body>
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
    </nav>
<br><br>
    <section id="signup" style="width:100%;">
        <div class="container" >
            <div class="signup-container" style="width:800px;">
                <h2 style="color:#244C85;font-family: Verdana;">Candidate Sign Up</h2>
                <form id="signup-form" action="submit_candidate_signup.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="signup-fullname">Full Name</label>
                        <input type="text" id="signup-fullname" name="fullname" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-email">Email</label>
                        <input type="email" id="signup-email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-password">Password</label>
                        <input type="password" id="signup-password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-address">Address</label>
                        <textarea id="signup-address" name="address" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="signup-phone">Phone Number</label>
                        <input type="tel" id="signup-phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-ic">IC Number</label>
                        <input type="text" id="signup-ic" name="ic_number" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-profile-pic">Profile Picture</label>
                        <input type="file" id="signup-profile-pic" name="profile_picture" accept="image/*" required>
                    </div>
                    <div class="form-group">
                        <label for="signup-resume">Resume</label>
                        <input type="file" id="signup-resume" name="resume" accept=".pdf,.doc,.docx" required>
                    </div>
                    <div class="form-group">
                        <button type="submit">Sign Up</button>
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
</body>
</html>
