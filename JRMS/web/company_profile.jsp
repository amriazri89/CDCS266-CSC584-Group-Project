<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="custom" uri="com.tag" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Profile</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            
        }

        /* Form styles */
        form {
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: auto;
            margin-top: auto;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            font-family: arial;
            font-size: 16px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

     
    </style>
</head>
<body>
    <custom:navBar role="company" session="${user != null}"/><br><br><br><br>
    <div class="container">
        <h2>Company Profile</h2>
        <form id="company-profile-form">
            <div class="form-group">
                <label for="company-name">Company Name:</label>
                <input type="text" id="company-name" name="company-name" placeholder="Your Company Name..." required>
            </div>
            <div class="form-group">
                <label for="company-description">Company Description:</label>
                <textarea id="company-description" name="company-description" placeholder="Your company description ..."  required></textarea>
            </div>
            <div class="form-group">
                <label for="company-location">Location:</label>
                <input type="text" id="company-location" name="company-location" placeholder="Your Company Location..." value="" required>
            </div>
            <div class="form-group">
                <label for="company-industry">Industry:</label>
                <select id="industry-select"    >
                    <option value="selected" selected>Any Industry...</option>
                    <option value="Accounting">Accounting</option>
                    <option value="Agriculture, Forestry & Fishing">Agriculture, Forestry & Fishing</option>
                    <option value="Automotive">Automotive</option>
                    <option value="Construction">Construction</option>
                    <option value="Consulting">Consulting</option>
                    <option value="Education">Education</option>
                    <option value="Entertainment">Entertainment</option>
                    <option value="Finance">Finance</option>
                    <option value="Food & Beverage">Food & Beverage</option>
                    <option value="Healthcare">Healthcare</option>
                    <option value="Information Technology">Information Technology</option>
                    <option value="Manufacturing">Manufacturing</option>
                    <option value="Marketing & Advertising">Marketing & Advertising</option>
                    <option value="Retail">Retail</option>
                    <option value="Telecommunications">Telecommunications</option>
                    <!-- Add more industry options here -->
                </select>
                        </div>
            <div class="form-group">
                <button type="submit" style="float:right">Update Company Profile</button>
            </div>
        </form>
    </div>
    <br>
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Add any scripts for handling form submission -->
    <script>
        // JavaScript for handling form submission
        document.getElementById("company-profile-form").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent the form from submitting

            // Extract form data
            var formData = new FormData(this);

            // Perform AJAX request to submit the form data to the server
            // Replace the URL and method with the appropriate values for your backend
            fetch("update_profile.php", {
                method: "POST",
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    // Profile updated successfully, display success message or redirect
                    alert("Profile updated successfully!");
                    // Optionally redirect to another page
                    // window.location.href = "profile.jsp";
                } else {
                    // Profile update failed, display error message
                    alert("Failed to update profile. Please try again.");
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
