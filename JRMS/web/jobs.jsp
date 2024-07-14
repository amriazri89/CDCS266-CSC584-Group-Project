<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">
    <%@ page import="com.model.User" %>
    <%@ page import="com.model.CandidateUser" %>
    <%@page import="com.model.JobVacancies"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Job Listings</title>
        <link rel="stylesheet" href="css/styles.css">
        <style>
            /* Additional styles for job listings */
            button {
                background-color: #4C779F;
                color: white;
                border: none;
                padding: 8px 16px;
                cursor: pointer;
                border-radius: 4px;
                margin-top: 10px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            button:hover {
                background-color: #244C85;
                transform: scale(1.05);
            }

            .job-listings {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
                margin-top: 50px;
            }

            .job {
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .job:hover {
                transform: scale(1.02);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .job h3 {
                margin-bottom: 10px;
                text-decoration: underline;
            }

            .job p {
                margin-bottom: 15px;
            }

            #job-select {
                width: 280px;
                height: 60px;
            }

            #job-search-form button {
                margin-left: 10px;
            }

            .container h2 {
                color: #244C85;
                font-size: 24px;
                font-weight: bold;
                font-family: Arial, sans-serif;
            }
            
            legend{
                color:green;
}
            fieldset{
                padding:20px;
                background: whitesmoke;
            }
        </style>
    </head>

    <body style="background:#fbf7f5">

        <%
            String role = ""; // Initialize role variable

            // Check if user session exists and determine role
            if (session.getAttribute("user") != null) {
                Object userObject = session.getAttribute("user");
                if (userObject instanceof CandidateUser) {
                    role = "candidate";
                }
            }
        %>
        <custom:navBar role="<%= role %>" session="${user != null}" />
        <fieldset>
            <section id="jobs">
                <div class="container"><br><br>
                    <% String login = request.getParameter("login");
                       if (login != null && login.equals("yes")) {
                    %>
                    <audio id="myAudio" controls autoplay style="display:none">
                        <source src="audio/jrms.mp3" type="audio/mp3">
                        Your browser does not support the audio element.
                    </audio>
                    <%
                        }
                    %>
                    <h2>Latest Job Listings</h2><br>

                    <center>
                        <form id="job-search-form" >
                            <span style="color:red">
                                <%
                                    if (request.getParameter("msg") != null) {
                                        String message = request.getParameter("msg");
                                        out.println("<p>" + message + "</p>"); // Output the message to the HTML response
                                        System.out.println("Message from request parameter: " + message); // Print to server console
                                    }
                                %>
                            </span>
                            <label for="job-select">
                                <h2>Select a Job:</h2><br>
                            </label>
                            <input type="text" placeholder="Enter Keywords..." style="width:300px;" />
                            &nbsp;&nbsp;
                            <select id="job-select">
                                <option value="" selected>Any Job Classification...</option>
                                <option value="Accounting">Accounting</option>
                                <option value="Administration & Office Support">Administration & Office Support</option>
                                <option value="Advertising, Art & Media">Advertising, Art & Media</option>
                                <option value="Banking & Financial Services">Banking & Financial Services</option>
                                <option value="Call Centre & Customer Service">Call Centre & Customer Service</option>
                                <option value="Design & Architecture">Design & Architecture</option>
                                <option value="Education & Training">Education & Training</option>
                                <option value="Engineering">Engineering</option>
                                <option value="Healthcare & Medical">Healthcare & Medical</option>
                                <option value="Hospitality & Tourism">Hospitality & Tourism</option>
                                <option value="Sales">Sales</option>
                                <option value="Self Employment">Self Employment</option>
                                <option value="Sport & Recreation">Sport & Recreation</option>
                                <!-- Add more job options here -->
                            </select>

                            &nbsp;&nbsp;

                            <input type="text" placeholder="Enter City Or Region..." style="width:300px;" />
                            &nbsp;&nbsp;
                            <button style="height:45px;width:80px;" type="submit">Search</button>
                        </form>
                        <button style="width:80px;margin-left:-20px;height:45px;float:right;margin-top:-52px;" type="submit" onclick="resetForm()">Reset</button>
                        <br>
                    </center>
                    <div class="job-listings">
                        <c:forEach var="jobVacancies" items="${jobVacancies}">
                            <div class="job" style="width:280px">
                                <h3>${jobVacancies.title }</h3>
                                <p>Job Type :${jobVacancies.jobType}</p>
                                <p>Salary: ${jobVacancies.salary}</p>
                                <p>Description:${jobVacancies.description}</p><br>
                                <fieldset>
                                    <legend> Company </legend>
                                    <p>name : ${jobVacancies.recruitmentCompany.name}</p>
                                    <p>email : ${jobVacancies.recruitmentCompany.email}</p>
                                    <p>description : ${jobVacancies.recruitmentCompany.description}</p>
                                </fieldset>
                                <button onclick="redirectToApply('${jobVacancies.id}')">Apply Now</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <script>
                    function redirectToApply(jobId) {
                        // Check if user session exists
                        if (<%= session.getAttribute("user") == null%>) {
                            window.location.href = "jobVacancies?action=alljobVacancies&msg=please login to apply jobs"
                        } else {
                            window.location.href = "apply.jsp?jobId=" + encodeURIComponent(jobId);
                        }
                    }
                    function resetForm() {
                        window.location.href = "jobVacancies?action=alljobVacancies"
                    }
                </script>
            </section>
        </fieldset>
        <footer>
            <div class="container">
                <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
