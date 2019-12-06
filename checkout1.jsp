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
</style>
<%@page import="java.sql.*,java.text.*,java.util.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:water","postgres","");

	int oid = Integer.parseInt(request.getParameter("oid"));
	String odate = request.getParameter("odate");
	float amt = Float.parseFloat(request.getParameter("amt"));
	String cardno = request.getParameter("cardno");
	String bname = request.getParameter("bname");

	String eid = session.getAttribute("userid").toString();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = sdf.parse(odate);
	java.sql.Date new_odate = new java.sql.Date(d.getTime());

	PreparedStatement ps = con.prepareStatement("insert into order_master values(?,?,?,?,?,?,?)");
	ps.setInt(1,oid);
	ps.setDate(2,new_odate);
	ps.setFloat(3,amt);
	ps.setString(4,"Pending");
	ps.setString(5,cardno);
	ps.setString(6,bname);
	ps.setString(7,eid);
	
	ps.executeUpdate();

	ps = con.prepareStatement("insert into order_details values(?,?,?)");

	Vector prodlist = (Vector)session.getAttribute("prodlist");

	for(int i=0;i<prodlist.size();i++){
		Vector rec = (Vector)prodlist.get(i);
		int pid = Integer.parseInt(rec.get(0).toString());
		int qty = Integer.parseInt(rec.get(1).toString());

		ps.setInt(1,pid);
		ps.setInt(2,oid);
		ps.setInt(3,qty);
		ps.executeUpdate();
	}
%>
<body>
<center>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<h2>Your order is placed successfully.</h2>
<h3>Order No: <%=oid%></h3>


<%
	session.removeAttribute("prodlist");
	session.removeAttribute("tot");
%>
</center>
</body>
	
	

