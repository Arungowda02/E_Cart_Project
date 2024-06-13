package com.ecart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecart.dao.DAO;
import com.ecart.entity.User;
import com.ecart.factory.FactoryProvider;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		
		DAO dao = new DAO(FactoryProvider.getFactory());
		User userByEmailAndPassword = dao.getUserByEmailAndPassword(Email, Password);
		
		if(userByEmailAndPassword == null)
		{
			session.setAttribute("message", "Invalid Email or Password !! Try Again...");
			response.sendRedirect("LoginPage.jsp");
		}
		else
		{
			session.setAttribute("current-user", userByEmailAndPassword);
			
			if(userByEmailAndPassword.getUserType().equals("admin"))
			{
				response.sendRedirect("AdminPage.jsp");
			}
			else if(userByEmailAndPassword.getUserType().equals("normal"))
			{
				response.sendRedirect("index.jsp");
			}
		}

		
		
	}

}
