package mainproject.SqlControlor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.control.FlightControl;

@WebServlet(value="/insertflight")
public class InsertFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int airline=Integer.parseInt(request.getParameter("airline"));
	String flightnum=request.getParameter("flightnum");
	String departure=request.getParameter("Departure");
	String arivel=request.getParameter("arivel");
	String deptim=request.getParameter("deptim");
	String arvtim=request.getParameter("arvtim");
	int seat=Integer.parseInt(request.getParameter("seat"));
	Double price=Double.parseDouble(request.getParameter("price"));
	FlightControl flt=new FlightControl();

	
	if(flt.InsertFlights(airline, flightnum, departure, arivel, deptim, arvtim, price, seat)) {
		response.sendRedirect("succesfuly.jsp");
		}
	else {
		response.sendRedirect("UnSuccesfull.jsp");
	}
	}

}
