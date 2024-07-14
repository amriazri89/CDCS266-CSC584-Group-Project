<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en"><%@ page import="com.model.CandidateUser" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update candidate profile</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Add any additional styles as needed -->
</head>
<body>
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
<custom:navBar role="<%= role %>" session="${user != null}" /><br>
    <div class="container">
        <h2>Update candidate profile</h2>
        <form action="user" method="post" id="update-job-form">
            <input type="hidden" name="action" value="updateCandidate">
            <input type="hidden" name="candidateId" value="${user.id}" >
            <div class="form-group">
                <label for="candidate-fullname">Candidate New Fullname</label>
                <input type="text" id="candidate-fullname" name="fullname" value="${user.fullname}" required>
            </div>
            <div class="form-group">
                <label for="candidate-email">Candidate New Email:</label>
                <input type="text" id="candidate-email" name="email" value="${user.email}" required>
            </div>
            <div class="form-group">
                <label for="candidate-password">Candidate New Password:</label>
                <input type="text" id="candidate-password" name="password" value="${user.password}"required>
            </div>
            <div class="form-group">
                <label for="candidate-address">Candidate New Address:</label>
                <input type="text" id="candidate-address" name="address" value="${user.address}"required>
            </div>
            <div class="form-group">
                <label for="candidate-phone">Candidate New Phone Number</label>
                <input type="text" id="candidate-phone" name="phone" value="${user.phone}"required>
            </div>
            <div class="form-group">
                <label for="candidate-ic_number">Candidate New Ic Number:</label>
                <input type="text" id="candidate-ic_number" name="ic_number" value="${user.noIc}"required>
            </div>
            <div class="form-group">
                        <button type="submit">Update Profile</button>
            </div>
        </form>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Add any scripts for handling form submission -->
    <script>
        // JavaScript for handling form submission  
        function showSuccessMessage() {
            // Display popup message
            alert("Profile updated successfully!");
        }
    </script>
</body>
</html>
