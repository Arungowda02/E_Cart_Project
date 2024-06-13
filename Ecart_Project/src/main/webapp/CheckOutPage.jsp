<%@page import="com.ecart.entity.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First to order the items");
	response.sendRedirect("LoginPage.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Out Page</title>
<%@include file="Component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body ">
						<h3 class="text-center mb-4">Your Cart items</h3>
						<div class="cart-body"></div>

					</div>
				</div>

			</div>
			<div class="col-md-6">
				<!-- form -->

				<div class="card">
					<div class="card-body ">
						<h3 class="text-center mb-4">Your details for order</h3>
						<form action="order_details" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" value="<%=user.getUserEmail()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="name" class="form-label">Your Name</label> <input
									type="text" value="<%=user.getUserName()%>"
									class="form-control" id="name">
							</div>
							<div class="form-group">
								<label for="number" class="form-label">Your contact
									number</label> <input type="text" value="<%=user.getUserPhone()%>"
									class="form-control" id="number">
							</div>
							<div class="form-group">
								<label for="address" class="form-label">Your shipping
									address</label>
								<textarea class="form-control"
									value="<%=user.getUserAddress()%>" id="address" rows="3"></textarea>
							</div>

							<div class="container text-center mt-3">
								<button type="submit" name="action" value="submit"
									class="btn btn-outline-success">Submit</button>
								<button type="submit" name="action" value="shopping"
									class="btn btn-primary">Continue shopping</button>
							</div>
						</form>


					</div>
				</div>



			</div>
		</div>
	</div>

</body>
<%@include file="Component/common_modal.jsp"%>
</html>