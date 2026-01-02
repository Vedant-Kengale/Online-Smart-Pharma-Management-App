<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>User Wholesaler Home</title>
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
							<a href="home.jsp" class="js-logo-clone"><%=session.getAttribute("usertype")%></a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
						<ul class="site-menu js-clone-nav d-none d-lg-block">
							<li><a data-toggle="modal"
								data-target="#SelectManufacturerModal">Select Manufacturer</a></li>
							<li><a href="#" data-toggle="modal"
								data-target="#trackOrder">Track</a></li>
						</ul>
						</nav>
					</div>

					<div class="icons">
						<a class="btb btn-warning" role="button" href="logout.jsp">${sessionScope.uemail}
							&nbsp Logout</a>
					</div>

				</div>
				<!-- End Navbar -->
			</div>

			<%
				Connection con = (Connection) application.getAttribute("myConnection");
				PreparedStatement ps1 = con.prepareStatement("select * from manufacturer where status=?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ps1.setString(1, "Active");
				ResultSet rs1 = ps1.executeQuery();
			%>

			<!-- Start Track Order -->
			<div class="modal fade" id="trackOrder" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">

							<h5 class="modal-title" id="exampleModalLabel">Track Your
								Order</h5>

							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>


						<div class="modal-body">
							<form action="UserWholesalerTrack.jsp" method="post">
								<input type="hidden" name="w_id"
									value=<%=session.getAttribute("u_id")%>>

								<div class="form-group">
									<input type="text" name="wo_id" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Track ID">
								</div>

								<button type="submit" class="btn btn-primary">Track</button>

							</form>


						</div>


					</div>
				</div>

			</div>

			<!-- End Track Order -->

			<!-- Start Select Manufacturer Modal -->

			<div class="modal fade" id="SelectManufacturerModal"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="SelectManufacturerModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="SelectManufacturerModalLabel">Select
								Manufacturer</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="ShowAllManufacturerProducts.jsp" method="post">

								<div class="mb-3">
									<select name="m_id" class="form-select"
										aria-label="Default select example">
										<option selected>Select Manufacturer ID</option>
										<%
											while (rs1.next()) {
										%>
										<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
										<%
											}
										%>

									</select>
								</div>

								<button type="submit" class="btn btn-primary">Show Me
									Product</button>

							</form>


						</div>

					</div>
				</div>
			</div>

			<!-- End Add Product Modal -->

		</div>

		<%
			//PreparedStatement ps = con.prepareStatement("select * from wproduct where w_id=?",
					//ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
			PreparedStatement ps = con.prepareStatement("select * from wproduct where w_id=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String m_id = (String) session.getAttribute("u_id");
			ps.setString(1, m_id);
			ResultSet rs = ps.executeQuery();
			int i = 1;
		%>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">Popular Products</h2>
					</div>
				</div>

				<div class="row">

					<%
						while (rs.next()) {
					%>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="<%=rs.getString(5)%>" alt="Product Image"
							class="product-img override-img"></a>
						<h3 class="text-dark">
							<a href="shop-single.html"><%=rs.getString(2)%></a>
						</h3>
						<p class="price">
							&mdash; Rs.
							<%=rs.getString(4)%>
							
							<form action="updateWPPrice.jsp" method="post">
								W.Rs. <input class="my-1" type="text" name="wprice" value="<%=rs.getString(5) %>" >
								<input type="hidden" name="wp_id" value="<%=rs.getString(1) %>" >
								<button type="submit" class="btn btn-primary cart">Update Price</button>
							</form>
						</p>
					</div>

					<%
						}
					%>

				</div>
				<div class="row mt-5">
					<div class="col-12 text-center">
						<a href="shop.html" class="btn btn-primary px-4 py-3">View All
							Products</a>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">Testimonials</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 block-3 products-wrap">
						<div class="nonloop-block-3 no-direction owl-carousel">

							<div class="testimony">
								<blockquote>
									<img src="images/person_1.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Kelly Holmes</p>
							</div>

							<div class="testimony">
								<blockquote>
									<img src="images/person_2.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Rebecca Morando</p>
							</div>

							<div class="testimony">
								<blockquote>
									<img src="images/person_3.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Lucas Gallone</p>
							</div>

							<div class="testimony">
								<blockquote>
									<img src="images/person_4.jpg" alt="Image"
										class="img-fluid w-25 mb-4 rounded-circle">
									<p>&ldquo;Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Nemo omnis voluptatem consectetur quam
										tempore obcaecati maiores voluptate aspernatur iusto eveniet,
										placeat ab quod tenetur ducimus. Minus ratione sit quaerat
										unde.&rdquo;</p>
								</blockquote>

								<p>&mdash; Andrew Neel</p>
							</div>

						</div>
					</div>
				</div>
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
								<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
									Molestiae ex ad minus rem odio voluptatem.</p>
							</div>
						</a>
					</div>
					<div class="col-lg-6 mb-5 mb-lg-0">
						<a href="#" class="banner-1 h-100 d-flex"
							style="background-image: url('images/bg_2.jpg');">
							<div class="banner-1-inner ml-auto  align-self-center">
								<h2>Rated by Experts</h2>
								<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
									Molestiae ex ad minus rem odio voluptatem.</p>
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
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Eius quae reiciendis distinctio voluptates sed dolorum excepturi
							iure eaque, aut unde.</p>
					</div>

				</div>
				<div class="col-lg-3 mx-auto mb-5 mb-lg-0">
					<h3 class="footer-heading mb-4">Quick Links</h3>
					<ul class="list-unstyled">
						<li><a href="#">Supplements</a></li>
						<li><a href="#">Vitamins</a></li>
						<li><a href="#">Diet &amp; Nutrition</a></li>
						<li><a href="#">Tea &amp; Coffee</a></li>
					</ul>
				</div>

				<div class="col-md-6 col-lg-3">
					<div class="block-5 mb-5">
						<h3 class="footer-heading mb-4">Contact Info</h3>
						<ul class="list-unstyled">
							<li class="address">203 Fake St. Mountain View, San
								Francisco, California, USA</li>
							<li class="phone"><a href="tel://919284875613">+91 92848
									75613</a></li>
							<li class="email">vedantkengale96@gmail.com</li>
						</ul>
					</div>


				</div>
			</div>
			<div class="row pt-5 mt-5 text-center">
				<div class="col-md-12">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank" class="text-primary">Vedant
							Kengale</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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

</body>

</html>