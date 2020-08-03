<%@ page language="java" import="java.sql.*;"%>

<%

    System.out.println("MySQL Connect Example.");
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
	 String dbName = "userdetails";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "root";
   
      Class.forName(driver).newInstance();
	
	  try {
       conn = DriverManager.getConnection(url+dbName,userName,password);
	     
        Statement stmt = conn.createStatement();
		ResultSet rst = stmt.executeQuery("select * from user");
		while(rst.next()){
			out.println(rst.getString(2));
		}

      System.out.println("Connected to the database");
      conn.close();
      System.out.println("Disconnected from database");
    } catch (Exception e) {
      e.printStackTrace();
    }
      
    
 %> 