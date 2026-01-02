<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Wholesaler Product Price Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%
		String wprice = request.getParameter("wprice");
		String wp_id = request.getParameter("wp_id");
		Connection con = (Connection) application.getAttribute("myConnection");
		PreparedStatement ps = null;
		ps = con.prepareStatement("update wproduct set wp_price=? where wp_id=?", ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		ps.setString(1, wprice);
		ps.setString(2, wp_id);
		int i = 0;
		try {
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("H2 : " + e);
		}
		if (i > 0) {
	%>


	<script>	 
	   Swal.fire({
	        icon: 'success',
	        title: 'Success!',
	        text: 'Price Updated successfully!',
	        showConfirmButton: false,
	        timer: 2000
	    }).then(() => {
	        window.location.href = "UserWholesalerHome.jsp";
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
	        text: 'Price Updated Failed!',
	        showConfirmButton: false,
	        timer: 2000
	    }).then(() => {
	        window.location.href = "UserWholesalerHome.jsp";
	    });
  
   </script>

	<%
		}
	%>

</body>
</html>