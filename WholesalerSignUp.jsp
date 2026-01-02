<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wholesaler SignUp Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body> <!-- //6 Project.webm //45.58 -->
<!-- 
w_id=W_101
w_phone=%2B91-9284875613
w_fname=Vedant
w_lname=Kengale
w_email=vedantkengale96%40gmail.com
w_country=India
w_state_country=Maharashtra
w_address=Flat+no+902+A+Wing+Ranjan+Heights
w_postal_zip=412101
w_companyname=Vedant+Enterprises
password=vk123

 -->
<%
   String w_id = request.getParameter("w_id");
   String w_phone = request.getParameter("w_phone");
   String w_fname = request.getParameter("w_fname");
   String w_lname = request.getParameter("w_lname");
   String w_email = request.getParameter("w_email");
   String w_country = request.getParameter("w_country");
   String w_state_country = request.getParameter("w_state_country");
   String w_address = request.getParameter("w_address");
   String w_postal_zip = request.getParameter("w_postal_zip");
   String w_companyname = request.getParameter("w_companyname");
   String password = request.getParameter("password");
   
   Connection con = (Connection)application.getAttribute("myConnection");

   PreparedStatement ps = null;
   
   ps = con.prepareStatement("insert into wholesaler(w_id,w_fname,w_lname,w_country,w_companyname,w_address,w_state_country,w_postal_zip,w_email,w_phone,password) values(?,?,?,?,?,?,?,?,?,?,?)",
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
   
   ps.setString(1, w_id);
   ps.setString(2, w_fname);
   ps.setString(3, w_lname);
   ps.setString(4, w_country);
   ps.setString(5, w_companyname);
   ps.setString(6, w_address);
   ps.setString(7, w_state_country);
   ps.setString(8, w_postal_zip);
   ps.setString(9, w_email);
   ps.setString(10, w_phone);
   ps.setString(11, password);
   
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