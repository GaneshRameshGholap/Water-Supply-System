<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/bg3.jpg");
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
<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from product order by pid");
	ResultSet rs = ps.executeQuery();
	int i=0;
	while(rs.next()){
%>
<table width='50%' align='center' style='padding:15px;'>
<tr>
<td style='padding:15px;text-align:center;'>
<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=200 height=200/><br>
<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
<p>Rs.<%=rs.getFloat(3)%>/-</p>
<a href='add_cart.jsp?pid=<%=rs.getInt(1)%>' style='font-size:12pt;padding:5px;background:black;color:white;border-radius:5px;text-decoration:none;box-shadow:3px 3px 3px #444444;'>Buy Now</a>
</td>
</tr>
</table><br>
<%
	}
%>
</table>
</body>	
