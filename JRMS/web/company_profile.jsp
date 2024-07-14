<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="custom" uri="com.tag" %>
<%@ page import="com.model.User" %>

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
    <custom:navBar role="company" session="${user != null}"/><br><br><br><br>
    <div class="container">
        <h2>Company Profile</h2>
        <form id="company-profile-form" action="jobVacancies" method="post">
            <div class="form-group">
                <label for="company-name">Company Name:</label>
                <input type="text" id="company-name" name="name" value="${user.recruitmentCompany.name}" placeholder="Your Company Name..." required>
            </div>
            <div class="form-group">
                <label for="company-description">Company Description:</label>
                <textarea id="company-description" name="description" value="${user.recruitmentCompany.description}" placeholder="Your company description ..."  required></textarea>
            </div>
              <div class="form-group">
                <label for="company-location">Email </label>
                <input type="text" id="company-location" name="email" value="${user.recruitmentCompany.email}" placeholder="Your Company Email..." required>
            </div>
            <div class="form-group">
                <label for="company-location">Company Phone</label>
                <input type="text" id="company-location" name="phone" value="${user.recruitmentCompany.phone}" placeholder="Your Company Phone..." required>
            </div>
               <div class="form-group">
                <label for="company-location">Address</label>
                <input type="text" id="company-location" name="address" value="${user.recruitmentCompany.address}" placeholder="Your Company Location..." required>
            </div>
            <div class="form-group">
                <label for="industry">Industry:</label>
                <select id="industry-select"  value="${user.recruitmentCompany.industry}"  >
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

 
</body>
</html>
