package mainproject.SqlControlor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.control.FlightControl;

@WebServlet(value="/Airports")
public class InsertAirport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String airportCode=request.getParameter("AirportCode");
		String AirportName=request.getParameter("AirportName");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		FlightControl flc=new FlightControl();
		
		if(flc.InsertAirport(airportCode, AirportName, city, country)) {
			response.sendRedirect("succesfuly.jsp");
		}
		else{
			response.sendRedirect("UnSuccesfull.jsp");
		}
	}

}
