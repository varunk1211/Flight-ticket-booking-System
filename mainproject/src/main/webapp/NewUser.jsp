<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" ></script>
<style type="text/css">
.container-sm{
	padding: 20px;
	border: 0.5px solid black;
}
</style>
</head>
<body>
<h2 class="text-center">new users</h2>
<div class="container-sm">
	<form action="sigin" method="post">	
	  <div class="mb-3 ">
	    <label for="exampleInputEmail1" class="form-label">Email address</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp">
	    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
	  </div>
	  <div class="mb-3">
	    <label for="exampleInputPassword1" class="form-label">Password</label>
	    <input type="password" class="form-control" name="password" id="exampleInputPassword1">
	  </div>
	   <div class="mb-3">
	    <label for="exampleInputPassword1" class="form-label">user name</label>
	    <input type="text" class="form-control"  required name="name" title="Please enter a valid string (letters only)" id="exampleInputPassword1">
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>
</body>
</html>