<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Registration</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles for the registration page */
        .registration-container {
            width: 700px;
            margin: 50px auto; /* Center the form vertically */
            padding: 30px;
            background-color: #f4f4f4;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .registration-container h2 {
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
            border-radius: 3px;
            border: 1px solid #ccc;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #4C779F;
            color: #f6f8fe;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #244C85;
        }
        body {
            background-image: url('image/pexels-njeromin-11542516.jpg'); /* Replace 'path_to_your_image.jpg' with the actual path to your image */
            background-size: cover;
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
    <br><br><br>
    <div class="registration-container">
        <h2>Registration Form: Company Details</h2>
 
        <form id="company-registration-form">
            <div class="form-group">
                <label for="company-name">Company Name</label>
                <input type="text" id="company-name" name="company-name" required>
            </div>
            <div class="form-group">
                <label for="company-details">Company Details (Short Description)</label>
                <textarea id="company-details" name="company-details" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="company-phone">Company Phone Number</label>
                <input type="tel" id="company-phone" name="company-phone" required>
            </div>
            <div class="form-group">
                <label for="company-email">Company Email</label>
                <input type="email" id="company-email" name="company-email" required>
            </div>
            <div class="form-group">
                <label for="company-address">Company Address</label>
                <input type="text" id="company-address" name="company-address" required>
            </div>
            <div class="form-group">
                <label for="company-password">Password</label>
                <input type="password" id="company-password" name="company-password" required>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
