<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" uri="com.tag" %>
<!DOCTYPE html>
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




        #companies-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
        }

        .company {
            width: calc(33.33% - 20px);
            padding: 20px;
            margin-bottom: 20px;
            background-color:white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .company h3 {
            margin-bottom: 10px;
            color: #258AC0;
        }

        .company p {
            margin-bottom: 5px;
            color: #333;
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

        

        footer {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px 0;
            text-align: center;
            bottom: 0;
            width: 100%;
            color: #fff;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>

<body>

    <custom:navBar role="admin" session="${user != null}"/>
    <br> <br> <br> <br> <br>

    <div class="container">
        <fieldset style="background:whitesmoke;padding:20px;width:280px;">        <h2 style="color:black">List of Companies</h2>

            
        </fieldset>

        <%  String login = request.getParameter("login");
    if (login != null && login.equals("yes")) {
%>
        <audio id="myAudio" controls autoplay style="display:none">
        <source src="audio/jrms.mp3" type="audio/mp3">
        Your browser does not support the audio element.
    </audio>
<% 
    }
%>

        <div id="companies-list">
            <c:forEach var="rc" items="${recruitmentCompany}">
                <div class="company">
                    <h3>${rc.name}</h3>
                    <p><strong>Email:</strong> ${rc.email}</p>
                    <p><strong>Description:</strong> ${rc.description}</p>
                    <p><strong>Phone:</strong> ${rc.phone}</p>
                    <p><strong>Address:</strong> ${rc.address}</p>
                    <p><strong>Industry:</strong> ${rc.industry}</p>
                    
                    <p><strong>PIC Email : </strong> ${rc.user.email}</p><br>
                    <button>View Profile</button>
                    <button>View List of Candidates</button><br><br>
                    <button>Create Job Vacancies</button>
                </div>
            </c:forEach>
        </div>
    </div>
<br><br>
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

</body>

</html>
