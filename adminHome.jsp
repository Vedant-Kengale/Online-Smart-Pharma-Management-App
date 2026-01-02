<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
          <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
          <form action="#" method="post">
            <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
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
            <nav class="site-navigation text-right text-md-center" role="navigation">
              <ul class="site-menu js-clone-nav d-none d-lg-block">
                
              </ul>
            </nav>
          </div>
          
          <div class="icons">
            <a class="btb btn-warning" role="button" href="logout.jsp"><%=session.getAttribute("uname")%>
            &nbsp Logout</a>  
          </div>
          
        </div>
        <!-- End Navbar -->
      </div>
    </div>
    
    <%
        Connection con = (Connection)application.getAttribute("myConnection");
        
        PreparedStatement ps = con.prepareStatement("select * from manufacturer",
        		ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = ps.executeQuery();
        
        PreparedStatement ps1 = con.prepareStatement("select * from wholesaler",
        		ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs1 = ps1.executeQuery();
        int i=1;
    %>

    <div class="site-section">
      <div class="container">
        <table class="table table-warning">
            <thead>
                <tr>
                    <th scope="col">SR.NO</th>
                    <th scope="col">M_ID</th>
                    <th scope="col">M_NAME</th>
                    <th scope="col">EMAIL</th>
                    <th scope="col">PHONE</th>
                    <th scope="col">TYPE</th>
                    <th scope="col">STATUS</th>
                    <th scope="col">ACTION</th>
                </tr>
            </thead>
            <tbody>
                
                <!-- Start Manufacturer Row -->
                
                <% while(rs.next()){ %>
                <tr>
                    <th scope="row" style="white-space: nowrap;"><%=i++ %></th>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(5) %></td>
                    <td>Manufacturer</td>
                    <td><%=rs.getString(6) %></td>
                    <td style="white-space: nowrap;">
                    <% if(rs.getString(6).equals("Active")) { %>
                          <a href="UserStatusUpdate.jsp?id=<%= rs.getString(1) %>&usertype=Manufacturer&status=Rejected" class="btn btn-sm btn-danger">Reject</a>
                    
                    <% } else if(rs.getString(6).equals("Pending")) { %>
                          <a href="UserStatusUpdate.jsp?id=<%= rs.getString(1) %>&usertype=Manufacturer&status=Active" class="btn btn-sm btn-success">Active</a>
                          <a href="UserStatusUpdate.jsp?id=<%=rs.getString(1)%>&usertype=Manufacturer&status=Rejected" class="btn btn-sm btn-danger" >Reject</a>
                    
                    <% } else { %>
                          <a href="UserStatusUpdate.jsp?id=<%=rs.getString(1)%>&usertype=Manufacturer&status=Active" class="btn btn-sm btn-success" >Active</a>
                    
                    <% } %> 
                                    
                    </td>
                </tr>
                <% } %>
                
                <!-- End Manufacturer Row -->
                
                <!-- Start Wholesaler Row -->
                
                <% while(rs1.next()){ %>
                <tr>
                    <th scope="row"><%=i++ %></th>
                    <td><%=rs1.getString(1) %></td>
                    <td><%=rs1.getString(2) + " " + rs1.getString(3) %></td>
                    <td><%=rs1.getString("w_email") %></td>
                    <td><%=rs1.getString("w_phone") %></td>
                    <td>Wholesaler</td>
                    <td><%=rs1.getString("status") %></td>
                    <td>
                    <% if(rs1.getString("status").equals("Active")) { %>
                          <a href="UserStatusUpdate.jsp?id=<%= rs1.getString(1) %>&usertype=Wholesaler&status=Rejected" class="btn btn-sm btn-danger">Reject</a>
                    
                    <% } else if(rs1.getString("status").equals("Pending")) { %>
                          <a href="UserStatusUpdate.jsp?id=<%=rs1.getString(1)%>&usertype=Wholesaler&status=Active" class="btn btn-sm btn-success" >Active</a>
						  <a href="UserStatusUpdate.jsp?id=<%=rs1.getString(1)%>&usertype=Wholesaler&status=Rejected" class="btn btn-sm btn-danger" >Reject</a>
                    
                    <% } else { %>
                          <a href="UserStatusUpdate.jsp?id=<%=rs1.getString(1)%>&usertype=Wholesaler&status=Active" class="btn btn-sm btn-success" >Active</a>
                    
                    <% } %>
                    </td>
                </tr>
                <% } %>
                
                <!-- End Wholesaler Row -->
                
            </tbody>
        </table>
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
								<li class="phone"><a href="tel://9284875613">+91 92848 75613</a></li>
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


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
		crossorigin="anonymous"></script>

</body>

</html>