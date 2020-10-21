
<%@page import="java.io.InputStream"%>
<%@page import="sun.awt.SunHints.Value"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.sql.*" import="java.servlet.*" import="java.io.*" %>
    <%@page isELIgnored="false"%>
   
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Products</title>
<style type="text/css">
a:hover{color:#000;color: White;}
</style>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-code,no-store,must-revalidate");

if(session.getAttribute("username")==null)
{
	response.sendRedirect("login.jsp");
}

%>
<div id='container'>
	<c:import url="Header.jsp"></c:import>
	
	
		<div id='productmain'>
		
			<c:import url="Sideuserbar.jsp"></c:import>
			
			<div id='products'>
			<center><h2>Products</h2></center>
			<div>
				
				<%
				try
				{
				String Productname,Productid,Product;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
				System.out.println("Connected to Database");
				PreparedStatement ps=con.prepareStatement("Select * from Products where productquantity>0 and category='Keyboard'");
				ResultSet rs=ps.executeQuery();
				int count=0;
				
				while(rs.next())
				{	
					
					int id=rs.getInt(2);
					
					 byte[] imgData = rs.getBytes("PRODUCTPIC"); 
			       	 String encode = Base64.getEncoder().encodeToString(imgData);
			         request.setAttribute("imgBase", encode);
					
					if(count==0)
					{%>
						&nbsp&nbsp
					<%}
					count++;
					Productname=rs.getString(1);
					request.setAttribute("name", Productname);
					Productid=rs.getString(2);
					request.setAttribute("id", Productid);
					String productprice=rs.getString(3);
					request.setAttribute("price", productprice);
					%>
					<div style="border:solid rgba(0,0,0,0.5)" class="productdetails">
					<h3><c:out value="${name}"/>
						
					<label style="float: right;">Rs. : <c:out value="${price}"/></label>
					
					</h3>
					
					<a href="Productdis.jsp?id=<%=Productid%>"><img style="hover{color:#000;color: White;};border:solid rgba(0,0,0,0.5)" src="data:image/jpeg;base64,${imgBase}" class="productimage"></a>
					</div>
					&nbsp
					
					<%
					if(count==3)
					{%>
						<br>
						<br>
			
					<%
					count=0;
					}
					
				}
				
				
				
				}
				catch(Exception E)
				{
					
				}
				%>
				
			
			</div>
	
		</div>
</div>
</body>
</html>