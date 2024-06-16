<%@page import="com.model.User"%>
<%@ taglib prefix="custom" uri="com.tag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User List</title>
        <link rel="stylesheet" href="css/styles.css">
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: grey;
                color: white;
            }

            button.update {
                background-color: #258AC0;
                color: #fff;
                border: none;
                padding: 8px 12px;
                border-radius: 3px;
                font-size: 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-right: 10px;
            }

            button.update:hover {
                background-color: #165F86;
            }

            button.default {
                background-color: #91768F;
                color: #fff;
                border: none;
                padding: 8px 12px;
                border-radius: 3px;
                font-size: 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-right: 10px;
            }

            button.default:hover {
                background-color: #440B3F;
            }
            
            /* Modal styles */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto; /* 10% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on content */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

/* Close button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
input{
   width:500px;height:10px;
}
        </style>
    </head>

    <body style="background-color:whitesmoke">
        <custom:navBar role="admin" session="${user != null}"/>
        <br><br><br><br>
        <div class="container">
            <h2>User List</h2>
            <form id="job-search-form" action="UserController" method="get">
                <input type="hidden" name="action" value="listUsers">
                <label for="job-select">
                    <h2>Select a Job</h2>
                </label>
                <input type="text" placeholder="Enter Keywords..." style="width:300px;">
                &nbsp;&nbsp;
                <select id="job-select" style="width:200px;height:60px;">
                    <option value="Admin">Admin</option>
                    <option value="Company Admin">Company Admin</option>
                    <option value="Candidate">Candidate</option>
                </select>
                &nbsp;&nbsp;
                <button style="height:45px;" type="submit">Search</button>
                <a href="../JRMS/user_list.jsp" style="height:45px;" type="reset" >Reset</a>
            </form>
            <a href="../JRMS/createUser.jsp" style="height:45px;" type="reset" >Create User</a>
            <br>
            <table>
                <thead>
                    <tr>
                        <th style="width:100px;">User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${empty user.id ? 'N/A' : user.id}</td>
                            <td>${empty user.fullname ? 'N/A' : user.fullname}</td>
                            <td>${empty user.noIc ? 'N/A' : user.noIc}</td>
                            <td>${empty user.phone ? 'N/A' : user.phone}</td>
                            <td>${empty user.email ? 'N/A' : user.email}</td>
                            <td>
                    <center>
                        
<button class="update"
        data-userid="${user.id}"
        data-username="${user.fullname}"
        data-useremail="${user.email}">
    Update
</button>
    <form action="user" >
        <input type="hidden" name="action" value="deleteUser" />
        <input type="hidden" name="userId" value="${user.id}" />
    <button class="delete" data-userid="${user.id}" data-username="${user.fullname}"  onclick="return confirm('Are you sure want to delete this user ?')">
            Delete
        </button></form>
                            <!-- Modal -->
<div id="updateUserModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Update User</h2>
        <form id="updateUserForm" action="user" method="post">
            <input type="hidden" name="action" value="updateUser">
            <input type="hidden" id="userId" name="userId">
            <label for="userName">Name:</label>
            <input type="text" id="userName"  name="userName" ><br><br>
            <label for="userEmail">Email:</label>
            <input type="email" id="userEmail" style="width:500px;height:30px" name="userEmail" required>
            <!-- Add more fields as needed -->
            <button type="submit">Update</button>
        </form>
    </div>
</div>

                    </center>
                    </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <br>
        <footer>
            <div class="container">
                <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
            </div>
        </footer>
    </body>
<script>
    var modals = document.querySelectorAll('.modal');

    var updateButtons = document.querySelectorAll('.update');
    var deleteButtons = document.querySelectorAll('.delete');

    var spans = document.querySelectorAll('.close');

    updateButtons.forEach(function(button) {
        button.onclick = function() {
            var userId = this.getAttribute('data-userid');
            var userName = this.getAttribute('data-username');
            var userEmail = this.getAttribute('data-useremail');

            document.getElementById('userId').value = userId;
            document.getElementById('userName').value = userName;
            document.getElementById('userEmail').value = userEmail;

            document.getElementById('updateUserModal').style.display = "block";
        }
    });

    deleteButtons.forEach(function(button) {
        button.onclick = function() {
            var userId = this.getAttribute('data-userid');
            var userName = this.getAttribute('data-username');

            document.getElementById('deleteUserId_' + userId).value = userId;

            // Show the specific delete modal for this user
            document.getElementById('deleteUserModal_' + userId).style.display = "block";
        }
    });

    spans.forEach(function(span) {
        span.onclick = function() {
            modals.forEach(function(modal) {
                modal.style.display = "none";
            });
        }
    });

    window.onclick = function(event) {
        modals.forEach(function(modal) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        });
    }
</script>


</html>
