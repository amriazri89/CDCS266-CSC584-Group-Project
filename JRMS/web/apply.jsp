<!DOCTYPE html>
<%@ page import="com.model.User" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Application Form</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles for login and sign-up forms */
        body {
            background-image: url('image/pexels-njeromin-11542516.jpg'); /* Replace 'path_to_your_image.jpg' with the actual path to your image */
            background-size: cover;
        }
        .application-form {
            max-width: 600px;
            margin: 50px auto; /* Center the form vertically */
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .application-form h2 {
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
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        textarea{
            height:100px;
        }
        .form-group textarea {
            resize: vertical; /* Allow vertical resizing */
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
    <custom:navBar />
    <br><br><br>
    <section id="apply-job">
        <div class="container">
            <form class="application-form" action="JobApplication" method="post">
                <input type="hidden" name="action" value="applyJob" />
                <input type="hidden" name="jobId" value="<%=request.getParameter("jobId")%>" />
                <input type="hidden" name="userId" value="${user.id}" />
                <h2>Apply for a Job</h2>
                <b> Candidate Name :</b> ${user.fullname}<br><br>
               <b> Email :</b> ${user.email}<br><br>
               <b> NoIc :</b> ${user.noIc}<br><br>
<!--                <div class="form-group">
                    <label for="resume">Resume</label>
                    <input type="file" id="resume" name="resume" accept=".pdf,.doc,.docx" required>
                </div>-->
                <div class="form-group">
                    <label for="coverletter">Cover Letter</label>
                    <textarea id="coverletter" name="coverletter" required></textarea>
                </div>
<br>                <div class="form-group">
                    <button type="submit">Submit Application</button>
                </div>
            </form>
        </div>
    </section>
<br>
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
