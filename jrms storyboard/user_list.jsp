<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="css/styles.css">
    <!-- Add any additional styles as needed -->
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: grey;
            color:white;
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


    </style>
</head>

<body style="background-color:whitesmoke">
    <nav>
        <div class="container">
            <img src="image/job.png" alt="Background Image" style="margin-left:-200px;width:100px;height:68px;">

            <h1 style="margin-left:-700px;;">Job Recruitment <span style="color:blue;font-size:12px;">by vintech</span>
            </h1>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="listofcompany.html">Company List</a></li>
                <li><a href="user_list.html">User List</a></li>

            </ul>
        </div>
    </nav><br><br><br><br>
    <div class="container">
        <h2>User List</h2>

        <form id="job-search-form">

            <label for="job-select">
                <h2>Select a Job:</h2><br>
            </label>
            <input type="text" placeholder="Enter Keywords..." style="width:300px;" />
            &nbsp;&nbsp;
            <select id="job-select" style="width:200px;height:60px;">
                <option value="Accounting">Admin</option>
                <option value="Administration & Office Support">Company Admin</option>
                <option value="Advertising, Art & Media">Candidate</option>
            </select>

            &nbsp;&nbsp;

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button style="height:45px;" type="submit">Search</button>
            <button  style="height:45px;" type="submit" onclick="resetForm()">Reset</button>
        </form>
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
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>john@example.com</td>
                    <td>Active</td>
                    <td>Company User</td>
                    <td>                    
                        <center><button class="update"  onclick="update('${company.name}')">Update</button>
                         <button class="default" onclick="update('${company.name}')">Inactive</button>
                     </center> </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>jane@example.com</td>
                    <td>Active</td>
                    <td>Company Admin</td>
                    <td>                    
                       <center><button class="update"  onclick="update('${company.name}')">Update</button>
                        <button class="default" onclick="update('${company.name}')">Inactive</button>
                    </center> </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Michael Johnson</td>
                    <td>michael@example.com</td>
                    <td>Active</td>
                    <td>Admin</td>
                    <td>                    
                        <center><button class="update"  onclick="update('${company.name}')">Update</button>
                         <button class="default" onclick="update('${company.name}')">Inactive</button>
                     </center> </td>
                </tr>
                <!-- Add more rows for each user -->
                <tr>
                    <td>4</td>
                    <td>Emily Brown</td>
                    <td>emily@example.com</td>
                    <td>Active</td>
                    <td>Company User</td>
                    <td>                    
                        <center><button class="update"  onclick="update('${company.name}')">Update</button>
                         <button class="default" onclick="update('${company.name}')">Inactive</button>
                     </center> </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>David Wilson</td>
                    <td>david@example.com</td>\
                    <td>Active</td>
                    <td>Company Admin</td>
                    <td>                    
                        <center><button class="update"  onclick="update('${company.name}')">Update</button>
                         <button class="default" onclick="update('${company.name}')">Inactive</button>
                     </center> </td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>Emma Thompson</td>
                    <td>emma@example.com</td>
                    <td>Inactive</td>
                    <td>Admin</td>
                    <td>                    
                        <center><button class="update"  onclick="update('${company.name}')">Update</button>
                         <button class="default" onclick="update('${company.name}')">Active</button>
                     </center> </td>
                </tr>
                <!-- Add more rows for each user -->
                <!-- Repeat until you have 20 rows -->
            </tbody>
        </table>
    </div>
    <br>
    <footer>
        <div class="container">
            <p>&copy; 2024 Job Recruitment System. All rights reserved.</p>
        </div>
    </footer>

    <!-- Add any scripts or additional content -->
</body>

</html>