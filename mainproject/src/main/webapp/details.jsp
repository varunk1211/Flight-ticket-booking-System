<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<style>
.card-title {
  color: #262626;
  font-size: 2em;
  line-height: normal;
  font-weight: 700;
  margin-bottom: 0.5em;
}

.small-desc {
  font-size: 1.5em;
  font-weight: 400;
  line-height: 1.5em;
  color: #452c2c;
}

.small-desc {
  font-size: 1em;
}



.card1{
  display: block;
  position: relative;
  width: 400px;
  height: 400px;
  background-color: #f2f8f9;
  border-radius: 10px;
  padding: 2em 1.2em;
  margin: 12px;
  text-decoration: none;
  z-index: 0;
  overflow: hidden;
  background: linear-gradient(to bottom, #b2d8fe, #0d6efd);
 
  font-family: Arial, Helvetica, sans-serif;
}

.card1:before {
  content: '';
  position: absolute;
  z-index: -1;
  top: -16px;
  right: -16px;
  background: linear-gradient(135deg, #b2d8fe, #0d6efd);
  height: 50px;
  width: 50px;
  border-radius: 32px;
  transform: scale(1);
  transform-origin: 50% 50%;
  transition: transform 0.35s ease-out;
}

.card1:hover:before {
  transform: scale(28);
	
}

.card1:hover .small-desc{
  transition: all 0.5s ease-out;
  color: rgba(255, 255, 255, 0.8);
 
}

.card1:hover .card-title {
  transition: all 0.5s ease-out;
  color: #ffffff;

}
.me{
width: 100%;
}
.mes:hover{
 box-shadow: 0px 8px 10px 1px rgba(0, 0, 0, 0.2);
  			transform: translateY(-10px);
}
</style>
<body  >
<%-- <%
 	if(request.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
} 
	%> --%>

    <%@ include file="header.jsp" %>

       <div class=" d-flex flex-wrap  justify-content-between ">
   <% 
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            // Connect to your database
            Class.forName("com.mysql.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/flight_booking_system";
            String username = "root";
            String password = "varun@2003";
            conn = DriverManager.getConnection(jdbcUrl, username, password);
            
            // Retrieve flight details from the database
            String sql = "SELECT f.flight_number, a1.airport_name AS departure_airport, " +
                         "a2.airport_name AS arrival_airport, f.departure_datetime, " +
                         "f.arrival_datetime, f.price, f.available_seats " +
                         "FROM flights f " +
                         "JOIN airports a1 ON f.departure_airport_code = a1.airport_code " +
                         "JOIN airports a2 ON f.arrival_airport_code = a2.airport_code " +
                         "WHERE f.available_seats > 0 " +
                         "ORDER BY f.departure_datetime";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            
            // Display flight details in the table
            while (rs.next()) {
        %>
      
        <div class="card1 d-flex flex-wrap align-content-between mes">
        
		      <h5 class="card-title "><b>Flight number:</b><%= rs.getString("flight_number") %> </h5>
		      <p class="card-text small-desc"><b>departure air port:</b><%= rs.getString("departure_airport") %></p>
		      <p class="card-text small-desc"><b>arrival air port: </b><%= rs.getString("arrival_airport") %></p>
		      <p class="card-text small-desc"><b>departure date time: </b><%= rs.getTimestamp("departure_datetime") %></p>
		      <p class="card-text small-desc"><b>arrival date time:</b> <%= rs.getTimestamp("arrival_datetime") %></p>
		      <p class="card-text small-desc"><b>price :</b> <%= rs.getDouble("price") %></p>
		      <p class="card-text small-desc"><b>seat:</b><%= rs.getInt("available_seats") %> </p>
		      <a href="flightBooking.jsp?flight_id=<%=rs.getString("flight_number")%>" class="btn btn-primary me">Book</a>
		   
 		</div>
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection, statement, and result set
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (stmt != null) {
                try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
        %>
       
  <!--   </table>
     -->
     </div>
    <footer>
    <%@ include file="footer.jsp" %>
    </footer>
</body>
</html>
