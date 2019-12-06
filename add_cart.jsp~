<style>
	body, html 
	{
  		height: 90%;
		background-image: url("images/bg5.jpg");
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
	}

	.btn
	{
		background:black;
		color:white;
		padding:7px;
		font-size:12pt;
	}

	table
	{
		background: white;
		padding: 10px;
	}
	
	td
	{
		padding: 15px;
	}
</style>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%@page import="java.sql.*,java.util.*"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from product where pid=?");
	ps.setInt(1,pid);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<form method='post' action='add_cart1.jsp'>
<table style='padding:10px;background:linen;' align='center'>
<tr>
	<td colspan=2 style='padding:10px;text-align:center;'>
		<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=300 height=300/><br>
		<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
		<p>Rs.<%=rs.getFloat(3)%>/-</p>
	</td>
</tr>
<tr>
	<td><b>Qty:</b></td><td><input type='text' name='qty' required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='ADD CART' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
<input type='hidden' name='pid' value=<%=rs.getInt(1)%>>
</table>
</form>
</body>
