<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	int pid = Integer.parseInt(request.getParameter("pid"));

	PreparedStatement ps = con.prepareStatement("delete from product where pid=?");
	ps.setInt(1,pid);
	ps.executeUpdate();
	response.sendRedirect("add_products.jsp");
%>


