<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ include file="AdmineHeader.jsp"%>
 
<body>
<div class="container">
  <!-- Content here -->
  <table  class=" table table-striped " style="margin-top: 50px;">
			<tr>
				<th>flight id</th>
				<th>flight number</th>
				<th>number of passenger</th>
			</tr>

            <% 
            // Database connection parameters
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
                
                // Define the SQL query to retrieve flight details
                String sql = "SELECT flight_id,f.flight_number,f.total_seats - f.available_seats as passenger FROM flights f;";
                
                // Create a PreparedStatement with the query
                stmt = conn.prepareStatement(sql);
                
                // Execute the query
                rs = stmt.executeQuery();
                
                // Process the results and generate dropdown options
                while (rs.next()) {   %>
                <tr>
                 <td > <%=rs.getInt("flight_id")%> </td>
                  <td> <%= rs.getString("flight_number")%> </td>
                   <td> <%= rs.getInt("passenger")%> </td>
        		 </tr>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (rs != null) { rs.close(); }
                    if (stmt != null) { stmt.close(); }
                    if (conn != null) { conn.close(); }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
  
</table>
</div>
<footer>
<%@ include file="footer.jsp" %>
</footer>
</body>
</html>