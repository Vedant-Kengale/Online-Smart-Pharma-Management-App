<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Update Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<%
		String usertype = request.getParameter("usertype");
		String id = request.getParameter("id");
		String status = request.getParameter("status");

		Connection con = (Connection) application.getAttribute("myConnection");

		PreparedStatement ps = null;

		if (usertype.equals("Manufacturer")) {
			ps = con.prepareStatement("update manufacturer set status=? where m_id=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		}

		else if (usertype.equals("Wholesaler")) {
			ps = con.prepareStatement("update wholesaler set status=? where w_id=?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		}

		ps.setString(1, status);
		ps.setString(2, id);

		int i = ps.executeUpdate();
		
	%>
	<!-- Script -->
	<!-- Account Pending Sweet Alert-->

	<script>
			
			Swal.fire({
			    title: "Your Account Member Updated!!!",
			    icon: "success",
			    timer: 2000, // 2 seconds
			    timerProgressBar: true,
			    didOpen: () => {
			      Swal.showLoading();
			    },
			    willClose: () => {
			      // Redirect after alert closes
			      window.location.href = "adminHome.jsp";
			    }
			  });
			</script>
	

</body>
</html>