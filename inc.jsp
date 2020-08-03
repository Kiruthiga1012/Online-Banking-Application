<%@ page language="java" import="java.sql.*;"%>
<%

// initialze the parameter form

	String firstName = "";
	String lastname = "";
	String userName =  "";
	String password =  "";
	String email =  "";
	String contactNo =  "";
	String address =  "";
	String countryName =  "";
	String state =  "";
	String flag = "";
	String readOnly = "";
	ResultSet rs1=null;
	ResultSet rs2=null;
	int countUser=0;
	int countemail=0;
	boolean emailvalid = false;
	String  validuser = ""; 
	String  validemail = ""; 

// initialze the database connectivity
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
	 String dbName = "userdetails";
    String driver = "com.mysql.jdbc.Driver";
    String username = "root"; 
    String userPassword = "root";
	String submit="";


if(request.getParameter("Submit")!=null)
{
 submit = request.getParameter("Submit").toString();
}
if(request.getParameter("Submit")!=null)
{
	
		firstName = request.getParameter("firstName");
		lastname = request.getParameter("lastname");
		userName = request.getParameter("userName");
		password = request.getParameter("password");
		email = request.getParameter("email");
		contactNo = request.getParameter("contactNo");
		address = request.getParameter("address");
		countryName = request.getParameter("countryName");
		state = request.getParameter("state");
  
  	
	 try {
      Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,username,userPassword);
	  Statement st = conn.createStatement();
	   String strQuery=null;
      
         
	  
 
         strQuery = "select * from user where email='"+email+"'"; 
		 rs1 = st.executeQuery(strQuery); 
		 while(rs1.next())
		 {
			 
		   countemail++;
		 }
  
     if(countemail>0)
		 {
		 validemail="Email already exits"+"<br>";
		 }

     
	  if(session.getAttribute("userid")!=null)
      {
		readOnly = "READONLY";
		    
		strQuery = "select count(*) from user where email='"+email+"' and username!='"+userName+"'"; 
		
		 rs2 = st.executeQuery(strQuery); 
		
		 if(rs2.next())
		 {
			 if(rs2.getInt(1)>0)
			 {
		      emailvalid = true;
			   validemail="Email already exits"+"<br>";
			 }
		 }
      
	   
	   if(!emailvalid)
		  {
		    
		   strQuery = "update user set first_name='"+firstName+"',last_name='"+lastname+"',username='"+userName+"',password='"+password+"',email='"+email+"',contact_no='"+contactNo+"',address='"+address+"',country_name='"+countryName+"',state='"+state+"'  where username='"+userName+"'";
		   int rs = st.executeUpdate(strQuery);
			 if(rs>0)
				{
				 response.sendRedirect("welcome.jsp");
				}	
		  }
		  
	  }
	  else 
	  {
			strQuery = "select * from user where username='"+userName+"'"; 
			rs1 = st.executeQuery(strQuery);
			while(rs1.next())
			{
			countUser++;
			}
			 if(countUser>0)
			 {
			 validuser="User already exits"+"<br>";
			 }
			if(countUser==0 && countemail==0)
			{
				strQuery = "insert into user set first_name='"+firstName+"',last_name='"+lastname+"',username='"+userName+"',password='"+password+"',email='"+email+"',contact_no='"+contactNo+"',address='"+address+"',country_name='"+countryName+"',state='"+state+"'  ";
				int rs = st.executeUpdate(strQuery);
				if(rs>0)
				{
				response.sendRedirect("successuser.jsp");
				}	
			}
	  }
	 
	
	  
      System.out.println("Connected to the database");
      conn.close();
      System.out.println("Disconnected from database");
    } catch (Exception e) {
      e.printStackTrace();
    }
}
else
{
  
	if(request.getParameter("flag")!=null)
	{
		flag = request.getParameter("flag");
	}
	if((session.getAttribute("userid")!=null) &&  flag.equals("edit"))
	{
		 readOnly = "READONLY";
	String user = session.getAttribute("userid").toString();
     
	   
		try {
		  Class.forName(driver).newInstance();
		  conn = DriverManager.getConnection(url+dbName,username,userPassword);
		  Statement st = conn.createStatement();
		  String strQuery = "select * from user where username='"+user+"'"; 
		   ResultSet rs = st.executeQuery(strQuery);
		 
		   while(rs.next())
			{
				firstName = rs.getString(1).toString();
				lastname = rs.getString(2).toString();
				userName = rs.getString(3).toString();
				email = rs.getString(5).toString();
				contactNo = rs.getString(6).toString();
				address = rs.getString(7).toString();
				countryName = rs.getString(8).toString();
				state = rs.getString(9).toString();
			   
			}
		  System.out.println("Connected to the database");
		  conn.close();
		  System.out.println("Disconnected from database");
		 
		} catch (Exception e) {
		  e.printStackTrace();
		}
		
	}
}


%>
<%=validuser%>
<%=validemail%>
