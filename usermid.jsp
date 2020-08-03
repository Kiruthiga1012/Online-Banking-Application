<%@ page language="java" import="java.sql.*;"%>
<html>
<head>
</head>
<body>
<%
  String firstName = request.getParameter("firstName");
  String lastName = request.getParameter("lastname");
  String userName = request.getParameter("userName");
  String password = request.getParameter("password");
  String email = request.getParameter("email");
  String contactNo = request.getParameter("contactNo");
  String address = request.getParameter("address");
  String countryName = request.getParameter("countryName");
  String state = request.getParameter("state");
  
  	



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
	   String strQuery=null;
	  if(session.getAttribute("userid")!=null)
      {
		   strQuery = "update user set first_name='"+firstName+"',last_name='"+lastName+"',username='"+userName+"',password='"+password+"',email='"+email+"',contact_no='"+contactNo+"',address='"+address+"',country_name='"+countryName+"',state='"+state+"'  where username='"+userName+"'";
	  }
	  else
	  {
	   strQuery = "insert into user set first_name='"+firstName+"',last_name='"+lastName+"',username='"+userName+"',password='"+password+"',email='"+email+"',contact_no='"+contactNo+"',address='"+address+"',country_name='"+countryName+"',state='"+state+"'  ";
	  }
	  out.println(strQuery);
	  int rs = st.executeUpdate(strQuery);
	 if(rs>0)
		{
	  //  response.sendRedirect("login.jsp");
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


