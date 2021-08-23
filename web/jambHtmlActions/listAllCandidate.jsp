<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="com.jambApp.models.AspirantModel" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/14/2021
  Time: 5:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/edit.css">
    <title>All Candidate</title>
</head>
<body style="color: #ffffff">
    <div class = " container form-group" style = "display:flex;justify-content: space-around">
        <div class = "form-group">
            <a href="findAspirantsByRegNo.jsp" class="btn btn-outline-success btn--animation" style = "color: white">Get Aspirants By Registration Number</a>
        </div>
        <div class ="form-group">
            <a href="findAspirantsBySchoolName.jsp" class="btn btn--outline-success btn--animation" style = "color: white">Get Aspirants By School Name</a>
        </div>
    </div>
    <div>
        <table class="table" style="color:white">
            <thead>
                <tr>
                    <th scope="col">S/N</th>
                    <th scope="col">Registration Number</th>
                    <th scope="col">FirstName</th>
                    <th scope="col">LastName</th>
                    <th scope="col">Middle Name</th>
                    <th scope="col">Gender</th>
                    <th scope = "col">Instition</th>
                    <th scope = "col">Course</th>
                    <th scope = "col">Edit</th>
                    <th scope = "col">Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try{
                        AspirantRepository aspirantRepository = new AspirantRepository();
                        List<AspirantModel> students = aspirantRepository. listAllAspirant();
                        int count = 1;
                        for(AspirantModel mode : students) {

                %>

                    <tr>
                        <th><%=count++%></th>
                        <th><%=mode.getRegistrationNumber()%></th>
                        <th><%=mode.getFirstName()%></th>
                        <th><%=mode.getLastName()%></th>
                        <th><%=mode.getMiddleName()%></th>
                        <th><%=mode.getGender()%></th>
                        <th><%=mode.getInstitution()%></th>
                        <th><%=mode.getCourse()%></th>
                        <th><a href="Edit.jsp?regNo=<%=mode.getRegistrationNumber()%>" class="btn btn-primary">Edit</a></th>
                        <th><a href="Delete.jsp?regNo=<%=mode.getRegistrationNumber()%>" class="btn btn-danger" onclick = "return confirm('Are you sure you want to delete?');">Delete</a></th>
                    <%}
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }%>
                </tr>
            </tbody>
        </table>
    </div>
    <Script src = "../javaScript/js.js"></Script>
</body>
</html>