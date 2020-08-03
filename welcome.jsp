<%@ include file="logininc.jsp" %>
<html>
<head>
<style>
A:hover {

text-decoration: none;
font-family:arial;
font-size:14px;
color: #000000;
BORDER: none;

}
A {

text-decoration: underline;
font-family:arial;
font-size:14px;
color: #000000;
BORDER: none;

}

</style>
</head>
<body>
<br><br><br>
<table border=0 width="300px" align="center" style="background-color:ffeeff;">

<%
if(session.getAttribute("userid")!=null)
{
String user = session.getAttribute("userid").toString();
%>

<tr><td style="font-weight:bold;font-size:20pt;" align="center">Welcome
 <%= user%></td></tr>
 <tr><td align="right"> 
&nbsp;
</td></tr>
<tr><td align="center"> 
 <a href="saveuser.jsp?flag=edit">Update profile</a>
 </td></tr>
 <tr><td align="right"> 
&nbsp;
</td></tr>
 <tr><td align="center"> 
  <a href="cash.jsp">Cash Transaction</a>
 </td></tr>
 <tr><td align="center"> 
&nbsp;
</td></tr>
 <tr><td align="center"> 
  <a href="viewstatement.jsp">View Transaction</a>
  </td></tr>
   <tr><td align="center"> 
&nbsp;
</td></tr>

<%
	
}
%>

</table>
</body>
</html>


