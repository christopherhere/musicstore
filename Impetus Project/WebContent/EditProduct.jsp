<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>

<%
String name=null;
String description=null;
int price=0;
int quantity=0;
int id=0;
String i=null;
;
try
{
id=Integer.parseInt(request.getParameter("id"));
System.out.println(id);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
System.out.println("Connected To Database");
PreparedStatement ps=con.prepareStatement("Select * from products where productid=?");

ps.setInt(1,id );

ResultSet rs=ps.executeQuery();
while(rs.next())
{
	name=rs.getString(1);
	price=rs.getInt(3);
	description=rs.getString(4);
	quantity=rs.getInt(6);
	i=rs.getString(2);
}

}
catch(Exception e)
{
	
}

%>






<div id='container'>
	<c:import url="Header.jsp"></c:import>
	
	<div id='productmain'></div>
		<c:import url="Sideadminbar.jsp"></c:import>
		
		<div id='products'>
			<center><h2>Edit Products</h2></center>
			<form action="UpdateProduct" method="Post">
				<table>
					<tr>
						<td><input name='pid' type='hidden' value=<%=i %>></td>
					</tr>
					<tr>
						<td>Product Name</td>
						<td><input value="<%=name %>" name='pname' /></td>
					</tr>
					<tr>
						<td>Product Price</td>
						<td><input value="<%=price %>" name='pprice' /></td>
					</tr>
					<tr>
						<td>Product Quantity</td>
						<td><input name="pq" value="<%=quantity %>" /></td>
					</tr>
					<tr>
						<td>Product Description</td>
						<td><input name="pd" value="<%=description %>" /></td>
					</tr>
					<tr>
						<td>Category</td>
						<td>
							<select name='Category'>
								  <option value="Guitar">Guitar</option>
								  <option value="Keyboard">Keyboard</option>
								  <option value="Drums">Drums</option>
								  <option value="Violin">Violin</option>
							</select>
			
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Update product" /></td>
					</tr>
					
				</table>
			</form>
		
		
		</div>
</div>
</body>
</html>