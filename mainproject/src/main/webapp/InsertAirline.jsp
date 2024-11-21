
<%@include file="AdmineHeader.jsp" %>
<body>

<div class="container">
    <h1>Airline Form</h1>
    <br>
    <form action="Airline" method="post">
      <div class="form-group">
        <label for="airlineId">Airline Name</label>
        <input type="text" class="form-control" id="airlineId" name="AirlineName" placeholder="Enter Airline Name">
      </div>
    <br>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
  <br>
  <br>
<footer>
<%@include file="footer.jsp" %>
</footer>

</body>
</html>