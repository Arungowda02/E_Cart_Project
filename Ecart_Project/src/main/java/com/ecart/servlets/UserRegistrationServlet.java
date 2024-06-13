package com.ecart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ecart.entity.User;
import com.ecart.factory.FactoryProvider;

@WebServlet("/registration")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegistrationServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	
	try {
		
		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		String PhoneNumber = request.getParameter("phone_number");
		String Address = request.getParameter("address");
		
		if(Name.isEmpty())
		{
			out.println("Name is empty");
			return;
		}
		

		User user = new User(Name, Email, Password, PhoneNumber, "Default.jpg", Address, "normal");	
		
		Session hibernateSession = FactoryProvider.getFactory().openSession();
		
		Transaction beginTransaction = hibernateSession.beginTransaction();
		
		int userId = (int) hibernateSession.save(user);
		
		
		beginTransaction.commit();
		
		hibernateSession.close();
		
		
		HttpSession session = request.getSession();
		session.setAttribute("message", "Hello "+Name+ "<br>Your Registration successfull !! ");
		
		response.sendRedirect("UserRegistration.jsp");
		return;
		
		
	} catch (Exception e) {
		e.printStackTrace();

	}
	
	
	
	}

}
