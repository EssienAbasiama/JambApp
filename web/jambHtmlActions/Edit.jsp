<%@ page import="java.sql.Date" %>
<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="com.jambApp.models.AspirantModel" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/16/2021
  Time: 3:52 AM
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
    <title>Update Student</title>
</head>
<body>
<%
    if (request.getMethod().equalsIgnoreCase("GET")) {
        AspirantModel repo = null;
        try {
            String name = request.getParameter("regNo");
            AspirantRepository aspirantRepository = new AspirantRepository();
            repo = aspirantRepository.findAspirantsWithRegNo(name);
        } catch(Exception e) {
            out.println(e.getMessage());
        }
        assert repo != null;
    %>
            <form method = "post">
                <div class = form-group>
                    <label for="Regno">Registration Number</label>
                    <input type="text" id="Regno" name="Regno" value="<%=repo.getRegistrationNumber()%>" readonly>
                </div>
                <div class = form-group>
                    <label for="firstName">FirstName</label>
                    <input type="text" id="firstName" name="firstName" value="<%=repo.getFirstName()%>">
                </div>
                <div class = form-group>
                    <label for="lastName">lastName</label>
                    <input type="text" id="lastName" name="lastName" value="<%=repo.getLastName()%>">
                </div>
                <div class = "form-group">
                    <label for="middleName">Middle Name</label>
                    <input type="text" id="middleName" name="middleName" value="<%=repo.getMiddleName()%>">
                </div>
                <div class = "form-group">
                    <label for="dateOfBirth">DateOfBirth</label>
                    <input type="Date" id="dateOfBirth" name="dateOfBirth" value="<%=repo.getDateOfBirth()%>">
                </div>

                <div class = "form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" value="<%=repo.getAddress()%>">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%=repo.getEmail()%>">
                </div>
                <div class="form-group">
                    <label for="nIN">NIN</label>
                    <input type="text" id="nIN" name="nIN" value="<%=repo.getNin()%>">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <input type="text" id="gender" name="gender" value="<%=repo.getGender()%>">
                </div>

                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" value="<%=repo.getStateOfOrigin()%>">
                </div>

                <div class = "form-group">
                    <label for="institution">Institution</label>
                    <input type="text" id="institution" name="institution" value="<%=repo.getInstitution()%>">
                </div>

                <div class="form-group">
                    <label for="course">Course</label>
                    <input type="text" id="course" name="course" value ="<%=repo.getCourse()%>">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
    <%

        }

            if(request.getMethod().equalsIgnoreCase("POST")) {
                String regno = request.getParameter("Regno");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String middleName = request.getParameter("middleName");
                String date = request.getParameter("dateOfBirth");
                Date dateOfBirth =  Date.valueOf(date);
                String address = request.getParameter("address");
                String email = request.getParameter("middleName");
                String nIN = request.getParameter("nIN");
                String state = request.getParameter("state");
                String gender = request.getParameter("gender");
                String institution = request.getParameter("institution");
                String course = request.getParameter("course");

                boolean success = AspirantRepository.updateAspirant(regno,firstName,lastName, middleName,
                        dateOfBirth, address, email, nIN, gender, state,
                        institution, course);
                if (success == true) {
                    response.sendRedirect("listAllCandidate.jsp");
                }
            }
    %>
    </body>
</html>