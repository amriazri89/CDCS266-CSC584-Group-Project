<%-- 
    Document   : createUser
    Created on : Jun 16, 2024, 2:41:38 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="custom" uri="com.tag" %>

<html>
    <head>        <link rel="stylesheet" href="css/styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <custom:navBar role="admin" session="${user != null}"/>
        <br><br><br><br><br>
    <center><h1>Create User</h1>
        <form action="user" method="post" >
            <input type="hidden" name="action" value="createUser">
            Email :
            <input type="text" name="email" style="height:60px;width:300px"/><br><br>
            Password :
            <input type="password" style="height:60px;width:300px" name="password" /><br><br>
            Role : <select id="job-select" name="role" style="width:200px;height:60px;">
                <option value="Admin">Admin</option>
                    <option value="Company Admin">Company Admin</option>
                <option value="Candidate">Candidate</option>
            </select>
            <br><br>
            <button style="height:45px;" type="submit">Create User</button>
        </form></center> </body>
</html>
