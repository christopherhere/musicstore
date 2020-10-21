<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" import="java.servlet.*" import="java.io.*"%>
  
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=session.getAttribute("username").toString();
System.out.println(name);
String email=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
	System.out.println("Connected to Database");
	PreparedStatement ps=con.prepareStatement("Select email from userdata where name=?");
	ps.setString(1,name);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		email=rs.getString(1);
	}
}
catch(Exception E)
{
	
}
%>
<div id='container'>
<c:import url="Header.jsp"></c:import>
<div id='productmain'>
<c:import url="Sideuserbar.jsp"></c:import>
<div id='products'>
<h2>Order Successful</h2>
Dear <%=name %>,<br>
Ordered Will Be Delivered In 2-3 bussiness days.<br>
Order deatails will be sent to <%=email %> with the receipt.
</div>


</div>
</div>

</body>
</html>