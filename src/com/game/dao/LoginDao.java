package com.game.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.game.dto.GameDto;

import common.JDBCTemplate;

public class LoginDao extends JDBCTemplate {

	public GameDto login(String user_id,String user_pw) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		GameDto res = new GameDto();
		
		String sql = " SELECT * FROM USERS WHERE USER_ID=? AND USER_PW=? ";
		
		try {
			
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			
			pstm.setString(2, user_pw);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				
				res.setUser_id(rs.getString("user_id"));
				res.setUser_pw(rs.getString("user_pw"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_email(rs.getString("user_email"));
				res.setUser_enabled(rs.getString("user_enabled"));
				res.setUser_count(rs.getInt("user_count"));
				
			}
			System.out.println(res.getUser_id());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05");
		}
		
		return res;
	}
	
	public boolean idChk(String user_id) {
	      
	      Connection con = getConnection();
	      PreparedStatement pstm = null;
	      ResultSet rs = null;
	      boolean res = false;
	      String sql = " SELECT * FROM USERS WHERE USER_ID = ?";
	      
	      try {
	         
	         pstm = con.prepareStatement(sql);
	         pstm.setString(1,user_id);
	         System.out.println("03");
	         
	         rs = pstm.executeQuery();
	         System.out.println("04");
	         
	         res = rs.next();
	         
	      } catch (SQLException e) {
	         System.out.println("3/4");
	         e.printStackTrace();
	      } finally {
	         
	         close(rs);
	         close(pstm);
	         close(con);
	         System.out.println("05");
	      }
	      
	      System.out.println(res);
	      return res;
	   }
	   
	
	public int insertLogin(GameDto dto) {
	      
	      Connection con = getConnection();
	      PreparedStatement pstm = null;
	      
	      int res = 0;
	      
	      String sql = " INSERT INTO USERS VALUES(USER_NO.NEXTVAL, ? , ? , ? , ? , 'N', 0 , ?) ";
	      
	      try {
	         pstm = con.prepareStatement(sql);
	         pstm.setString(1, dto.getUser_id());
	         pstm.setString(2,dto.getUser_pw());
	         pstm.setString(3, dto.getUser_name());
	         pstm.setString(4,dto.getUser_email());
	         //pstm.setString(5, dto.getUser_enabled());
	         //pstm.setInt(6, dto.getUser_count());
	         pstm.setString(5, dto.getUser_image());
	         
	         System.out.println("3" + sql);
	         
	         res = pstm.executeUpdate();
	         System.out.println("4");
	         System.out.println("Dao.res : "+res);
	         
	         if(res>0)commit(con);
	         
	      } catch (SQLException e) {
	         
	         System.out.println("3/4");
	         e.printStackTrace();
	         
	      } finally {
	         close(pstm);
	      }
	      
	      return res;
	   }
	
public GameDto pwchk(String user_id) {
		
		Connection con = getConnection();
	      PreparedStatement pstm = null;
	      ResultSet rs = null;
	      GameDto res = null;
	      String sql = " SELECT USER_ID, USER_PW FROM USERS WHERE USER_ID=? ";

	      try {
	         pstm = con.prepareStatement(sql);
	         pstm.setString(1, user_id);

	         System.out.println("03. query 준비:" + user_id);

	         rs = pstm.executeQuery();
	         System.out.println("04. query 실행 및 리턴");
	         
	         while(rs.next()) {
	            res = new GameDto(rs.getString("user_id") ,rs.getString("user_pw"));
	            
	            
	            System.out.println("dao - res : "+res.getUser_pw());
	         }

	      } catch (SQLException e) {
	         System.out.println("3/4 실행 오류");
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstm);
	         close(con);
	         System.out.println("05. db 종료\n");
	      }
	     
	         
	      return res;
	      

	}
	
	public int Update_pw(GameDto dto) {
	      
	      Connection con = getConnection();
	      PreparedStatement pstm = null;
	      ResultSet rs = null;
	      int res = 0;
	      String sql = " UPDATE USERS SET USER_PW =?  WHERE USER_ID = ? ";
	      
	      try {
	         
	         pstm = con.prepareStatement(sql);
	         pstm.setString(1,dto.getUser_pw());
	         pstm.setString(2,dto.getUser_id());
	         
	         System.out.println("수정 쿼리 준비 03");
	         
	         res = pstm.executeUpdate();
	         
	         System.out.println("쿼리 실행 및 준비 04 ");
	         
	         if(res>0) {
	            commit(con);
	         }
	         
	         
	      } catch (SQLException e) {
	         System.out.println("3/4 단계 오류");
	         e.printStackTrace();
	      }finally {
	         close(pstm);
	         close(con);
	         System.out.println("05. db 종료\n");
	      }
	      
	      return res;
	}
	

	public GameDto sidchk(String userid) {
		  Connection con = getConnection();
	      PreparedStatement pstm = null;
	      ResultSet rs = null;
	      GameDto dto = new GameDto();
	      String sql = " SELECT * FROM USERS WHERE USER_ID = ? ";
	      
	      try {
	         pstm = con.prepareStatement(sql);
	         pstm.setString(1, userid);
	         
	         rs = pstm.executeQuery();
	         
	         while(rs.next()) {
	            dto.setUser_no(rs.getInt("user_no"));
	            dto.setUser_id(rs.getString("user_id"));
	            dto.setUser_pw(rs.getString("user_pw"));
	            dto.setUser_name(rs.getString("user_name"));
	            dto.setUser_email(rs.getString("user_email"));
	            dto.setUser_enabled(rs.getString("user_enabled"));
	            dto.setUser_count(rs.getInt("user_count"));
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstm);
	      }
	      return dto;
	   }
	   
	
	   public int insertSNSUser( GameDto kdto) {
		   	  Connection con = getConnection();
		      PreparedStatement pstm  = null;
		      int res = 0;
		      String sql = "INSERT INTO USERS VALUES(?, ?, '비밀번호', ?, '이메일', 'N', 0,'https://lh3.googleusercontent.com/proxy/_q8K8kvbpZJDyPu5jHeyuyRmwVXsAnZGMRyKqwjpyIeUXFEinZLLwte3nCphWxLlejuxM-KQRSkgYPNtWMQja_rM-jA4KrsEZD2rp4wJ32RnYNv3maFW9NBfQYWe5VWmMBTuhg59VblKKTNrHgzXNPFKeNYiIP1no_YC')";
		      System.out.println("sql : "+sql);
		      System.out.println("kakao insert");
		      try {
		         pstm = con.prepareStatement(sql);
		         pstm.setInt(1, kdto.getUser_no());
		         pstm.setString(2, kdto.getUser_id());
		         pstm.setString(3, kdto.getUser_name());
		         System.out.println("3성공");
		         
		         res = pstm.executeUpdate();
		         System.out.println("4성공");
		         System.out.println("res : " + res);
		      } catch (SQLException e) {
		    	  System.out.println("실패");
		         e.printStackTrace();
		      }finally {
		         close(pstm);
		      }
		      return res;
		   }
	
	   public GameDto selectUserImg(String user_id) {
		      Connection con = getConnection();
		      PreparedStatement pstm = null;
		      ResultSet rs = null;
		      GameDto res = new GameDto();
		      String sql = " SELECT USER_IMAGE FROM USERS WHERE USER_ID=? ";
		      try {
		         pstm = con.prepareStatement(sql);
		         pstm.setString(1, user_id);

		         System.out.println("03. query 준비:" + sql);

		         rs = pstm.executeQuery();
		         System.out.println("04. query 실행 및 리턴");
		         
		         while(rs.next()) {
		            
		            res.setUser_image(rs.getString("user_image"));
		            
		            
		            System.out.println("gamedto" +res);
		         }

		      } catch (SQLException e) {
		         System.out.println("3/4 실행 오류");
		         e.printStackTrace();
		      }finally {
		         close(rs);
		         close(pstm);
		         close(con);
		         System.out.println("05. db 종료\n");
		      }
		         
		      return res;      
		   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
