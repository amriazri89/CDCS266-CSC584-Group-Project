<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="custom" uri="com.tag" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Recruitment Management Dashboard</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Your CSS styles here */
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
            background-color: #C1145C;
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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
        }
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
        input {
            width: 500px;
            height: 10px;
        }
        .btn {
            background-color: #666;
            border: 1px solid var(--blue-dark);
            border-radius: 3px;
            color: #fff;
            display: inline-block;
            font-size: 14px;
            padding: 6px 12px;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
            min-width: 60px;
            position: relative;
            transition: color 0.1s ease;
        }
        .btn:hover {
            background-color: #414444;
        }
        select {
            color: black;
        }
    </style>
     <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/jrms"
                       user="root" password="prisma"/>
    
    <sql:query dataSource="${dbSource}" var="recruitmentCompany">
        SELECT recruitment_company.industry,COUNT(*) as count FROM recruitment_company GROUP BY industry;
    </sql:query>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(initializeChart);

        function initializeChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Industry');
            data.addColumn('number', 'Count');

            var jobVacanciesByIndustry = [
<c:forEach var="entry" items="${recruitmentCompany.rows}">
                    ['${entry.industry}', ${entry.count}]<c:if test="${!entry.last}">,</c:if>
                </c:forEach>            ];

            data.addRows(jobVacanciesByIndustry);

            var options = {
                'title': 'Company Industry Report',
                'titleTextStyle': {'fontSize': 16},
                'pieHole': 0.3,
                'tooltip': {'text': 'count'},
                'width': 800,
                'height': 400
            };

            var chart = new google.visualization.PieChart(document.getElementById('jobStatusChart'));
            chart.draw(data, options);
        }
    </script>
</head>
<body style="background-color:whitesmoke">
    <custom:navBar role="admin" session="${user != null}"/>
    <br><br><br><br>
    <div class="container">
        <div style="background-color: ; padding: 10px;">
            <div style="display: flex; align-items: center; justify-content: center;">
                <hr style="flex-grow: 1; height: 1px;">
                <span style="padding: 0 20px;color:purple;font-size:30px; font-weight: bold;">Job Recruitment Dashboard</span>
                <hr style="flex-grow: 1; height: 1px;">
            </div>
            <div class="column-child">
                <div id="jobStatusChart" style="width:800px;box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);"></div>
            </div>        
        </div>
    </div>

</body>
</html>
