<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>V2-AIRWAYS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>
<style type="text/css">
	marquee{
	text-align: center;
	 color:white; 
	 text-transform: uppercase;
	 }
  body {
    margin: 0;
    padding: 0;
    min-height: 100vh; /* Ensure the body takes up at least the full height of the viewport */
    display: flex;
    flex-direction: column;
  }
 
  footer {
    color: #fff;
    padding: 10px 0;
    position: fixed;
    bottom: 0;
    width: 100%;
  }
	
</style>
</head>

<body >
 
<marquee class="bg-primary" scrollamount="20" style="text-align: center;color:white"><h2> WELCOME TO THE V2-AIRWAYS</h2></marquee>
<nav class="navbar navbar-expand-lg  sticky-top  text-light"style="background-color: #e3f2fd;" >
  <div class="container-fluid ">
    <a class="navbar-brand" href="#">V2-AirWays</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="HomePage.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="details.jsp">book flight</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="AboutUs.jsp">about</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " aria-disabled="true" href="login.jsp">logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav> 
</body>
</html>