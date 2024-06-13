function add_to_cart(pId, pName, pPrice) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {

		let Products = [];
		let Product = { ProductId: pId, ProductName: pName, productQuantity: 1, ProductPrice: pPrice };
		Products.push(Product);
		localStorage.setItem("cart", JSON.stringify(Products));
		console.log("product is added first time");
		showToast("Product is added to cart");
	}
	else {
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.ProductId == pId)

		if (oldProduct) {
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {

				if (item.ProductId == oldProduct.ProductId) {

					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product quantity is increased");
			showToast(oldProduct.ProductName + " quantity is increased. Total Quantity = " + oldProduct.productQuantity);
		}

		else {
			let Product = { ProductId: pId, ProductName: pName, productQuantity: 1, ProductPrice: pPrice };
			pcart.push(Product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added");
			showToast("Product is added to cart");

		}

	}

	cart_update();
}


function cart_update() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("cart is empty");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h1>Cart does not have any item</h1>");
		$(".checkout-btn").addClass("disabled");
	}
	else {
		console.log(cart);

		$(".cart-items").html(`( ${cart.length} )`);


		let table = `
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
		</tr>
		</thead>
		      `;
		let totalPrice = 0;
		cart.map((item) => {
			table += `<tr>
				  <td>${item.ProductName}</td>
				  <td>${item.ProductPrice}</td>
				  <td>${item.productQuantity}</td>
				  <td>${item.productQuantity * item.ProductPrice}</td>
				  <td><button  class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.ProductId})'>Remove</button></td>
				  </tr>`

			totalPrice += item.ProductPrice * item.productQuantity;
		})


		table = table +
			`
		<tr><td colspan='5' class='text-right font-weight-bold'>Total Price : ${totalPrice}</td></tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass("disabled");
	}

}



function deleteItemFromCart(pId) {
	let cart = JSON.parse(localStorage.getItem("cart"));

	let newcart = cart.filter((item) => item.ProductId != pId);

	localStorage.setItem("cart", JSON.stringify(newcart));

	cart_update();
	showToast("Product is removed from cart");

}


function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);

	setTimeout(() => {
		$("#toast").removeClass("display");

	}, 2000)
}



$(document).ready(function() {
	cart_update();
})

function goToCheckOut() {
	window.location = "CheckOutPage.jsp";
}









