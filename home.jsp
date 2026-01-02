<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Pharma &mdash; Colorlib Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
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
				<!-- Start NavBar -->
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
								<li class="active"><a href="home.jsp">Home</a></li>
								<li><a href="shop.html">Store</a></li>
								<li class="has-children"><a href="#">Login or SignUp</a>
									<ul class="dropdown">

										<li><a data-bs-toggle="modal"
											data-bs-target="#AdminSignInModal">Admin SignIn</a></li>

										<li><a data-bs-toggle="modal"
											data-bs-target="#ManufacturerSignUpModal">Manufacturer
												SignUp</a></li>
										<li><a data-bs-toggle="modal"
											data-bs-target="#WholesalerSignUpModal">Wholesaler SignUp</a></li>

										<li><a data-bs-toggle="modal"
											data-bs-target="#UsersSignInModal">User's SignIn</a></li>



									</ul></li>
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>

					<div class="icons">
						<a href="#" class="icons-btn d-inline-block js-search-open"><span
							class="icon-search"></span></a> <a href="cart.html"
							class="icons-btn d-inline-block bag"> <span
							class="icon-shopping-bag"></span> <span class="number">2</span>
						</a> <a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
							class="icon-menu"></span></a>
					</div>

				</div>
				<!-- End NavBar -->

			</div>


			<!-- Start Admin Signin Modal -->
			<div class="modal fade" id="AdminSignInModal"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="AdminSignInModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="AdminSignInModalLabel">Admin
								SignIn</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="adminLoginProcess.jsp" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">

									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="password" class="form-control"
										id="exampleInputPassword1">
								</div>

								<button type="submit" class="btn btn-primary">SignIn</button>
							</form>

							<%
								if (session.getAttribute("uname") != null && session.getAttribute("role").equals("admin")) {
									response.sendRedirect("adminHome.jsp");
									return;
								}
							%>

							<%
								if (session.getAttribute("Loginmsg") != null) {
									out.print("<div class='mt-2 alert alert-danger alert-dismissible fade show text-center' role='alert'>"
											+ "<strong>Error! - </strong>" + (String) session.getAttribute("Loginmsg") + "."
											+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
											+ "</div>");
									//out.print("<h3 class='text-center text-danger'>"+(String)session.getAttribute("Loginmsg")+"</h3>");

								}
							%>

						</div>

					</div>
				</div>
			</div>
			<!-- End Admin Signin Modal -->

			<!-- Start Manufacturer SignUp Modal -->
			<div class="modal fade" id="ManufacturerSignUpModal"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="ManufacturerSignUpModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="ManufacturerSignUpModalLabel">Manufacturer
								SignUp</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<form action="ManufacturerSignUp.jsp" method="post">
								<div class="mb-3">
									<input type="text" name="m_id" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Id">
								</div>

								<div class="mb-3">
									<input type="text" name="m_name" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Company Name">
								</div>

								<div class="mb-3">
									<input type="phone" name="phone" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter Phone Number">
								</div>

								<div class="mb-3">
									<input type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Email address">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>

								<div class="mb-3">
									<input type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Enter Strong Password">
								</div>


								<button type="submit" class="btn btn-primary">Submit</button>
							</form>

						</div>

					</div>
				</div>
			</div>
			<!-- End Manufacturer SignUp Modal -->

			<!-- Start User's Signin Modal -->
			<div class="modal fade" id="UsersSignInModal"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="UsersSignInModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="UsersSignInModalLabel">User's
								SignIn</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="UsersLoginProcess.jsp" method="post">
								<div class="mb-3">
									<select class="form-select" name="usertype"
										aria-label="Default select example">
										<option selected>Select User's</option>
										<option value="Manufacturer">Manufacturer</option>
										<option value="Wholesaler">Wholesaler</option>
									</select>
								</div>

								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">

									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="password" class="form-control"
										id="exampleInputPassword1">
								</div>

								<button type="submit" class="btn btn-primary">SignIn</button>
								<button type="reset" class="btn btn-danger">Reset</button>
							</form>

							<%
								if (session.getAttribute("uemail") != null && session.getAttribute("role").equals("user")
										&& session.getAttribute("usertype").equals("Manufacturer")) {
									response.sendRedirect("UserManufacturerHome.jsp");
									return;
								}
								else if (session.getAttribute("uemail") != null && session.getAttribute("role").equals("user")
										&& session.getAttribute("usertype").equals("Wholesaler")) {
									response.sendRedirect("UserWholesalerHome.jsp");
									return;
								}
							%>

							<%
								if (session.getAttribute("Loginmsg") != null) {
									out.print("<div class='mt-2 alert alert-danger alert-dismissible fade show text-center' role='alert'>"
											+ "<strong>Error! - </strong>" + (String) session.getAttribute("Loginmsg") + "."
											+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
											+ "</div>");
									//out.print("<h3 class='text-center text-danger'>"+(String)session.getAttribute("Loginmsg")+"</h3>");

								}
							%>

						</div>

					</div>
				</div>
			</div>
			<!-- End User's Signin Modal -->


			<!-- Start Wholesaler SignUp Modal -->
			<div class="modal fade" id="WholesalerSignUpModal"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="WholesalerSignUpModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="WholesalerSignUpModalLabel">Wholesaler
								SignUp</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<form action="WholesalerSignUp.jsp" method="post">
								<div class="row">
									<div class="mb-3 col-4">
										<input type="text" name="w_id" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter Id">
									</div>

									<div class="mb-3 col-8">
										<input type="phone" name="w_phone" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter Phone Number">
									</div>
								</div>

								<div class="row">
									<div class="mb-3 col-6">
										<input type="text" name="w_fname" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter First Name">
									</div>
									<div class="mb-3 col-6">
										<input type="text" name="w_lname" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter Last Name">
									</div>
								</div>



								<div class="mb-3">
									<input type="email" name="w_email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Email address">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>

								
								<div class="mb-3">
									<div class="row">
										<div class="col-6">
											<select name="w_country" class="form-select"
												aria-label="Default select example">
												<option selected>Select Country</option>
												<option value="India">India</option>
												<option value="USA">USA</option>
												<option value="Itali">Itali</option>
											</select>
										</div>
										
										<div class="col-6">
											<select name="w_state_country" class="form-select"
												aria-label="Default select example">
												<option selected>Select State</option>
												<option value="Maharashtra">Maharashtra</option>
												<option value="Gujarat">Gujarat</option>
												<option value="MP">MP</option>
											</select>
										</div>
									</div>
								</div>

							
								<div class="row">
								<div class="mb-3 col-8">
										<input type="text" name="w_address" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter Address">
								</div>
								
								<div class="mb-3 col-4">
										<input type="text" name="w_postal_zip" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter Postal Zip">
								</div>
								</div>
								
								<div class="mb-3">
										<input type="text" name="w_companyname" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter Company Name">
								</div>
								
								<div class="mb-3">
									<input type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Enter Strong Password">
								</div>


								<button type="submit" class="btn btn-primary">Create Account</button>
							</form>

						</div>

					</div>
				</div>
			</div>
			<!-- End Wholesaler SignUp Modal -->





		</div>




		<div class="site-blocks-cover"
			style="background-image: url('images/hero_1.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 mx-auto order-lg-2 align-self-center">
						<div class="site-block-cover-content text-center">
							<h2 class="sub-title">Effective Medicine, New Medicine
								Everyday</h2>
							<h1>Welcome To Pharma</h1>
							<p>
								<a href="#" class="btn btn-primary px-5 py-3">Shop Now</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row align-items-stretch section-overlap">
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="banner-wrap bg-primary h-100">
							<a href="#" class="h-100">
								<h5>
									Free <br> Shipping
								</h5>
								<p>
									Amet sit amet dolor <strong>Lorem, ipsum dolor sit
										amet consectetur adipisicing.</strong>
								</p>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="banner-wrap h-100">
							<a href="#" class="h-100">
								<h5>
									Season <br> Sale 50% Off
								</h5>
								<p>
									Amet sit amet dolor <strong>Lorem, ipsum dolor sit
										amet consectetur adipisicing.</strong>
								</p>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="banner-wrap bg-warning h-100">
							<a href="#" class="h-100">
								<h5>
									Buy <br> A Gift Card
								</h5>
								<p>
									Amet sit amet dolor <strong>Lorem, ipsum dolor sit
										amet consectetur adipisicing.</strong>
								</p>
							</a>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">Popular Products</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="images/product_01.png" alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Bioderma</a>
						</h3>
						<p class="price">
							<del>95.00</del>
							&mdash; $55.00
						</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<a href="shop-single.html"> <img src="images/product_02.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Chanca Piedra</a>
						</h3>
						<p class="price">$70.00</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<a href="shop-single.html"> <img src="images/product_03.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Umcka Cold Care</a>
						</h3>
						<p class="price">$120.00</p>
					</div>

					<div class="col-sm-6 col-lg-4 text-center item mb-4">

						<a href="shop-single.html"> <img src="images/product_04.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Cetyl Pure</a>
						</h3>
						<p class="price">
							<del>45.00</del>
							&mdash; $20.00
						</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<a href="shop-single.html"> <img src="images/product_05.png"
							alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">CLA Core</a>
						</h3>
						<p class="price">$38.00</p>
					</div>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="images/product_06.png" alt="Image"></a>
						<h3 class="text-dark">
							<a href="shop-single.html">Poo Pourri</a>
						</h3>
						<p class="price">
							<del>$89</del>
							&mdash; $38.00
						</p>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-12 text-center">
						<a href="shop.html" class="btn btn-primary px-4 py-3">View All
							Products</a>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section bg-light">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">New Products</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 block-3 products-wrap">
						<div class="nonloop-block-3 owl-carousel">

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_03.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_01.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_02.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

							<div class="text-center item mb-4">
								<a href="shop-single.html"> <img src="images/product_04.png"
									alt="Image"></a>
								<h3 class="text-dark">
									<a href="shop-single.html">Umcka Cold Care</a>
								</h3>
								<p class="price">$120.00</p>
							</div>

						</div>
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
								<li class="phone"><a href="tel://919284875613">+91 92848 75613</a></li>
								<li class="email">vedantkengale@gmail.com</li>
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
								href="https://colorlib.com" target="_blank" class="text-primary">Vedant Kengale</a>
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