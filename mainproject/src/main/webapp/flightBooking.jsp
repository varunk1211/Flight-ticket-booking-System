<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<body>
 <%@ include file="header.jsp" %>
    <%
    // Retrieve the flight number from the URL parameter
    String flightNumber = request.getParameter("flight_id");
    %> 
    <div class="container mt-5">
    <h2>Flight Details</h2>
    <form action="iam" method="get">
        <div class="form-group">
        <input type="hidden" class="form-control" name="flightId" value=<%=flightNumber %>>
      </div>
      <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name">
      </div>
      <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name">
      </div>
      <div class="form-group">
        <label for="phoneNumber">Phone Number:</label>
        <input type="number" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number">
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email"  name="Email" placeholder="Enter email">
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>

  <!-- Bootstrap JS (optional, for certain features like dropdowns, popovers, etc.) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
     <footer>
    <%@ include file="footer.jsp" %>
    </footer>
</body>
</html>
