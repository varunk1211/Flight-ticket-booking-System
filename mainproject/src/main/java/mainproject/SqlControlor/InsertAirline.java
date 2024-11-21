package mainproject.SqlControlor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.control.FlightControl;

@WebServlet(value="/Airline")
public class InsertAirline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String airlinename=request.getParameter("AirlineName");
		FlightControl fcl=new FlightControl();
		if(fcl.InsertAirline(airlinename)) {
			response.sendRedirect("succesfuly.jsp");
		}
		else {
			response.sendRedirect("UnSuccesfull.jsp");
		}
	}

}
