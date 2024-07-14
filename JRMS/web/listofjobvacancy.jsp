<%@ page import="com.model.CompanyUser" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" uri="com.tag" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update and Delete Job Vacancies</title>
        <link rel="stylesheet" href="css/styles.css">
        <style>
            /* CSS styles for job listings and buttons */
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
                float: right;
                margin-top: 20px;
                margin-right: 20px;
            }
            .createbutton button {
                font-size: 18px;
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
            button.delete {
                background-color: #e12646;
                color: #fff;
                border: none;
                padding: 8px 12px;
                border-radius: 3px;
                font-size: 17px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-right: 10px;
            }
            button.delete:hover {
                background-color: #822734;
            }

            /* Modal styles */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            .modal-content {
                background-color: #fefefe;
                margin: 10% auto; /* 10% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 50%; /* Could be more or less, depending on content */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }

            /* Close button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
            }

            input, select, textarea {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                box-sizing: border-box;
            }

            button.modal-button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                float: right;
                margin-top: 10px;
            }

            button.modal-button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body style="background:#fbf7f5">
        <%-- Java code to check user role from session --%>
        <%
            String role = ""; // Initialize role variable

            if (session.getAttribute("user") != null) {
                Object userObject = session.getAttribute("user");
                if (userObject instanceof CompanyUser) {
                    role = "company";
                }
            }
        %>
        <%-- Custom tag for navigation bar based on user role --%>
        <custom:navBar role="<%= role%>" userId="${user.id}" session="${user != null}" />
        <br><br><br><br>
        <div class="container">
            <div class="createbutton">
                <button onclick="createJob()">Create Job Vacancy</button>
            </div><br>
            <h2>${user.recruitmentCompany.name} Job Vacancies</h2>
            <div id="job-vacancies" class="job-listings">
                <%-- Iterate over job vacancies and display details --%>
                <c:forEach var="job" items="${jobList}">
                    <div class="job">
                        <h3>${job.title}</h3>
                        <p>Job Type: ${job.jobType}</p>
                        <p>Salary: ${job.salary}</p>
                        <p>Description: ${job.description}</p>
                        <p>Status: ${job.status}</p>
                        <%-- Buttons for update and delete --%>
                        <button class="update" onclick="openUpdateModal('${job.id}', '${job.title}', '${job.jobType}', '${job.salary}', '${job.description}', '${job.status}', '${user.id}')">Update</button>
                        <button class="delete" onclick="deleteJob('${job.id}')">Delete</button>
                    </div>
                </c:forEach>
            </div>
        </div>
        <br><br>

        <footer>
            <div class="container">
                <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
            </div>
        </footer>

        <%-- Form for deleting a job --%>
        <form id="deleteJobForm" action="jobVacancies" method="post" style="display:none;">
            <input type="hidden" name="action" value="deleteJob">
            <input type="hidden" id="deleteJobId" name="jobId">
            <input type="hidden" name="userId" value="${user.id}">
        </form>

        <%-- Modal for updating job details --%>
        <div id="updateJobModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Update Job Vacancy</h2>
                <form id="updateJobForm" action="jobVacancies" method="post">
                    <input type="hidden" name="action" value="updateJob">
                    <input type="hidden" id="updateUserId" name="userId" >
                    <input type="hidden" id="updateJobId" name="jobId" >
                    <label for="updateJobTitle">Job Title:</label>
                    <input type="text" id="updateJobTitle" name="title" required><br><br>
                    <label for="updateJobType">Job Type:</label>
                    <select id="updateJobType" name="jobType" required>
                        <option value="full-time">Full Time</option>
                        <option value="part-time">Part Time</option>
                        <option value="contract">Contract</option>
                    </select><br><br>
                    <label for="updateJobSalary">Salary:</label>
                    <input type="text" id="updateJobSalary" name="salary" required><br><br>
                    <label for="updateJobDescription">Job Description:</label>
                    <textarea id="updateJobDescription" name="description" rows="4" required></textarea><br><br>
                    <button type="submit" class="modal-button">Update Job Vacancy</button>
                    <br><br>
                </form>
            </div>
        </div>

        <script>
            // Function to open update job modal with pre-filled data
            function openUpdateModal(jobId, jobTitle, jobType, jobSalary, jobDescription, jobStatus, userId) {
                document.getElementById('updateJobId').value = jobId;
                document.getElementById('updateJobTitle').value = jobTitle;
                document.getElementById('updateJobType').value = jobType;
                document.getElementById('updateUserId').value = userId;
                document.getElementById('updateJobSalary').value = jobSalary;
                document.getElementById('updateJobDescription').value = jobDescription;
                document.getElementById('updateJobModal').style.display = "block";
            }

            // Function to close modal
            var closeButtons = document.querySelectorAll('.close');
            closeButtons.forEach(function (button) {
                button.onclick = function () {
                    document.getElementById('updateJobModal').style.display = "none";
                }
            });

            // Close modal when clicking outside of it
            window.onclick = function (event) {
                var modal = document.getElementById('updateJobModal');
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            // Function to handle job deletion
            function deleteJob(jobId) {
                if (confirm("Are you sure you want to delete this job vacancy?")) {
                    document.getElementById('deleteJobId').value = jobId;
                    document.getElementById('deleteJobForm').submit();
                }
            }

            // Function to redirect to job creation page
            function createJob() {
                window.location.href = "create_job.jsp";
            }
        </script>
        <br>
    </body>
</html>
