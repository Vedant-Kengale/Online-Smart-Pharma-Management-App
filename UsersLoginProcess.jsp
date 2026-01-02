<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login Process Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%
	String usertype = request.getParameter("usertype");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	Connection con = (Connection) application.getAttribute("myConnection");

	PreparedStatement ps=null;
	if(usertype.equals("Manufacturer"))
	{
		ps = con.prepareStatement("select * from Manufacturer where email=? and password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	else if(usertype.equals("Wholesaler"))
	{
		ps = con.prepareStatement("select * from Wholesaler where w_email=? and password=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	
	ps.setString(1, email);
	ps.setString(2, password);

	ResultSet rs = ps.executeQuery();

	if (rs.next()) 
	{
		if(usertype.equals("Manufacturer"))
		{
			if(rs.getString("status").equals("Pending") || rs.getString("status").equals("Rejected"))
			{
				session.setAttribute("Loginmsg", "Your Account is Pending or Rejected!!!");
		%>
				<!-- Script -->
				
				<script>
		
		
		Swal.fire({
		    title: "Your Account is Pending!!!",
		    icon: "warning",
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
			else
			{
				session.setAttribute("uemail", email);
				session.setAttribute("u_id", rs.getString(1));
				session.setAttribute("usertype", usertype);
				session.setAttribute("role", "user");
		%>
			<%-- <jsp:forward page="UserManufacturerHome.jsp"></jsp:forward> --%>
			
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
		      window.location.href = "UserManufacturerHome.jsp";
		    }
		  });
		
		</script>
			
			<%
			} %>
<%
		}
		else if(usertype.equals("Wholesaler"))
		{
	
			if(rs.getString("status").equals("Pending") || rs.getString("status").equals("Rejected"))
			{
				session.setAttribute("Loginmsg", "Your Account is Pending or Rejected!!!");
		%>
				<!-- Script -->
				
				<script>
		
		
		Swal.fire({
		    title: "Your Account is Pending!!!",
		    icon: "warning",
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
			else
			{
				session.setAttribute("uemail", email);
				session.setAttribute("u_id", rs.getString(1));
				session.setAttribute("usertype", usertype);
				session.setAttribute("role", "user");
		%>
			<%-- <jsp:forward page="UserManufacturerHome.jsp"></jsp:forward> --%>
			
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
		      window.location.href = "UserWholesalerHome.jsp";
		    }
		  });
		
		</script>
			
			<%
			} %>
	<%
		}
	}		

	else {
		request.setAttribute("Error", "Sorry!Username or Password Error. plz Enter Correct Detail");
		session.setAttribute("Loginmsg", "Login MissMatch - Email & Password Wrong");
		
%>
<jsp:forward page="home.jsp"></jsp:forward>
<%
	}
%>
</body>
</html>