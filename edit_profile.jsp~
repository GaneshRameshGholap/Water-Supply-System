<style>
	body, html 
	{
  		height: 90%;
		background-image: url("images/bg1.jpg");
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
	}
</style>
<%@page import="java.sql.*"%>
<body>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	Class.forName("org.postgresql.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	PreparedStatement ps = con.prepareStatement("update customer set password=?, name=?, address=?, phone=? where email=?");
	ps.setString(1, pwd);
	ps.setString(2, name);
	ps.setString(3, addr);
	ps.setString(4, phone);
	ps.setString(5, email);

	ps.executeUpdate();

%>
<center>
<h2>Profile updated successfully.</h2><br>
Click <a href='custhome.jsp'>here</a> to continue.
</center>
</body>

