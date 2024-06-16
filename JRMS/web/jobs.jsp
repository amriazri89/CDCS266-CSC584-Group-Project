<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">

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
            padding: 4px 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #244C85;
        }




        .job-listings {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .job {
            font-size: 15px;
            ;
        }

        .job h3 {
            margin-bottom: 10px;
        }

        .job p {
            margin-bottom: 15px;
        }

        .job button {
            background-color: #4C779F;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .job button:hover {
            background-color: #244C85;
        }

        #job-select {
            width: 250px;
            height: 60px;
            /* Set width to 100px */
        }

        /* Optional: Adjust button styles */
        #job-search-form button {
            margin-left: 10px;
            /* Add some margin between the buttons */
        }

        .container h2 {
            color: #244C85;
            /* Text color */
            /* Horizontal offset, Vertical offset, Blur radius, Color */
            font-size: 24px;
            /* Font size */
            font-weight: bold;
            /* Font weight */
            font-family: Arial, sans-serif;
            /* Font family */
        }
        h3{
            text-decoration: underline;
        }
    </style>
</head>

<body style="background:#fbf7f5">
     <custom:navBar />

    <fieldset>
        <section id="jobs">
            <div class="container"><br><br>
            
                <h2>Latest Job Listings</h2><br>

                <fieldset></fieldset>
                <center>
                    <form id="job-search-form">

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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button style="height:45px;" type="submit">Search</button>
                        <button  style="height:45px;" type="submit" onclick="resetForm()">Reset</button>
                    </form>
                    <br>
                </center>
                <div class="job-listings">
                    <!-- Dummy job listings -->
                    <div class="job">
                        <h3>Software Engineer</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Data Analyst</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Marketing Specialist</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <!-- Add 10 more dummy job listings -->
                    <div class="job">
                        <h3>Web Developer</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Graphic Designer</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Accountant</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Project Manager</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Human Resources Manager</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Customer Service Representative</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Sales Representative</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <div class="job">
                        <h3>Executive Assistant</h3>
                        <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button onclick="redirectToApply()">Apply Now</button>
                    </div>
                    <!-- End of dummy job listings -->
                </div>
            </div>
            <script>
                function redirectToApply() {
                    // Redirect to apply.html
                    window.location.href = "apply.html";
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