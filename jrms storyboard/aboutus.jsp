<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Job Recruitment System</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles for about us page */
        body{
            background-image: url('image/pexels-itzel-zarate-1170413563-22858523.jpg');
        }
        .about-container {
            max-width: 800px;
            margin: 50px auto; /* Center the box vertically */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* Box shadow for depth */
            animation: fadeIn 1s ease; /* Fade-in animation */
        }
        .about-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .about-container p {
            line-height: 1.6;
            margin-bottom: 20px;
            color: #000; /* Set font color to black */
        }

        /* Keyframes for fade-in animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-50px); /* Move up by 50 pixels */
            }
            to {
                opacity: 1;
                transform: translateY(0); /* Move back to normal position */
            }
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
<br><br><br><br>
    <section id="about">
        <div class="container">
            <div class="about-container">
                <i>
                <h2>About Us...</h2>
                <p>Welcome to our<b> Job Recruitment System</b>! We are dedicated to helping companies find the best talent and assisting job seekers in finding their dream jobs.</p>
                <p>Our platform provides a seamless experience for both employers and candidates. Employers can post job listings, manage applications, and find the perfect candidates for their roles. Candidates can explore job opportunities, submit applications, and showcase their skills and experiences.</p>
                <p>With our user-friendly interface and powerful features, we aim to streamline the recruitment process, making it efficient and effective for everyone involved.</p>
                <p>Whether you're a company looking to hire top talent or an individual seeking new career opportunities, we're here to support you every step of the way.</p>
            </i></div>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
