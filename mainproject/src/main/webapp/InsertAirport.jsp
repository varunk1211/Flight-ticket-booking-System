
<%@ include file="AdmineHeader.jsp"%>
<body>

<div class="container">
    <h1>Airport Form</h1>
    <form action="Airports" method="post">
      <div class="form-group">
        <label for="airportCode">Airport Code</label>
        <input type="text" class="form-control" id="airportCode" name="AirportCode" placeholder="Enter Airport Code" required>
      </div>
      <br>
      <div class="form-group">
        <label for="airportName">Airport Name</label>
        <input type="text" class="form-control" id="airportName" name="AirportName" placeholder="Enter Airport Name">
      </div>
      <br>
      <div class="form-group">
        <label for="city">City</label>
        <input type="text" class="form-control" id="city" name="city" placeholder="Enter City">
      </div>
      <br>
      <div class="form-group">
        <label for="country">Country</label>
        <input type="text" class="form-control" id="country" name="country" placeholder="Enter Country">
      </div>
      <br>
       <div class="mb-3">
    <button class="btn btn-primary" type="submit">Submit</button>
  		</div>
    </form>
 </div>
		<footer>
		<%@include file="footer.jsp" %>
		</footer>
		
</body>
</html>