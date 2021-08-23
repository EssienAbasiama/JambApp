<%@ page import="java.sql.Date" %>
<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %><%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/14/2021
  Time: 3:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/edit.css">
    <title>JambForm Registration</title>
</head>
<body>
    <form method="post">
        <div class = form-group>
            <label for="firstName">FirstName</label>
            <input type="text" id="firstName" name="firstName">
        </div>
            <div class = "form-group">
                <label for="lastName">lastName</label>
                <input type="text" id="lastName" name="lastName">
            </div>
            <div class = "form-group">
                <label for="middleName">Middle Name</label>
                <input type="text" id="middleName" name="middleName">
            </div>
            <div class = "form-group">
                <label for="dateOfBirth">Date Of Birth</label>
                <input type="Date" id="dateOfBirth" name="dateOfBirth">
            </div>
            <div class = "form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="nIN">NIN</label>
                <input type="text" id="nIN" name="nIN">
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" id="state" name="state">
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <input type="text" id="gender" name="gender">
            </div>
            <div class = "form-group">
                <label for="institution">Institution</label>
                <input type="text" id="institution" name="institution">
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <input type="text" id="course" name="course">
            </div>
            <div>
                <button type="submit" class="btn btn-primary">submit</button>
            </div>
    </form>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String middleName = request.getParameter("middleName");

    String date = request.getParameter("dateOfBirth");
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat format = new SimpleDateFormat(pattern);
    java.util.Date date1 = format.parse(date);
    Date dateOfbirth  = new Date(date1.getTime());

    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String nIN = request.getParameter("nIN");
    String state = request.getParameter("state");
    String gender = request.getParameter("gender");
    String institution = request.getParameter("institution");
    String course = request.getParameter("course");

    AspirantRepository aspirantRepository = new AspirantRepository();
     boolean success = aspirantRepository.registerAspirants(firstName, lastName, middleName,
            dateOfbirth, address, email, nIN, gender, state,
            institution, course);
     if (success == true) {
         %>
    <Script>
        alert("registration successful");
    </Script>
    <%
         response.sendRedirect("../Home.jsp");
    } else {
         out.println("An Error Occurred, check Your Inputs");
     }
}%>
</body>
</html>
