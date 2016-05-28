package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class conn2DB {
	private conn2DB c2db = null;
	public conn2DB(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			log("1/6 S");
		} catch (ClassNotFoundException e) {
			log("1/6 F", e);
		}
	}
	
	public Connection getConnection(){
		Connection conn = null;
		String url = "jdbc:mysql://192.168.0.25:3306";
		String user = "root";
		String password = "";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) { log("an error from [conn2DB.getConnection()]",e); }
		
		return conn;
	}
	public void close(Connection conn, Statement psmt, ResultSet rs){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {}
		}
		if(psmt != null){
			try {
				psmt.close();
			} catch (SQLException e) {}
		}
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {}
		}
	}
	
	public conn2DB getC2db() {
		return c2db;
	}

	public void setC2db(conn2DB c2db) {
		this.c2db = c2db;
	}

	public void log(String str){
		System.out.println(str);
	}
	public void log(String str, Exception e){
		System.out.print(str+" ");
		e.printStackTrace();
	}
}
