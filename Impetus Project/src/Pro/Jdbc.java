package Pro;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Jdbc
{
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	FileInputStream fis;
	public Jdbc() throws ClassNotFoundException, SQLException
	{
		System.out.println("IN jdbc");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCLA","system","1234");
		System.out.println("Connected To Database");
	}
	
	public String Aunthenticate(String username,String password) throws SQLException
	{
		return password;
		
	}
	
	public void block(String username) throws SQLException
	{
		ps=con.prepareStatement("UPDATE userdata SET status= 'Blocked' WHERE username=?");
		ps.setString(1, username);
		ps.executeUpdate();
		ps.close();
	}
	
	public void unblock(String username) throws SQLException
	{
		ps=con.prepareStatement("UPDATE userdata SET status= 'UnBlocked' WHERE username=?");
		ps.setString(1, username);
		ps.executeUpdate();
		ps.close();
	}
	
	public String Add(String name,int id,int price,String dis,String pic,int quantity,String cat) throws SQLException, IOException
	{
		
		ps=con.prepareStatement("insert into Products values (?,?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setInt(2, id);
		ps.setInt(3, price);
		ps.setString(4, dis);
		ps.setInt(6, quantity);
		ps.setString(7, cat);
		fis=new FileInputStream(pic);
		ps.setBinaryStream(5, fis,(int)fis.available());
		ps.executeUpdate();
		con.close();
		return "Added";
		
	}
	
	public String UpdateAdd(String name,int price,String dis,int quantity,int id,String category) throws SQLException, IOException
	{
		
		ps=con.prepareStatement("update Products set productname=?,productprice=?,productdiscription=?,productquantity=?,Category=? where productid=? ");
		ps.setInt(6, id);
		ps.setString(1, name);
		ps.setInt(2, price);
		ps.setString(3, dis);
		ps.setInt(4, quantity);
		ps.setString(5, category);
		System.out.println("JDbc working");
		ps.executeUpdate();
		con.close();
		
		return "Added";
		
	}
	
	public void delete(int id) throws SQLException
	{
		System.out.println("Entered Jdbc");
		ps=con.prepareStatement("DELETE FROM products WHERE productid=?");
		ps.setInt(1, id);
		ps.executeUpdate();
		System.out.println("Delete Record");
		con.close();
		
	}
	
	public void quantity(int id) throws SQLException
	{
		
		ps=con.prepareStatement("update products set PRODUCTQUANTITY=PRODUCTQUANTITY-1 where PRODUCTID=?");
		ps.setInt(1, id);
		ps.executeUpdate();
		con.close();
		
	}
	
	public List<ProductsPojo> getProduct() throws SQLException
	{
		List<ProductsPojo> l=new ArrayList<ProductsPojo >();
		ProductsPojo pro=new ProductsPojo();
		ps=con.prepareStatement("Select * from Products");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
		pro.setPid(rs.getInt(2));
		pro.setPname(rs.getString(1));
		pro.setPrice(rs.getInt(3));
		pro.setDis(rs.getString(4));
		l.add(pro);
		}
		con.close();
		return l;
		
	}
	
	public List<ProductsPojo> getProductdis(int id) throws SQLException
	{
		List<ProductsPojo> l=new ArrayList<ProductsPojo >();
		ProductsPojo pro=new ProductsPojo();
		ps=con.prepareStatement("Select * from Products where id =?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
		pro.setPid(rs.getInt(2));
		pro.setPname(rs.getString(1));
		pro.setPrice(rs.getInt(3));
		pro.setDis(rs.getString(4));
		l.add(pro);
		}
		con.close();
		return l;
		
	}
	
	public List<UserPojo > getUsers() throws SQLException
	{
		List<UserPojo> l=new ArrayList<UserPojo>();
		ps=con.prepareStatement("Select * from userData");
		UserPojo pro=new UserPojo();
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			pro.setName(rs.getString(1));
			pro.setUsername(rs.getString(2));
			pro.setPassword(rs.getString(3));
			l.add(pro);
			
		}
		ps.close();
		return l;
	}
	
	public String registeer(String name,String username,String password,String email,int number) throws SQLException
	{
		System.out.println("INtoRegister");
		ps=con.prepareStatement("insert into userdata values(?,?,?,?,?,'unblock')");
		ps.setString(1, name);
		ps.setString(2, username);
		ps.setString(3, password);
		ps.setString(4, email);
		ps.setInt(5, number);
		ps.executeUpdate();
		con.close();
		return "success";
		
	}
	
	public void updateprofile(String name,String password,String email,int Phone,String username) throws SQLException
	{
		ps=con.prepareStatement("update userdata set name=?, password=?,email=?,pnumber=? where username=?");
		ps.setString(1, name);
		ps.setString(2, password);
		ps.setString(3, email);
		ps.setInt(4, Phone);
		ps.setString(5, username);
		ps.executeUpdate();
		con.close();
				
	}
	
	public String delete(String username) throws SQLException
	{
		ps=con.prepareStatement("delete from userdata where username=?");
		ps.setString(1, username);
		ps.executeUpdate();
		con.close();
		return null;
	}
	
	
}
