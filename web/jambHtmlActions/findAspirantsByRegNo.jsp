<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="com.jambApp.models.AspirantModel" %>
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
        <title>GetAspirantByRegistrationNumber</title>
    </head>
    <body>
        <p>Get Aspirants By Registration Number</p>

        <form action="" method="post">
            <label for="regno">Find By Registration Number</label>
            <input type="text" id="regno" name="regno">
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
                    try{
                        AspirantRepository aspirantRepository = new AspirantRepository();
                        if (request.getMethod().equalsIgnoreCase("POST")) {
                            String value = request.getParameter("regno");
                            AspirantModel models = aspirantRepository.findAspirantsWithRegNo(value);
                            int count = 0;
                            %>
                                <tr>
                                    <td><%=++count%></td>
                                    <td><%=models.getRegistrationNumber()%></td>
                                    <td><%=models.getFirstName()%></td>
                                    <td><%=models.getLastName()%></td>
                                    <td><%=models.getMiddleName()%></td>
                                    <td><%=models.getGender()%></td>
                                    <td><%=models.getInstitution()%></td>
                                    <td><%=models.getCourse()%></td>
                                    <td><a href="Edit.jsp?regNo = <%=models.getRegistrationNumber()%> " class="btn btn-outline-success btn--animation">Edit</a></td>
                                    <td><a href="Delete.jsp?regNo = <%=models.getRegistrationNumber()%>" class="btn btn-outline-danger btn--animation" onclick = "click()">Delete</a></td>
                                </tr>
                    <%
                        }
                    }catch (Exception throwable) {
                        out.println(throwable.getMessage());
                        }
                    %>
                </tbody>
            </table>
        </div>
        <Script src = "../javaScript/js.js"></Script>
    </body>
</html>
