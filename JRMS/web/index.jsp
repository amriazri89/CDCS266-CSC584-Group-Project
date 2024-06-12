<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Recruitment Management System</title>
    <!-- Add links to your CSS files for styling -->
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .body {
            background:whitesmoke;
        }
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Global styles */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
   /* background-image: url('image/pexels-fauxels-3184424.jpg');
    background-size: cover;
    background-position: center;
    display: flex;
    align-self: center;*/
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}
.container h2 
{
    font-family: Arial, sans-serif;
    line-height: 2.6;
    color: black; /* Text color */
    font-size: 22px; /* Font size */
    font-weight: normal;
    text-decoration: underline;
}
.container1 h1 
{
    color: rgb(0, 0, 0); /* Text color */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Horizontal offset, Vertical offset, Blur radius, Color */
    font-size: 24px; /* Font size */
    font-weight: bold; /* Font weight */
    font-family: Arial, sans-serif; /* Font family */
}
/* Candidate Profiles */
#candidates {
    display: flex; /* Set display to flex */
    overflow-x: auto; /* Add horizontal scrolling if needed */
}

.container-2 {
    flex: 0 0 auto; /* Ensure containers don't grow or shrink */
    width: 100%; /* Set width to 100% */
    max-width: 300px; /* Adjust this value according to your design */
    margin-right: 20px; /* Add some spacing between containers */
}

.container-2:last-child {
    margin-right: 0; /* Remove margin from the last container */
}

.candidate-profiles {
    display: flex; /* Set display to flex */
    flex-direction: column; /* Arrange profiles vertically */
    align-items: center; /* Center items horizontally */
}

.candidate {
    text-align: center; /* Center text within the profile */
    border: 1px solid #ccc; /* Add a border for better separation */
    padding: 10px; /* Add some padding */
    box-shadow: 0 0 10px rgba(0, 0, 255, 0.1); 

}

.candidate:hover {
    box-shadow: 0 0 10px rgba(0, 0, 255, 0.3); /* Adjust the alpha value as needed */

}

.candidate h3 {
    margin-top: 0; /* Remove default margin */
}

button {
    background-color: #4C779F;
    color: white;
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    margin-top: 10px;
}

button:hover {
    background-color: #244C85;
}



/* Homepage section */
#home {
    background-color: #f4f4f4;
    padding: 10px 0;
    text-align: center;
}
#home h2 {
    margin-bottom: 0px;
}

/* Job Listings section */
#jobs {
    padding: 50px 0;
}
.job-listings {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}



.job h3 {
    margin-bottom: 10px;
}
.job p {
    margin-bottom: 15px;
}


/* Candidate Profiles section */
#candidates {
    padding: 50px 0;
}
.candidate-profiles {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}
.candidate {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.candidate h3 {
    margin-bottom: 10px;
}
.candidate p {
    margin-bottom: 15px;
}
.candidate button {
    background-color: #333;
    color: #fff;
    border: none;
    padding: 8px 12px;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
.candidate button:hover {
    background-color: #555;
}


.premium {
            color: #FFD700; /* Gold color */
            font-weight: bold;
        }
        .subscription-link {
            text-align: center;
            margin-top: 10px;
        }
        h2{
            color:turquoise;
        }
.subscription-link a {
        display: inline-block;
        padding: 10px 20px;
        /* background-color:#083647; */
        color:#083647;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        }
    </style>
</head>
<body> 
    <custom:navBar />
<br><br><br>
    <!-- Homepage -->
    <section id="home" style="background:#43798C">
        <div class="container1">
            <h1 style="color:white">Explore Our Job Recruitment System</h1>
            <i style="color:white">Discover opportunities to grow and thrive. Find your next career move with us!</i>
            <!-- Add more content as needed -->
        </div>
    </section>
    
    
    <div class="body">
    <div class="subscription-link">
        <a href="subscription.jsp" style="display: inline-block; overflow: hidden;">
            <marquee direction="left" >Want To Find Best Candidate For Company Job Vacancies? <b>Click Here to Subscribe.</b></marquee>
        </a>
            </div>

    <!-- Job Listings -->
    <section id="jobs">
        <div class="container">
            <h2>Latest Offer From Company</h2>
            <div class="job-listings">
                <!-- Sample job listing for Intel Corporation -->
                <div class="job">
                    <h3>Intel Corporation</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <!-- Redirect to candidates.jsp when clicked -->
                    <button onclick="redirectToCandidates()">Apply Position Now</button>
                </div>
                <div class="job">
                    <h3>Nvidia Corporation</h3>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <!-- Redirect to jobs.jsp when clicked -->
                    <button onclick="redirectToJobs()">Apply Position Now</button>
                </div>

                
            </div>
            
        </div>
       
    
        <script>
            // JavaScript functions to handle redirection
            function redirectToCandidates() {
                // Redirect to candidates.jsp
                window.location.href = "candidates.jsp";
            }
    
            function redirectToJobs() {
                // Redirect to jobs.jsp
                window.location.href = "jobs.jsp";
                window.close()
            }
        </script>
        
          <div class="background-image" style="float:right;margin-top:-300px">
            <Fieldset style="border:none">
                <img src="image/pexels-fauxels-3184424.jpg" alt="Background Image">

            </Fieldset>
        </div>
    </section>
    <br>
<center><b>Find Your Perfect Candidate...</b></center><br>
    <!-- Candidate Profiles -->
    <section id="candidates" style="background-color: white;">
        <div class="container">
            <h2> Candidate 1</h2>
            <!-- Candidate profiles will be dynamically populated here -->
            <div class="candidate-profiles">
                <!-- Sample candidate profile -->
                <div class="candidate">
                    <h3>Candidate Name</h3>
                    <p>Skills: Lorem ipsum, dolor sit amet</p>
                    <button style="background-color:#0A7C6D">View Profile</button>
                </div>
                <!-- Add more candidate profiles dynamically -->
            </div>
        </div>
        <div class="container">
            <h2> Candidate 2</h2>
            <!-- Candidate profiles will be dynamically populated here -->
            <div class="candidate-profiles">
                <!-- Sample candidate profile -->
                <div class="candidate">
                    <h3>Candidate Name</h3>
                    <p>Skills: Lorem ipsum, dolor sit amet</p>
                    <button style="background-color:#0A7C6D">View Profile</button>
                </div>
                <!-- Add more candidate profiles dynamically -->
            </div>
        </div>
        <div class="container">
            <h2>Candidate 3</h2>
            <!-- Candidate profiles will be dynamically populated here -->
            <div class="candidate-profiles">
                <!-- Sample candidate profile -->
                <div class="candidate">
                    <h3>Candidate Name</h3>
                    <p>Skills: Lorem ipsum, dolor sit amet</p>
                    <button style="background-color:#0A7C6D">View Profile</button>
                </div>
                <!-- Add more candidate profiles dynamically -->
            </div>
        </div>
        <div class="container">
            <h2>Candidate 4</h2>
            <!-- Candidate profiles will be dynamically populated here -->
            <div class="candidate-profiles">
                <!-- Sample candidate profile -->
                <div class="candidate">
                    <h3>Candidate Name</h3>
                    <p>Skills: Lorem ipsum, dolor sit amet</p>
                    <button style="background-color:#0A7C6D">View Profile</button>
                </div>
                <!-- Add more candidate profiles dynamically -->
            </div>
        </div>
        <div class="container">
            <h2>Candidate 5</h2>
            <!-- Candidate profiles will be dynamically populated here -->
            <div class="candidate-profiles">
                <!-- Sample candidate profile -->
                <div class="candidate">
                    <h3>Candidate Name</h3>
                    <p>Skills: Lorem ipsum, dolor sit amet</p>
                    <button style="background-color:#0A7C6D">View Profile</button>
                </div>
                <!-- Add more candidate profiles dynamically -->
            </div>
        </div>
    </section>
</fieldset>
</div>


    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Add script tags for any JavaScript functionalities -->
</body>
</html>
