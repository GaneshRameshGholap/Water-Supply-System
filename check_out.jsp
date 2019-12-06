<script type='text/javascript'>
function validate()
{
	x = document.forms["order"]["cardno"];

	if(!x.value.match(/\d{4}-\d{4}-\d{4}-\d{4}/))
	{
		alert("Invalid card no");
		x.focus();
		return false;
	}

	return true;
}
</script>

<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select count(*) from order_master");
	rs.next();
	int oid = rs.getInt(1)+1;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = new java.util.Date();
	String odate = sdf.format(d);

	float tot = Float.parseFloat(session.getAttribute("tot").toString());
%>
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
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<form method='post' action='checkout1.jsp' name='order' onsubmit='return validate()'>
<table width='40%' height='40%' align='center' style='background:black;color:white;'>
<tr>
	<td><b>Order ID:</b></td>
	<td><input type='text' name='oid' value=<%=oid%> readOnly></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><input type='text' name='odate' value=<%=odate%> readOnly></td>
</tr>
<tr>
	<td><b>Total Amount:</b></td>
	<td><input type='text' name='amt' value=<%=tot%> readOnly></td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><input type='text' name='cardno'></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><input type='text' name='bname'></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='Pay Now' class='btn'></td>
	<td align='center'><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>
</body>
	
	

