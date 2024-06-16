<%@page import="com.model.CompanyUser"%>
<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">
<%@ page import="com.model.User" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update and Delete Job Vacancies</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Add any additional styles as needed -->
    <style>
        .job-listings {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .job {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .job h3 {
            margin-bottom: 10px;
        }

        .job p {
            margin-bottom: 15px;
        }

        .createbutton {
            width: 300px;
            ;
            padding: 20px;
            border-radius: 5px;
            margin-left: 1225px;

        }

        .createbutton button {
            background-color: #7a7c90;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .createbutton button:hover {
            background-color: #7a83e0;
        }

        .createbutton:active {
            vertical-align: top;
            padding-top: 8px;
        }


        #job-select {
            width: 250px;
            /* Set width to 100px */
        }

        /* Optional: Adjust button styles */
        #job-search-form button {
            margin-left: 10px;
            /* Add some margin between the buttons */
        }

        .container h2 {
            font-weight: bold;
            /* Font weight */
            font-family: Arial, sans-serif;
            /* Font family */
        }


        button.delete {
            background-color: #e12646;
            color: #fff;
            border: none;
            padding: 11px 19px;
            border-radius: 3px;
            font-size: 17px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        button.delete:hover {
            background-color: #822734;
        }
    </style>
</head>

<body style="background:#fbf7f5">
    <%
    String role = ""; // Initialize role variable
    
    // Check if user session exists and determine role
    if (session.getAttribute("user") != null) {
        Object userObject = session.getAttribute("user");
         if (userObject instanceof CompanyUser) {
            role = "company";
        }
        
    }
%>
<custom:navBar role="<%= role %>" session="${user != null}"/>
<br>

    <div class="container">
        <br> <br>
        <div class="createbutton" style="float:right;margin-top: 20px;margin-right: -100px;">
            <button style="font-size: 18px;" onclick="createJob()">Create Job Vacancies</button>
        </div>
        <h2>Fintech Company Job Vacancies</h2>
        <!-- Sample job vacancies will be dynamically populated here -->
        <div id="job-vacancies">
            <!-- Sample job vacancy -->
            <div class="job-listings">
                <div class="job">
                    <h3>Software Engineer</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Data Analyst</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Marketing Specialist</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <!-- Add 10 more dummy job listings -->
                <div class="job">
                    <h3>Web Developer</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Graphic Designer</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Accountant</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Project Manager</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Human Resources Manager</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Customer Service Representative</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Sales Representative</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
                <div class="job">
                    <h3>Executive Assistant</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="updateJob()">Update</button>
                    <button class="delete" onclick="deleteJob(1)">Delete</button>
                </div>
            </div>
            <!-- Add more job vacancies dynamically -->
        </div>
    </div>
    <br>

    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Add any scripts for handling job update and deletion -->
    <script>
        // JavaScript for handling job update
        function updateJob() {
            // Redirect to the update job page
            window.location.href = "updatejob.html";
        }
        function createJob() {
            window.location.href = "create_job.html";
        }

        // JavaScript for handling job deletion
        function deleteJob(jobId) {
            // Confirm deletion
            if (confirm("Are you sure you want to delete this job vacancy?")) {
                // Perform deletion using AJAX request
                fetch("delete_job.php?id=" + jobId, {
                    method: "DELETE"
                })
                    .then(response => {
                        if (response.ok) {
                            // Job deleted successfully, reload the page to reflect changes
                            location.reload();
                        } else {
                            // Deletion failed, display error message
                            alert("Failed to delete job vacancy. Please try again.");
                        }
                    })
                    .catch(error => {
                        // Error occurred during the request
                        console.error("Error:", error);
                        alert("An error occurred. Please try again later.");
                    });
            }
        }
    </script>
</body>

</html>