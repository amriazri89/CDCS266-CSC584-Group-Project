
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Job Vacancies</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Add any additional styles as needed -->
</head>
<body style="background-color:whitesmoke">
    <custom:navBar /><br><br><br><br>
    <a href="listofjobvacancy.jsp" style="font-weight:10px;text-align:center;text-decoration: none;height:30px;margin-left: 20px;font: 1em sans-serif;border-radius: 5px;width:200px;">&nbsp;&nbsp;Back as Company Admin</a>
    <br><div class="container">
        <h2>Create Job Vacancies</h2>
        <form id="create-job-form">
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
                    <option value="" selected>Select Job Type</option>
                    <option value="full-time">Full Time</option>
                    <option value="part-time">Part Time</option>
                    <option value="contract">Contract</option>
                    <option value="contract">Freelance</option>
                    <!-- Add more job types as needed -->
                </select>
            </div>
            <!-- <div class="form-group">
                <label for="application-deadline">Application Deadline:</label>
                <input type="date" id="application-deadline" name="application-deadline" required>
            </div> -->
            <div class="form-group">
                <button type="submit">Create Job Vacancies</button>
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
        document.getElementById("create-job-form").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent the form from submitting

            // Extract form data
            var formData = new FormData(this);

            // Perform AJAX request to submit the form data to the server
            // Replace the URL and method with the appropriate values for your backend
            fetch("submit_job.php", {
                method: "POST",
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    // Job created successfully, display success message or redirect
                    alert("Job created successfully!");
                    // Optionally redirect to another page
                    // window.location.href = "jobs.jsp";
                } else {
                    // Job creation failed, display error message
                    alert("Failed to create job. Please try again.");
                }
            })
            .catch(error => {
                // Error occurred during the request
                console.error("Error:", error);
                alert("An error occurred. Please try again later.");
            });
        });
    </script>
</body>
</html>
