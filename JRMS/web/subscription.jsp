<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Subscription</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles for the subscription page */
        .subscription-container {
            max-width: 1500px; /* Increased max-width */
            margin: 50px auto; /* Center the form vertically */
            padding: 30px;
            background-color: #f4f4f4;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
    flex-wrap: wrap;
    justify-content: center;
        }
        .subscription-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .subscription-container {
    max-width: 1500px;
    margin: 50px auto;
    padding: 30px;
    background-color: #f4f4f4;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.subscription-plan {
    flex: 1 1 150px;
    margin: 0 10px 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
}

.subscription-plan h3 {
    margin-bottom: 10px;
}

.subscription-plan p {
    margin-bottom: 15px;
}
h3{
    text-decoration: underline;
}
/* Global styles */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
   background-image: url('image/pexels-fauxels-3184424.jpg');
    background-size: cover;
    background-position: center;
    display:flexbox;
    align-self: center;
}

.subscription-plan button {
    width: 100%; /* Set button width to 100% */
    padding: 10px;
    background-color: #4C779F;
    color: #fff;
    font-size: 16px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.subscription-plan button:hover {
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

    <h2>Choose a Company Subscription Plan</h2>

    <div class="subscription-container">
        <div class="subscription-plan">
            <h3>Basic Plan</h3>
            <br>
            <p>Post up to 5 job listings per month</p>
            <p>Access to basic candidate search</p>
            <br>
            <button>Subscribe RM150/Per Month</button>
        </div>
        <div class="subscription-plan">
            <h3>Premium Plan</h3>
            <br>
            <p>Unlimited job postings</p>
            <p>Advanced candidate search</p>
            <p>Email and phone support</p>
            <br>
            <button>Subscribe RM250/Per Month</button>
        </div>
        <div class="subscription-plan">
            <h3>Enterprise Plan</h3>
            <br>
            <p>Customized solutions for your hiring needs</p>
            <p>Premium customer support</p>
            <p>Integration options with HR systems</p>
            <br>
            <button>Subscribe RM350/Per Month</button>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
