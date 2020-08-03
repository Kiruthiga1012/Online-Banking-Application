<%@ include file="logininc.jsp" %>
<%@ page language="java" import="java.sql.*;"%>
<html>
<head>
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
<br><br><br>



<%
 int offset=0;
 int ofset = 0;
 if(request.getParameter("offset")!=null)
 {
	   offset= Integer.parseInt(request.getParameter("offset").toString());
 }


	int total_count = 0;
	int total_page = 0;
	int per_page =5;
    String name="";
	if(offset>1){
	ofset = offset*per_page-per_page;
	}
	
  if((request.getParameter("account_no")!=null) && request.getParameter("account_no")!="")
  {
	
  String user = session.getAttribute("userid").toString();
  String account_no = request.getParameter("account_no");

  String sd[] = request.getParameter("sdate").toString().split("-");
  String ed[] = request.getParameter("edate").toString().split("-");
  
  String sdate = sd[2]+"-"+sd[0]+"-"+sd[1] ;
  String edate = ed[2]+"-"+ed[0]+"-"+ed[1];
 


  //out.println("user " + user);
  // out.println("account_no " + account_no);
 // out.println("sdate " + sdate);
//  out.println("edate " + edate);
 
 
    System.out.println("MySQL Connect Example.");
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
	 String dbName = "userdetails";
    String driver = "com.mysql.jdbc.Driver";
    String username = "root"; 
    String userPassword = "root";
	String color = "#F9EBB3";


    try {
      Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,username,userPassword);
      
	   Statement stcount = conn.createStatement();
	  String strQuerycount = "select count(*),account_no from  transaction where username='"+user+"' and account_no='"+account_no+"' and cdate>='"+sdate+"' and cdate<='"+edate+"' group by account_no"; 
	  ResultSet rscount = stcount.executeQuery(strQuerycount);
      if(rscount.next())
		{
		 total_count=rscount.getInt(1);
		}

        if(total_count%per_page==0)
		{
		   total_page = total_count/per_page;
		}
		else
		{
            total_page = total_count/per_page+1;
		}
		//out.println(total_count);
		//out.println(total_page);
		//out.println(ofset);


  
		Statement st1 = conn.createStatement();
		    String strQuery1 = "select * from  user where username='"+user+"'";
		ResultSet   rs1 = st1.executeQuery(strQuery1);

         if(rs1.next())
		{
			  name =rs1.getString(1) + " "+ rs1.getString(2);
		}
       
       
	  
	  Statement st = conn.createStatement();
	  String strQuery = "select * from  transaction where username='"+user+"' and account_no='"+account_no+"' and cdate>='"+sdate+"' and cdate<='"+edate+"' limit "+ofset+","+per_page; 
	 // out.println(strQuery);
	 
	  ResultSet rs = st.executeQuery(strQuery);
	//  out.println("offset " + offset);
	  int count=0;
	  if(offset>1)
	   count=offset*per_page-per_page;
	
	  
	%>  
	<table style="padding-left:150px;">
<tr style="background-color:efefef;">
<td><b>Account No</b></td><td>:</td><td><%=account_no%></td>
</tr>
<tr style="background-color:efefef;">
<td><b>Username</b></td><td>:</td><td><%=user%></td>
</tr>
<tr style="background-color:efefef;">
<td><b>Name</b></td><td>:</td><td><%=name%></td>
</tr>

</table>
<br><br><br>
<table width="700px" align="center"  style="border:1px solid #000000;" >
<tr>
<td colspan=8 align="center" style="background-color:ffeeff"><b>Transaction Report</b></td>
</tr>
<tr style="background-color:efefef;">
<td><b>SNo</b></td>
<td><b>Amount</b></td>
<td><b>Net Amount</b></td>
<td><b>Cash Type</b></td>
<td><b>Date</b></td>
</tr>	 
<%
		  
	  while(rs.next())
		{
		  
		  if((count%2)==0)
		{
			
			color = "#eeffee";
			
			
		}
		else
		{
			 color = "#F9EBB3";
		}
		  count++;

		 
		  
	 %>
	 <tr style="background-color:<%=color%>;">
<td><%=count%></td>
<td><%=rs.getInt(4)%></td>
<td><%=rs.getInt(7)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(5)%></td>
</tr>
	 <%
		}
	 %>
	  </table>
	  <br><br>
	  <table width="100px" align="center" border=0><tr>
	  <%
	 if(count==0)
		{
		 %>
       <tr style="background-color:<%=color%>;">
<td colspan=8 align="center">No Record</td>

</tr>
		 <%
		}
	  
      System.out.println("Connected to the database");
      conn.close();
      System.out.println("Disconnected from database");
    } catch (Exception e) {
      e.printStackTrace();
    }

	       if(offset>1)
		{
		   int previous = offset-1;
		%>
		<td>
		 <a href="viewTransaction.jsp?account_no=<%=account_no%>&sdate=<%=request.getParameter("sdate")%>&edate=<%=request.getParameter("edate")%>&offset=<%=previous%>">Previous</a></td>
		<%
		}

 if(total_page>0)
		{
 for(int i=1;i<=total_page;i++)
 {
	 if(request.getParameter("offset")==null)
	 {
          offset=1;
	 }
	  if(i==offset)
	 {
		  %>
	     <td>
		<%=i%></td>
	  <%
	 }
     else{
	  %>
	     <td>
		 <a href="viewTransaction.jsp?account_no=<%=account_no%>&sdate=<%=request.getParameter("sdate")%>&edate=<%=request.getParameter("edate")%>&offset=<%=i%>"><%=i%></a></td>
	  <%
	 }
      
	}
		}

	
	   if(offset<total_page)
		{
		   int next = offset+1;
		%>
		<td>
		 <a href="viewTransaction.jsp?account_no=<%=account_no%>&sdate=<%=request.getParameter("sdate")%>&edate=<%=request.getParameter("edate")%>&offset=<%=next%>">Next</a></td>
		<%
		}

	 }
  else
  {
	   
	  response.sendRedirect("viewstatement.jsp");
  }




 %> 
</tr>
</table>

</body>
</html>


