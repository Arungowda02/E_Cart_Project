<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="Component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-header text-center bg-primary text-white">
						<h2>Login here</h2>
					</div>
					<div class="card-body">
					<%@include file="Component/message.jsp" %>
						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary border-0">Submit</button>
								<button type="reset" class="btn btn-primary border-0">Reset</button>
							</div>
							<div class="container text-center mt-3">
								<p>
									If you're not registered <a href="UserRegistration.jsp">Click
										here</a>
								</p>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>