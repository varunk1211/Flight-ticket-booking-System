package mainproject.SqlControlor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.control.LoginControl;


@WebServlet(value = "/sigin")
public class SigninPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		PrintWriter out=response.getWriter();
		LoginControl log=new LoginControl();
		if(log.signin(email,password,name)) {
			response.sendRedirect("login.jsp");
		}
		else {
			out.println("<html><body>");
			out.println("<h2>plz re enter the values</h2>");
			out.println("</html></body>");
		}
		
		
		
	}

}
