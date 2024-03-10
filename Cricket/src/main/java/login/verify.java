package login;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public verify() {
        super();
            }
	public void init(ServletConfig config) throws ServletException {
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
		String username,password;
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		username=request.getParameter("user");
		password=request.getParameter("password");
		Date dt=new Date();
		String dateString = request.getParameter("dob");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		pw.print(username+"  "+password);
		boolean num,eml;
		num=verifyDetels.isNumber(username);
		eml=verifyDetels.isEmail(username);
		verifyUser verif=new verifyUser();
		String data;
		if(username.equals("") || password.equals("")) {
			data="NULL Found";
		request.setAttribute("data", data);
		RequestDispatcher reqd = request.getRequestDispatcher("login.jsp");
		reqd.forward(request, response);
		}
		if(num)
		{
			if(username.length()==10) {
				verif.setPhonenumber(username);
				verif.setPassword(password);
				verif=verifyloginDb.verifyPhone(verif);
				if(verif==null) {
				
				data="Number Not Found";
				request.setAttribute("data", data);
				RequestDispatcher reqd = request.getRequestDispatcher("login.jsp");
				reqd.forward(request, response);
				}
				else {
					HttpSession session=request.getSession(false); 
					 session.setAttribute("email", verif.getEmail());
					 session.setAttribute("id", Integer.toString(verif.getDep_id()));
						RequestDispatcher reqd = request.getRequestDispatcher("control.jsp");
						reqd.forward(request, response);
					}
				}
			else {
				data="Enter Valid Number";
				request.setAttribute("data", data);
				RequestDispatcher reqd = request.getRequestDispatcher("login.jsp");
				reqd.forward(request, response);
			}
		}
		else {
		if(eml) {
				verif.setEmail(username);
				verif.setPassword(password);
				verif=verifyloginDb.verifyEmail(verif);
				if(verif==null) {
					data="Email or Password Not Found";
					request.setAttribute("data", data);
					RequestDispatcher reqd = request.getRequestDispatcher("login.jsp");
					reqd.forward(request, response);
				}
				else {
					
					 HttpSession session=request.getSession(false); 
					 session.setAttribute("email", verif.getEmail());
					 session.setAttribute("id", Integer.toString(verif.getDep_id()));
					RequestDispatcher reqd = request.getRequestDispatcher("control.jsp");
					reqd.forward(request, response);
				}
				
			}
		else {
				data="Enter Valid Email";
				request.setAttribute("data", data);
				RequestDispatcher reqd = request.getRequestDispatcher("login.jsp");
				reqd.forward(request, response);
			}
		}
	}

}
