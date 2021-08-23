<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.jambApp.models.AspirantModel" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/15/2021
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/edit.css">
    <title>GetAspirantBySchoolName</title>
</head>
<body>
<p>Get Aspirants By Registration Number</p>
<form action="" method="post">
    <label for="school">Find By School Name</label>
    <input type="text" id="school" name="school">
    <button type="submit" class="btn btn-primary">Get</button>
</form>

<div>
    <table class="table table-striped table-dark">
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
            try {
                AspirantRepository aspirantRepository = new AspirantRepository();
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String value = request.getParameter("school");

                    List<AspirantModel> models = aspirantRepository.findaspirantInSameSchool(value);
                    int count = 1;
                    for (AspirantModel student: models) {
    %>
                        <tr>
                            <td><%=count++%></td>
                            <td><%=student.getRegistrationNumber()%></td>
                            <td><%=student.getFirstName()%></td>
                            <td><%=student.getLastName()%></td>
                            <td><%=student.getMiddleName()%></td>
                            <td><%=student.getGender()%></td>
                            <td><%=student.getInstitution()%></td>
                            <td><%=student.getCourse()%></td>
                            <td><a href="Edit.jsp?regNo = <%=student.getRegistrationNumber()%> " class="btn btn-outline-success btn--animation">Edit</a></td>
                            <td><a href="Delete.jsp?regNo = <%=student.getRegistrationNumber()%>" class="btn btn-outline-danger btn--animation" onclick = "click()">Delete</a></td>
                        </tr>
        <%
                    }
                }
            }
            catch (Exception throwable) {
                    out.println(throwable.getMessage());
                }
    %>
            <Script src = "../javaScript/js.js"></Script>
</body>
</html>