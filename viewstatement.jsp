<%@ include file="logininc.jsp" %>
<html>
<head>
  <link rel="stylesheet" href="rfnet.css">
  <style type="text/css">
  <!--
   -->
  </style>
  <script type="text/javascript" language="javascript" src="datetimepicker.js"></script>
  <script language="JavaScript">
	<!--
		if (document.images)
		{
		calimg= new Image(16,16); 
		calimg.src="images/cal.gif"; 
		}
	//-->
</script>
</head>

<body>
<br><br>
<form name="cashForm" method="post" action="viewTransaction.jsp">
<table width="350px" align="center" border=0 style="background-color:ffeeff">
<tr>
		<td colspan=2 align="center" style="font-weight:bold;font-size:20pt;">View Transaction</td>
		
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
		
	</tr>
	<tr>
		<td>Account No</td>
		<td><input type="text" name="account_no" value=""></td>
	</tr>
	
	
	<tr>
		<td>Start Date</td>
		<td><input type="sdate" name="sdate" id="sdate"><a href="javascript:NewCal('sdate','mmddyyyy')"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
	</tr>

	<tr>
		<td>End Date</td>
		<td><input type="edate" name="edate" id="edate"><a href="javascript:NewCal('edate','mmddyyyy')"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
	</tr>
	
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Submit"></td>
	</tr>

<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	
</table>
</form>

</body>
</html>


