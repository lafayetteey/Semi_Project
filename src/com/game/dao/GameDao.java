package com.game.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.game.dto.GameDto;
import com.game.dto.MainDto;

import common.JDBCTemplate;

public class GameDao extends JDBCTemplate {

	public List<MainDto> mContentSelectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MainDto> res = new ArrayList<>();
		String sql = "SELECT * FROM GAME , M_CONTENT WHERE M_GAME_NO = GAME_NO";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 :" + sql);
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next()) {
				MainDto dto = new MainDto();
				dto.setGame_no(rs.getInt(1));				
				dto.setGame_staravg(rs.getDouble(2));
				dto.setGame_platform(rs.getInt(3));
				dto.setGame_name(rs.getString(4));
				dto.setGame_company(rs.getString(5));
				dto.setGame_genre(rs.getInt(6));
				dto.setGame_release(rs.getDate(7));
				dto.setGame_content(rs.getString(8));
				dto.setM_game_no(rs.getInt(9));
				dto.setM_game_platform(rs.getInt(10));
				dto.setM_game_name(rs.getString(11));
				dto.setM_game_company(rs.getString(12));
				dto.setM_game_summary(rs.getString(13));
				dto.setM_game_slideimage(rs.getString(14));
				dto.setM_game_image(rs.getString(15));
				
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return res;		
	}

	
	public List<GameDto> selectReview() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<>();
		String sql = "SELECT ROWNUM, A.* FROM (SELECT USER_NAME , USER_NO , USER_IMAGE, USER_COUNT FROM USERS ORDER BY USER_COUNT DESC) A WHERE ROWNUM <= 6 AND USER_COUNT > 0 ";

		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				GameDto tmp = new GameDto(rs.getString(2), rs.getInt(3) , rs.getString(4));
				res.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return res;
	}

	public GameDto selectGame(int game_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		GameDto res = null;
		String sql = "SELECT * FROM GAME , URL WHERE GAME_NO = ? AND URL_GAME_NO = ? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, game_no);
			pstm.setInt(2, game_no);
			System.out.println("03 . query 준비" + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				res = new GameDto();
	            res.setGame_no(rs.getInt(1));
	            res.setGame_staravg(rs.getDouble(2));
	            res.setGame_platform(rs.getInt(3));
	            res.setGame_name(rs.getString(4));
	            res.setGame_company(rs.getString(5));
	            res.setGame_genre(rs.getInt(6));
	            res.setGame_release(rs.getDate(7));
	            res.setGame_content(rs.getString(8));
	            res.setUrl_game_no(rs.getInt(9));
	            res.setMain_image(rs.getString(10));
	            res.setImage1(rs.getString(11));
	            res.setImage2(rs.getString(12));
	            res.setImage3(rs.getString(13));
	            res.setImage4(rs.getString(14));
	            res.setVideo1(rs.getString(15));
	            res.setVideo2(rs.getString(16));
	            res.setVideo3(rs.getString(17));
	            res.setVideo4(rs.getString(18));
	            res.setVideo_image1(rs.getString(19));
	            res.setVideo_image2(rs.getString(20));
	            res.setVideo_image3(rs.getString(21));
	            res.setVideo_image4(rs.getString(22));
	            res.setVideo_title1(rs.getString(23));
	            res.setVideo_title2(rs.getString(24));
	            res.setVideo_title3(rs.getString(25));
	            res.setVideo_title4(rs.getString(26));
	            res.setArticle1(rs.getString(27));
	            res.setArticle2(rs.getString(28));
	            res.setArticle3(rs.getString(29));
	            res.setA_image1(rs.getString(30));
	            res.setA_image2(rs.getString(31));
	            res.setA_image3(rs.getString(32));
	            res.setArticle_title1(rs.getString(33));
	            res.setArticle_title2(rs.getString(34));
	            res.setArticle_title3(rs.getString(35));
	            res.setArticle_summary1(rs.getString(36));
	            res.setArticle_summary2(rs.getString(37));
	            res.setArticle_summary3(rs.getString(38));
	            res.setPackage_img(rs.getString(39)); 	 
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return res;

	}

	public List<GameDto> selectAll(int platform, int sort) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<>();
		String sql = null;

		if (platform == 1) {
			if (sort == 1) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 1 ORDER BY GAME_STARAVG DESC) A";
			} else if (sort == 2) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 1 ORDER BY GAME_NAME ASC) A";
			} else if (sort == 3) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 1 ORDER BY GAME_RELEASE DESC) A";
			}
		} else if (platform == 2) {
			if (sort == 1) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 2 ORDER BY GAME_STARAVG DESC) A";
			} else if (sort == 2) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 2 ORDER BY GAME_NAME ASC) A";
			} else if (sort == 3) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 2 ORDER BY GAME_RELEASE DESC) A";
			}
		} else if (platform == 3) {
			if (sort == 1) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 3 ORDER BY GAME_STARAVG DESC) A";
			} else if (sort == 2) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 3 ORDER BY GAME_NAME ASC) A";
			} else if (sort == 3) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 3 ORDER BY GAME_RELEASE DESC) A";
			}
		} else if (platform == 4) {
			if (sort == 1) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 4 ORDER BY GAME_STARAVG DESC) A";
			} else if (sort == 2) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 3 ORDER BY GAME_NAME ASC) A";
			} else if (sort == 3) {
				sql = "SELECT ROWNUM, A.* FROM (SELECT * FROM GAME WHERE GAME_PLATFORM = 3 ORDER BY GAME_RELEASE DESC) A";
			}
		}

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 " + sql);
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및");
			while (rs.next()) {
				GameDto tmp = new GameDto(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getString(9));
				res.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return res;
	}

	public List<GameDto> search(String search) {
		if (!search.isEmpty()) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			List<GameDto> res = new ArrayList<GameDto>();
			String sql = " SELECT * FROM USERS  U FULL OUTER JOIN REVIEW R ON U.USER_ID = R.RV_USER_ID FULL OUTER JOIN GAME G ON R.RV_GAME_NO = G.GAME_NO " 
					+ " FULL OUTER JOIN URL L ON G.GAME_NO= L.URL_GAME_NO WHERE REPLACE(GAME_NAME,' ','')  LIKE ? ORDER BY RV_DATE DESC";
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, "%" + search.replaceAll(" ", "") + "%");
				System.out.println("3.쿼리문 작성" + sql);

				rs = pstm.executeQuery();
				while (rs.next()) {
					GameDto tmp = new GameDto();

					// GAME
					tmp.setGame_no(rs.getInt("game_no"));
					tmp.setGame_staravg(rs.getDouble("game_staravg"));
					tmp.setGame_platform(rs.getInt("game_platform"));
					tmp.setGame_name(rs.getString("game_name"));
					tmp.setGame_company(rs.getString("game_company"));
					tmp.setGame_genre(rs.getInt("game_genre"));
					tmp.setGame_release(rs.getDate("game_release"));
					tmp.setGame_content(rs.getString("game_content"));

					// REVIEW
					tmp.setRv_no(rs.getInt("rv_no"));
					tmp.setRv_user_id(rs.getString("rv_user_id"));
					tmp.setRv_game_no(rs.getInt("rv_game_no"));
					tmp.setRv_star(rs.getInt("rv_star"));
					tmp.setRv_content(rs.getString("rv_content"));
					tmp.setRv_date(rs.getDate("rv_date"));
					tmp.setRv_platform(rs.getInt("rv_platform"));
					
					// URL 
					tmp.setMain_image(rs.getString("main_image"));
					res.add(tmp);
				}
				System.out.println("4.쿼리실행 및 리턴");
			} catch (SQLException e) {
				System.out.println("3/4 오류");
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
				System.out.println("5. db 종료");
			}
			return res;
		} else {
			return null;
		}
	}

	public List<GameDto> reviewselectAll(GameDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<>();
		String sql = " SELECT * FROM REVIEW WHERE RV_GAME_NO=? ORDER BY RV_DATE DESC ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getGame_no());
			System.out.println("03. query 준비 " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및");

			while (rs.next()) {
				GameDto tmp = new GameDto();
				tmp.setRv_no(rs.getInt(1));
				tmp.setRv_user_id(rs.getString(2));
				tmp.setRv_game_no(rs.getInt(3));
				tmp.setRv_star(rs.getInt(4));
				tmp.setRv_content(rs.getString(5));
				tmp.setRv_date(rs.getDate(6));
				tmp.setRv_platform(rs.getInt(7));

				res.add(tmp);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public int reviewInsert(GameDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO REVIEW VALUES(RV_NO.NEXTVAL, ? ,?, ? ,?, SYSDATE, ?) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getRv_user_id());
			pstm.setInt(2, dto.getGame_no());
			pstm.setDouble(3, dto.getRv_star());
			pstm.setString(4, dto.getRv_content());
			pstm.setInt(5, dto.getRv_platform());
			System.out.println("03. query 준비 : " + sql); 

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}

		return res;
	}

	public List<GameDto> selectReviewPc() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=1 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}

	public List<GameDto> selectReviewPs4() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=2 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}

	public List<GameDto> selectReviewXbox() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=3 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}

	public List<GameDto> selectReviewSwitch() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=4 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}

	public int deleteRv(int seq, String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " DELETE FROM REVIEW WHERE RV_NO=? AND RV_USER_ID=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			pstm.setString(2, user_id);

			System.out.println("03. query 준비:" + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectPc() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=1 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectPs4() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();

		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=2 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectXbox() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=3 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectSwitch() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE GAME_PLATFORM=4 AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public GameDto selectOne_RV(int rv_no, String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		GameDto res = null;
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO WHERE RV_NO=? AND RV_USER_ID=? AND RV_NO IS NOT NULL ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, rv_no);
			pstm.setString(2, user_id);

			System.out.println("03. query 준비:" + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = new GameDto(rs.getInt("rv_no"),rs.getString("game_name"),
						rs.getInt("rv_star"),rs.getString("rv_content"),rs.getInt("rv_platform"));
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

	public int updateRv(GameDto dto) {
		Connection con = getConnection();
		PreparedStatement  pstm = null;
		int res=0;
		String sql = " UPDATE REVIEW SET RV_STAR=?, RV_CONTENT=? WHERE RV_NO=? AND RV_USER_ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setDouble(1, dto.getRv_star());
			pstm.setString(2, dto.getRv_content());
			pstm.setInt(3, dto.getRv_no());
			pstm.setString(4, dto.getRv_user_id());
			
			System.out.println("03.query 준비: "+sql);

			res=pstm.executeUpdate();
			System.out.println("04. qeury 실행 및 리턴");
			
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

	public List<Integer> count(int game_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Integer> res = new ArrayList<>();
		String sql = "SELECT COUNT(*) FROM REVIEW WHERE RV_GAME_NO = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, game_no);
			rs = pstm.executeQuery();

			while (rs.next()) {
				res.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return res;
	}

	public int starUpdate(int game_no, double starAvg_res) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "UPDATE GAME SET GAME_STARAVG = ? WHERE GAME_NO = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setDouble(1, starAvg_res);
			pstm.setInt(2, game_no);
			res = pstm.executeUpdate();
			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	public List<GameDto> otherUserSelect(int user_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<>();
		String sql = "SELECT * FROM USERS U FULL OUTER JOIN REVIEW R ON U.USER_ID = R.RV_USER_ID FULL OUTER JOIN GAME G ON R.RV_GAME_NO = G.GAME_NO FULL OUTER JOIN URL M ON G.GAME_NO = M.URL_GAME_NO WHERE USER_NO= ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, user_no);
			System.out.println("03. query 준비 : " + sql );
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next() ) {
				GameDto dto = new GameDto();
				dto.setUser_no(rs.getInt(1));
				dto.setUser_id(rs.getString(2));
				dto.setUser_pw(rs.getString(3));
				dto.setUser_name(rs.getString(4));
				dto.setUser_email(rs.getString(5));
				dto.setUser_enabled(rs.getString(6));
				dto.setUser_count(rs.getInt(7));
				dto.setUser_image(rs.getString(8));
				dto.setRv_no(rs.getInt(9));
				dto.setRv_user_id(rs.getString(10));
				dto.setRv_game_no(rs.getInt(11));
				dto.setRv_star(rs.getInt(12));
				dto.setRv_content(rs.getString(13));
				dto.setRv_date(rs.getDate(14));
				dto.setRv_platform(rs.getInt(15));
				dto.setGame_no(rs.getInt(16));
				dto.setGame_staravg(rs.getDouble(17));
				dto.setGame_platform(rs.getInt(18));
				dto.setGame_name(rs.getString(19));
				dto.setGame_company(rs.getString(20));
				dto.setGame_genre(rs.getInt(21));
				dto.setGame_release(rs.getDate(22));
				dto.setGame_content(rs.getString(23));
				dto.setUrl_game_no(rs.getInt(24));
				dto.setMain_image(rs.getString(25));
				dto.setImage1(rs.getString(26));
				dto.setImage2(rs.getString(27));
				dto.setImage3(rs.getString(28));
				dto.setImage4(rs.getString(29));
				dto.setVideo1(rs.getString(30));
				dto.setVideo2(rs.getString(31));
				dto.setVideo3(rs.getString(32));
				dto.setVideo4(rs.getString(33));
				dto.setVideo_image1(rs.getString(34));
				dto.setVideo_image2(rs.getString(35));
				dto.setVideo_image3(rs.getString(36));
				dto.setVideo_image4(rs.getString(37));
				dto.setVideo_title1(rs.getString(38));
				dto.setVideo_title2(rs.getString(39));
				dto.setVideo_title3(rs.getString(40));
				dto.setVideo_title4(rs.getString(41));
				dto.setArticle1(rs.getString(42));
				dto.setArticle2(rs.getString(43));
				dto.setArticle3(rs.getString(44));
				dto.setA_image1(rs.getString(45));
				dto.setA_image2(rs.getString(46));
				dto.setA_image3(rs.getString(47));
				dto.setArticle_title1(rs.getString(48));
				dto.setArticle_title2(rs.getString(49));
				dto.setArticle_title3(rs.getString(50));
				dto.setArticle_summary1(rs.getString(51));
				dto.setArticle_summary2(rs.getString(52));
				dto.setArticle_summary3(rs.getString(53));
				dto.setPackage_img(rs.getString(54));
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	
	public List<GameDto> otherUserSelect(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<>();
		String sql = "SELECT * FROM USERS U FULL OUTER JOIN REVIEW R ON U.USER_ID = R.RV_USER_ID FULL OUTER JOIN GAME G ON R.RV_GAME_NO = G.GAME_NO FULL OUTER JOIN URL M ON G.GAME_NO = M.URL_GAME_NO WHERE USER_ID= ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03. query 준비 : " + sql );
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next() ) {
				GameDto dto = new GameDto();
				dto.setUser_no(rs.getInt(1));
				dto.setUser_id(rs.getString(2));
				dto.setUser_pw(rs.getString(3));
				dto.setUser_name(rs.getString(4));
				dto.setUser_email(rs.getString(5));
				dto.setUser_enabled(rs.getString(6));
				dto.setUser_count(rs.getInt(7));
				dto.setUser_image(rs.getString(8));
				dto.setRv_no(rs.getInt(9));
				dto.setRv_user_id(rs.getString(10));
				dto.setRv_game_no(rs.getInt(11));
				dto.setRv_star(rs.getInt(12));
				dto.setRv_content(rs.getString(13));
				dto.setRv_date(rs.getDate(14));
				dto.setRv_platform(rs.getInt(15));
				dto.setGame_no(rs.getInt(16));
				dto.setGame_staravg(rs.getDouble(17));
				dto.setGame_platform(rs.getInt(18));
				dto.setGame_name(rs.getString(19));
				dto.setGame_company(rs.getString(20));
				dto.setGame_genre(rs.getInt(21));
				dto.setGame_release(rs.getDate(22));
				dto.setGame_content(rs.getString(23));
				dto.setUrl_game_no(rs.getInt(24));
				dto.setMain_image(rs.getString(25));
				dto.setImage1(rs.getString(26));
				dto.setImage2(rs.getString(27));
				dto.setImage3(rs.getString(28));
				dto.setImage4(rs.getString(29));
				dto.setVideo1(rs.getString(30));
				dto.setVideo2(rs.getString(31));
				dto.setVideo3(rs.getString(32));
				dto.setVideo4(rs.getString(33));
				dto.setVideo_image1(rs.getString(34));
				dto.setVideo_image2(rs.getString(35));
				dto.setVideo_image3(rs.getString(36));
				dto.setVideo_image4(rs.getString(37));
				dto.setVideo_title1(rs.getString(38));
				dto.setVideo_title2(rs.getString(39));
				dto.setVideo_title3(rs.getString(40));
				dto.setVideo_title4(rs.getString(41));
				dto.setArticle1(rs.getString(42));
				dto.setArticle2(rs.getString(43));
				dto.setArticle3(rs.getString(44));
				dto.setA_image1(rs.getString(45));
				dto.setA_image2(rs.getString(46));
				dto.setA_image3(rs.getString(47));
				dto.setArticle_title1(rs.getString(48));
				dto.setArticle_title2(rs.getString(49));
				dto.setArticle_title3(rs.getString(50));
				dto.setArticle_summary1(rs.getString(51));
				dto.setArticle_summary2(rs.getString(52));
				dto.setArticle_summary3(rs.getString(53));
				dto.setPackage_img(rs.getString(54));
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	
	public GameDto selectOtherUser(int user_no) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		GameDto res = null;
		String sql = "SELECT * FROM USERS WHERE USER_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, user_no);
			System.out.println("03. query 준비 :" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()  ) {
				res = new GameDto();
				res.setUser_no(rs.getInt("user_no"));
				res.setUser_id(rs.getString("user_id"));
				res.setUser_pw(rs.getString("user_pw"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_email(rs.getString("user_email"));
				res.setUser_enabled(rs.getString("user_enabled"));
				res.setUser_count(rs.getInt("user_count"));
				res.setUser_image(rs.getString("user_image"));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	public GameDto selectOtherUser(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		GameDto res = null;
		String sql = "SELECT * FROM USERS WHERE USER_id = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03. query 준비 :" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()  ) {
				res = new GameDto();
				res.setUser_no(rs.getInt("user_no"));
				res.setUser_id(rs.getString("user_id"));
				res.setUser_pw(rs.getString("user_pw"));
				res.setUser_name(rs.getString("user_name"));
				res.setUser_email(rs.getString("user_email"));
				res.setUser_enabled(rs.getString("user_enabled"));
				res.setUser_count(rs.getInt("user_count"));
				res.setUser_image(rs.getString("user_image"));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
	public List<GameDto> selectPc(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT, USER_ID " + 
				" FROM REVIEW A " + 
				" FULL OUTER JOIN GAME B " + 
				"ON A.RV_GAME_NO = B.GAME_NO " + 
				" FULL OUTER JOIN USERS C " + 
				" ON A.RV_USER_ID = C.USER_ID " + 
				" WHERE GAME_PLATFORM=1 " +
				"AND GAME_PLATFORM = RV_PLATFORM" +
				" AND USER_ID = ? " +
				" AND RV_NO IS NOT NULL ORDER BY RV_NO ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectPs4(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		//ps4
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT, USER_ID " + 
				" FROM REVIEW A " + 
				" FULL OUTER JOIN GAME B " + 
				"ON A.RV_GAME_NO = B.GAME_NO " + 
				" FULL OUTER JOIN USERS C " + 
				" ON A.RV_USER_ID = C.USER_ID " + 
				" WHERE GAME_PLATFORM=2 " + 
				" AND USER_ID = ? " +
				" AND RV_NO IS NOT NULL ORDER BY RV_NO ";
		
	
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectXbox(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// xbox
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT, USER_ID " + 
				" FROM REVIEW A " + 
				" FULL OUTER JOIN GAME B " + 
				"ON A.RV_GAME_NO = B.GAME_NO " + 
				" FULL OUTER JOIN USERS C " + 
				" ON A.RV_USER_ID = C.USER_ID " + 
				" WHERE GAME_PLATFORM=3 " + 
				" AND USER_ID = ? " +
				" AND RV_NO IS NOT NULL ORDER BY RV_NO ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectSwitch(String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// switch
		String sql = " SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT, USER_ID " + 
				" FROM REVIEW A " + 
				" FULL OUTER JOIN GAME B " + 
				"ON A.RV_GAME_NO = B.GAME_NO " + 
				" FULL OUTER JOIN USERS C " + 
				" ON A.RV_USER_ID = C.USER_ID " + 
				" WHERE GAME_PLATFORM=4 " + 
				" AND USER_ID = ? " +
				" AND RV_NO IS NOT NULL  ORDER BY RV_NO ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}
	public List<GameDto> selectReviewPc(int startRow, int endRow, String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql ="SELECT * FROM(SELECT * FROM "
				+ " (SELECT ROWNUM AS row_num,RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM ,RV_DATE FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO FULL OUTER JOIN USERS C ON A.RV_USER_ID = C.USER_ID WHERE RV_PLATFORM = 1 AND USER_ID = ? )) "
				+ " WHERE row_num >= ? AND row_num <= ? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			pstm.setInt(2, startRow);
			pstm.setInt(3, endRow);
			
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));
				dto.setRv_date(rs.getDate("rv_date"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}

	public List<GameDto> selectReviewPs4(int startRow, int endRow, String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();

		String sql ="SELECT * FROM(SELECT * FROM "
				+ " (SELECT ROWNUM AS row_num,RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM ,RV_DATE  FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO FULL OUTER JOIN USERS C ON A.RV_USER_ID = C.USER_ID WHERE GAME_PLATFORM=2 AND USER_ID = ? )) "
				+ " WHERE row_num >= ? AND row_num <= ? ";
		
		
//		SELECT RV_NO,GAME_NAME, RV_STAR, RV_CONTENT, USER_ID FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO FULL OUTER JOIN USERS C ON A.RV_USER_ID = C.USER_ID WHERE GAME_PLATFORM=2 AND USER_ID = ? AND RV_NO IS NOT NULL
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			pstm.setInt(2, startRow);
			pstm.setInt(3, endRow);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));
				dto.setRv_date(rs.getDate("rv_date"));
				
				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}

	public List<GameDto> selectReviewXbox(int startRow, int endRow,String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql ="SELECT * FROM(SELECT * FROM "
				+ " (SELECT ROWNUM AS row_num,RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM ,RV_DATE  FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO FULL OUTER JOIN USERS C ON A.RV_USER_ID = C.USER_ID WHERE GAME_PLATFORM=3 AND USER_ID = ? )) "
				+ " WHERE row_num >= ? AND row_num <= ? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			pstm.setInt(2, startRow);
			pstm.setInt(3, endRow);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));
				dto.setRv_date(rs.getDate("rv_date"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}
	

	public List<GameDto> selectReviewSwitch(int startRow, int endRow, String user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<GameDto>();
		// pc
		String sql ="SELECT * FROM(SELECT * FROM "
				+ " (SELECT ROWNUM AS row_num,RV_NO,GAME_NAME, RV_STAR, RV_CONTENT,RV_PLATFORM ,RV_DATE  FROM REVIEW A FULL OUTER JOIN GAME B ON A.RV_GAME_NO = B.GAME_NO FULL OUTER JOIN USERS C ON A.RV_USER_ID = C.USER_ID WHERE GAME_PLATFORM=4 AND USER_ID = ? )) "
				+ " WHERE row_num >= ? AND row_num <= ? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			pstm.setInt(2, startRow);
			pstm.setInt(3, endRow);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 실행 및 리턴");

			while (rs.next()) {
				GameDto dto = new GameDto();
				dto.setRv_no(rs.getInt("rv_no"));
				dto.setGame_name(rs.getString("game_name"));
				dto.setRv_star(rs.getInt("rv_star"));
				dto.setRv_content(rs.getString("rv_content"));
				dto.setRv_platform(rs.getInt("rv_platform"));
				dto.setRv_date(rs.getDate("rv_date"));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;

	}
	
	public int getCount2(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "select count(*) from review where rv_platform =2";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return count; // 총 레코드 수 리턴
	}
	
	public int getCount1(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "select count(*) from review where rv_platform =1";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return count; // 총 레코드 수 리턴
	}
	
	public int getCount3(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "select count(*) from review where rv_platform =3";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return count; // 총 레코드 수 리턴
	}
	public int getCount4(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "select count(*) from review where rv_platform =4";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return count; // 총 레코드 수 리턴
	}
	
	public List<GameDto> Test() {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GameDto> res = new ArrayList<>();
		String sql = "SELECT * FROM GAME , URL";
		
		try {
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				GameDto dto = new GameDto();
				dto.setGame_no(rs.getInt(1));
				dto.setGame_staravg(rs.getDouble(2));
				dto.setGame_platform(rs.getInt(3));
				dto.setGame_name(rs.getString(4));
				dto.setGame_company(rs.getString(5));
				dto.setGame_genre(rs.getInt(6));
				dto.setGame_release(rs.getDate(7));
				dto.setGame_content(rs.getString(8));
				dto.setUrl_game_no(rs.getInt(11));
				dto.setMain_image(rs.getString(12));
				dto.setImage1(rs.getString(13));
				dto.setImage2(rs.getString(14));
				dto.setImage3(rs.getString(15));
				dto.setImage4(rs.getString(16));
				dto.setVideo1(rs.getString(17));
				dto.setVideo2(rs.getString(18));
				dto.setVideo3(rs.getString(19));
				dto.setVideo4(rs.getString(20));
				dto.setArticle1(rs.getString(21));
				dto.setArticle2(rs.getString(22));
				dto.setArticle3(rs.getString(23));
				dto.setA_image1(rs.getString(24));
				dto.setA_image2(rs.getString(25));
				dto.setA_image3(rs.getString(26));
				
				res.add(dto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return res;
		
	}


	public int GetCount(String rv_user_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		String sql = "SELECT USER_COUNT FROM USERS WHERE USER_ID = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, rv_user_id);
			System.out.println("3성공");
			rs = pstm.executeQuery();
			System.out.println("4성공");
			while(rs.next()) {
				res = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return res;
	}


	public int user_count_up(int user_count, String rv_user_id) {
		Connection con = getConnection();
		PreparedStatement pstm =null;
		int res = 0;
		String sql = "UPDATE USERS SET USER_COUNT = ? WHERE USER_ID = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, user_count);
			pstm.setString(2, rv_user_id);
			System.out.println("3성공");
			res = pstm.executeUpdate();
			System.out.println("4성공");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			
		}
		
		return res;
	}
	
	
}
