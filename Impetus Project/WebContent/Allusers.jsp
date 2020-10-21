<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
tr {font-size: 15px}
#a {font-weight: bolder;}
table {}
</style>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
		System.out.println("Connected to Database");
		PreparedStatement ps=con.prepareStatement("Select * from userdata");
		ResultSet rs=ps.executeQuery();
		PreparedStatement ps1=con.prepareStatement("Select * from userdata");
%>

<div id='container'>
	<c:import url="Header.jsp"></c:import>
	<div id="productmain">
	<c:import url="Sideadminbar.jsp"></c:import>
	
	<div id="products">
	<center><h2>All users</h2></center>
	<table style="">
		<tr>
			<td id='a'>NAME</td>
			<td id='a'>USERNAME</td>
			<td id='a'>EMAIL</td>
			<td id='a'>NUMBER</td>
		</tr>
		
		<% 
		String status="";
		while(rs.next())
		{
			status=rs.getString(6);
			out.print("<tr>");
			out.print("<td>"+rs.getString(1).toUpperCase()+"</td>");
			out.print("<td>"+rs.getString(2).toUpperCase()+"</td>");
			out.print("<td>"+rs.getString(4).toUpperCase()+"</td>");
			out.print("<td>"+rs.getString(5).toUpperCase()+"</td>");
			
			
			
			if(status.equals("Blocked"))
			{%>
				<td><a href="Status?action=unblock&&id=<%=rs.getString(2)%>">UNBLOCK</a></td>
			<%}
			else
			{%>
				<td><a href="Status?action=block&&id=<%=rs.getString(2)%>">BLOCK</a></td>
			<%}
			%>
			
			
			
			
			<%out.print("</tr>");
		}
		%>
	</table>
	</div>
	</div>
</div>
</body>
</html>