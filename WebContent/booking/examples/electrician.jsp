<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
   
    %>
    <%@ page import="java.io.IOException" %>
    <%@ page import="java.io.IOException" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.sql.PreparedStatement" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="../assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>

<%
		if(session.getAttribute("email")==null)
		{
			out.println("<h4>Please login first</h4>");
			response.sendRedirect("index.jsp");		}

String arg=" ";
if(request.getParameter("arg")!=null)
{
	arg=request.getParameter("arg");
}
	

%>
    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="../assets/img/sidebar-3.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="logo">
                <a href="javascript:void(0)" class="simple-text">
                 <% String em=(session.getAttribute("email")).toString(); 
                 if(em.length()>25)
                 {
                 	out.println(em.substring(0,21)+"...");
                 }
                 else
                 {
                	 out.println(em);
                 }
                 %>
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li >
                        <a href="./dashboard.jsp">
                            <i class="material-icons">dashboard</i>
                            <p>Carpenter</p>
                        </a>
                    </li>
                    <li>
                        <a href="./plumber.jsp">
                            <i class="material-icons">person</i>
                            <p>Plumber</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="./electrician.jsp">
                            <i class="material-icons">content_paste</i>
                            <p>Electrician</p>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> Book your Electrician</a>
                             <%  
                               if(arg.equals("done")){out.print("<h6>Successfully booked your Electrician</h6>");}%>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    	
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
                            	
                        </ul>
                        
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                   
                        
                      
                        
                
                  
                    <div class="row">
                    <% int i=0;
    			try
    			{
    				Driver d=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");  
    				PreparedStatement ps=con.prepareStatement("select * from user where type=? ");
    				ps.setString(1,"electrician");
    				ResultSet rs=ps.executeQuery();	
    			
    				while(rs.next())
    				{i++;
    				%>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="green">
                          <a href=http://localhost:8080/booking/send?tp=electrician&email=<%out.println(rs.getString("email")); %>>
					<button type="button" class="btn btn-primary">Book This Electrician</button></a>
                                </div>
                                <div class="card-content">
                                    <h4 class="title"><%out.println(rs.getString("email")); %></h4>
                                    <p class="category">
                                       <%out.println(rs.getString("CNo")); %>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                     <%out.println(rs.getString("Address")); %>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <%
    				}
    				
    			}
    			catch(Exception e)
    			{
    				out.println(e);
    			}
                    if(i==0)
                    {
                    	out.println("<h2> Sorry no Electricians available</h2>");
                    }
    		
    			%>                  
                    </div>
                </div>
            </div>
        
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="../assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="../assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

    });
</script>

</html>