<!-- %@page import="java.io.InputStream"%!-- >
<!-- %@page import="java.io.FileInputStream"%!-- >
<!-- %@page import="java.io.File"%!-- >
<!-- %@page import="java.sql.ResultSet"%!-- >
<!-- %@page import="java.sql.PreparedStatement"%!-- >
<!-- %@page import="java.sql.Connection"%!-- >
<!-- %@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%!-->
<!-- DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Manufacturer Product Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body-->
	<%
		//String mp_id = request.getParameter("mp_id");
	    //String mp_name = request.getParameter("mp_name");
	    //String mp_desc = request.getParameter("mp_desc");
	    //String mp_price = request.getParameter("mp_price");
	    //String myloc = "C:/Software/Project Workspace/Pharma Management System/WebContent/images/"+request.getParameter("image");
	    //String m_id = (String) session.getAttribute("u_id");
	    
	    //Connection con = (Connection) application.getAttribute("myConnection");
	    //PreparedStatement ps = con.prepareStatement("insert into mproduct values(?,?,?,?,?,?)",
	    	//	ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    
	    //ps.setString(1, mp_id);
	    //ps.setString(2, mp_name);
	    //ps.setString(3, mp_desc);
	    //ps.setString(4, mp_price);
	    //ps.setString(6, m_id);
	    
	    //try{
	    	//System.out.println("OK1");
	    	//File image = new File(myloc);
	    	//System.out.println("Image: "+myloc);
	    	//FileInputStream fis = new FileInputStream(image);
	    	//System.out.println("Fis : "+fis);
	    	//ps.setBinaryStream(5, (InputStream)fis, (int)(image.length()));
	    //}
	    //catch(Exception e){
	    	//System.out.print("H1: "+e);
	    //}
	    //int i=0;
	    //try{
	    	//i = ps.executeUpdate();
	    //}
	    //catch(Exception e){
	    	//System.out.println("H2 : "+e);
	    //}
	    
	    //if(i>0){
	%>
	    <!-- Product Added Successfully Sweet Alert>

			<script>
			
			Swal.fire({
			    title: "Product Added Successfully!!!",
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
	    //}
	    //else {
	%>
	    <!-- Product Added Failed Sweet Alert>

			<script>
			
			Swal.fire({
			    title: "Product Added Failed!!!",
			    icon: "error",
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
	    //}
	%>
	
</body>
</html-->

<!-- ================================================== -->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Manufacturer Product Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%
		String mp_id = request.getParameter("mp_id");
	    String mp_name = request.getParameter("mp_name");
	    String mp_desc = request.getParameter("mp_desc");
	    String mp_price = request.getParameter("mp_price");
	    String myloc = "images/"+request.getParameter("image");
	    String m_id = (String) session.getAttribute("u_id");
	    
	    Connection con = (Connection) application.getAttribute("myConnection");
	    PreparedStatement ps = con.prepareStatement("insert into mproduct values(?,?,?,?,?,?)",
	    		ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	    
	    ps.setString(1, mp_id);
	    ps.setString(2, mp_name);
	    ps.setString(3, mp_desc);
	    ps.setString(4, mp_price);
	    ps.setString(5, myloc);
	    ps.setString(6, m_id);
	    
	    int i = ps.executeUpdate();
	    
	    %>
	    
	    <% if(i>0){ %>
	
	    <!-- Product Added Successfully Sweet Alert-->

			<script>
			
			Swal.fire({
			    title: "Product Added Successfully!!!",
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
	    }
	    else {
	%>
	    <!-- Product Added Failed Sweet Alert-->

			<script>
			
			Swal.fire({
			    title: "Product Added Failed!!!",
			    icon: "error",
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
	    }
	%>
	
</body>
</html>