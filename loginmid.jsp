<%@ page language="java" import="java.sql.*;"%>
<html>
<head>
</head>
<body>
<%
  
  String userName = request.getParameter("userName");
  String password = request.getParameter("password");
 
  	


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
	  String strQuery = "select count(*) from user where username='"+userName+"' and password='"+password+"'"; 
	  out.println(strQuery);
	  ResultSet rs = st.executeQuery(strQuery);
	 
	   if(rs.next())
		{
		   if(rs.getInt(1)>0)
			{
			   session.setAttribute("userid",userName);
			  response.sendRedirect("welcome.jsp");
			}
			else
			{
               response.sendRedirect("login.jsp");
			}
		}
      System.out.println("Connected to the database");
      conn.close();
      System.out.println("Disconnected from database");
    } catch (Exception e) {
      e.printStackTrace();
    }
 %> 

</body>
</html>


