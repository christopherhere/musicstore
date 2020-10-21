<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<style type="text/css">

#box {}

</style>
</head>
<body>

<div id='container'>
		
		<div id='header' style="border-radius:5px;position: relative;border:solid rgba(0,0,0,0.5);margin-left:7px">
			<label id='sitename'>&nbspLifafa</label>&nbsp The Joy of Music
			<a style="float: right;" href="Newac.jsp"><label style="font-size: 20px;font-family: garamond"><br>CREATE ACCOUNT&nbsp<br></label></a>
		</div>
	
		
		
		<div id='productmain' style="margin-top:1%">
			<div style="overflow:hidden;height:50px;width: 99%;border-radius: 5px">
			<img alt="" src="ban.jpg" style="">
			</div>
			<br>
		<div id='quicktog' style="overflow: hidden;padding: 15px;position: absolute;">
		<img alt="" src="side.jpg" style="width: 200px">
		<br>
			<fieldset style="border:solid rgba(0,0,0,0.5)">
			<legend><h3>Abous Us</h3></legend>
			<p>India's largest direct online retailer for musical instruments and pro audio equipment. <br>
			 We also offer a wide range of services to the music entertainment industry.
		
			The Lifafa brand is well known for our focus on customer service and it has become one of the most trusted names in the industry.<br></p>
			</fieldset>
		</div>
		<div id='products' style="background-color: rgba(0,0,0,0)">
			<div style="background-color: rgba(0,0,0,0.1);padding: 10px;border-radius: 5px">
				<fieldset style="border:solid rgba(0,0,0,0.5)">
						<legend>Login</legend>
						<br>
						<form action='LoginCheck' method='get'>
						<table id='logintable'>
							<tr>
								<td>Username</td>
								<td><input id='uid' type="text" name="Username"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input id='pass' type="Password" name="Password"></td>
							</tr>
						</table>
						<input type="submit" value="Submit">
						</form>
					</fieldset>
			</div>
			<br>
			<div style=";background-color: rgba(0,0,0,0.1);padding:10px;height: 470px;width:98%;">
				<img style="width: 100%;height: 100%" id="img1"></img>
			</div>
			
			
		</div>
		
		
		
		</div>
		
		
</div>
</body>
<script type="text/javascript">
var imgarray=['11.jpg','222.jpg','33.jpg'],
curIndex=0;
imgDuration=20000;

function slideshow()
{
document.getElementById('img1').src=imgarray[curIndex];
curIndex++;
if(curIndex==imgarray.length)
{
curIndex=0;
}
setTimeout("slideshow()",imgDuration);

}
slideshow();
</script>
</html>