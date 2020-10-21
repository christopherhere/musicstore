package Pro;

public class UserPojo
{
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	String name;
	String username;
	String password;
	
	public String toString()
	{
		return name+" "+username+" ";
	}
}
