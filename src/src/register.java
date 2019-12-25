package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.*;
import java.util.Properties;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class register extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	String cno=request.getParameter("cno");
	long contact=Long.parseLong(cno);
	
	String add=request.getParameter("address");
	String type;
	type="";
	if(request.getParameter("type")!=null)
	{
		type=(request.getParameter("type")).toString();
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
	try
	{
	Driver d=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");  
	PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?)");
	ps.setString(1,email);
	ps.setString(2,pass);
	ps.setLong(3, contact);
	ps.setString(4, add);
	ps.setString(5,type);
	ps.executeUpdate();
	HttpSession ses=request.getSession(); 
	ses.setAttribute("address",add);
	ses.setAttribute("email", email);
	ses.setAttribute("contact", contact);
	if(type.equals("customer"))
	{
	out.println("<h4>welcome to your dashboard , you are successfully registered</h4>");
	response.sendRedirect("booking/examples/dashboard.jsp?arg=d");
	}
	else
	{
		out.println("<h4>you are registered successfully , you will be notified via email whenever you will receive a request from our customer</h4>");
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.include(request, response);
	}
	}
	catch (Exception e)
	{
		out.println(e);
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.include(request, response);
		out.print(e);
		
	}
	
	}

}
