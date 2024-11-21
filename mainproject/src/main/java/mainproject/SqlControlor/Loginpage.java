package mainproject.SqlControlor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.control.LoginControl;

@WebServlet(value ="/login")
public class Loginpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String radio=request.getParameter("radio");
		
		LoginControl control=new LoginControl();
		switch(radio) {
			case "user":{
					if( control.user(email,password)!=null) {
						String name=control.user(email,password);
							request.setAttribute("name",name);
							RequestDispatcher res=request.getRequestDispatcher("header.jsp");
							res.forward(request,response);	
						}
					else {
							out.println("user login failed");
						}
					break;
			}	
			
			case "admin":{
				if(control.admine(email,password)) {
					request.setAttribute("name",email);
					RequestDispatcher res=request.getRequestDispatcher("AdminePower.jsp");
					res.forward(request,response);	
			
				}
				else {
				out.println("admine login failed");
				}
			break;	
			}
		}
	}

}
