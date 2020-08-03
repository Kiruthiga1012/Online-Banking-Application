<%@ include file="inc.jsp" %>
<%@ include file="logininc.jsp" %>
<html>
<head>
<script src="valid.js" type="text/javascript"></script>
</head>

<body>
<br>
<form name="userform" method="post"  onsubmit="return validate();">
<table width="350px" border=0 align="center" style="background-color:ffeeff;">

	
<tr>
		<td colspan=2  style="font-weight:bold;font-size:20pt;" align="center">User Registeration</td>
		
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
		
	</tr>
	<tr>
		<td>First Name </td>
		<td><input type="text" name="firstName" value="<%=firstName%>" ></td>
	</tr>
	<tr>
		<td>Last Name </td>
			<td><input type="text" name="lastname" value="<%=lastname%>"></td>
	</tr>
	<tr>

		<td>Login Name</td>
		
		<td><input type="text" name="userName" value="<%=userName%>" <%=readOnly%>></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password" value=""></td>
	</tr>
	<tr>
		<td>Confirm Password</td>
		<td><input type="password" name="confirmPassword" value=""></td>
	</tr>
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" value="<%=email%>"></td>
	</tr>
	<tr>
		<td>Contact No</td>
		<td><input type="text" name="contactNo" value="<%=contactNo%>"></td>
	</tr>
	<tr>
		<td>Address</td>
		<td><textarea  name="address" rows=5 cols=25><%=address%></textarea></td>
	</tr>
	<tr>
		<td>Country Name</td>
		<td><input type="text" name="countryName" value="<%=countryName%>"></td>
	</tr>
	<tr>
		<td>State</td>
		<td><input type="text" name="state" value="<%=state%>"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Save User"></td>
	</tr>
</table>
</form>
</body>
</html>


