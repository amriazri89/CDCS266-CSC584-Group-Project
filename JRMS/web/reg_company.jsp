<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Company Registration</title>
        <link rel="stylesheet" href="css/styles.css">
        <style>
            /* Additional styles for the registration page */
            .registration-container {
                width: 700px;
                margin: 50px auto; /* Center the form vertically */
                padding: 30px;
                background-color: #f4f4f4;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .registration-container h2 {
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
            .form-group input {
                width: 100%;
                padding: 8px;
                border-radius: 3px;
                border: 1px solid #ccc;
            }
            .form-group button {
                width: 100%;
                padding: 10px;
                background-color: #4C779F;
                color: #f6f8fe;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .form-group button:hover {
                background-color: #244C85;
            }
            body {
                background-image: url('image/pexels-njeromin-11542516.jpg'); /* Replace 'path_to_your_image.jpg' with the actual path to your image */
                background-size: cover;
            }

            #industry-select {
                color: black; /* Default color for options */
                background-color: white; /* Background color */
                padding: 5px;
                border-radius: 3px;
                border: 1px solid #ccc;
                font-size: 16px;
                width: 100%;
            }
            /* Style for option hover */
            #industry-select option:hover {
                background-color: lightgray; /* Hover color */
            }
        </style>
    </head>
    <body>
        <custom:navBar />
        <br><br><br>
        <div class="registration-container">
            <h2>Registration Form: Company Details</h2>

            <form id="company-registration-form" 
                action="recruitmentCompany" method="post">
                <input type="hidden"  name="action" value="createCompany" />
                <div class="form-group">
                    <label for="company-name">Company Name</label>
                    <input type="text" id="company-name" name="companyName" required>
                </div>
                <div class="form-group">
                    <label for="company-details">Company Details (Short Description)</label>
                    <textarea id="company-details" name="companyDetails" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label for="company-phone">Company Phone Number</label>
                    <input type="tel" id="company-phone" name="companyPhone" required>
                </div>
                <div class="form-group">
                    <label for="company-email">Company Email</label>
                    <input type="email" id="company-email" name="companyEmail" required>
                </div>
                <div class="form-group">
                    <label for="company-address">Company Address</label>
                    <input type="text" id="company-address" name="companyAddress" required>
                </div>
                <div class="form-group">
                    <label for="industry">Industry:</label>
                    <select id="industry-select" name="industry" value="${user.recruitmentCompany.industry}"  >
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
                Person In Charge Details
                <div class="form-group">
                    <label for="company-password">PIC Email </label>
                    <input type="email" id="company-password" name="userEmail" required>
                </div>
                <div class="form-group">
                    <label for="company-password">Password</label>
                    <input type="password" id="company-password" name="userPassword" required>
                </div>
                <div class="form-group">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>
        <footer>
            <div class="container">
                <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
