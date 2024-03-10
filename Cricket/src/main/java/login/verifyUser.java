package login;

import java.util.Date;

public class verifyUser {
	private String email,password,phonenumber,name;
	private int id,dep_id;
	private Date dt;
	
	public verifyUser(String email, String password, String phonenumber, String name, int id, int dep_id, Date dt) {
		super();
		this.email = email;
		this.password = password;
		this.phonenumber = phonenumber;
		this.name = name;
		this.id = id;
		this.dep_id = dep_id;
		this.dt = dt;
	}
	
	public verifyUser() {
		super();
	}
	
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDt() {
		return dt;
	}
	public void setDt(Date dt) {
		this.dt = dt;
	}
	
}
