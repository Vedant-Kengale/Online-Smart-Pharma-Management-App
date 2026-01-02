<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Manufacturer Accept WOrder Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<%
		String id = request.getParameter("wo_id");
		
		
		Connection con = (Connection) application.getAttribute("myConnection");
		PreparedStatement ps=null , ps1 , ps2;
		ps= con.prepareStatement("update wholesaler_order set status=? where wo_id=?",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		ps.setString(1, "1");
		ps.setString(2, id);
		
		ps1= con.prepareStatement("insert into wholesaler_order_track(wo_id,status) values(?,?)",
				ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		ps1.setString(1, id);
		ps1.setString(2, "Your Order is Ready To Dispatch!!!");
		
		int i=0;
		try
		{
			i = ps.executeUpdate();
			i = ps1.executeUpdate();
				
		}
		catch(Exception e)
		{
			System.out.println("H2 : "+e);
		}
		if (i>0)
		{		
    %>
    
    <script>
		
		
		Swal.fire({
		    title: "Order Accepted Successfully!!!",
		    icon: "success",
		    timer: 2000, // 2 seconds
		    timerProgressBar: true,
		    didOpen: () => {
		      Swal.showLoading();
		    },
		    willClose: () => {
		      // Redirect after alert closes
		      window.location.href = "UserManufacturerOrder.jsp";
		    }
		  });
		
	</script>
	
	<%
		}
		else {
    %>
    
    <script>
		
		
		Swal.fire({
		    title: "Order Accepted Failed!!!",
		    icon: "error",
		    timer: 2000, // 2 seconds
		    timerProgressBar: true,
		    didOpen: () => {
		      Swal.showLoading();
		    },
		    willClose: () => {
		      // Redirect after alert closes
		      window.location.href = "UserManufacturerOrder.jsp";
		    }
		  });
		
		</script>
    
    <%
		}
    %>

</body>
</html>