package main.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


public class FlightControl {
	
	static Connection con;
	static Statement st;
	static PreparedStatement ps;
	static{
			try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_booking_system","root","varun@2003");
			 st=con.createStatement();
			} 
		catch (ClassNotFoundException se) {
			se.printStackTrace();
		} 
		catch (SQLException se) {
			// TODO Auto-generated catch block
			se.printStackTrace();
		}
	}
	
public boolean InsertAirport(String FlightId ,String AirportName,String City,String Country) {
	String insertQuarryAirport="insert into airports values('"+FlightId+"','"+AirportName+"','"+City+"','"+Country+"');";
	try {
		ps=con.prepareStatement(insertQuarryAirport);
		int result=ps.executeUpdate();
		if(result>0) {
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		try {
			ps.close();
			
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return false;
}


public boolean InsertAirline(String AirlineName) {
	String insertQuarryAirport="insert into airlines (airline_name) VALUES('"+AirlineName+"');";
	try {
		ps=con.prepareStatement(insertQuarryAirport);
		int result=ps.executeUpdate();
		if(result>0) {
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return false;
}

	
public  boolean InsertFlights(int airline, String flightnum, String depcode, String arrcode,
	        String deptim, String arrtim, double price, int seat) {
			String insertQueryFlight = "INSERT INTO flights(airline_id, flight_number, " +
			"departure_airport_code, arrival_airport_code, departure_datetime, " +
			"arrival_datetime, price, total_seats, available_seats) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try {
			ps = con.prepareStatement(insertQueryFlight);
			ps.setInt(1, airline);
			ps.setString(2, flightnum);
			ps.setString(3, depcode);
			ps.setString(4, arrcode);
			ps.setString(5, deptim);
			ps.setString(6, arrtim);
			ps.setDouble(7, price);
			ps.setInt(8, seat);
			ps.setInt(9, seat);
			
			int result = ps.executeUpdate(); // Execute the statement after setting parameters
			
			if (result > 0) {
			return true;
			}
			} catch (SQLException e) {
			e.printStackTrace();
			}
			finally {
				try {
					ps.close();
					
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return false;
		}


}
