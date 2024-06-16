<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Company</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Additional styles */
        body {
            position: relative;
            background-image: url('image/pexels-tima-miroshnichenko-5439137.jpg');
            /* Replace 'path_to_your_image.jpg' with the actual path to your image */
            background-size: cover;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Adjust the alpha value (0.5) to set the desired opacity level */
            z-index: -1;
            /* Place the overlay behind other content */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        #companies-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .company {
            width: calc(33.33% - 20px);
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .company h3 {
            margin-bottom: 10px;
        }

        .company p {
            margin-bottom: 5px;
        }

        .company button {
            background-color: #258AC0;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 3px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        .company button:hover {
            background-color: #165F86;
        }

        h2 {
            color: rgb(221, 214, 214);
            text-decoration: underline;
        }
    </style>
</head>

<body>
     <custom:navBar role="admin" session="${user != null}"/>
    <br> <br> <br> <br> <br>

    <div class="container">
        <h2>List of Companies </h2><br>
        <div id="companies-list">
            <!-- Company information will be dynamically populated here -->
        </div>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>
    <!-- Add any scripts for fetching and displaying company data -->
    <script>
        // Example JavaScript for fetching company data and populating the page
        window.onload = function () {
            // Dummy data (replace with actual data fetching logic)
            var companies = [
                { name: "Tech Solutions Inc.", industry: "Technology", location: "New York" },
                { name: "Marketing Masters LLC", industry: "Marketing", location: "Los Angeles" },
                { name: "Data Innovators Ltd.", industry: "Data Science", location: "San Francisco" }
                // Add more company objects as needed
            ];

            var companyListContainer = document.getElementById("companies-list");

            // Iterate through the company data and create HTML elements to display it
            companies.forEach(function (company) {
                var companyDiv = document.createElement("div");
                companyDiv.classList.add("company");
                companyDiv.innerHTML = `
                    <h3>${company.name}</h3>
                    <p>Industry: ${company.industry}</p>
                    <p>Location: ${company.location}</p>
                    <br>
                    <button onclick="viewCompanyProfile('${company.name}')">View Profile</button>
                    <button onclick="viewListOfCandidates('${company.name}')">View List of Candidates</button><br><br>
                    <button onclick="createJob('${company.name}')">Create Job Vacancies</button>
`;
                companyListContainer.appendChild(companyDiv);
            });
        }

        // Function to simulate viewing a company profile (replace with actual logic)
        function viewCompanyProfile(name) {
            alert("Viewing profile of " + name);
            // Redirect to the company profile page or perform any other action
        }

        // Function to simulate viewing a list of candidates for a company (replace with actual logic)
        function viewListOfCandidates(name) {
            alert("Viewing list of candidates for " + name);
            // Redirect to the page displaying the list of candidates for the selected company or perform any other action
        }
        function createJob(name) {
            // Redirect to create_job.html
            window.location.href = "create_job.jsp";
        }
    </script>
</body>

</html>