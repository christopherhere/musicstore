package Pro;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.print("HI");
		int a=Integer.parseInt(request.getParameter("id"));
		if(request.getParameter("action").equals("deleteproduct"))
		{
			try {
				System.out.println("JDbc before");
				Jdbc j=new Jdbc();
				j.delete(a);;
				System.out.println("deleted Product");
				RequestDispatcher rd=request.getRequestDispatcher("GetProducts.jsp");
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
			try {
				String name=request.getParameter("pname");
				int price=Integer.parseInt(request.getParameter("pprice"));
				int q=Integer.parseInt(request.getParameter("pq"));
				String d=request.getParameter("pd");
				int id=Integer.parseInt(request.getParameter("pid"));
				String cat=request.getParameter("Category");
				Jdbc j=new Jdbc();
				j.UpdateAdd(name, price, d, q,id,cat);
				RequestDispatcher rd=request.getRequestDispatcher("AdminProducts.jsp");
				rd.forward(request, response);
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			
			
		}

}
