<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manufacturer SignUp Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
   String m_id = request.getParameter("m_id");
   String m_name = request.getParameter("m_name");
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   String phone = request.getParameter("phone");
   
   Connection con = (Connection)application.getAttribute("myConnection");

   PreparedStatement ps = null;
   
   ps = con.prepareStatement("insert into manufacturer(m_id,m_name,password,email,phone) values(?,?,?,?,?)",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
   
   ps.setString(1, m_id);
   ps.setString(2, m_name);
   ps.setString(3, password);
   ps.setString(4, email);
   ps.setString(5, phone);
   
   int i=0;
   try
   {
	   i = ps.executeUpdate();
   }
   catch(Exception e)
   {
	   System.out.print("H2 : "+e);
   }
   
   if(i>0)
   {
%>
    <!-- Login Successful Sweet Alert-->

	<script>
	
	Swal.fire({
	    title: "Account Created Successfully!!!",
	    icon: "success",
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
   else {
%>

   <!-- Login Failed Sweet Alert-->

	<script>
	
	Swal.fire({
	    title: "Account Created Failed!!!",
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