

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import login.Conndav;
import login.verifyUser;
import view.Score;

import view.bean.search;
import view.bean.update;


public class Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Action() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 HttpSession session=request.getSession(false);
		 if(session!=null)
		 {
			 session.invalidate();
			 
		 }
		 RequestDispatcher reqd = request.getRequestDispatcher("index.html");
			reqd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action,id;
		PreparedStatement ps;
		Connection conn;
		verifyUser vu;
		conn=Conndav.conn();
		response.setContentType("text/html");
		
		PrintWriter pwPrintWriter=response.getWriter();
		action=request.getParameter("action");
		if(action.matches("update"))
		{
			String dep;
			dep=request.getParameter("select");
			id=request.getParameter("id");
			vu=new verifyUser();
			vu.setId(Integer.parseInt(id));
			vu.setDep_id(Integer.parseInt(dep));
			pwPrintWriter.print(vu.getId());
			update.updateDepid(vu);
			pwPrintWriter.print("<br>"+dep);
			update.updateDepid(vu);
			Score.insertScore(vu.getId()); 
			pwPrintWriter.print("<form action='control.jsp'>");
			pwPrintWriter.print("<input type='submit' value='Update Detels'>");
			pwPrintWriter.print("</form>");	
		}
		else if(action.matches("name"))
		{
			pwPrintWriter.print("Name");
		}
		else if(action.matches("password"))
		{
			
		}
		else if(action.matches("emails"))
		{
			String emid,pass = null;
			emid=request.getParameter("email");
			id=request.getParameter("id");
			vu=new verifyUser();
			int idd = 0;
			vu.setId(idd);
			vu.setPassword(pass);
			vu.setEmail(emid);
			idd=Integer.parseInt(id);
			pass=request.getParameter("pass");
			if(search.searchPassword(idd, pass)) {
				update.updateEmail(vu);
			}
			else
			{
			
				request.setAttribute("passeml","Pasword Not Found");
				RequestDispatcher reqd = request.getRequestDispatcher("control.jsp");
				reqd.forward(request, response);
			}
		}
			
	}

}
