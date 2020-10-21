<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id='header'>
			<label id='sitename'>Lifafa</label>&nbsp The Joy of Music<br>
			&nbspHi <a href="Profile.jsp"><label style="font-family: garamond"><%out.print(session.getAttribute("username")); %></label></a> !
			
			
	</div>
	<div id="userlog"  style="">
			<h2 id="name">
			<a href="Cont?action=logout">LOGOUT&nbsp</a>
			</h2><br>	
	</div>
	
</body>
</html>