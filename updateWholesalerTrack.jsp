<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Update Wholesaler Track Page</title>
<!-- 14 Project.webm -->
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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
	crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
							<a href="home.jsp" class="js-logo-clone"><%=session.getAttribute("usertype")%></a>
						</div>
					</div>

					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li><a data-bs-toggle="modal"
									data-bs-target="#AddProductModal">Add Product</a></li>
								<li><a href="UserManufacturerOrder.jsp">ORDER</a></li>
								<li><a href="#" data-toggle="modal"
									data-target="#trackOrder">TRACK</a></li>
								<li class="active"><a data-bs-toggle="modal"
									data-bs-target="updateWholesalerTrack.jsp">UPDATETRACKSTATUS</a></li>
							</ul>
						</nav>
					</div>

					<div class="icons">
						<a class="btn btn-warning" role="button" href="logout.jsp">
							${sessionScope.uemail} &nbsp Logout</a>
					</div>

				</div>
				<!-- End NavBar -->

			</div>
			<%
				String wo_id = request.getParameter("wo_id");
				String status = request.getParameter("status");

				Connection con = (Connection) application.getAttribute("myConnection");

				PreparedStatement ps = null;
				ps = con.prepareStatement("insert into wholesaler_order_track(wo_id,status) values (?,?)",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

				ps.setString(1, wo_id);
				ps.setString(2, status);

				int i = 0;
				try {
					i = ps.executeUpdate();
					if (status.equalsIgnoreCase("Delivered")) {
						ps = con.prepareStatement("update wholesaler_order set status=? where wo_id=?",
								ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

						ps.setString(2, wo_id);
						ps.setString(1, "2");
						ps.executeUpdate();
						//action 0 1 2 means completed

						PreparedStatement ps2 = con.prepareStatement("select * from wholesaler_order where wo_id=?",
								ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

						ps2.setString(1, wo_id);
						ResultSet rs2 = ps2.executeQuery();
						if (rs2.next()) {
							String w_id = rs2.getString(2);
							//System.out.println("Mila : " + rs2.getString(4));
							JSONObject data = new JSONObject(rs2.getString(4));
							//JSON : {"prmp_1":[1," Bioderma Sensibio h2o ",200],"prmp_5":[1," Cla Core ",1000],"prmp_4":[2," umcka cold care ",350]}
							Iterator<String> it = data.keys();
							while (it.hasNext()) {
								String id = it.next();//prmp_1
								String idImage = id.substring(2);
								JSONArray values = data.getJSONArray(id); // [2," Cla Core\n\t\t\t\t\t\t\t",400]
								int qty = values.getInt(0);
								System.out.println(qty);
								String name = values.getString(1);
								System.out.println(name);
								int price = values.getInt(2);
								System.out.println(price);

								PreparedStatement ps3 = con.prepareStatement("select * from mproduct where mp_id=?",
										ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

								ps3.setString(1, idImage);
								ResultSet rs3 = ps3.executeQuery();
								String image = null;
								String desc = null;

								if (rs3.next()) {
									image = rs3.getString(5); // image VARCHAR
									desc = rs3.getString(3);
								}
								//name , desc, price,image,w_id

								ps = con.prepareStatement(
										"insert into wproduct(wp_name,wp_desc,mp_price,image,w_id) values (?,?,?,?,?)",
										ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

								ps.setString(1, name);
								ps.setString(2, desc);
								ps.setString(3, "" + price);
								ps.setString(4, image); // image VARCHAR
								ps.setString(5, w_id);

								ps.executeUpdate();

							}
						}
					}
				} catch (Exception e) {
					System.out.println("H2 : " + e);
					e.printStackTrace();
				}
				if (i > 0) {
					//Delivered.....
					//wproduct!!! insert!!!.....
				 
			%>

			<script>	 
			   Swal.fire({
			        icon: 'success',
			        title: 'Success!',
			        text: 'Track Order Updated successfully!',
			        showConfirmButton: false,
			        timer: 2000
			    }).then(() => {
			        window.location.href = "UserManufacturerHome.jsp";
			    });
  
   </script>
			<%
				}

				else {
			%>
			<script>
				 Swal.fire({
				        icon: 'success',
				        title: 'Success!',
				        text: 'Track Order Updated Failed!',
				        showConfirmButton: false,
				        timer: 2000
				    }).then(() => {
				        window.location.href = "UserManufacturerHome.jsp";
				    });
 </script>
			<%
				}
			%>



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