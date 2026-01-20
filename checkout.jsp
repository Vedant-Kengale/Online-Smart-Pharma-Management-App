<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>Checkout Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">


<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="site-wrap">


		<div class="site-navbar py-2">

			<div class="search-wrap">
				<div class="container">
					<a href="#" class="search-close js-search-close"><span
						class="icon-close2"></span></a>
					<form action="#" method="post">
						<input type="text" class="form-control"
							placeholder="Search keyword and hit enter...">
					</form>
				</div>
			</div>

			<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="logo">
						<div class="site-logo">
							<a href="home.jsp" class="js-logo-clone">Pharma</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
						<ul class="site-menu js-clone-nav d-none d-lg-block">

						</ul>
						</nav>
					</div>
					<div class="icons">
						<a class="btn btn-warning" role="button" href="logout.jsp">
							${sessionScope.uemail} &nbsp Logout</a> <a href="cart.html"
							class="icons-btn d-inline-block bag"> <span
							class="icon-shopping-bag"></span> <span class="number" id="cart">2</span>
						</a> <a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none">
							<span class="icon-menu"></span>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Checkout</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">


				<form action="WholesalerOrderPlaceProcess.jsp" method="get">

					<input type="hidden" name="itemsJson" id="itemsJson"> 
					<input type="hidden" name="totalAmt" id="totalAmt">


					<%
						String u_id = (String) session.getAttribute("u_id");
						String usertype = (String) session.getAttribute("usertype");
						System.out.println(u_id);
						System.out.println(usertype);

						if (usertype.equals("Wholesaler")) {
							Connection con = (Connection) application.getAttribute("myConnection");
							PreparedStatement ps = con.prepareStatement("select * from wholesaler where w_id=?",
									ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							ps.setString(1, u_id);
							ResultSet rs = ps.executeQuery();
							//System.out.println("OK1");
							if (rs.next()) {
								//System.out.println("OK2");
					%>


					<div class="row">
						<div class="col-md-6 mb-5 mb-md-0">
							<h2 class="h3 mb-3 text-black">Billing Details</h2>
							<div class="p-3 p-lg-5 border">
								<div class="form-group">
									<label for="c_country" class="text-black">Country <span
										class="text-danger">*</span></label> <select id="c_country"
										name="wo_country" class="form-control">
										<option value="1">Select a country</option>
										<option value="<%=rs.getString(4)%>" selected><%=rs.getString(4)%>
										</option>
									</select>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_fname" class="text-black">First Name <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="c_fname" name="wo_fname"
											value="<%=rs.getString(2)%>">
									</div>
									<div class="col-md-6">
										<label for="c_lname" class="text-black">Last Name <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="c_lname" name="wo_lname"
											value="<%=rs.getString(3)%>">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black">Company
											Name </label> <input type="text" class="form-control"
											id="c_companyname" name="wo_companyname"
											value="<%=rs.getString(5)%>">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_address" class="text-black">Address <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="c_address" name="wo_address"
											placeholder="Street address" value="<%=rs.getString(6)%>">
									</div>
								</div>



								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_state_country" class="text-black">State
											/ Country <span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="c_state_country"
											name="wo_state_country" value="<%=rs.getString(7)%>">
									</div>
									<div class="col-md-6">
										<label for="c_postal_zip" class="text-black">Postal /
											Zip <span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="c_postal_zip"
											name="wo_postal_zip" value="<%=rs.getString(8)%>">
									</div>
								</div>

								<div class="form-group row mb-5">
									<div class="col-md-6">
										<label for="wo_email_address" class="text-black">Email
											Address <span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="c_email_address"
											name="wo_email_address" value="<%=rs.getString(9)%>">
									</div>
									<div class="col-md-6">
										<label for="c_phone" class="text-black">Phone <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="c_phone" name="wo_phone"
											placeholder="Phone Number" value="<%=rs.getString(10)%>">
									</div>
								</div>


								<div class="form-group">
									<label for="c_order_notes" class="text-black">Order
										Notes</label>
									<textarea name="wo_order_notes" id="c_order_notes" cols="30"
										rows="5" class="form-control"
										placeholder="Write your notes here..."></textarea>
								</div>

							</div>
						</div>
						<div class="col-md-6">



							<div class="row mb-5">
								<div class="col-md-12">
									<h2 class="h3 mb-3 text-black">Your Order</h2>
									<div class="p-3 p-lg-5 border">
										<table class="table site-block-order-table mb-5">
											<thead>
												<th>Product</th>
												<th>Total</th>
											</thead>
											<tbody id="items">

											</tbody>
										</table>




										<div class="border mb-3">


											<div class="collapse" id="collapsebank">
												<div class="py-2 px-4">
													<p class="mb-0">Make your payment directly into our
														bank account. Please use your Order ID as the payment
														reference. Your order won’t be shipped until the funds
														have cleared in our account.</p>
												</div>
											</div>
										</div>

										<div class="border mb-3">

											

											<div class="collapse" id="collapsecheque">
												<div class="py-2 px-4">
													<p class="mb-0">Make your payment directly into our
														bank account. Please use your Order ID as the payment
														reference. Your order won’t be shipped until the funds
														have cleared in our account.</p>
												</div>
											</div>
										</div>

										<div class="border mb-5">


											<div class="collapse" id="collapsepaypal">
												<div class="py-2 px-4">
													<p class="mb-0">Make your payment directly into our
														bank account. Please use your Order ID as the payment
														reference. Your order won’t be shipped until the funds
														have cleared in our account.</p>
												</div>
											</div>
										</div>

										<div class="form-group">
											<button class="btn btn-primary btn-lg btn-block"
												type="submit">Place Order</button>
										</div>

										<%
											}
											}
										%>

									</div>
								</div>
							</div>

						</div>
					</div>

					<!-- </form> -->

				</form>

			</div>
		</div>


		<div class="site-section bg-secondary bg-image"
			style="background-image: url('images/bg_2.jpg');">
			<div class="container">
				<div class="row align-items-stretch">
					<div class="col-lg-6 mb-5 mb-lg-0">
						<a href="#" class="banner-1 h-100 d-flex"
							style="background-image: url('images/bg_1.jpg');">
							<div class="banner-1-inner align-self-center">
								<h2>Pharma Products</h2>
								<p>Genuine medicines and healthcare essentials from trusted pharmacies.
                                   Quality-checked, safe, and reliable.</p>
							</div>
						</a>
					</div>
					<div class="col-lg-6 mb-5 mb-lg-0">
						<a href="#" class="banner-1 h-100 d-flex"
							style="background-image: url('images/bg_2.jpg');">
							<div class="banner-1-inner ml-auto  align-self-center">
								<h2>Rated by Experts</h2>
								<p>Medicines reviewed by certified healthcare professionals.
                                   Trusted recommendations you can rely on.</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>


		<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

					<div class="block-7">
						<h3 class="footer-heading mb-4">About Us</h3>
						<p>A digital pharma management platform focused on efficient medicine ordering, inventory control, and customer handling. 
						   Online Pharma Management System is a JSP-based web application built to deliver secure operations, improved accuracy, 
						   and a smooth user experience for pharmacies and users.</p>
					</div>

				</div>
				<div class="col-lg-3 mx-auto mb-5 mb-lg-0">
					<h3 class="footer-heading mb-4">Quick Links</h3>
					<ul class="list-unstyled">
						<li><a href="mailto:vedantkengale96@gmail.com" aria-label="Gmail">Gmail</a></li>
						<li><a href="https://linkedin.com/in/vedant-kengale" aria-label="LinkedIn">LinkedIn</a></li>
						<li><a href="https://github.com/Vedant-Kengale" aria-label="Github">Github</a></li>
						<li><a href="https://www.instagram.com/vedant_kengale_5126/" aria-label="Instagram">Instagram</a></li>
					</ul>
				</div>

				<div class="col-md-6 col-lg-3">
					<div class="block-5 mb-5">
						<h3 class="footer-heading mb-4">Contact Info</h3>
						<ul class="list-unstyled">
							<li class="address">203 Fake St. Mountain View, San
								Francisco, California, USA</li>
							<li class="phone"><a href="tel://919284875613">+91 92848 75613</a></li>
							<li class="email">vedantkengale96@gmail.com</li>
						</ul>
					</div>


				</div>
			</div>
			<div class="row pt-5 mt-5 text-center">
				<div class="col-md-12">
					<p>
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | Made 
						<i aria-hidden="true"></i> by 
						<a href="https://my_portfolio.com" target="_blank" class="text-primary">Vedant Kengale</a>
					</p>
				</div>

			</div>
		</div>
		</footer>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
		crossorigin="anonymous"></script>

	<script>
		console.log("Hi!!!")
		
		
		if (localStorage.getItem('cart')==null)
		{
			console.log("Empty Cart!!!")
			var cart = {};
		}
		else
		{
			console.log("Not Empty Cart!!!")
			cart = JSON.parse(localStorage.getItem('cart'));
			updateCart(cart);
		}
		
		
		//Add To Cart or Cart Listener 
		
		
		function updateCart(cart)
		{
			console.log("Call Update Function!!!");
			
			//cart {'prmp_1':[1,'BD',100] , 'prmp_2':[2,'N',100]}
			
			let sum=0;
			let total=0;
			for(item in cart) //item='prmp_2'
			{
				//sum += cart[item][0]; //sum=3
				let qty = cart[item][0];
		        let name = cart[item][1];
		        let price = cart[item][2];
		        
		        total= total + (qty*price);
		        sum = sum + qty;
		        
		        console.log("qty "+ qty);
		        console.log("name "+ name);
		        console.log("price "+ price);
		        
		        mystr = `<tr>
                
              <td class="product-name">
                <h2 class="h5 text-black">\${name}</h2>
              </td>
              
              
              <td>Rs.\${qty*price}</td>
              
            </tr>`;
		        
		        $('#items').append(mystr);
				console.log(mystr);
				
				
				
			}
			
			$('#items').append(`<tr>
            
            <td class="product-name">
              <h2 class="h5 text-black">Total</h2>
            </td>
            
            
            <td>Rs.\${total}</td>
            
          </tr>`);
			
			let cartWithoutImage = {};

			for (let key in cart) {
			  // Copy first 3 elements (exclude image path)
			  cartWithoutImage[key] = cart[key].slice(0, 3);
			}

			console.log(cartWithoutImage);
			
			$('#itemsJson').val(JSON.stringify(cartWithoutImage));
			$('#totalAmt').val(total);
			
		}
		
		
	</script>
</html>
