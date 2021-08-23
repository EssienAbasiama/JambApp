<%@ page import="com.jambApp.repositories.AspirantRepository" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: ESSIEN ABASIAMA
  Date: 8/16/2021
  Time: 3:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Delete</title>
</head>
<body><%
    if (request.getMethod().equalsIgnoreCase("GET")) {
        String regNo = request.getParameter("regNo");
        try {
            AspirantRepository aspirantRepo = new AspirantRepository();
            boolean success = aspirantRepo.deleteCandidateInfo(regNo);
            if (success == true) {
                %>
            
<%
                response.sendRedirect("listAllCandidate.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }
%>

</body>
</html>