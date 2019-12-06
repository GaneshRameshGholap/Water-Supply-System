<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	int oid = Integer.parseInt(request.getParameter("oid"));

	PreparedStatement ps = con.prepareStatement(
			"update order_master set status='Cancel' where oid=?");

	ps.setInt(1, oid);

	ps.executeUpdate();

	response.sendRedirect("manage_orders.jsp");
%>
