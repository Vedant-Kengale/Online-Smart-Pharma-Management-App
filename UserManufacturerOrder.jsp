<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>User Manufacturer Order Page</title>
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
							<li><a data-toggle="modal" data-target="#AddProductModal">Add
									Product</a></li>
							<li class="active"><a href="UserManufacturerOrder.jsp">ORDER</a></li>
							<li><a href="#trackOrder">TRACK</a></li>
							<li><a data-bs-toggle="modal"
								data-bs-target="#updateTrackOrder">UPDATE TRACK STATUS</a></li>
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

			<!-- Start Add Product Modal -->

			<div class="modal fade" id="AddProductModal"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="AddProductModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="AddProductModal">Add Product</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="AddMProductProcess.jsp" method="post">

								<div class="mb-3">
									<input type="text" name="mp_id" class="form-control"
										placeholder="Enter Product ID">
								</div>

								<div class="mb-3">
									<input type="text" name="mp_name" class="form-control"
										placeholder="Enter Product Name">
								</div>

								<div class="mb-3">
									<textarea name="mp_desc" class="form-control"
										id="exampleFormControlTextarea1" rows="3"
										placeholder="Enter Product Description"></textarea>
								</div>

								<div class="mb-3">
									<input type="text" name="mp_price" class="form-control"
										placeholder="Enter Product Price">
								</div>

								<div class="input-group mb-3">
									<input type="file" name="image" class="form-control"
										id="inputGroupFile02">
								</div>

								<button type="submit" class="btn btn-primary">Save Product</button>

							</form>


						</div>

					</div>
				</div>
			</div>

			<!-- End Add Product Modal -->

		</div>

		<%
			Connection con = (Connection) application.getAttribute("myConnection");

			PreparedStatement ps = con.prepareStatement("select * from wholesaler_order where m_id=?",
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
						<h2 class="text-uppercase">Wholesaler Orders</h2>
					</div>
				</div>

				<div class="row">

					<!-- =================== -->
					<!--% 
					   // while(rs.next())
					   // {
					    	
					--%>
					<div class="col-sm-6 col-lg-4 text-center item mb-4">
						<span class="tag">Sale</span> <a href="shop-single.html"> 
						<img src="<!--%=//rs.getString(5) %-->
					<!-- "-->
					<!-- alt="Product Image" class="product-img override-img"></a>
						<h3 class="text-dark">
							<a href="shop-single.html"-->
					<!-- %=//rs.getString(2) %-->
					<!-- /a>
						</h3>
						<p class="price"-->
					<!-- &mdash; Rs.-->
					<!-- %= //rs.getString(4) %-->
					<!-- /p>
					</div-->

					<!-- % 
					   // }
					%-->

					<!-- ======================== -->

					<table class="table table-warning">
						<thead>
							<tr>
								<th scope="col">SR.NO</th>
								<th scope="col">WO_ID</th>
								<th scope="col">W_ID</th>
								<th scope="col">PRODUCTS</th>
								<th scope="col">ORDER NOTES</th>
								<th scope="col">ACTION</th>
							</tr>
						</thead>
						<tbody>

							<!-- Start Manufacturer Row -->

							<%
								while (rs.next()) {
							%>
							<tr>
								<th scope="row"><%=i++%></th>
								<td><%=rs.getString(1)%></td>
								<td><%=rs.getString(2)%></td>
								
								
								<td>
								
								<%
								    String s = rs.getString(4);
								    System.out.println("JSON : " + s);
								    
								    //s = {"prmp_1":[2," Cla Core\n\t\t\t\t\t\t\t",400],"prmp_2":[1," Poo Pourri\n\t\t\t\t\t\t\t",600]}
								    JSONObject data = new JSONObject(s);
								    Iterator<String> it = data.keys(); //prmp_5 , prmp_6
								    System.out.println();
								    int qty;
								    String name;
								    int price;
								    out.println("<table><thead><tr>"
											    + "<th scope='col'>SR.NO</th>"
											    + "<th scope='col'>NAME</th>"
											    + "<th scope='col'>QTY</th>"
											    + "<th scope='col'>PRICE</th>"
											    + "</thead></tr><tbody>");
								    int j=1;
								    while(it.hasNext())
								    {
								    	String key = it.next();
								        System.out.println(key);
								        
								        JSONArray values = data.getJSONArray(key); // [2," Cla Core\n\t\t\t\t\t\t\t",400]
								    	qty = values.getInt(0);
								    	System.out.println(qty);
								    	
								    	name = values.getString(1);
								    	System.out.println(name);
								    	
								    	price = 0;

								    	if (!values.isNull(2)) {
								    	    try {
								    	        price = values.getInt(2);
								    	    } catch (Exception e) {
								    	        price = 0; // fallback
								    	    }
								    	}

								    	System.out.println(price);
								    	
								    	out.println("<tr>"
								    			+ "<th scope='row'>"+ j++ +"</th>"
								                + "<td>" + name + "</td>"
								                + "<td>" + qty + "</td>"
								                + "<td>" + price + "</td>"
								                + "</tr>");
								%>
								
								<%   
								    }
								    out.println("</tbody></table>");
								%>
								
								</td>
								
								<td><%=rs.getString(5)%></td>
								
								<td style="white-space: nowrap;">
							<%
								if (rs.getString(6).equals("0")) {
							%> 
							   <a href="UserManufacturerAccept_WOrder.jsp?wo_id=<%=rs.getString(1)%>" 
							   class="btn btn-sm btn-primary">Accept</a>		
							    
							<%
 	                            }
								else {
                            %> 
                               <span class="text-success">Order Accepted</span><br>
                            
                            <%
 	                            }
                            %>
								</td>
							</tr>
							<%
								}
							%>

							<!-- End Manufacturer Row -->  <!-- 13 Project.webm -->

						</tbody>
					</table>

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
