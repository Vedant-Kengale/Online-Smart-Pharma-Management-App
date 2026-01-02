<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>All Manufacturer Product Page</title>
<meta charset="utf-8">
<!-- 9 Project.webm //17.48 -->
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

<style type>
.mydisabled {
	pointer-events: none;
}
</style>
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
						</ul>
						</nav>
					</div>

					<div class="icons">
						<a class="btb btn-warning" role="button" href="logout.jsp">${sessionScope.uemail}
							&nbsp Logout</a>
					</div>

					<a href="cart.jsp" class="icons-btn d-inline-block bag" id="carta">
						<span class="icon-shopping-bag"></span> <span class="number"
						id="cart"></span>
					</a>

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
										<option value="<%=rs1.getString(1)%>">
											<%=rs1.getString(1)%>
										</option>
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
			PreparedStatement ps = con.prepareStatement("select * from mproduct where m_id=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String m_id = request.getParameter("m_id");
			session.setAttribute("m_id", m_id);
			ps.setString(1, m_id);
			ResultSet rs = ps.executeQuery();

			//PreparedStatement ps1 = con.prepareStatement("select * from wholesaler", ResultSet.TYPE_SCROLL_SENSITIVE,
			//	ResultSet.CONCUR_UPDATABLE);
			//ResultSet rs1 = ps1.executeQuery();
			int i = 1;
		%>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-uppercase">
							Popular
							<%=request.getParameter("m_id")%>
							Products
						</h2>
					</div>
				</div>

				<div class="row">

					<%
						while (rs.next()) {
					%>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> <img
							src="<%=rs.getString("image")%>" alt="Product Image"
							id="img<%=rs.getString(1)%>" class="product-img override-img"></a>
						<h3 class="text-dark">
							<a href="shop-single.html"> <span
								id="name<%=rs.getString(1)%>"> <%=rs.getString(2)%>
							</span>
							</a>
						</h3>
						<p class="price">
							&mdash; Rs. <span id="price<%=rs.getString(1)%>"> <%=rs.getString(4)%>
							</span>
						</p>
						<span id="divpr<%=rs.getString(1)%>" class="divpr">

							<button id="pr<%=rs.getString(1)%>" class="btn cart"
								style="background-color: #FFD700;">Add To Cart</button>

						</span>
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

	<script>
	
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
		$('.cart').click(  function() 
		{
			var idstr = this.id.toString();
			console.log(idstr);
			
			if(cart[idstr] != undefined)//cart['prmp_1']  != undefined	undefined != undefined
			{
				cart[idstr][0] += 1 ; // cart {'prmp_1':[2,'BD','100']}
			}
			else
			{
				//Empty cart{}
				qty = 1;
				a = idstr.slice(2);// prmp_1	=> mp_1
				console.log("ID : " , a);//mp_1
				name = document.getElementById('name' + a).innerHTML;
				console.log("Name : " , name);//mp_1
				price = parseInt(document.getElementById('price' + a).innerHTML);
				console.log("Price : " , price);//mp_1
				imgSrc = document.getElementById('img' + a).src; 
				
				cart[idstr] = [ qty, name, price,imgSrc ]; // cart {'prmp_1':[1,'BD',100] , 'prmp_2':[1,'N',100]}				
			}
			console.log("After Add product : ", cart);
			updateCart(cart);
			
		});
		
		
		$('.divpr').on("click", "button.minus", function() {
			a = this.id.slice(7);//minusprmp_1  minusprmp_2  minusprmp_3  minusprmp_4  
			cart['pr' + a][0] = cart['pr' + a][0] - 1;
			//				= 0-1=-1
			cart['pr' + a][0] = Math.max(0, cart['pr' + a][0]);
			document.getElementById('valpr' + a).innerHTML = cart['pr' + a][0];
			updateCart(cart);
		});
		$('.divpr').on("click", "button.plus", function() {
			a = this.id.slice(6);
			cart['pr' + a][0] = cart['pr' + a][0] + 1;
			document.getElementById('valpr' + a).innerHTML = cart['pr' + a][0];
			updateCart(cart);
		});
		
		function updateCart(cart)
		{
			console.log("Call Update Function!!!");
			
			//cart {'prmp_1':[1,'BD',100] , 'prmp_2':[2,'N',100]}
			
			let sum=0;
			for(item in cart) //item='prmp_2'
			{
				sum += cart[item][0]; //sum=3
				//divprmp_1
				if(cart[item][0]!=0) // 1 != 0
				{
					document.getElementById('div'+item).innerHTML="<button id=minus"+item +" class='btn btn-primary minus' style='background-color: #FFD700; color: black;'>-</button>"+
				"<span id=val"+item+"> "+cart[item][0]+" </span> <button id=plus"+item +" class='btn btn-primary plus' style='background-color: #FFD700; color: black;'>+</button>";
				}
				else
				{
					console.log('OK');
					document.getElementById('div'+item).innerHTML="<button id="+item+" class='btn cart' style='background-color: #FFD700;'>Add To Cart</button>";
					delete cart[item];
				}
			}
			
			if(sum==0)
			{
				const element = document.getElementById("carta");
				element.classList.add("mydisabled");
			}
			else
			{
				const element = document.getElementById("carta");
				element.classList.remove("mydisabled");
			} 
			
			document.getElementById('cart').innerHTML = sum;
			
			//cart Object Convert String
			localStorage.setItem('cart', JSON.stringify(cart));
		}
		
	</script>

</body>

</html>