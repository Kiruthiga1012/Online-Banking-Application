<html>
<head>
<style>
A.l:hover {

text-decoration: none;
font-family:arial;
font-size:14px;
color: #000000;
BORDER: none;

}
A.l {

text-decoration: underline;
font-family:arial;
font-size:14px;
color: #000000;
BORDER: none;

}

</style>
</head>
<body>
<table align="center" width="900px" border=0>
<tr> <td align="right"><a href="index.jsp" class="l" style="color:#000000;">Home</a>
<%
if((session.getAttribute("userid")!=null))
{
	%>

&nbsp;|&nbsp;<a href="welcome.jsp" class="l" style="color:#000000;">My Account</a>&nbsp;|&nbsp;<a href="logout.jsp" class="l" style="color:#000000;">Logout</a>
<%
}
%>
</td>
</tr>
</table>
</body>
</html>
