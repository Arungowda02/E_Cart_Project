<%@page import="com.ecart.entity.User"%>
<%@include file="common_css_js.jsp"%>

<%
User user1 = (User) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i><span>  </span>Home</a></li>
				

			</ul>

			<ul class="navbar-nav me-right mb-2 mb-lg-0">


				<%
				if (user1 == null) {
				%>
				
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="LoginPage.jsp"><i class="fa-solid fa-user"></i> <span>     </span>Login</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="UserRegistration.jsp"><i class="fa-solid fa-user-plus"></i> <span>     </span>Register</a></li>

				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="<%=user1.getUserType().equals("admin")? "AdminPage.jsp" : "index.jsp"%>"><%=user1.getUserName()%></a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="LogoutServlet">Log Out</a></li>

				<%
				}
				%>
				<li class="nav-item active"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#cart">
					<i class="fa-solid fa-cart-shopping"></i><span>    </span><span class="cart-items">(4)</span></a></li>

			</ul>
		</div>
	</div>
</nav>