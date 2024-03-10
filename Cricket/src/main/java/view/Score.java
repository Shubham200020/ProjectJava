package view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import login.Conndav;

public class Score {
	public static boolean insertScore(int scoreid)
	{
		Connection conn=Conndav.conn();
		PreparedStatement ps;
		try {
			 ps=conn.prepareStatement("insert into batting_score(ID) values(?)");
			ps.setInt(1, scoreid);
			ps.executeUpdate();
			ps=conn.prepareStatement("insert into bawling(ID) values(?) ");
			ps.setInt(1, scoreid);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
