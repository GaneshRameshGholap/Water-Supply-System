<script type='text/javascript'>
function validate()
{
	x = document.forms["login"]["loginid"];

	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
		x.focus();
		return false;
	}

	return true;
}
</script>

<style>
	body, html 
	{
  		height: 90%;
		background-image: url("images/bg3.jpg");
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

	table
	{
		background: white;
		padding: 10px;
		height: 250px;
		width: 450px;
		top: 200px;
		left: 500px;
		position: fixed;
	}
</style>
<body>
<br>
<center><button onclick="location.href='index.jsp'" class='btn'>HOME</button></center>
<form method='post' action='customerlogin.jsp' name="login" onsubmit="return validate()">
<table align='center'>
<tr>
	<td colspan=2 align='center'><b>CUSTOMER LOGIN</b></td>
</tr>
<tr>
	<td><b>LOGIN ID:</b></td>
	<td><input type='text' name='loginid' required placeholder='Enter email ID'></td>
</tr>
<tr>
	<td><b>PASSWORD:</b></td>
	<td><input type='password' name='pwd' required placeholder='Enter password'></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='LOGIN' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
<tr>
	<td colspan=2 align='center'><a href='custreg.jsp'><b>New User</b></a></td>
</tr>
</table>
</form>
</body>

