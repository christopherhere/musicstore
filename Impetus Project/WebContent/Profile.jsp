<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String username=session.getAttribute("username").toString();
String name=null;
String email=null;
String password=null;
int number=0;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
System.out.println("Connected To Database");
PreparedStatement ps=con.prepareStatement("Select * from userdata where username=?");
ps.setString(1,username);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	name=rs.getString(1);
	email=rs.getString(4);
	number=rs.getInt(5);
	password=rs.getString(3);
	
}

%>
<div id='container'>
	<c:import url="Header.jsp"></c:import>
	<div id='productmain'>
	<c:import url="Sideuserbar.jsp"></c:import>
		<div id='products'>
		<h2><center>Profile Details</center></h2>
		<form action='LoginCheck' method="Post">
			<table>
				<tr>
					<td>Name :</td>
					<td><input name='name' value="<%=name %>" type='text'></input></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input name='password' value="<%=password %>" type='Password'></input></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input name='email' value="<%=email%>" type='text'></input></td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input name='number' value="<%=number %>" type='text'></input></td>
				</tr>
				<tr>
					<td></td>
					<td><input type='submit' value="Update Profile"></input></td>
				</tr>
			
			</table>
		</form>
		</div>
	</div>
</div>

</body>
</html>