<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Job Vacancies</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Add any additional styles as needed -->
</head>
<body>
    <nav>
        <div class="container">
            <h1>Job Recruitment System</h1>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="create_job.html">Create Job Vacancies</a></li>
                <li><a href="hire_candidate.html">List Of Application</a></li>
                <li><a href="company_profile.html">Company Profile</a></li>
            </ul>
        </div>
    </nav><br>
    <div class="container">
        <h2>Update Job Vacancies</h2>
        <form id="update-job-form">
            <div class="form-group">
                <label for="job-title">Job Title:</label>
                <input type="text" id="job-title" name="job-title" required>
            </div>
            <div class="form-group">
                <label for="job-description">Job Description:</label>
                <textarea id="job-description" name="job-description" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="job-location">Job Location:</label>
                <input type="text" id="job-location" name="job-location" required>
            </div>
            <div class="form-group">
                <label for="job-type">Job Type:</label>
                <select id="job-type" name="job-type" required>
                    <option value="">Select Job Type</option>
                    <option value="full-time">Full Time</option>
                    <option value="part-time">Part Time</option>
                    <option value="contract">Contract</option>
                    <!-- Add more job types as needed -->
                </select>
            </div>
            <div class="form-group">
                <label for="application-deadline">Application Deadline:</label>
                <input type="date" id="application-deadline" name="application-deadline" required>
            </div>
            <div class="form-group">
                <button type="button" onclick="showSuccessMessage()">Update Job Vacancies</button>
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
            alert("Job updated successfully!");
        }
    </script>
</body>
</html>
