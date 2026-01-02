<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Process Page</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

	<%
		String userEmail = request.getParameter("email");
		String password = request.getParameter("password");
		Connection con = (Connection) application.getAttribute("myConnection");

		PreparedStatement ps = con.prepareStatement("select * from admin where email=? and password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

		ps.setString(1, userEmail);
		ps.setString(2, password);

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			session.setAttribute("uname", userEmail);
			session.setAttribute("role", "admin");
	%>
    
	<!-- Login Successful Sweet Alert-->

	<script>
	
	Swal.fire({
	    title: "Login Successfully!!!",
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

	<%
		}
		else {
			request.setAttribute("Error", "Sorry! Username or Password Error. plz Enter Correct Detail");
			session.setAttribute("Loginmsg", "Login MisMatch - Email & Password Wrong");
		
	%>

	<!-- Login Failed Sweet Alert-->

	<script>
	
	Swal.fire({
	    title: "Login Failed - Email & Password Mismatch!!!",
	    icon: "error",
	    timer: 2000, // 2 seconds
	    timerProgressBar: true,
	    didOpen: () => {
	      Swal.showLoading();
	    },
	    willClose: () => {
	      // Redirect after alert closes
	      window.location.href = "home.jsp";
	    }
	  });
	
	</script>
	
	<%
		}
	%>

</body>
</html>