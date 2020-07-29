package com.game.dto;

import java.util.Date;

public class GameDto {

	// USER TABLE
	// 유저 번호, 아이디, 비밀번호, 이름, 이메일, 가입여부, COUNT=리뷰 작성 수
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_enabled;
	private int user_count;
	private String user_image;

	// -- 리뷰 번호, 리뷰에 작성한 유저 아이디, 게임 번호, 별점, 내용, 작성일자, 플랫폼 번호
	// -- RV_USER_ID는 USERS 테이블의 USER_ID의 컬럼을 참조
	// -- RV_GAME_NO는 GAME 테이블의 GAME_NO의 컬럼을 참조
	// -- RV_PLATFORM GAME 테이블의 GAME_PLATFORM의 컬럼을 참조
	// REVIEW TABLE
	private int rv_no;
	private String rv_user_id;
	private int rv_game_no;
	private int rv_star;
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

	// -- 상세페이지 테스트 테이블
	// CONTENTPAGE TABLE
	private int url_game_no;
	private String main_image;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String video1;
	private String video2;
	private String video3;
	private String video4;
	private String video_image1;
	private String video_image2;
	private String video_image3;
	private String video_image4;
	private String video_title1;
	private String video_title2;
	private String video_title3;
	private String video_title4;
	private String article1;
	private String article2;
	private String article3;
	private String a_image1;
	private String a_image2;
	private String a_image3;
	private String article_title1;
	private String article_title2;
	private String article_title3;
	private String article_summary1;
	private String article_summary2;
	private String article_summary3;
	private String package_img;

	public GameDto() {
	};
	
	

	public GameDto(String user_id, String user_pw, String user_name, String user_email, String user_enabled,
			String user_image) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_enabled = user_enabled;
		this.user_image = user_image;
	}



	public GameDto(int game_no, int rv_star, int rv_platform, String rv_content, String rv_user_id) {
		super();
		this.rv_user_id = rv_user_id;
		this.rv_star = rv_star;
		this.rv_content = rv_content;
		this.rv_platform = rv_platform;
		this.game_no = game_no;
	}

	public GameDto(String rv_user_id, int rv_star, String rv_content, int rv_platform) {
		super();
		this.rv_user_id = rv_user_id;
		this.rv_star = rv_star;
		this.rv_content = rv_content;
		this.rv_platform = rv_platform;
	}

	public GameDto(int rv_no, String game_name, int rv_star, String rv_content, int rv_platform) {
		super();
		this.rv_no = rv_no;
		this.game_name = game_name;
		this.rv_star = rv_star;
		this.rv_content = rv_content;
		this.rv_platform = rv_platform;

	}

	public GameDto(int rv_no, int rv_star, String rv_content, int rv_platform, String rv_user_id) { // 수정
		super();
		this.rv_no = rv_no;
		this.rv_star = rv_star;
		this.rv_content = rv_content;
		this.rv_platform = rv_platform;
		this.rv_user_id = rv_user_id;
	}

	public GameDto(int user_no, String user_id, String user_pw, String user_name, String user_email,
			String user_enabled, int user_count, String user_image, int rv_no, String rv_user_id, int rv_game_no,
			int rv_star, String rv_content, Date rv_date, int rv_platform, String rv_game_name, int row_num,
			int game_no, double game_staravg, int game_platform, String game_name, String game_company, int game_genre,
			Date game_release, String game_content, int url_game_no, String main_image, String image1, String image2,
			String image3, String image4, String video1, String video2, String video3, String video4,
			String video_image1, String video_image2, String video_image3, String video_image4, String video_title1,
			String video_title2, String video_title3, String video_title4, String article1, String article2,
			String article3, String a_image1, String a_image2, String a_image3, String article_title1,
			String article_title2, String article_title3, String article_summary1, String article_summary2,
			String article_summary3, String package_img) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_enabled = user_enabled;
		this.user_count = user_count;
		this.user_image = user_image;
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
		this.url_game_no = url_game_no;
		this.main_image = main_image;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.video1 = video1;
		this.video2 = video2;
		this.video3 = video3;
		this.video4 = video4;
		this.video_image1 = video_image1;
		this.video_image2 = video_image2;
		this.video_image3 = video_image3;
		this.video_image4 = video_image4;
		this.video_title1 = video_title1;
		this.video_title2 = video_title2;
		this.video_title3 = video_title3;
		this.video_title4 = video_title4;
		this.article1 = article1;
		this.article2 = article2;
		this.article3 = article3;
		this.a_image1 = a_image1;
		this.a_image2 = a_image2;
		this.a_image3 = a_image3;
		this.article_title1 = article_title1;
		this.article_title2 = article_title2;
		this.article_title3 = article_title3;
		this.article_summary1 = article_summary1;
		this.article_summary2 = article_summary2;
		this.article_summary3 = article_summary3;
		this.package_img = package_img;
	}

	public GameDto(String user_name, int user_no , String user_image) {
		super();
		this.user_name = user_name;
		this.user_no = user_no;
		this.user_image = user_image;
	}
	
	

	public GameDto(int user_no, String user_id, String user_name) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_name = user_name;
	}

	public GameDto(String user_id, String user_pw, String user_name, String user_email, String user_enabled) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_enabled = user_enabled;
	}

	public GameDto(int row_num, int game_no, double game_staravg, int platform, String game_name, String game_company,
			int game_genre, Date game_release, String game_content) {
		super();
		this.row_num = row_num;
		this.game_no = game_no;
		this.game_staravg = game_staravg;
		this.game_platform = platform;
		this.game_name = game_name;
		this.game_company = game_company;
		this.game_genre = game_genre;
		this.game_release = game_release;
		this.game_content = game_content;
	}

	public GameDto(int game_no) {
		super();
		this.game_no = game_no;
	}

	public GameDto(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
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

	public int getRv_star() {
		return rv_star;
	}

	public void setRv_star(int rv_star) {
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

	public int getUrl_game_no() {
		return url_game_no;
	}

	public void setUrl_game_no(int url_game_no) {
		this.url_game_no = url_game_no;
	}

	public String getMain_image() {
		return main_image;
	}

	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getVideo1() {
		return video1;
	}

	public void setVideo1(String video1) {
		this.video1 = video1;
	}

	public String getVideo2() {
		return video2;
	}

	public void setVideo2(String video2) {
		this.video2 = video2;
	}

	public String getVideo3() {
		return video3;
	}

	public void setVideo3(String video3) {
		this.video3 = video3;
	}

	public String getVideo4() {
		return video4;
	}

	public void setVideo4(String video4) {
		this.video4 = video4;
	}

	public String getVideo_image1() {
		return video_image1;
	}

	public void setVideo_image1(String video_image1) {
		this.video_image1 = video_image1;
	}

	public String getVideo_image2() {
		return video_image2;
	}

	public void setVideo_image2(String video_image2) {
		this.video_image2 = video_image2;
	}

	public String getVideo_image3() {
		return video_image3;
	}

	public void setVideo_image3(String video_image3) {
		this.video_image3 = video_image3;
	}

	public String getVideo_image4() {
		return video_image4;
	}

	public void setVideo_image4(String video_image4) {
		this.video_image4 = video_image4;
	}

	public String getVideo_title1() {
		return video_title1;
	}

	public void setVideo_title1(String video_title1) {
		this.video_title1 = video_title1;
	}

	public String getVideo_title2() {
		return video_title2;
	}

	public void setVideo_title2(String video_title2) {
		this.video_title2 = video_title2;
	}

	public String getVideo_title3() {
		return video_title3;
	}

	public void setVideo_title3(String video_title3) {
		this.video_title3 = video_title3;
	}

	public String getVideo_title4() {
		return video_title4;
	}

	public void setVideo_title4(String video_title4) {
		this.video_title4 = video_title4;
	}

	public String getArticle1() {
		return article1;
	}

	public void setArticle1(String article1) {
		this.article1 = article1;
	}

	public String getArticle2() {
		return article2;
	}

	public void setArticle2(String article2) {
		this.article2 = article2;
	}

	public String getArticle3() {
		return article3;
	}

	public void setArticle3(String article3) {
		this.article3 = article3;
	}

	public String getA_image1() {
		return a_image1;
	}

	public void setA_image1(String a_image1) {
		this.a_image1 = a_image1;
	}

	public String getA_image2() {
		return a_image2;
	}

	public void setA_image2(String a_image2) {
		this.a_image2 = a_image2;
	}

	public String getA_image3() {
		return a_image3;
	}

	public void setA_image3(String a_image3) {
		this.a_image3 = a_image3;
	}

	public String getArticle_title1() {
		return article_title1;
	}

	public void setArticle_title1(String article_title1) {
		this.article_title1 = article_title1;
	}

	public String getArticle_title2() {
		return article_title2;
	}

	public void setArticle_title2(String article_title2) {
		this.article_title2 = article_title2;
	}

	public String getArticle_title3() {
		return article_title3;
	}

	public void setArticle_title3(String article_title3) {
		this.article_title3 = article_title3;
	}

	public String getArticle_summary1() {
		return article_summary1;
	}

	public void setArticle_summary1(String article_summary1) {
		this.article_summary1 = article_summary1;
	}

	public String getArticle_summary2() {
		return article_summary2;
	}

	public void setArticle_summary2(String article_summary2) {
		this.article_summary2 = article_summary2;
	}

	public String getArticle_summary3() {
		return article_summary3;
	}

	public void setArticle_summary3(String article_summary3) {
		this.article_summary3 = article_summary3;
	}

	public String getPackage_img() {
		return package_img;
	}

	public void setPackage_img(String package_img) {
		this.package_img = package_img;
	}

	@Override
	public String toString() {
		return "GameDto [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_email=" + user_email + ", user_enabled=" + user_enabled + ", user_count="
				+ user_count + ", user_image=" + user_image + ", rv_no=" + rv_no + ", rv_user_id=" + rv_user_id
				+ ", rv_game_no=" + rv_game_no + ", rv_star=" + rv_star + ", rv_content=" + rv_content + ", rv_date="
				+ rv_date + ", rv_platform=" + rv_platform + ", rv_game_name=" + rv_game_name + ", row_num=" + row_num
				+ ", game_no=" + game_no + ", game_staravg=" + game_staravg + ", game_platform=" + game_platform
				+ ", game_name=" + game_name + ", game_company=" + game_company + ", game_genre=" + game_genre
				+ ", game_release=" + game_release + ", game_content=" + game_content + ", url_game_no=" + url_game_no
				+ ", main_image=" + main_image + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3
				+ ", image4=" + image4 + ", video1=" + video1 + ", video2=" + video2 + ", video3=" + video3
				+ ", video4=" + video4 + ", video_image1=" + video_image1 + ", video_image2=" + video_image2
				+ ", video_image3=" + video_image3 + ", video_image4=" + video_image4 + ", video_title1=" + video_title1
				+ ", video_title2=" + video_title2 + ", video_title3=" + video_title3 + ", video_title4=" + video_title4
				+ ", article1=" + article1 + ", article2=" + article2 + ", article3=" + article3 + ", a_image1="
				+ a_image1 + ", a_image2=" + a_image2 + ", a_image3=" + a_image3 + ", article_title1=" + article_title1
				+ ", article_title2=" + article_title2 + ", article_title3=" + article_title3 + ", article_summary1="
				+ article_summary1 + ", article_summary2=" + article_summary2 + ", article_summary3=" + article_summary3
				+ ", package_img=" + package_img + ", getUser_image()=" + getUser_image() + ", getUser_no()="
				+ getUser_no() + ", getUser_id()=" + getUser_id() + ", getUser_pw()=" + getUser_pw()
				+ ", getUser_name()=" + getUser_name() + ", getUser_email()=" + getUser_email() + ", getUser_enabled()="
				+ getUser_enabled() + ", getUser_count()=" + getUser_count() + ", getRv_no()=" + getRv_no()
				+ ", getRv_user_id()=" + getRv_user_id() + ", getRv_game_no()=" + getRv_game_no() + ", getRv_star()="
				+ getRv_star() + ", getRv_content()=" + getRv_content() + ", getRv_date()=" + getRv_date()
				+ ", getRv_platform()=" + getRv_platform() + ", getRv_game_name()=" + getRv_game_name()
				+ ", getRow_num()=" + getRow_num() + ", getGame_no()=" + getGame_no() + ", getGame_staravg()="
				+ getGame_staravg() + ", getGame_platform()=" + getGame_platform() + ", getGame_name()="
				+ getGame_name() + ", getGame_company()=" + getGame_company() + ", getGame_genre()=" + getGame_genre()
				+ ", getGame_release()=" + getGame_release() + ", getGame_content()=" + getGame_content()
				+ ", getUrl_game_no()=" + getUrl_game_no() + ", getMain_image()=" + getMain_image() + ", getImage1()="
				+ getImage1() + ", getImage2()=" + getImage2() + ", getImage3()=" + getImage3() + ", getImage4()="
				+ getImage4() + ", getVideo1()=" + getVideo1() + ", getVideo2()=" + getVideo2() + ", getVideo3()="
				+ getVideo3() + ", getVideo4()=" + getVideo4() + ", getVideo_image1()=" + getVideo_image1()
				+ ", getVideo_image2()=" + getVideo_image2() + ", getVideo_image3()=" + getVideo_image3()
				+ ", getVideo_image4()=" + getVideo_image4() + ", getVideo_title1()=" + getVideo_title1()
				+ ", getVideo_title2()=" + getVideo_title2() + ", getVideo_title3()=" + getVideo_title3()
				+ ", getVideo_title4()=" + getVideo_title4() + ", getArticle1()=" + getArticle1() + ", getArticle2()="
				+ getArticle2() + ", getArticle3()=" + getArticle3() + ", getA_image1()=" + getA_image1()
				+ ", getA_image2()=" + getA_image2() + ", getA_image3()=" + getA_image3() + ", getArticle_title1()="
				+ getArticle_title1() + ", getArticle_title2()=" + getArticle_title2() + ", getArticle_title3()="
				+ getArticle_title3() + ", getArticle_summary1()=" + getArticle_summary1() + ", getArticle_summary2()="
				+ getArticle_summary2() + ", getArticle_summary3()=" + getArticle_summary3() + ", getPackage_img()="
				+ getPackage_img() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	

}