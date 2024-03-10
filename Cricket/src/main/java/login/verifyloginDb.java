package login;

import java.sql.*;

public class verifyloginDb {
	public static verifyUser verifyEmail(verifyUser lu)
	{
		verifyUser vla=null;
		Connection conn;
		ResultSet rs;
		conn=Conndav.conn();
		try {
			PreparedStatement ps=conn.prepareStatement("select ID,NAME,PHONE_NUMBER,EMAIL_ID,DEP_ID from players where password = ? and email_id = ?");
			ps.setString(1, lu.getPassword());
			ps.setString(2, lu.getEmail());
			rs=ps.executeQuery();
			while (rs.next()) {
				vla=new verifyUser();
				vla.setId(rs.getInt(1));
				vla.setDep_id(rs.getInt(5));
				vla.setName(rs.getString(2));
				vla.setEmail(rs.getString(4));
				vla.setPassword(rs.getString(3));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vla;
		
	}
	public static verifyUser verifyPhone(verifyUser lu)
	{
		verifyUser vla=null;
		Connection conn;
		ResultSet rs;
		conn=Conndav.conn();
		try {
			PreparedStatement ps=conn.prepareStatement("select ID,NAME,PHONE_NUMBER,EMAIL_ID,DEP_ID from players where password = ? and PHONE_NUMBER = ?");
			ps.setString(1, lu.getPassword());
			ps.setString(2, lu.getPhonenumber());
			rs=ps.executeQuery();
			while (rs.next()) {
				vla=new verifyUser();
				vla.setId(rs.getInt(1));
				vla.setName(rs.getString(2));
				vla.setPassword(rs.getString(3));
				vla.setEmail(rs.getString(4));
				vla.setDep_id(rs.getInt(5));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vla;
		
	}
	
	public boolean matchEmail(verifyUser lu)
	{
		
		Connection conn;
		ResultSet rs;
		PreparedStatement ps;
		conn=Conndav.conn();
		try {
			ps=conn.prepareStatement("select EMAIL_ID from players where EMAIL_ID = ?");
			ps.setString(1, lu.getEmail());
			rs=ps.executeQuery();
			while(rs.next())
			{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean matchPhone(verifyUser lu)
	{
		
		Connection conn;
		ResultSet rs;
		PreparedStatement ps;
		conn=Conndav.conn();
		if(lu.getPhonenumber().length()!=10)
			return true;
		try {
			ps=conn.prepareStatement("select  PHONE_NUMBER from players where  PHONE_NUMBER = ?");
			ps.setString(1, lu.getPhonenumber());
			rs=ps.executeQuery();
			while(rs.next())
			{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
