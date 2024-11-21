package main.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class Booking {
	
	static String url="jdbc:mysql://localhost:3306/flight_booking_system";
	static String user="root";
	static String password="varun@2003";
	static PreparedStatement ps;
	static Connection con;
	static ResultSet rs;
	static Statement stm;
static {
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	con = DriverManager.getConnection(url,user,password);
	}
	catch (ClassNotFoundException e) {
		System.out.println("Class Not Found Exception");
		}
	catch(SQLException e) {
		System.out.println("SQL exception");
	}
    
}
	public static  int BookingFlight(String fname,String lname,String email,long phoneNo )
	{
		
		String quarry="INSERT INTO passengers (first_name, last_name, email, phone) VALUES ('"+fname+"', '"+lname+"', '"+email+"', '"+phoneNo+"');";
		try{
		ps=con.prepareStatement(quarry);
		
		int result=ps.executeUpdate();
		if(result>0) {
	
			String passengerId="select passenger_id from passengers where first_name='"+fname+"' AND email='"+email+"' And phone='"+phoneNo+"'; ";
			
			stm=con.createStatement();
			rs=stm.executeQuery(passengerId);
			rs.next();
			return rs.getInt(1);
			
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}


	
	public static int flightid(String flightNumber) {
		
		String FlightId="SELECT flight_id FROM flights WHERE flight_number = '"+flightNumber+"';";
		
		try {
			stm=con.createStatement();
			rs=stm.executeQuery(FlightId);
			rs.next();
			return rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public static int bookingId(int flightid, int passengerId,String date) {
		
		try {
			
			String BookingId="insert into bookings (flight_id,passenger_id,booking_date) VALUES('"+flightid+"','"+passengerId+"','"+date+"');";
			ps=con.prepareStatement(BookingId);
			int result=ps.executeUpdate();
			if(result>0) {
				 String  BookingIdRecovery=" SELECT booking_id from bookings where flight_id='"+flightid+"' AND passenger_id='"+passengerId+"' AND booking_date='"+date+"' ;";
				 stm=con.createStatement();
					rs=stm.executeQuery(BookingIdRecovery);
					rs.next();
					return rs.getInt(1);
			
			}
				
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		

		
		return 0;
	}
	
public static int SetAvailable(int flightId){	
    String query = "UPDATE flights SET available_seats = available_seats - 1 WHERE flight_id = " + flightId;
    try {
		int rowsAffected = stm.executeUpdate(query);
		
		return rowsAffected;
	}
    
    catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    return 0;
}
	
	
	public int finalboooking(String flightid, String fname,String lname ,String email,long phone) {
		int me=flightid(flightid);
		int v=SetAvailable(me);
		
		if(v>0) {
			int s=BookingFlight(fname, lname,email,phone);
			String date=new SimpleDateFormat ("YYYY-MM-dd HH:mm:ss").format (Calendar.getInstance().getTime());
		
			
			int finish=bookingId(me,s,date);
			
			if(finish>0) {
				return finish;
			}
		}
		
		try {
			con.close();
			rs.close();
			stm.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
	


}
