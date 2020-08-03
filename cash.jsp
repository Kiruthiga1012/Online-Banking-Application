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
<form name="cashForm" method="post" action="cashmid.jsp">
<br><br>
<table width="400px" align="center" border=0 style="background-color:ffeeff;">
<tr>
		<td align="center" colspan=2 style="font-weight:bold;font-size:20pt;">Cash Transaction</td>
		
	</tr>
<tr>
		<td align="center" colspan=2>&nbsp;</td>
		
	</tr>
	<tr>
		<td>Account No</td>
		<td><input type="text" name="account_no" value=""></td>
	</tr>
	
	<tr>
		<td>Cash</td>
		<td>
		<select name="cashType">
		<option value="-1">Select</option>
		<option value="Deposit">Deposit</option>
		<option value="WithDrawn">WithDrawn</option>
		</select>
		</td>
	</tr>

	<tr>
		<td>Amount</td>
		<td><input type="amount" name="amount"></td>
	</tr>
	<%--<tr>
		<td>Date</td>
		<td><input type="cdate" name="cdate" id="cdate"><a href="javascript:NewCal('cdate','mmddyyyy')"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
	</tr>--%>
	
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


