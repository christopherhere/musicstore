package Pro;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveProduct
 */
@WebServlet("/SaveProduct")
public class SaveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try {
			Jdbc j=new Jdbc();
			String name=request.getParameter("pname");
			int id=Integer.parseInt(request.getParameter("pid"));
			int price=Integer.parseInt(request.getParameter("pprice"));
			int quantity=Integer.parseInt(request.getParameter("pquantity"));
			String dis=request.getParameter("pdis");
			String pic=request.getParameter("pic");
			String cat=request.getParameter("Category");
			System.out.println(cat);
			String result=j.Add(name, id, price, dis,pic,quantity,cat);
			System.out.println("Added Product :" +pic);
			RequestDispatcher rd;
			PrintWriter pw=response.getWriter();
			if(result.equals("Added"))
			{
				rd=request.getRequestDispatcher("/AdminProducts.jsp");
				pw.print("Product Added");
				rd.include(request, response);
				
			}
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
