<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>V2-AIRWAYS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" ></script>

<style>
.marquee{
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
<body>
<marquee  scrollamount="20" style="text-align:  center;background-color: red;color:white"><h2> WELCOME TO THE V2-AIRWAYS</h2></marquee>
<nav class="navbar navbar-expand-lg navbar-light bg-primary" data-bs-theme="dark">
  <a class="navbar-brand" href="#">V2-AIRWAYS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="AdminePower.jsp">Home</a>
      </li>
   
  
         <li class="nav-item">
        <a class="nav-link" href="NumberOfPassenger.jsp">Show Passengers</a>
      </li>
      
         <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       flights </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="InsertFlight.jsp">new flight</a>
          <a class="dropdown-item" href="InsertAirline.jsp">new airline</a>
            <a class="dropdown-item" href="InsertAirport.jsp">new airport</a>
            </div>
      </li>
      
      
   
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">log out</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>