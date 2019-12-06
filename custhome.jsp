<style>
	body, html 
	{
  		height: 90%;
		background-image: url("images/bg2.jpg");
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
</style>
<body>

<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME CUSTOMER - <%=session.getAttribute("username")%></h1>
<br><br>
<center>
	<button onclick="location.href='view_profile.jsp'" class='btn'>VIEW PROFILE</button>
	<button onclick="location.href='prod_list.jsp'" class='btn'>PLACE ORDER</button>
	<button onclick="location.href='track_orders.jsp'" class='btn'>VIEW ORDER</button>
	<button onclick="location.href='view_cart.jsp'" class='btn'>VIEW CART</button>
	<button onclick="location.href='logout.jsp'" class='btn'>LOGOUT</button>
</center>
</body>

