<%@page import="com.ecart.factory.HelperClass1"%>
<%@page import="com.ecart.entity.Category"%>
<%@page import="com.ecart.dao.CategoryDao"%>
<%@page import="com.ecart.dao.ProductDao"%>
<%@page import="com.ecart.entity.Product"%>
<%@page import="java.util.*"%>
<%@page import="com.ecart.factory.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Cart</title>
<%@include file="Component/common_css_js.jsp"%>
<%@include file="Component/common_modal.jsp"%>
<link rel="stylesheet" href="CSS/Style.css">




</head>
<body>

	<%
	String cat = request.getParameter("category");

	ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
	List<Product> productList = null;

	if (cat != null && !cat.trim().isEmpty()) {
		if (cat.trim().equals("all")) {
			productList = productDao.getAllProduct();
		} else {
			try {
		int categoryId = Integer.parseInt(cat.trim());
		productList = productDao.getAllProductByCategoryId(categoryId);
			} catch (NumberFormatException e) {
		out.println("Invalid category ID.");
			}
		}
	} else {
		// Handle case where cat is null or empty
		productList = productDao.getAllProduct();
	}

	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> categoryList = categoryDao.getCategories();
	%>
	<div class="container-fuild">
		<%@include file="Component/Navbar.jsp"%>



		<div class="row mt-2 mx-1">


			<!-- categoty -->
			<div class="col-md-2 ">
				<div class="list-group" id="list-tab" role="tablist">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active" role="tab">
						All Category </a>

					<%
					for (Category category : categoryList) {
					%>
					<a href="index.jsp?category=<%=category.getCategoryId()%>"
						class="list-group-item list-group-item-action" role="tab"><%=category.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>



			<!-- Products -->
			<div class="col-md-10">
				<div class="row row-cols-1 row-cols-md-4 g-4">
					<%
					for (Product product : productList) {
					%>

					<div class="col">
						<div class="card">
							<div class="container m-2 text-center">
								<img
									style="max-height: 200px; max-width: 100%; width: auto; height: auto;"
									src="Images/Products/<%=product.getpPhoto()%>"
									alt="<%=product.getpPhoto()%>">
							</div>

							<div class="card-body">
								<h5 class="card-title"><%=product.getpName()%></h5>
								<p class="card-text"><%=HelperClass1.get10Words(product.getpDescription())%></p>
								<div class="container"
									style="padding-left: 0px; padding-right: 0px;">
									<div class="row" style="margin-left: 0px; margin-right: 0px;">
										<div class="discount-price col"
											style="padding-left: 0px; padding-right: 0px;">
											<h4>
												&#x20B9;<%=product.getPriceAfterDiscount()%>/-
											</h4>
										</div>
										<div class="Original-price col"
											style="margin-left: 0px; padding-left: 10px; border-top-width: 0px; margin-top: 4px;">
											<h5>
												&#x20B9;<%=product.getpPrice()%></h5>
										</div>
										<div class="col"
											style="padding-left: 0px; padding-right: 0px; margin-top: 2px;">
											<p style="color: green"><%=product.getpDiscount()%>% off
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<button class="btn btn-primary"
									onclick="add_to_cart('<%=product.getpId()%>', '<%=product.getpName()%>', '<%=product.getpPrice()%>' )">Add
									to Cart</button>

							</div>
						</div>



					</div>
					<%
					}

					if (productList.size() == 0) {
					out.println("<h1>Sorry.. No item in this Category</h1>");
					}
					%>
				</div>




			</div>
		</div>


	</div>
</body>
</html>