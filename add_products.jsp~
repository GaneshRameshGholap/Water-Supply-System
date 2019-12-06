<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/bg5.jpg");
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
		background:white;
		color:black;
		width: 1000px;
	}
	
	td,th
	{
		padding: 10px;	
		border: 1px solid black;
	}

	a
	{
		text-decoration:none;
		padding: 10px;
		background: black;
		color: white;
	}
</style>
<body>

<h1 align="center" style='background:black;color:white;padding:10px;'>UPDATE PRODUCT DETAILS</h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");
%>
<form method='post' action='http://localhost:8080/water/add_product' enctype="multipart/form-data">
<br><br>
<table align='center'>
<tr>
	<td>Product Name:</td>
	<td><input type='text' name='proddesc' required></td>
</tr>
<tr>
	<td>Rate:</td>
	<td><input type='text' name='rate' required></td>
</tr>
<tr>
	<td>Stock Qty:</td>
	<td><input type='text' name='qty' required></td>
</tr>
<tr>
	<td>Image URL:</td>
	<td><input type='file' name='imgurl'></td>
</tr>
<tr>
	<td><input type='submit' value='Add' class='btn'></td>
	<td><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>
<br>
<%
	PreparedStatement ps = con.prepareStatement("select pid,pname,price,qty_in_hand from product order by pid");
	ResultSet rs = ps.executeQuery();
%>
<table align='center'>
<tr bgcolor='gray'>
	<th>Product ID</th>
	<th>Name</th>
	<th>Rate</th>
	<th>Qty In Hand</th>	
	<th>Image</th>
	<th>Delete</th>
	<th>Update</th>
</tr>
<%
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><img src='images/<%=rs.getString(1)%>.jpg' width='100px' height='100px'/></td>
			<td><a href='del_product.jsp?pid=<%=rs.getInt(1)%>'>Delete</a></td>
			<td><a href='update_product.jsp?pid=<%=rs.getInt(1)%>'>Update</a></td>
		</tr>
<%
	}
%>
</table>

