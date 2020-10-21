<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id='container'>
	<div id='header'>
			<label id='sitename'>Lifafa</label>
	</div>
	
	<div id="userlog">
			<h2 id="name">
			<a href="login.jsp">Login&nbsp</a>
			</h2><br>	
		</div>
	<div id='productmain'>
	<form action='Cont?action=register' method='Post'>
		<table>
			<tr>
				<td>Name :</td>
				<td><input name='name' type='text'></input></td>
			</tr>
			<tr>
				<td>Username :</td>
				<td><input name='username' type='text'></input></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input name='password' type='Password'></input></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input name='email' type='text'></input></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input name='number' type='text'></input></td>
			</tr>
			<tr>
				<td></td>
				<td><input type='submit' value="Register"></input></td>
			</tr>
		
		</table>
	</form>
	</div>	

</div>
</body>
</html>