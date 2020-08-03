<%@ page language="java" import="java.util.*,java.sql.*,java.text.*;"%>
<%
  
   String DATE_FORMAT_NOW = "yyyy-MM-dd";
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
     
    String validdate =  sdf.format(cal.getTime());

	
 


  String user = session.getAttribute("userid").toString();
  String account_no = request.getParameter("account_no");
   String cashType = request.getParameter("cashType");
 /*  String cdate[] = request.getParameter("cdate").toString().split(" ");
   String cd[] = cdate[0].toString().split("-");
     String cashdate = cd[2]+"-"+cd[0]+"-"+cd[1]+ " " + cdate[1];*/
   int amount = Integer.parseInt(request.getParameter("amount").toString());
   int netamount=0;
  //out.println(user);
  // out.println(account_no);
   //.println(cashType);
   //out.println(amount);
   //out.println(cashdate);
  	


    System.out.println("MySQL Connect Example.");
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
	 String dbName = "userdetails";
    String driver = "com.mysql.jdbc.Driver";
    String username = "root"; 
    String userPassword = "root";
    try {
      Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,username,userPassword);
	  Statement st = conn.createStatement();
	  String strQuery = "select count(*),netamount from transaction where username='"+user+"' and account_no='"+account_no+"' and id=(select max(id) from transaction) group by id"; 
	  //out.println("1" +strQuery);
	  ResultSet rs = st.executeQuery(strQuery);
	 
	   if(rs.next())
		{
		    out.println("in select");
		   if(cashType.equals("Deposit"))
			{
              netamount = amount +  rs.getInt(2);    
			}
			else if(cashType.equals("WithDrawn"))
			{
				if(rs.getInt(2)>amount){
                 netamount = rs.getInt(2)-amount; 
				}
				else
				{
					 response.sendRedirect("cash.jsp?errmsg=error");
				}
			}
			strQuery = "insert into transaction set account_no='"+account_no+"',username='"+user+"',amount='"+amount+"',cdate='"+validdate+"',cashType='"+cashType+"',netamount='"+netamount+"'";
             int i = st.executeUpdate(strQuery);
			 if(i>0)
			{
				  response.sendRedirect("welcome.jsp");
			}
			
		}
		else
		{
			netamount = amount;
		  	strQuery = "insert into transaction set account_no='"+account_no+"',username='"+user+"',amount='"+amount+"',cdate='"+validdate+"',cashType='"+cashType+"',netamount='"+netamount+"'";
			out.println("2 "+strQuery);
			 int i = st.executeUpdate(strQuery);
			 if(i>0)
			{
				  response.sendRedirect("welcome.jsp");
			}
		}
      System.out.println("Connected to the database");
      conn.close();
      System.out.println("Disconnected from database");
    } catch (Exception e) {
      e.printStackTrace();
    }
 %> 



