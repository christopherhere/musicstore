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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }
    Cookie co=null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		Connection con=null;
		Cookie[] c=request.getCookies();
		String cookie;
		PreparedStatement ps;
		ResultSet rs;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcla","system","1234");
			System.out.println("Connected To Database");
			for(int i=0;i<c.length;i++)
			{
				cookie=c[i].getName();
				if(cookie.equals("JSESSIONID"))
				{
				
				}
				else
				{
					System.out.println(cookie);
					ps=con.prepareStatement("select * from products where productid="+c[i].getName());
					String name=c[i].getValue();
					System.out.println(name);
					rs=ps.executeQuery();
					int id;
					while(rs.next())
					{
						id=rs.getInt(2);
						Jdbc j=new Jdbc();
						j.quantity(id);
						co = new Cookie(cookie, "");
				        co.setMaxAge(0);
				        response.addCookie(co);
						
					}
				}
			}
		RequestDispatcher rd=request.getRequestDispatcher("OrderDetails.jsp");
		rd.forward(request, response);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally 
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
