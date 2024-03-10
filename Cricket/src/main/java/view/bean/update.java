package view.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import login.Conndav;
import login.verifyDetels;
import login.verifyUser;


public class update {
	public static void delete(verifyUser vu)
	{
		Connection conn;
		PreparedStatement ps=null;
		conn=Conndav.conn();
		try {
			 ps=conn.prepareStatement("delete from players where id = ?");
			 ps.setInt(1, vu.getId());
			 ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static boolean updateDepid(verifyUser vu)
	{
		Connection conn;
		PreparedStatement ps=null;
		conn=Conndav.conn();
		try {
			ps=conn.prepareStatement("update players set DEP_ID = ? where id = ?");
			ps.setInt(1, vu.getDep_id());
			ps.setInt(2, vu.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public static boolean updatePhone(verifyUser vu)
	{
		boolean isnum;
		PreparedStatement ps;
		Connection conn;
		conn=Conndav.conn();
		isnum=verifyDetels.isNumber(vu.getPhonenumber());
		if(isnum)
		{
			try {
				ps=conn.prepareStatement("update players set PHONE_NUMBER = ? where id = ? ");
				ps.setString(1, vu.getPhonenumber());
				ps.setInt(1, vu.getId());
				ps.executeUpdate();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}
	public static boolean updateEmail(verifyUser vu)
	{
		PreparedStatement ps;
		Connection conn;
		conn=Conndav.conn();
		boolean isEmail;
		isEmail=verifyDetels.isEmail(vu.getEmail());
		if(isEmail)
		{
			try {
				ps=conn.prepareStatement("UPDATE players set EMAIL_ID = ? where id = ?");
				ps.setString(1, vu.getEmail());
				ps.setInt(2, vu.getId());
				ps.executeUpdate();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}
	public static boolean updatePassword(verifyUser vu)
	{
		PreparedStatement ps;
		Connection conn;
		conn=Conndav.conn();
		try {
			ps=conn.prepareStatement("update players set PASSWORD = ? where id = ?");
			ps.setString(1, vu.getPassword());
			ps.setInt(2, vu.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	public static boolean updateDate()
	{
		return false;
	}
}
