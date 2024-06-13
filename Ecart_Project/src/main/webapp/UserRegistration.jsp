<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<%@include file="Component/common_css_js.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-#a3e9fc;">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="LoginPage.jsp">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card px-5">
					<div class="card-body">
					<%@include file="Component/message.jsp" %>

						<h2 class="text-center my-3">Sign Up here</h2>

						<form action="registration" method="post">

							<div class="mb-3">
								<label for="name" class="form-label">User Name</label> <input
									type="text" name="name" class="form-control" id="name"
									placeholder="Enter Your Name" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="email" name="email" class="form-control" id="email"
									placeholder="Enter Your Email" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" name="password" class="form-control" id="password"
									placeholder="Enter Your Password" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="phone_number" class="form-label">Phone
									Number</label> <input type="number" class="form-control"
									id="phone_number" name="phone_number" placeholder="Enter Your Phone Number"
									aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="address" class="form-label">Address</label>
								<textarea style="height: 180px;" class="form-control" name="address"
									placeholder="Enter Your Address"></textarea>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>

							</div>
						</form>

					</div>
				</div>


			</div>
		</div>

	</div>
</body>
</html>