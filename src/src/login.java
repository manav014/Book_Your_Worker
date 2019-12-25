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

@WebServlet("/login")
public class login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	try
	{
	Driver d=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");  
	PreparedStatement ps=con.prepareStatement("select Address,CNo,type from user where email=? and Password=? ");
	ps.setString(1,uname);
	ps.setString(2,pass);
	ResultSet rs=ps.executeQuery();

		if(rs.next() /*&& type=="customer"*/)
		{
			String type=rs.getString("type");
			if(type.equals("customer"))
			{
			String add=rs.getString("Address");
			long cno=rs.getLong("CNo");
			HttpSession ses=request.getSession();
			ses.setAttribute("address",add);
			ses.setAttribute("email", uname);
			ses.setAttribute("contact", cno);
			con.close();
			response.sendRedirect("booking/examples/dashboard.jsp?arg=d");
			}
			else
			{

				out.println("<h4>Sorry only customers are allowed to login</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.include(request, response);

				
			}
		}
		else
		{
			out.println("<h4>Sorry Please enter a valid email and passsword</h4>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}
	catch (Exception e)
	{
		out.println(e);
	}
	
	}

}
