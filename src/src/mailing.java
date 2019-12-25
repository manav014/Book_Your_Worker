package src;
import java.io.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
@WebServlet("/send")
public class mailing extends HttpServlet 
{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        String tp=request.getParameter("tp");
    	HttpSession ses=request.getSession();
       	String email=(ses.getAttribute("email")).toString();
        PrintWriter out = response.getWriter();
        try {
        	
        
     
        	String address=(ses.getAttribute("address").toString());
        	String contact=(ses.getAttribute("contact").toString());
   
       String semail=request.getParameter("email");
       
       String to,subject,body;
       to="";
       subject="";
       body="";
        
           subject="New Booking";
         body="you have been booked by the email id " + email + "\n\n Address of the customer is "+address +"\n\ncontact number of the customer is "+contact;
       
       
        
       
           Properties props = new Properties();
           props.put("mail.smtp.host", "smtp.gmail.com");
           props.put("mail.smtp.socketFactory.port", "465");
           props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.port", "465");
           Session session = Session.getInstance(props,new javax.mail.Authenticator() 
           {
        	   protected PasswordAuthentication getPasswordAuthentication() 
        	   {
        		   return new PasswordAuthentication("studywithmanav2learn@gmail.com","manav_12345");
        	   }
           });
 
           try 
           {
        	   Message message = new MimeMessage(session);                      
        	   message.setFrom(new InternetAddress("studywithmanav2learn@gmail.com"));
        	   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(semail));
               message.setSubject(subject);
               message.setText(body);
               Transport.send(message);
               out.println("we have sent the email to our executive and we will contact you shortly");
               if(tp.equals("carpainter"))
       		{
            	   response.sendRedirect("booking/examples/dashboard.jsp?arg=done");
       		} 
       		else if(tp.equals("plumber"))
       		{

       		response.sendRedirect("booking/examples/plumber.jsp?arg=done");
       		}
       		else if(tp.equals("electrician"))
       		{
       			response.sendRedirect("booking/examples/electrician.jsp?arg=done");
       		}
           }catch (Exception e)
           {
        	   throw new RuntimeException(e);
           }
        } catch(Exception e)
        {           
        		
        		out.println(e);
//        		if(tp.equals("carpainter"))
//        		{
//        			RequestDispatcher rd=request.getRequestDispatcher("http://localhost:8080//booking//booking//examples//dashboard.jsp");
//            		rd.include(request, response);
//        		} 
//        		else if(tp.equals("plumber"))
//        		{
//
//        			RequestDispatcher rd=request.getRequestDispatcher("http://localhost:8080//booking//booking//examples//plumber.jsp");
//            		rd.include(request, response);
//        		}
//        		else if(tp.equals("electrician"))
//        		{
//
//        			RequestDispatcher rd=request.getRequestDispatcher("http://localhost:8080//booking//booking//examples//electrician.jsp");
//            		rd.include(request, response);
//        		}
        }
    }

}