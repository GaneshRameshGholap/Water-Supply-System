<%@page import="java.sql.*" %>
<% 
	String email=request.getParameter("loginid");
	String pwd=request.getParameter("pwd");

	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	PreparedStatement ps=con.prepareStatement(
			"select * from customer where email=? and password=?");
	ps.setString(1, email);
	ps.setString(2, pwd);

	ResultSet rs = ps.executeQuery();

	if(rs.next()){
		session.setAttribute("userid",rs.getString(1));
		session.setAttribute("username",rs.getString(3));
		response.sendRedirect("custhome.jsp");
	}
	else{
		response.sendRedirect("Error1.jsp");
	}
%>
