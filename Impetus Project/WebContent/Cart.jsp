<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="javax.servlet.http.Cookie" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<style type="text/css">
#a {font-weight: bold;}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id='container'>
<c:import url="Header.jsp"></c:import>
<div id='productmain'>
<c:import url="Sideuserbar.jsp"></c:import>
<div id='products'>
<center><h2>Cart</h2></center>
<%
Cookie cook;
Cookie[] c=request.getCookies();
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
System.out.println("Connected To Database");
PreparedStatement ps;
ResultSet rs;
String q=null;
int price=0;
%>
<table>
<tr>
	<td id='a'>Product Name</td>
	<td id='a'>Product Id</td>
	<td id='a'>Product Price</td>
</tr>
<% 
String cookie;
int id;
for(int i=1;i<c.length;i++)
{
	cookie=c[i].getName();
	System.out.println(cookie);
	if(cookie.equals("JSESSIONID"))
	{
	
	}
	else
	{
		ps=con.prepareStatement("select * from products where productid="+c[i].getName());
		String name=c[i].getValue();
		System.out.println(name);
		rs=ps.executeQuery();
		while(rs.next())
		{
		price=price+rs.getInt(3);
		id=rs.getInt(2);
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><a href="CartFunction?action=removeitem&&id=<%=id%>">Remove From Cart</a></td>
			</tr>
				
	  <%}
	}
}

%>
<tr>
<td id='a'>Total </td>
	<td></td>
	
	<td id='a' name='price'><%=price %></td>
</tr>
<tr>
	<td/>
	<td/>
	<td/>
	<td id='a'><a href="Checkout.jsp">Click To Checkout</a></td>
</tr>
</table>

</div>

</div>
</div>


</div>
</body>
</html>