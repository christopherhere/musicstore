package Pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartFunction
 */
@WebServlet("/CartFunction")
public class CartFunction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartFunction() {
        super();
        // TODO Auto-generated constructor stub
    }
    Cookie c=null;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw=response.getWriter();
		RequestDispatcher rd;
		String action=request.getParameter("action");
		
		if(action.equals("addcart"))
		{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
				System.out.println("Connected To Database");
				c=new Cookie(request.getParameter("id"),"1");
				response.addCookie(c);
				rd=request.getRequestDispatcher("Productdis.jsp");
				
				pw.print("Added to Cart");
				response.setContentType("text/html");
				rd.include(request, response);
				con.close();
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		else if(action.equals("removeitem"))
		{
			System.out.println("REmove");
			String cookiename=request.getParameter("id");
			c = new Cookie(cookiename, "");
	        c.setMaxAge(0);
	        response.addCookie(c);
	        System.out.println("REmove");
	    	rd=request.getRequestDispatcher("Cart.jsp");
	    	pw.print("Removed");
	    	response.setContentType("text/html");
			rd.include(request, response);
		
	        
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
