<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

  <%@ include file="header.jsp" %>
  <style>
    .ticket {
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 10px;
      margin: 20px auto;
      max-width: 600px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .ticket-details {
      font-size: 18px;
      margin-bottom: 10px;
    }
   
    
  </style>
</head>
<body style="background-image: url('image/im5.jpg'); background-size:cover; height:900px;">
 
        <% 
        // Define database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/flight_booking_system";
        String username = "root";
        String password = "varun@2003";
        
        // Initialize variables
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Connect to the database
            conn = DriverManager.getConnection(jdbcUrl, username, password);
            
            // Define the SQL query to retrieve booking details
            String sql = "SELECT b.booking_id, f.flight_number, " +
                         "a1.airport_name AS departure_airport, " +
                         "a2.airport_name AS destination_airport, " +
                         "f.departure_datetime, f.arrival_datetime, " +
                         "p.first_name, p.last_name, p.email, p.phone " +
                         "FROM bookings b " +
                         "JOIN flights f ON b.flight_id = f.flight_id " +
                         "JOIN airports a1 ON f.departure_airport_code = a1.airport_code " +
                         "JOIN airports a2 ON f.arrival_airport_code = a2.airport_code " +
                         "JOIN passengers p ON b.passenger_id = p.passenger_id " +
                         "WHERE b.booking_id = ?";
            
            // Create a PreparedStatement with the query
            stmt = conn.prepareStatement(sql);
            
            // Set the parameter for the booking ID
             stmt.setInt(1, (int)request.getAttribute("ticketid")) ;// Change 9 to your actual booking ID
            
            // Execute the query
            rs = stmt.executeQuery();
            
            // Process the results
            while (rs.next()) {
                // Retrieve booking details
                int bookingId = rs.getInt("booking_id");
                String flightNumber = rs.getString("flight_number");
                String departureAirport = rs.getString("departure_airport");
                String destinationAirport = rs.getString("destination_airport");
                Timestamp departureDatetime = rs.getTimestamp("departure_datetime");
                Timestamp arrivalDatetime = rs.getTimestamp("arrival_datetime");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
        %>
     		  
    <div class="container" id="textToDownload">
    <div class="ticket bg-light">
      <h2 class="text-center mb-4">Ticket Details</h2>
      <div class="ticket-details">
      
	    <p><strong>Booking Id:</strong> <%= bookingId %></p>
      	<p><strong>Name:</strong> <%= firstName + " " + lastName %> </p>
        <p><strong>Flight Number:</strong> <%= flightNumber %></p>
        <p><strong>Departure Airport:</strong> <%= departureAirport %></p>
        <p><strong>Destination Airport:</strong> <%= destinationAirport %></p>
        <p><strong>Departure Date/Time:</strong> <%= departureDatetime %></p>
        <p><strong>Arrival Date/Time:</strong> <%= arrivalDatetime %> </p>
        <p><strong>Email:</strong> <%= email %> </p>
        <p><strong>Phone:</strong> <%= phone %></p>
      </div>
    </div>
  </div>
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (rs != null) { rs.close(); }
            if (stmt != null) { stmt.close(); }
            if (conn != null) { conn.close(); }
        }
        %>
     <div class="d-grid gap-2 col-6 mx-auto  d-md-flex justify-content-md-end">   
     <button id="downloadBtn"  class="btn btn-outline-primary ">Download</button>
     
     </div>
     <BR>
     <br>
     <br>
     <br>
     
     
      <footer>
    <%@ include file="footer.jsp" %>
    </footer>
     
     
<script src="js/html2canva.js"></script>
<script>
document.getElementById('downloadBtn').addEventListener('click', function() {
    // Capture the text content as an image
    html2canvas(document.getElementById('textToDownload')).then((canvas) => {
        // Convert canvas to PNG image
        var image = canvas.toDataURL('image/png');

        // Create a link element
        var downloadLink = document.createElement('a');
        downloadLink.href = image;
        downloadLink.download = 'flightTicket.png';

        // Append the link to the body
        document.body.appendChild(downloadLink);

        // Click the link to trigger download
        downloadLink.click();

        // Remove the link from the body
        document.body.removeChild(downloadLink);
    });
});
</script>   
        
        
        
        
          
</body>
</html>
