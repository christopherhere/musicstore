<%@page import="sun.awt.SunHints.Value"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.*"  %>
    <%@page isELIgnored="false"%>
   
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Products</title>
</head>
<body>
<div id='container'>
<c:import url="Header.jsp"></c:import>
	
	
	
		<div id='productmain'>
		
			<c:import url="Sideadminbar.jsp"></c:import>
			
			<div id='products'>
			<center><h2>Add Products</h2></center>
			<form action="SaveProduct" method="post">
				<table>
					<tr>
						<td>Product Name</td>
						<td><input name='pname' /></td>
					</tr>
					<tr>
						<td>Product Id</td>
						<td><input name='pid' /></td>
					</tr>
					<tr>
						<td>Product Price</td>
						<td><input name='pprice' /></td>
					</tr>
					<tr>
						<td>Product Quantity</td>
						<td><input name='pquantity' /></td>
					</tr>
					<tr>
						<td>Product Discription</td>
						<td><input name='pdis' /></td>
					</tr>
					<tr>
						<td>Product Image</td>
						<td><input name="pic" type="file" accept="image"></input></td>
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
						<td><input type="submit" value="Add product" /></td>
					</tr>
					
				</table>
			</form>
			<div>
				
				
				
			
			</div>
	
		</div>
</div>
</body>
</html>