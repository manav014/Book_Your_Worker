<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
   
    %>
    <%@ page import="java.io.IOException" %>
    <%@ page import="java.io.IOException" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>

<style>
/* Full-width input fields */
input[type=text], input[type=password],input[type=email],input[type=number],select,option {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>



<body>

<%
		if(session.getAttribute("email")==null)
		{
			out.println("<h4>Please login first</h4>");
			response.sendRedirect("index.jsp");		}
		
%>

<button onclick="document.getElementById('plumber').style.display='block'" style="width:auto;">Book a plumber</button>

<div id="plumber" class="modal">
  
  
    <div class="imgcontainer">
      <span onclick="document.getElementById('plumber').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="https://www.w3schools.com/howto/img_avatar2.png" height=2px width=1px alt="Avatar" class="avatar">
    </div>

    <div class="container">
    		
    			<%
    			try
    			{
    				Driver d=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");  
    				PreparedStatement ps=con.prepareStatement("select * from user where type=? ");
    				ps.setString(1,"plumber");
    				out.println("hey there this is manav");
    				ResultSet rs=ps.executeQuery();	
    				while(rs.next())
    				{
    				%>
    				<a href=send?c=plumber&email=<%out.println(rs.getString("email")); %>>
	<button type="button" class="btn btn-primary btn-lg btn-block"><%out.println("email - "+rs.getString("email")+"addresss - "+rs.getString("Address")); %></button><br></a>
   	
					<%
    				}
    				
    			}
    			catch(Exception e)
    			{
    				out.println(e+"bye");
    			}
    		
    			%>
      		
           
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('plumber').style.display='none'" class="cancelbtn">Cancel</button>
	</div>      
    
  
</div>

<button onclick="document.getElementById('carpainter').style.display='block'" style="width:auto;">Book a Carpainter</button>

<div id="carpainter" class="modal">
  
 
    <div class="imgcontainer">
      <span onclick="document.getElementById('carpainter').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="https://www.w3schools.com/howto/img_avatar2.png" height=2px width=1px alt="Avatar" class="avatar">
    </div>

    <div class="container">
    		
    			<%
    			try
    			{
    				Driver d=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");  
    				PreparedStatement ps=con.prepareStatement("select * from user where type=? ");
    				ps.setString(1,"carpainter");
    				ResultSet rs=ps.executeQuery();	
    				while(rs.next())
    				{
    				%>
    				<a href=send?email=<%out.println(rs.getString("email")); %>>
					<button type="button" class="btn btn-primary btn-lg btn-block"><%out.println("email - "+rs.getString("email")+"addresss - "+rs.getString("Address")); %></button><br></a>
   	
					<%
    				}
    				
    			}
    			catch(Exception e)
    			{
    				out.println(e);
    			}
    		
    			%>
      		
           
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('carpainter').style.display='none'" class="cancelbtn">Cancel</button>
	</div>      
    
  </div>

<button onclick="document.getElementById('electrician').style.display='block'" style="width:auto;">Book an Electrician</button>

<div id="electrician" class="modal">
  
 
    <div class="imgcontainer">
      <span onclick="document.getElementById('electrician').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="https://www.w3schools.com/howto/img_avatar2.png" height=2px width=1px alt="Avatar" class="avatar">
    </div>

    <div class="container">
    		
    			<%
    			try
    			{
    				
    				Driver d=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");  
    				PreparedStatement ps=con.prepareStatement("select * from user where type=? ");
    				ps.setString(1,"electrician");
    				ResultSet rs=ps.executeQuery();	
    				while(rs.next())
    				{
    				%>
    				<a href=send?email=<%out.println(rs.getString("email")); %>>
					<button type="button" class="btn btn-primary btn-lg btn-block"><%out.println("email - "+rs.getString("email")+"addresss - "+rs.getString("Address")); %></button><br></a>
   	
					<%
    				}
    				
    			}
    			catch(Exception e)
    			{
    				out.println(e);
    			}
    		
    			%>
      		
           
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('electrician').style.display='none'" class="cancelbtn">Cancel</button>
	</div>      
    
 
</div>



<script>
    // Get the modal
    var pmodal = document.getElementById('plumber');
    var cmodal=document.getElementById('carpainter');
    var emodal=document.getElementById('electrician');
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == pmodal) {
            pmodal.style.display = "none";
        }
    }
    window.onclick = function(event) {
        if (event.target == cmodal) {
            cmodal.style.display = "none";
        }
    }
    window.onclick = function(event) {
        if (event.target == emodal) {
            emodal.style.display = "none";
        }
    }
    </script>





</body>
</html>
