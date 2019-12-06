<style>
	body, html 
	{
  		height: 90%;
		background-image: url("images/bg4.jpg");
		background-position: center;
  		background-repeat: no-repeat;
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
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>UPDATE PRODUCT DETAILS</h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>
<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	int pid = Integer.parseInt(request.getParameter("pid"));

	PreparedStatement ps = con.prepareStatement("select * from product where pid=?");
	ps.setInt(1,pid);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<form method='post' action='http://localhost:8080/water/update_product' enctype="multipart/form-data">
<br><br>
<table align='center'>
<tr>
	<td>Product ID:</td>
	<td><input type='text' name='pid' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td>Product Name:</td>
	<td><input type='text' name='proddesc' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td>Rate:</td>
	<td><input type='text' name='rate' value='<%=rs.getString(3)%>' required></td>
</tr>
<tr>
	<td>Stock Qty:</td>
	<td><input type='text' name='qty' value='<%=rs.getString(4)%>' required></td>
</tr>
<tr>
	<td>Image URL:</td>
	<td><input type='file' name='imgurl'></td>
</tr>
<tr>
	<td><input type='submit' value='Update' class='btn'></td>
	<td><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>

