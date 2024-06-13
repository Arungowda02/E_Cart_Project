package com.ecart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order_details")
public class OrderDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderDetails() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String action = request.getParameter("action");

		if ("submit".equals(action)) {
			response.sendRedirect("OrderDetailsPage.jsp");
		} else if ("shopping".equals(action)) {
			response.sendRedirect("index.jsp");
		}

	}

}
