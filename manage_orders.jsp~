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
		font-size:12pt;
	}

	td,th
	{
		padding: 15px;
	}

	.menu3
	{
		background: black;
		color: white;
		padding: 10px;
		text-decoration: none;
	}

	a
	{
		text-decoration:none;
		background: white;
		color: black;
		padding: 5px;
	}
</style>
<body>
<h1 align="center" style='background:black;color:white;padding:10px;'>VIEW ORDERS</h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>
<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	PreparedStatement ps = con.prepareStatement("select oid, odate, name, address, phone, emailid, total, status, card_no, bank_name from order_master,customer where emailid = customer.email");

	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
%>

<table width='40%' height='40%' align='center' style='background:black;color:white;'>
<tr>
	<td><b>Order ID:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Customer Name:</b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs.getString(5)%></td>
</tr>
<tr>
	<td><b>Email ID:</b></td>
	<td><%=rs.getString(6)%></td>
</tr>
<tr>
	<td><b>Total:</b></td>
	<td>Rs.<%=rs.getString(7)%>/-</td>
</tr>
<tr>
	<td><b>Status:</b></td>
	<td><%=rs.getString(8)%>&nbsp;&nbsp;<a href='dispatch.jsp?oid=<%=rs.getInt(1)%>'>Dispatch</a>&nbsp;&nbsp;<a href='cancel.jsp?oid=<%=rs.getInt(1)%>'>Cancel</a></td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><%=rs.getString(9)%></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><%=rs.getString(10)%></td>
</tr>
</table><br>
<%
	PreparedStatement ps1 = con.prepareStatement("select order_details.pid, pname, price, qty, qty*price from product, order_details where product.pid = order_details.pid and oid=?");
	ps1.setInt(1, rs.getInt(1));
	ResultSet rs1 = ps1.executeQuery();
%>
<table width='60%' align='center' style='background:black;color:white;'>
<tr style='background:gray;'>
	<th>Product ID</th>
	<th>Name</th>
	<th>Rate</th>
	<th>Qty</th>
	<th>Amount</th>
</tr>
<%
	while(rs1.next()){
%>
<tr>
	<td><%=rs1.getString(1)%></td>
	<td><%=rs1.getString(2)%></td>
	<td><%=rs1.getString(3)%></td>
	<td><%=rs1.getString(4)%></td>
	<td><%=rs1.getString(5)%></td>
</tr>
<%
	}
%>
</table><br>
<%
}
%>
</body>
