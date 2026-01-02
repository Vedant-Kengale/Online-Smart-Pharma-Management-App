<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wholesaler Order Place Process Page</title>
</head>
<body>
	<%
		String itemsJson = request.getParameter("itemsJson");
		String m_id = (String) session.getAttribute("m_id");
		String u_id = (String) session.getAttribute("u_id");
		String wo_order_notes = request.getParameter("wo_order_notes");

		Connection con = (Connection) application.getAttribute("myConnection");
		PreparedStatement ps = null;
		ps = con.prepareStatement("insert into wholesaler_order (w_id, m_id, itemsJson, wo_order_notes) values (?,?,?,?)",
				Statement.RETURN_GENERATED_KEYS);

		ps.setString(1, u_id); //Wholesaler ID
		ps.setString(2, m_id); //Manufacturer ID
		ps.setString(3, itemsJson);
		ps.setString(4, wo_order_notes);
		
		int i = 0;
		try{
			i = ps.executeUpdate();
		}
		catch (Exception e){
			System.out.println("H2 : " + e);
		}
		if (i > 0) {

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				String generatedId = rs.getString(1); // Assuming the ID column is of type long
				System.out.println("Generated ID : " + generatedId);
				session.setAttribute("orderId", generatedId);

				ps = con.prepareStatement("insert into wholesaler_order_track (wo_id,status) values(?,?)",
						Statement.RETURN_GENERATED_KEYS);

				ps.setString(1, "" + generatedId);
				ps.setString(2, "Order Placed Successfully");
				ps.executeUpdate();
			}
	%>
	<jsp:forward page="thankyou.jsp"></jsp:forward>
	<%
		}
		else {
	%>
	<script>
		alert("Something Problem Please Check Your Record!!!");
	</script>
	<%
		}
	%>

</body>
</html>