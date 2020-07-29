package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	
	public Connection getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01. drvier connected");
		} catch (ClassNotFoundException e) {
			System.out.println("01. driver connected error");
			e.printStackTrace();
		}
		
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:49161:xe";
		String id = "KH";
		String pw = "KH";
		
		try {
			con = DriverManager.getConnection(url , id , pw);
			System.out.println("02. account Connected");
		} catch (SQLException e) {
			System.out.println("02. account Connected error");			
			e.printStackTrace();
		}
		return con;
	}
	
	public boolean isConnection(Connection con) {
		
		boolean valid = true;
		
		try {
			if(con == null || con.isClosed() ) {
				valid = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return valid;		
	}
	
	public void close(Connection con ) {
		if (isConnection(con) ) {
			 try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void close(Statement stmt) {
		if( stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void close(ResultSet rs ) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void commit(Connection con) {
		if(isConnection(con) ) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void rollback(Connection con) {
		if(isConnection(con) ) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
