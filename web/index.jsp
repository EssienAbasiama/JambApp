<%@ page import="com.jambApp.repositories.AdminRepository" %>
<%@ page import="java.sql.SQLException" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/edit.css">

        <title>Jamb Admin Form</title>
    </head>
    <body>
        <div style = "padding-top:2%; margin-bottom: 4%;margin-left: 30%">
            <div class="card " style="background-color:white;color:black ;width: 30rem;padding: 2%;">
                <div class="card-body">
                    <div class = "container-md">
                        <form method = "post">
                            <div class="form-group">
                                <p>Admin Login Form</p>
                            </div>
                            <div class="form-group">
                                <label for="Email">Email</label>
                                <input type="Email" name = "Email" class="form-control" id="Email" placeholder="Email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" id="password" placeholder="password" required>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-primary">submit</button>
                            </div>
                        </form>
                        <%
                            try {
                                if(request.getMethod().equalsIgnoreCase("POST")) {
                                    AdminRepository valid;
                                    try {
                                        valid = new AdminRepository();
                                        String eMail = request.getParameter("Email");
                                        String passWord = request.getParameter("password");
                                        boolean success = AdminRepository.validation(eMail,passWord);
                                        if(success == true){
                                            response.sendRedirect("Home.jsp");
                                        }
                                    } catch (SQLException throwables) {
                                        throwables.printStackTrace();
                                    }
                                };
                            }catch (ClassNotFoundException e) {
                                e.printStackTrace();
                        }%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>