<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/bg1.jpg");
		background-position: center;
  		background-repeat: repeat;
  		background-size: cover;
	}

	.btn
	{
		background:black;
		color:white;
		padding:10px;
		font-size:14pt;
	}

	table
	{
		background:black;
		color:white;
		width: 1000px;
	}
	
	td,th
	{
		padding: 10px;	
		border: 1px solid white;
	}
</style>
<body>

<h1 align="center" style='background:black;color:white;padding:10px;'>CUSTOMER DETAILS</h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>
<table align='center'>
<tr>
	<th>Email</th>
	<th>Name</th>
	<th>Address</th>
	<th>Phone</th>
</tr>

<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");
	
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from customer");

	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
</tr>
<%
	}
%>
</table>	
</body>

