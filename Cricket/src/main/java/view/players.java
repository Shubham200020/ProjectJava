package view;
import java.io.IOException;


import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import login.Conndav;

import login.verifyUser;
import login.verifyloginDb;

public class players extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public players() {
        super();
      
    }

	
	public void init(ServletConfig config) throws ServletException {
	
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String name,password,repassword,phonenumber,email,birthday;
		int roleid,city,side;
		name=request.getParameter("name");
		email=request.getParameter("email").toLowerCase();
		phonenumber=request.getParameter("phone");
		password=request.getParameter("password");
		birthday=request.getParameter("birthday");
		repassword=request.getParameter("repassword");
		city=Integer.parseInt(request.getParameter("city"));
		roleid=Integer.parseInt(request.getParameter("roles"));
		side=Integer.parseInt(request.getParameter("side"));
		PrintWriter out=response.getWriter();
		String data;
		Date dt=Date.valueOf(birthday);
		if(password.equals(repassword)) {
			out.print("<br>Name:"+name);
			out.print("<br>Email:"+email);
			out.print("<br>Password:"+password);
			out.print("<br>City:"+city);
			out.print("<br>Role:"+roleid);
			out.print("<br>side:"+side);
			verifyUser vu=new verifyUser();
			verifyloginDb vld=new verifyloginDb();
			vu.setEmail(email);
			vu.setPhonenumber(phonenumber);
			Boolean eml,ph;
			eml=vld.matchEmail(vu);
			ph=vld.matchPhone(vu);
			if(eml) {
				
				data="Email Already exist:"+email;
				request.setAttribute("email", data);
				RequestDispatcher req=request.getRequestDispatcher("insert.jsp");
				req.forward(request, response);
			}
			else if(ph){
				out.print("<br><p>Phone Already exist or Invalid Number:<b>"+phonenumber+"</b></p>");
			data="Phone Already exist or Invalid Number:"+phonenumber;
			request.setAttribute("phone", data);
			RequestDispatcher req=request.getRequestDispatcher("insert.jsp");
			req.forward(request, response);
			}
			else {
				
				Connection conn;
				conn=Conndav.conn();
				Statement st;
				PreparedStatement ps;
				ResultSet rs;
				try {
					st=conn.createStatement();
					rs=st.executeQuery("select max(id) from players");
					rs.next();
					int id=rs.getInt(1)+1;
					out.print("<br>Id:"+id);
					ps=conn.prepareStatement("insert into players(ID,NAME,PHONE_NUMBER,EMAIL_ID,CITY_ID,ROLES_ID,PASSWORD,DOP) values(?,?,?,?,?,?,?,?)");
					ps.setInt(1, id);
					ps.setString(2, name);
					ps.setString(3, phonenumber);
					ps.setString(4, email);
					ps.setInt(5, city);
					ps.setInt(6, roleid);
					ps.setString(7, password);
					ps.setDate(8, dt);
					ps.executeUpdate();
					out.print("Insert data");
					pw.print("<br><b>");
					pw.print("<form action='index.html'>");
					pw.print("<input type='submit' value='successful'>");
					pw.print("</form>");
					pw.print("</b>");
				} 	catch (SQLException e) {
					out.print("Something Went Wrong  :  "+e);
					e.printStackTrace();
				}
			}
		}else {
			
			data="password Not Match";
			request.setAttribute("password", data);
			RequestDispatcher req=request.getRequestDispatcher("insert.jsp");
			req.forward(request, response);
			
		}
	}
}
