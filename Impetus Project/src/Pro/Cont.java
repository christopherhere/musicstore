package Pro;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;
import javax.websocket.Session;

/**
 * Servlet implementation class Cont
 */
@WebServlet("/Cont")
public class Cont extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cont() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		RequestDispatcher rd;
		String action=request.getParameter("action");
		HttpSession s=request.getSession();
		String u=request.getParameter("username");
		System.out.println(u);
		if(action.equals("logout"))
		{
			s.removeAttribute("username");
			rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
		else if(action.equals("getusers"))
		{
			try {
				Jdbc j=new Jdbc();
				request.setAttribute("user",j.getUsers());
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rd=request.getRequestDispatcher("Allusers.jsp");
			rd.forward(request, response);
		}
		
		else if(action.equals("deleteproduct"))
		{
			System.out.println("inside delete");
			String username=request.getParameter("username");
			try {
				Jdbc j=new Jdbc();
				j.delete(username);
				rd=request.getRequestDispatcher("Allusers.jsp");
				rd.forward(request, response);
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		else if(action.equals("delete"))
		{
			System.out.println("inside delete");
			int a=Integer.parseInt(request.getParameter("id"));
			try {
				Jdbc j=new Jdbc();
				j.delete(a);
				rd=request.getRequestDispatcher("/GetProductsjsp");
				rd.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else
		{
			try {
				System.out.println("Coming here");
				int a=Integer.parseInt(request.getParameter("id"));
				request.setAttribute("Prodis", new Jdbc().getProductdis(a));
				rd=request.getRequestDispatcher("Productdis.jsp");
				rd.forward(request, response);
				
				
				
				
				} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		String action=request.getParameter("action");
		if(action.equals("register"))
		{
			try {
				String name=request.getParameter("name");
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String email=request.getParameter("email");
				int number=Integer.parseInt(request.getParameter("number"));
				String no=request.getParameter("number");
				
				if (!name.matches("[a-zA-Z_]+")) {
					RequestDispatcher rd=request.getRequestDispatcher("Newac.jsp");
					pw.print("<font color=white>Invalid Name</font>");
					response.setContentType("text/html");
					rd.include(request, response);
					
				}
				
				else if (!email.matches( "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$"))
				{
					RequestDispatcher rd=request.getRequestDispatcher("Newac.jsp");
					pw.print("<font color=white>Invalid Email Please Enter in correct format</font>");
					response.setContentType("text/html");
					rd.include(request, response);
					
				}
				
				if (!no.matches("[0-9]+")) 
				{
					RequestDispatcher rd=request.getRequestDispatcher("Newac.jsp");
					pw.print("<font color=white>Invalid Number</font>");
					response.setContentType("text/html");
					rd.include(request, response);
					
				}
				
				
				
				else
				{	
					Jdbc j=new Jdbc();
					String status=j.registeer(name, username, password,email,number);
					RequestDispatcher rd=request.getRequestDispatcher("Newac.jsp");
					if(status.equals("success"))
					{
						pw.print("Registered");
						response.setContentType("text/html");
						rd.include(request, response);
					}
					else
					{
						pw.print("<font color=white>Not Registered</font>");
						rd.include(request, response);
					}
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		else if(action.equals("deleteproduct"))
		{
			String id=request.getParameter("Productid");
			System.out.println(id);
			RequestDispatcher rd=request.getRequestDispatcher("Login.html");
			rd.forward(request, response);
		}
		
		else
		{
			String a=request.getParameter("id");
			try {
				request.setAttribute("product", new Jdbc().getUsers());
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("Productdis.jsp");
			rd.forward(request, response);
		}
		
		doGet(request, response);
	}

}
