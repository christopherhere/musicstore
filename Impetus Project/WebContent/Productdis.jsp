<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.io.*"%>
    <%@page import="java.sql.*" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#a {float: right}
h3 {font-family: garamond}
#tnc {margin-left:20%;padding: 10px;background-color: rgba(0,0,0,0.1)}
</style>
</head>
<body>

<div id="container">
	<c:import url="Header.jsp"></c:import>
	<div id="productmain" style="">
		<c:import url="Sideuserbar.jsp"></c:import>
	<div id='productsdis'>
			
			
			
			<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
			System.out.println("Connected to Database");
			PreparedStatement ps=con.prepareStatement("Select * from Products where productid=?");
			ps.setString(1, request.getParameter("id"));
			ResultSet rs=ps.executeQuery();
			String name=null;
			String des=null;
			int price=0;
			int id=0;
			while(rs.next())
			{
				byte[] imgData = rs.getBytes("PRODUCTPIC"); 
		        String encode = Base64.getEncoder().encodeToString(imgData);
		        request.setAttribute("imgBase", encode);
				name=rs.getString(1);
				price=rs.getInt(3);
				id=rs.getInt(2);
				des=rs.getString(4);
				
			}
			%>
			
			<div style="padding :10px;">
			<img style="border:solid rgba(0,0,0,0.5);" src="data:image/jpeg;base64,${imgBase}" class="productimage">	
			</div>
			
			<div style="padding: 2px;">
			<label id="productname">
			<h3>Product Id : <%=id %><br>
			Product Price : <%=price %><br>
			Product Name : <%=name %>
			</h3>
			</label>
			<fieldset style="border:solid rgba(0,0,0,0.5)">
			<legend>Product Description</legend>
			<P><%=des%></P>
			<br>
			<a id='a' style="font-size: 20px" href="CartFunction?action=addcart&&id=<%=id%>&&q=1">Add To Cart</a>
			</fieldset>
			</div>
			
		
			
		</div>
		
			<br>
			<br>
			<div id='tnc' style="padding: 18px">
			
			<div style="border:solid rgba(0,0,0,0.5);border-radius:10px;padding: 10px">
			<P style="border:solid rgba(0,0,0,0.2)">
			<h3>Missing/Damaged Fee</h3>

For products returned with the following conditions below, a 15% product missing/damaged fee will be deducted from the refunded amount.

Wear and tear on the product like small scratches and dents
Damage to the original manufacturing box or accessories
Missing box items like an owner’s manual or software/ driver CD’s, etc.
Damage or dents incurred during the return shipping process
Tampered / Missing barcode from the product
Refunds will not be processed for products with more significant damage or missing significant accessories, like connector cables, or DC power supplies.

<h3>Return Policy Exceptions</h3>

Products received with physical damage must be reported to Bajaao within 2 days of the delivery date.
Products purchased as Open Box cannot be returned. All Open Box sales are final. Open Box products have been tested and are guaranteed to be functional. If you have a reason to believe that your open box product is non-functional, please contact us on helpdesk@bajaao.com with video evidence. We cover product malfunction for open-box products.
Products purchased under Garage Sale cannot be returned. All Garage Sales are final. Garage Sale products have been tested and are guaranteed to be functional.
We do not accept returns of the following items:
Harmonicas, flutes, saxophones, and all other wind instruments, earphones, In-ear monitors – due to health concerns are given potential exposure to the mouth/ear area.
Opened software products.
All products with manufacturer seal. Once the seal is opened it cannot be assigned to another user, and hence BAJAAO cannot accept the return unless there is a case of product malfunction.
Audio Interfaces, Midi Keyboards or any other product that entails registration in order to be used. Once registered, the product cannot be reassigned to another user, and hence BAJAAO cannot accept the return.
Gift Cards and Gift Vouchers
Acoustic Drum Kits and Drum heads cannot be accepted under returns unless there is a case of product malfunction / product defect.

Products damaged due to the use of an inappropriate power supply or products that were damaged due to voltage stability issues will not be accepted as returns. Across India, and even in the four core metro areas, a high-quality voltage stabiliser and spike protector are necessary to protect all electronic gear.
Note* - In case Bajaao is unable to pick-up your shipment due to certain unforeseen circumstance, you may have to ship the products to our facility. The logistic charges involved in these cases would be refunded back to you after the product reaches us.

<h3>Return Shipping</h3>

Unless you have received a damaged or defective product or a product different than the one you have ordered, you are responsible for shipping the product back to our facility near Mumbai.

<h3>Return Process</h3>

If you would like to return a product, it is required to either submit the Contact Us form or call us as soon as possible at +91-22-42035353 (extension 3). All returns must be authorised and the return shipment must be mailed within 15 days of receiving the original shipment.

The refund will be initiated only after the package has been received back at our facility.
The refunded amount will be transferred, as per banking and payment gateway norms, within 14 to 21 business days of the receipt of the returned shipment.</P></div>
			</div>
	
	</div>	

</div>

</body>
</html>