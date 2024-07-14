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

            button.btn-active {
                background-color: #E974A5;
                color: #fff;
                border: none;
                padding: 8px 12px;
                border-radius: 3px;
                font-size: 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-right: 10px;
            }
            button.btn-active:hover {
                background-color: #C1145C ;
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
                width:500px;height:30px;
            }
            .btn  {
                background-color: #666;
                border: 1px solid var(--blue-dark);
                border-radius: 3px;
                color: #fff;
                display: inline-block;
                font-size: 14px;
                padding: 6px 12px;
                text-decoration: none;
                text-align: center;font-weight:bold;
                min-width: 60px;
                position: relative;
                transition: color 0.1s ease;
            }

            .btn:hover {
                background-color: #414444;
            }
            select {
                color: black !important;
            }

            option {
                color: black !important;
            }



        </style>
    </head>

    <body style="background-color:whitesmoke">
        <custom:navBar role="admin" session="${user != null}"/>
        <br><br><br><br>
        <div class="container">
            <h2>User List</h2>
            <form id="job-search-form" action="user" method="get">
                <input type="hidden" name="action" value="listUsers">
                <label for="job-select">
                    <h2>Filter : </h2>
                </label>
                <input type="text" placeholder="Enter Keywords..." style="width:300px;margin-top:-80px">
                &nbsp;&nbsp;
                <select id="job-select" style="width:200px;height:30px;">
                    <option value="Admin">Admin</option>
                    <option value="Company Admin">Company Admin</option>
                    <option value="Candidate">Candidate</option>
                </select>
                &nbsp;&nbsp;
                <button style="height:45px;" type="submit">Search</button>
                <button onclick="reset()" type="submit">Reset</button>
                <script>
                    function reset() {
                        window.location.href = "../JRMS/user?action=listUsers";
                    }
                </script>
            </form>
            <a href="../JRMS/createUser.jsp" style="height:45px;font-size: 18px;float:right" class="btn" type="reset">Create User</a>
            <br><br>
            <table>
                <thead>
                    <tr>
                        <th style="width:10px;"><center>No</center></th>
                <th><center>Name</center></th>
                <th><center>NoIc</center></th>
                <th><center>Phone</center></th>
                <th><center>Email</center></th>
                <th><center>Role</center></th>
                <th><center>Status</center></th>
                <th><center>Action</center></th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}" varStatus="i">
                        <tr>
                            <td><center>${i.count}</center></td>
                    <td><center>${empty user.fullname ? 'N/A' : user.fullname}</center></td>
                    <td><center>${empty user.noIc ? 'N/A' : user.noIc}</center></td>
                    <td><center>${empty user.phone ? 'N/A' : user.phone}</center></td>
                    <td><center>${empty user.email ? 'N/A' : user.email}</center></td>
                    <td><center>${empty user.role ? 'N/A' : user.role}</center></td>
                    <td><center>${empty user.status ? 'N/A' : user.status}</center></td>

                    <td>
                    <center>
                        <button class="update"
                                data-userid="${user.id}"
                                data-fullname="${user.fullname}"
                                data-nric="${user.noIc}"
                                data-phone="${user.phone}"
                                data-email="${user.email}"
                                data-role="${user.role}">
                            Update
                        </button>
                        <form action="user" method="post">
                            <input type="hidden" name="action" value="deleteUser" />
                            <input type="hidden" name="userId" value="${user.id}" />
                            <button class="delete" data-userid="${user.id}" data-username="${user.fullname}" onclick="return confirm('Are you sure want to delete this user ?')">
                                Delete
                            </button>
                        </form>
                        <form action="user" method="post">
                            <input type="hidden" name="action" value="deleteUser" />
                            <input type="hidden" name="userId" value="${user.id}" />
                            <button class="btn-active" data-userid="${user.id}" data-username="${user.fullname}" onclick="return confirm('Are you sure want to delete this user ?')">
                                ${user.status}
                            </button>
                        </form>
                        <!-- Modal -->
                        <div id="updateUserModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <h2>Update User</h2>
                                <form id="updateUserForm" action="user" method="post">
                                    <input type="hidden" name="action" value="updateUser">
                                    <input type="hidden" id="userId" name="userId">

                                    <label for="fullname">Full Name:</label>
                                    <input type="text" id="fullname" name="fullname" style="width:500px;height:30px;"><br><br>

                                    <label for="nric">NRIC:</label>
                                    <input type="text" id="nric" name="nric" style="width:500px;height:30px;"><br><br>

                                    <label for="phone">Phone:</label>
                                    <input type="text" id="phone" name="phone" style="width:500px;height:30px;"><br><br>

                                    <label for="email">Email:</label>
                                    <input type="email" id="email" name="email" style="width:500px;height:40px;border-radis:5px" required><br><br>

                                    <label for="password">Password:</label>
                                    <input type="password" id="password" name="password" style="width:500px;height:40px;border-radis:5px" required><br><br>




                                    <button type="submit" style="background-color: #666; color: #fff; border: none; padding: 10px 20px; border-radius: 3px; font-size: 15px; cursor: pointer; transition: background-color 0.3s ease;">Update</button>
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

        updateButtons.forEach(function (button) {
            button.onclick = function () {
                var userId = this.getAttribute('data-userid');
                var fullname = this.getAttribute('data-fullname');
                var nric = this.getAttribute('data-nric');
                var phone = this.getAttribute('data-phone');
                var email = this.getAttribute('data-email');

                document.getElementById('userId').value = userId;
                document.getElementById('fullname').value = fullname;
                document.getElementById('nric').value = nric;
                document.getElementById('phone').value = phone;
                document.getElementById('email').value = email;

                document.getElementById('updateUserModal').style.display = "block";
            }
        });

        spans.forEach(function (span) {
            span.onclick = function () {
                modals.forEach(function (modal) {
                    modal.style.display = "none";
                });
            }
        });

        window.onclick = function (event) {
            modals.forEach(function (modal) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            });
        }
    </script>
</html>
