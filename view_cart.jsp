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
		padding: 10px;
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
<br>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%
	Vector v = (Vector)session.getAttribute("prodlist");
	if(v==null)
	{
		response.sendRedirect("custhome.jsp");
		return;
	}
%>
<%@page import="java.util.*,java.sql.*"%>
<br><br>
<table border=1 style='background:black;color:white;' align='center'>
<tr style='background:gray;'>
<th>Sr.No.</th>
<th>Product Name</th>
<th>Rate</th>
<th>Qty</th>
<th>Amount</th>
</tr>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from product where pid=?");

	int i=1;
	float tot=0;
	for(int j=0;j<v.size();j++){
		Vector rec = (Vector)v.get(j);
		int pid = Integer.parseInt(rec.get(0).toString());
		int qty = Integer.parseInt(rec.get(1).toString());
		ps.setInt(1,pid);
		ResultSet rs = ps.executeQuery();
		rs.next();
		float amt = qty*rs.getFloat(3);
		tot+=amt;
%>
<td><%=i%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getFloat(3)%></td>
<td><%=rec.get(1)%></td>
<td><%=amt%></td>
</tr>
<%
		i++;
	}
%>
<tr>
	<td colspan=4 align='right'><b>Total:</b></td>
	<td>Rs.<%=tot%>/-</td>
</tr>
</table><br>
<table width='40%' align='center'>
<tr>
	<td align='center'><a href='prod_list.jsp' class='menu3'>Continue Shopping</a></td>
	<td align='center'><a href='check_out.jsp' class='menu3'>Checkout</a></td>
</tr>
</table>
<%
	session.setAttribute("tot",tot);
%>
</body>

