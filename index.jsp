<%@ include file="logininc.jsp" %>
<html>
<head>
</head>
<body>
<br><br><br>
<table width="500px" align="center" style="background-color:ffeeff;">
<tr>
 <td>&nbsp;</td>
</tr>
<tr>
 <td style="font-weight:bold;font-size:20pt;" align="center">Welcome To Bank Application</td>
</tr>

<tr>
 <td>&nbsp;</td>
</tr>

<tr>
 <td>&nbsp;</td>
</tr>

<%
if(session.getAttribute("userid")==null)
{
%>
<tr>
 <td style="font-weight:bold;font-size:20pt;" align="center"><a href="login.jsp" >Login</a></td>
</tr>
<tr>
<td style="font-weight:bold;font-size:20pt;" align="center"><a href="saveuser.jsp">Register</a></td>
</tr>
<%
}
%>
</table>

</body>
</html>


