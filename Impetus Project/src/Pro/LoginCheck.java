package Pro;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username=request.getParameter("Username");
		Connection con=null;
		String password=request.getParameter("Password");
		PrintWriter pw=response.getWriter();
		HttpSession s=request.getSession();
		RequestDispatcher rd;
		
		if(username.equals("") || password.equals(""))
		{
			pw.print("<font color=white>Enter Username or Password</font>");
			rd=request.getRequestDispatcher("login.jsp");
			response.setContentType("text/html");
			rd.include(request, response);
		}
		else {
		
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
					System.out.println("Connected");
					PreparedStatement ps=con.prepareStatement("select password,status from userdata where username='"+username+"'");
					ResultSet rs=ps.executeQuery();
					String p="";
					String status="";
					
					while(rs.next())
					{
						p=rs.getString(1);
						System.out.println(p);	
						status=rs.getString(2);
						System.out.println(status);	
						
					}
					

					if(status.equals("Blocked"))
					{ 
						pw.print("<font color=white>User Blocked.Please write at admin</font>");
						rd=request.getRequestDispatcher("login.jsp");
						response.setContentType("text/html");
						rd.include(request, response);
					}
					else
					{
						
						if(password.contentEquals(p))
						{
							
						
							System.out.println("Enterred");
							s.setAttribute("username", username);
							System.out.println(s.getAttribute("username"));
							rd=request.getRequestDispatcher("/home.jsp");
						
							rd.forward(request, response);
						}
						
						else if(username.equals("admin") && password.equals("admin"))
						{
							s.setAttribute("username", username);
							rd=request.getRequestDispatcher("AdminProducts.jsp");
							rd.forward(request, response);
						}
						
						else
						{
							pw.print("<font color=white>Wrong Username or Password</font>");
							rd=request.getRequestDispatcher("login.jsp");
							response.setContentType("text/html");
							rd.include(request, response);
						}
						
								
					}
						} catch (ClassNotFoundException e) 
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) 
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						finally 
						{
							try {
									con.close();
								} 
							catch (SQLException e)
								{
								// TODO Auto-generated catch block
								e.printStackTrace();
								}
						}
				}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			RequestDispatcher rd;
			HttpSession session=request.getSession();
			PrintWriter pw=response.getWriter();
			String username=session.getAttribute("username").toString();
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			int number=Integer.parseInt(request.getParameter("number"));
			try {
				Jdbc j=new Jdbc();
				j.updateprofile(name, password, email, number, username);
				rd=request.getRequestDispatcher("Profile.jsp");
				pw.print("<font color=white>Profile Updated</font>");
				response.setContentType("text/html");
				rd.include(request, response);
				
				 
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
