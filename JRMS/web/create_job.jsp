<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.CompanyUser" %>
<%@ page import="com.model.RecruitmentCompany" %>
<%@ taglib prefix="custom" uri="com.tag" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Create Job Vacancies</title>
        <link rel="stylesheet" href="css/styles.css">
        <style>
            #job-type {
                color: black; /* Default color for options */
                background-color: white; /* Background color */
                padding: 5px;
                border-radius: 3px;
                border: 1px solid #ccc;
                font-size: 14px;
                width: 100%;
            }
            /* Style for option hover */
            #job-type option:hover {
                background-color: lightgray; /* Hover color */
            }
        </style></head>
    <body style="background-color: whitesmoke;">
        <custom:navBar role="admin" session="${user != null}"/>
        <br><br><br><br>
        <c:if test="${user != null and user.recruitmentCompany != null}">
            <div class="container">
                <h2>Create Job Vacancies by Company ${user.recruitmentCompany.name}</h2>
                <form id="create-job-form" action="jobVacancies" method="post">
                    <input type="hidden" name="companyId" value="${user.recruitmentCompany.id}" />
                    <input type="hidden" name="action" value="createJob" />
                    <input type="hidden" name="userId" value="${user.id}" />

                    <div class="form-group">
                        <label for="job-title">Job Title:</label>
                        <input type="text" id="job-title" name="jobTitle" required>
                    </div>
                    <div class="form-group">
                        <label for="job-description">Job Description:</label>
                        <textarea id="job-description" name="jobDescription" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="job-location">Salary:</label>
                        <input type="text" id="job-location" name="salary" required>
                    </div>
                    <div class="form-group">
                        <label for="job-type">Job Type:</label>
                        <select id="job-type" name="jobType" required>
                            <option value="" selected>Select Job Type</option>
                            <option value="Full-time">Full Time</option>
                            <option value="Part-time">Part Time</option>
                            <option value="Contract">Contract</option>
                            <option value="Freelance">Freelance</option>
                            <!-- Add more job types as needed -->
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit">Create Job Vacancies</button>
                    </div>
                </form>
            </div>
        </c:if>

        <footer>
            <div class="container">
                <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
            </div>
        </footer>

    </body>
</html>
