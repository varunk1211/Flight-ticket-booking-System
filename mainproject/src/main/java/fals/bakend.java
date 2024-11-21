package fals;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.control.Booking;

@WebServlet(value="/iam")
public class bakend extends HttpServlet {
      
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Booking book=new Booking(); 
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("Email");
		String fname=request.getParameter("firstName");
		String lname=request.getParameter("lastName");
		long phone=Long.parseLong(request.getParameter("phoneNumber"));
		String flightId=request.getParameter("flightId");
		
		int finish=book.finalboooking(flightId, fname, lname, email, phone);
		
		if(finish>0) {		
			request.setAttribute("ticketid",finish);
			RequestDispatcher res=request.getRequestDispatcher("Ticket.jsp");
			res.forward(request,response);
		}
		else {
			out.println("unsuccesfull");	
		}
		
	}

}
