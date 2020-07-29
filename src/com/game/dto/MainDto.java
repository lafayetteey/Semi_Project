package com.game.dto;

import java.sql.Date;

public class MainDto {
	// USER TABLE
	// 유저 번호, 아이디, 비밀번호, 이름, 이메일, 가입여부, COUNT=리뷰 작성 수
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_enabled;
	private int user_count;

	// -- 리뷰 번호, 리뷰에 작성한 유저 아이디, 게임 번호, 별점, 내용, 작성일자, 플랫폼 번호
	// -- RV_USER_ID는 USERS 테이블의 USER_ID의 컬럼을 참조
	// -- RV_GAME_NO는 GAME 테이블의 GAME_NO의 컬럼을 참조
	// -- RV_PLATFORM GAME 테이블의 GAME_PLATFORM의 컬럼을 참조
	// REVIEW TABLE
	private int rv_no;
	private String rv_user_id;
	private int rv_game_no;
	private double rv_star;
	private String rv_content;
	private Date rv_date;
	private int rv_platform;
	private String rv_game_name;

	// -- 게임 번호, 별 평점, 플랫폼, 게임이름, 회사, 장르, 출시일자, 요약(content)
	// GAME TABLE
	private int row_num;
	private int game_no;
	private double game_staravg;
	private int game_platform;
	private String game_name;
	private String game_company;
	private int game_genre;
	private Date game_release;
	private String game_content;

	// main 화면용 테이블
	private int m_game_no;
	private int m_game_platform;
	private String m_game_name;
	private String m_game_company;
	private String m_game_summary;
	private String m_game_slideimage;
	private String m_game_image;

	public MainDto() {
	}

	public MainDto(int user_no, String user_id, String user_pw, String user_name, String user_email,
			String user_enabled, int user_count, int rv_no, String rv_user_id, int rv_game_no, double rv_star,
			String rv_content, Date rv_date, int rv_platform, String rv_game_name, int row_num, int game_no,
			double game_staravg, int game_platform, String game_name, String game_company, int game_genre,
			Date game_release, String game_content, int m_game_no, int m_game_platform, String m_game_name,
			String m_game_company, String m_game_summary, String m_game_slideimage, String m_game_image) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_enabled = user_enabled;
		this.user_count = user_count;
		this.rv_no = rv_no;
		this.rv_user_id = rv_user_id;
		this.rv_game_no = rv_game_no;
		this.rv_star = rv_star;
		this.rv_content = rv_content;
		this.rv_date = rv_date;
		this.rv_platform = rv_platform;
		this.rv_game_name = rv_game_name;
		this.row_num = row_num;
		this.game_no = game_no;
		this.game_staravg = game_staravg;
		this.game_platform = game_platform;
		this.game_name = game_name;
		this.game_company = game_company;
		this.game_genre = game_genre;
		this.game_release = game_release;
		this.game_content = game_content;
		this.m_game_no = m_game_no;
		this.m_game_platform = m_game_platform;
		this.m_game_name = m_game_name;
		this.m_game_company = m_game_company;
		this.m_game_summary = m_game_summary;
		this.m_game_slideimage = m_game_slideimage;
		this.m_game_image = m_game_image;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_enabled() {
		return user_enabled;
	}

	public void setUser_enabled(String user_enabled) {
		this.user_enabled = user_enabled;
	}

	public int getUser_count() {
		return user_count;
	}

	public void setUser_count(int user_count) {
		this.user_count = user_count;
	}

	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_user_id() {
		return rv_user_id;
	}

	public void setRv_user_id(String rv_user_id) {
		this.rv_user_id = rv_user_id;
	}

	public int getRv_game_no() {
		return rv_game_no;
	}

	public void setRv_game_no(int rv_game_no) {
		this.rv_game_no = rv_game_no;
	}

	public double getRv_star() {
		return rv_star;
	}

	public void setRv_star(double rv_star) {
		this.rv_star = rv_star;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public int getRv_platform() {
		return rv_platform;
	}

	public void setRv_platform(int rv_platform) {
		this.rv_platform = rv_platform;
	}

	public String getRv_game_name() {
		return rv_game_name;
	}

	public void setRv_game_name(String rv_game_name) {
		this.rv_game_name = rv_game_name;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public double getGame_staravg() {
		return game_staravg;
	}

	public void setGame_staravg(double game_staravg) {
		this.game_staravg = game_staravg;
	}

	public int getGame_platform() {
		return game_platform;
	}

	public void setGame_platform(int game_platform) {
		this.game_platform = game_platform;
	}

	public String getGame_name() {
		return game_name;
	}

	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}

	public String getGame_company() {
		return game_company;
	}

	public void setGame_company(String game_company) {
		this.game_company = game_company;
	}

	public int getGame_genre() {
		return game_genre;
	}

	public void setGame_genre(int game_genre) {
		this.game_genre = game_genre;
	}

	public Date getGame_release() {
		return game_release;
	}

	public void setGame_release(Date game_release) {
		this.game_release = game_release;
	}

	public String getGame_content() {
		return game_content;
	}

	public void setGame_content(String game_content) {
		this.game_content = game_content;
	}

	public int getM_game_no() {
		return m_game_no;
	}

	public void setM_game_no(int m_game_no) {
		this.m_game_no = m_game_no;
	}

	public int getM_game_platform() {
		return m_game_platform;
	}

	public void setM_game_platform(int m_game_platform) {
		this.m_game_platform = m_game_platform;
	}

	public String getM_game_name() {
		return m_game_name;
	}

	public void setM_game_name(String m_game_name) {
		this.m_game_name = m_game_name;
	}

	public String getM_game_company() {
		return m_game_company;
	}

	public void setM_game_company(String m_game_company) {
		this.m_game_company = m_game_company;
	}

	public String getM_game_summary() {
		return m_game_summary;
	}

	public void setM_game_summary(String m_game_summary) {
		this.m_game_summary = m_game_summary;
	}

	public String getM_game_slideimage() {
		return m_game_slideimage;
	}

	public void setM_game_slideimage(String m_game_slideimage) {
		this.m_game_slideimage = m_game_slideimage;
	}

	public String getM_game_image() {
		return m_game_image;
	}

	public void setM_game_image(String m_game_image) {
		this.m_game_image = m_game_image;
	}

	@Override
	public String toString() {
		return "MainDto [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_email=" + user_email + ", user_enabled=" + user_enabled + ", user_count="
				+ user_count + ", rv_no=" + rv_no + ", rv_user_id=" + rv_user_id + ", rv_game_no=" + rv_game_no
				+ ", rv_star=" + rv_star + ", rv_content=" + rv_content + ", rv_date=" + rv_date + ", rv_platform="
				+ rv_platform + ", rv_game_name=" + rv_game_name + ", row_num=" + row_num + ", game_no=" + game_no
				+ ", game_staravg=" + game_staravg + ", game_platform=" + game_platform + ", game_name=" + game_name
				+ ", game_company=" + game_company + ", game_genre=" + game_genre + ", game_release=" + game_release
				+ ", game_content=" + game_content + ", m_game_no=" + m_game_no + ", m_game_platform=" + m_game_platform
				+ ", m_game_name=" + m_game_name + ", m_game_company=" + m_game_company + ", m_game_summary="
				+ m_game_summary + ", m_game_slideimage=" + m_game_slideimage + ", m_game_image=" + m_game_image + "]";
	};

}
