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
<center>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	Class.forName("org.postgresql.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	PreparedStatement ps = con.prepareStatement("select * from customer where email=?");
	ps.setString(1, email);

	ResultSet rs = ps.executeQuery();

	if(rs.next()){
%>
<h2>Already Registered.</h2><br>
<%
	}
	else{
		ps=con.prepareStatement("insert into customer values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, pwd);
		ps.setString(3, name);
		ps.setString(4, addr);
		ps.setString(5, phone);
		ps.executeUpdate();
%>
<h2>Registration Successful.</h2><br>
<%
	}
%>
Click <a href='custlogin.jsp'>here</a> to continue login.
</center>
</body>

