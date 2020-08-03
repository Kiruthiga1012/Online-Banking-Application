<html>
<head>
<script src="valid.js" type="text/javascript"></script>
<style>
A:hover {

text-decoration: none;
font-family:arial;
font-size:12px;
color: #000000;
BORDER: none;

}
A {

text-decoration: underline;
font-family:arial;
font-size:12px;
color: #000000;
BORDER: none;

}

</style>
</head>
<body>
<table width="800px" border=0 align="center" >
<tr> <td align="right"><a href="index.jsp" class="l" style="color:#000000;">Home</a></td></tr>
</table>
<br><br><br>
<form name="loginform" method="post" action="loginmid.jsp" onsubmit="return validLogin();">
<table width="250px" border=0 align="center" style="background-color:ffeeff;">


<tr>
		<td colspan=2 align="center" style="font-weight:bold;font-size:20pt;" align="center">User Login</td>
		
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
		
	</tr>

	<tr>
		<td style="font-size:12pt;" align="center">Login Name</td>
		<td><input type="text" name="userName" value=""></td>
	</tr>
	<tr>
		<td style="font-size:12pt;" align="center">Password</td>
		<td><input type="password" name="password" value=""></td>
	</tr>
	
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Login"></td>
	</tr>
	<tr>
		<td></td>
		<td align="right"><a href="saveuser.jsp">New User?</a></td>
	</tr>
</table>
</form>


</body>
</html>


