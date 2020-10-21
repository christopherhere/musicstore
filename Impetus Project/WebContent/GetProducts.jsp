<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {}
#a {font-weight: bold;}
</style>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Insert title here</title>
</head>
<body>

<div id='container'>
	<c:import url="Header.jsp"></c:import>
	
	
		<div id='productmain'>
		
			<c:import url="Sideadminbar.jsp"></c:import>
			
			<div id='products'>
			<center><h2>Product List</h2></center>
			<table>
			<tr>
				<td id='a'>PRODUCT NAME</td>
				<td id='a'>PRODUCT ID</td>
				<td id='a'>PRODUCT PRICE</td>
				<td id='a'>QUANTITY</td>
				<td id='a'>CATEGORY</td>
			</tr>
			<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
			System.out.println("Connected To Database");
			PreparedStatement ps=con.prepareStatement("Select * from Products order by category");
			ResultSet rs=ps.executeQuery();
			String Productname,Productid,Productprice;
			while(rs.next())
			{
				out.print("<tr>");
				out.print("<td>"+rs.getString(1).toUpperCase()+"</td>");
				out.print("<td>"+rs.getString(2).toUpperCase()+"</td>");
				out.print("<td>"+rs.getString(3).toUpperCase()+"</td>");
				out.print("<td>"+rs.getString(6).toUpperCase()+"</td>");
				out.print("<td>"+rs.getString(7).toUpperCase()+"</td>");
				
				
				%>
				<td><a href="EditProduct.jsp?id=<%=rs.getInt(2)%>">EDIT PRODUCT&nbsp</a></td>
				<td><a href="UpdateProduct?action=deleteproduct&&id=<%=rs.getInt(2)%>">DELETE PRODUCT</a></td>
				</tr>
			<%
			
			}
			%>	
			
		
			</table>
				
			
			</div>
	
		</div>
</div>
</body>
</html>