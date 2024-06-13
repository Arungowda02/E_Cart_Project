<%@page import="com.ecart.factory.HelperClass1"%>
<%@page import="com.ecart.factory.FactoryProvider"%>
<%@page import="com.ecart.dao.CategoryDao"%>
<%@page import="com.ecart.entity.User"%>
<%@page import="com.ecart.entity.Category"%>
<%@page import="java.util.*"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First");
	response.sendRedirect("LoginPage.jsp");
	return;
} else {

	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin!! please don't try to access this page");
		response.sendRedirect("LoginPage.jsp");
		return;
	}
}
%>
<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cdao.getCategories();
				
				
HashMap<String, Long> map = HelperClass1.getCount(FactoryProvider.getFactory());
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="Component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>

	<div class="container admin">
		<div class="container-fluid">
			<%@include file="Component/message.jsp"%>
		</div>

		<div class="row mt-4">

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt="users-icon"
								src="Images/group.png">
						</div>
						<h1><%=map.get("userCount") %></h1>
						<h1>Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								alt="categories-icon" src="Images/apps.png">
						</div>
						<h1><%=list.size() %></h1>
						<h1>Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								alt="product-icon" src="Images/in-stock.png">
						</div>
						<h1><%=map.get("productCount") %></h1>
						<h1>Products</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- second-row -->

		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								alt="product-icon" src="Images/add.png">
						</div>
						<p class="mt-3">Click here to add category</p>
						<h1>Add Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								alt="product-icon" src="Images/add-product.png">
						</div>
						<p class="mt-3">Click here to add products</p>
						<h1>Add Products</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- category modal start -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addProductServlet" method="post">
						<input type="hidden" name="operation" value="addCategory">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter Category" name="catTitle" required="required">
						</div>
						<div class="form-group mt-4">
							<textarea style="height: 250px;" class="form-control"
								placeholder="Enter Category description" name="catDescription"
								required="required"></textarea>
						</div>
						<div class="container text-center mt-4">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>


					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- category modal end -->

	<!-- product modal start -->


	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addProductServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addProduct">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter the title of product" name="productTitle"
								required="required">
						</div>

						<div class="form-group mt-4">
							<textarea style="height: 250px;" class="form-control"
								placeholder="Enter the product description"
								name="productDescription" required="required"></textarea>
						</div>

						<div class="form-group  mt-4">
							<input type="text" class="form-control"
								placeholder="Enter the price of product" name="productPrice"
								required="required">
						</div>

						<div class="form-group  mt-4">
							<input type="text" class="form-control"
								placeholder="Enter the discount of product"
								name="productDiscount" required="required">
						</div>

						<div class="form-group  mt-4">
							<input type="text" class="form-control"
								placeholder="Enter the quantity of product"
								name="productQuantity" required="required">
						</div>



						<div class="form-group  mt-4">
							<label>Select category</label><br> <select name="catId"
								class="form-control">
								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
								}
								%>


							</select>
						</div>

						<div class="form-group  mt-4">
							<label for="productPicture">Select product picture</label><br>
							<input type="file" id="productPicture" class="form-control"
								name="productPicture" required="required">
						</div>




						<div class="container text-center mt-4">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>


					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- product modal end -->


</body>
</html>




















