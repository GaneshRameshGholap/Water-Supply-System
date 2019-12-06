<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/bg1.jpg");
		background-position: center;
  		background-repeat: no-repeat;
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
</style>
<body>
<center>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	int oid = Integer.parseInt(request.getParameter("oid"));
	
	PreparedStatement ps = con.prepareStatement("select oid, odate, name, address, phone, emailid, total, status, card_no, bank_name from order_master,customer where emailid = customer.email and oid=?");

	ps.setInt(1,oid);

	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
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
	<td><%=rs.getString(8)%></td>
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
	ps = con.prepareStatement("select order_details.pid, pname, price, qty, qty*price from product, order_details where product.pid = order_details.pid and oid=?");
	ps.setInt(1, oid);
	rs = ps.executeQuery();
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
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
</tr>
<%
	}
}
else{
%>
<h2>Invalid order no <%=oid%></h2>
<%
}
%>
</center>
</body>
