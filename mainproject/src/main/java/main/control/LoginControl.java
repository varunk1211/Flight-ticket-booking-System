package main.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginControl {
	static Connection con;
	static ResultSet rs;
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
	
public String user( String email, String password) 
	{
			String ShowQuarry="select * from users where email='"+email+"' and  password='"+password+"';";
			 try {
				rs=st.executeQuery(ShowQuarry);
				if(rs.next()) {
					  return rs.getString(2);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return null;
	}
	
public  boolean admine( String email, String password)  {
		 String AdmineQuarry="select * from admins where email='"+email+"' and  password='"+password+"';" ;
		 try {
			rs=st.executeQuery(AdmineQuarry);

			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return  false;
	}


public boolean signin(String email,String password,String name)  {
	String insertQuarry="INSERT INTO users(username,password,email) VALUES('"+name+"','"+password+"','"+email+"');";
	try {
		ps=con.prepareStatement(insertQuarry);
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

}
