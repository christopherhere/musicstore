<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id='container'>
	<c:import url="Header.jsp"></c:import>
	<div id='productmain'>
	<c:import url="Sideuserbar.jsp"></c:import>
		<div id='products'>
		
		<center><h2>Billing Details</h2></center>
				
		<table>
		<tr>
			<td>Name</td>
			<td><input type='text'></td>
		</tr>
		<tr>
			<td>Phone number</td>
			<td><input type='text'></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type='text'></td>
		</tr>
		<tr>
			<td>Payment Type</td>
			<td>
			<select id="cars">
  <option value="volvo">Cash</option>
  <option value="saab">Card</option>
</select>
			
			</td>
		</tr>
		<tr>
		<td/>
		<td style='font-weight: bold;'><a href="Checkout">Order Now</a></td>
		</tr>
		</table>
		</div>
	
	</div>
</div>
</body>
</html>