
<%@ include file="AdmineHeader.jsp"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<body>
   <div class="container">
        <h1>Flight Form</h1>
        <form action="insertflight"  method="post">
        
        <div class="form-group">
        <label for="flightnumber">Flight Number</label>
        <input type="text" class="form-control" name="flightnum"id="flightnumber" placeholder="Enter flight number">
      </div>
         <br>
        
            <div class="form-group">
                <label for="departureCity">Departure City</label>
                <select class="form-control" name="Departure"  id="departureCity">
      <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_booking_system", "root", "varun@2003");
                String sql = "SELECT airport_name ,airport_code FROM airports;";
                PreparedStatement stmt = conn.prepareStatement(sql);
                   ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                         
                      %>
                      
			<option value="<%=rs.getString("airport_code")%>"><%= rs.getString("airport_name")%></option>            		 <% }
                  
            		 %> 
                </select>
               
              <br>
            </div>
            <div class="form-group">
                <label for="arrivalCity">Arrival City</label>
                <select class="form-control" name="arivel" id="arrivalCity">
               
           <%
           ResultSet rsm = stmt.executeQuery();
           while(rsm.next()){ %>
                	<option value="<%=rsm.getString("airport_code")%>"><%= rsm.getString("airport_name")%></option>     
           <% }%>
           
           </select> 
            </div>
            <br>
           <div class="form-group">
           <label for="airline">Airline</label>
           <select class="form-control" name="airline" id="airline">
           <%
           String air="Select airline_name ,airline_id from airlines;";
      		PreparedStatement stm = conn.prepareStatement(air);   
           ResultSet rst = stm.executeQuery();
           while(rst.next()){
        	   
        	   
            %>
           
  						<option value="<%=rst.getInt("airline_id")%>"><%= rst.getString("airline_name")%></option>     
        
           
           <% }
           // Close the connection, statement, and result set
           if (rs!=null && rsm!=null) {
               try { rs.close();  rsm.close();} catch (SQLException e) { e.printStackTrace(); }
           }
           if (stmt != null && stm!=null ) {
               try { stmt.close(); stm.close();} catch (SQLException e) { e.printStackTrace(); }
           }
           if (conn != null  ) {
               try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
           }
           
            }
    
      catch (Exception e) {
          e.printStackTrace();
      } 
      %>   
            </select> 
            </div>
            
           <br>
            <div class="form-group">
        <label for="departureDateTime">Departure Date/Time</label>
        <input type="datetime-local" class="form-control" name="deptim" id="departureDateTime">
      </div>
      <br>
      <div class="form-group">
        <label for="arrivalDateTime">Arrival Date/Time</label>
        <input type="datetime-local" class="form-control" name="arvtim" id="arrivalDateTime">
      </div>
      <br>
      <div class="form-group">
        <label for="price">Price</label>
        <input type="number" class="form-control"  name="price" id="price" placeholder="Enter Price">
      </div>
      <br>
      <div class="form-group">
        <label for="totalSeats">Total Seats</label>
        <input type="number" class="form-control" name="seat" id="totalSeats" placeholder="Enter Total Seats">
      </div>
         <br>
         
            <!-- Other form fields -->
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <footer>
    <%@include file="footer.jsp" %>
    </footer>
</body>
</html>






