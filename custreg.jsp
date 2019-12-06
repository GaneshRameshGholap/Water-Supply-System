<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["email"];

	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["pwd"];
	y = document.forms["reg"]["cpwd"];
	
	if(x.value!=y.value)
	{
		alert("Password and confirm password do not match.");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["phone"];
	if(!x.value.match(/^\d{10}$/))
	{
		alert("Invalid phone number.");
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
	}
	
	td
	{
		padding: 15px;
	}
</style>
<body>
<center><button onclick="location.href='index.jsp'" class='btn'>HOME</button></center><br>

<form method="POST" action ="customer.jsp" name="reg" onsubmit="return validate()">
<table align='center'>
<tr>
	<td><b>EMAIL ADDRESS:</b></td>
	<td><input type="text" name="email" placeholder="user@email.com" required></td>
</tr>
<tr>
	<td><b>PASSWORD:</b></td>
	<td><input type="password" name="pwd" placeholder="8-10 characters" required></td>
</tr>
<tr>
	<td><b>CONFIRM PASSWORD:</b></td>
	<td><input type="password" name="cpwd" placeholder="type your password again" required></td>
</tr>
<tr>
	<td><b>NAME:</b></td>
	<td><input type="text" name="name" required></td>
</tr>
<tr>
	<td><b>ADDRESS:</b></td>
	<td><textarea rows="3" cols="23" name="addr"></textarea></td>
</tr>
<tr>
	<td><b>CONTACT NUMBER:</b></td>
	<td><input type="text" name="phone" maxlength=10 required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='REGISTER' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>
</body>
