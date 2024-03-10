package view.bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import login.Conndav;
import oracle.jdbc.proxy.annotation.Pre;

public class search {
	public static boolean searchPassword(int id,String password)
	{
		Connection conn=null;
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			conn=Conndav.conn();
			ps=conn.prepareStatement("select PASSWORD from players where id = ?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				if(rs.getString(1).matches(password))
				{
					return true;
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static ResultSet searchByEmail(String emailid) {
		ResultSet rs=null;
		PreparedStatement ps=null;
		Connection conn;
		conn=Conndav.conn();
		try {
			ps=conn.prepareStatement("select ID,NAME,PHONE_NUMBER,EMAIL_ID from players where EMAIL_ID = ?");
			ps.setString(1, emailid);
			rs=ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static ResultSet searchByPhone(String phone)
	{
		ResultSet rs=null;
		PreparedStatement ps=null;
		Connection conn;
		conn=Conndav.conn();
		try {
			ps=conn.prepareStatement("select ID,NAME,PHONE_NUMBER,EMAIL_ID from players where  PHONE_NUMBER = ?");
			ps.setString(1, phone);
			rs=ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public static void searchByName(String name)
	{
		name=name.toLowerCase();
		String nm;
		Connection conn;
		conn=Conndav.conn();
		ResultSet rs=null;
		String sql="select ID,NAME,PHONE_NUMBER,EMAIL_ID from players ";
		try {
			Statement st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				nm=rs.getString(2).toLowerCase();
				if(nm.startsWith(name)) {
					
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
