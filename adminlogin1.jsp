<%@page import="java.sql.*" %>
<% 
	String loginid=request.getParameter("loginid");
	String pwd=request.getParameter("pwd");
        
	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql:water","postgres","");
	PreparedStatement ps = con.prepareStatement(
			"select * from admin where admin_id=? and admin_pwd=?");

	ps.setString(1, loginid);
	ps.setString(2, pwd);

	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		session.setAttribute("adminname",rs.getString(3));
		response.sendRedirect("adminhome.jsp");
	}
	else{
		response.sendRedirect("Error.jsp");
	}
%>
