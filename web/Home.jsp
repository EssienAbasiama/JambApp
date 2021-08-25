  <%-- Created by IntelliJ IDEA. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>

  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/style.css">
      <title>Home</title>
  </head>
  <body>
  <div style = "padding:3px ;padding-top:unset;font-size: 2vh" >
      <ul class="nav nav-pills nav-justified btn-success" style="position: sticky; margin-bottom: 50px">
          <li class="nav-item" style = "color: white">
              <a class="nav-link btn-success " href="jambHtmlActions/register.jsp">Register Candidate</a>
          </li>
          <li class="nav-item" style = "color: white">
              <a class="nav-link" style = "color: white" href="jambHtmlActions/listAllCandidate.jsp">View All candidate</a>
          </li>
          <li class="nav-item">
              <a class="nav-link " href="" style = "color: white">AboutUs</a>
          </li>
          <li class="nav-item">
              <a class="nav-link " href="#" tabindex="-1" aria-disabled="true" style = "color: white">Our Management</a>
          </li>
      </ul>
  </div>
  <header class="header">
      <div class="header__logo-box">

          <img src="images/images1.png" alt="logo" class="header__logo">
      </div>
      <div class = "header__text-box">
          <h1 class="heading-primary">
              <span class = "heading-primary--main"><Strong>Jamb</Strong>App</span>
              <span class="heading-primary--sub">Joint Admissions Matric. </span>
          </h1>
          <a href="#" class="btn btn--white btn--animation">Discover Our App</a>
      </div>
  </header>

  </body>
  </html>