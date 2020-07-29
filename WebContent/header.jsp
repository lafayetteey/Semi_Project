<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>



 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Semi_Project_Main_Page</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>
<link rel="stylesheet" href="assets/css/header.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function wrapWindowByMask() {
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});
		$('#mask').fadeTo("fast", 0.8);
	}

	$(document).ready(function() {
		$('.openMask').click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});
	});

	function loginPopup() {
		$(".login-popup").fadeIn(500);
		wrapWindowByMask();
	}

	function closeForm() {
		$(".login-popup").fadeOut(500);
		$('#mask').hide();
	}

	function SignUpPopup() {
		$(".signup-popup").fadeIn(500);
		wrapWindowByMask();
	}

	function closeSignForm() {
		$(".signup-popup").fadeOut(500);
		$('#mask').hide();
	}
	function idChk(bool){
	      var doc = document.getElementsByName("user_id")[1];
	      console.log(doc);
	      if(doc.value.trim()=="" || doc.value==null){
	      }
	      else{
	         $.ajax({ 
	            url :'LogController?command=idchk&user_id='+doc.value.trim(),
	            type : 'post',
	            dataType : 'text',
	            
	            
	            
	            success: function(data){
	               console.log(data);
	               if(data == 1){
	                  $(".idchk").text('ID 사용불가 : 중복 된 아이디 입니다.');
	                  $(".idbox").attr('style','background-color:rgba( 255, 102, 102, 0.5 ) !important');
	                        $(".idchk").css("color","red");
	               }else {
	                  $(".idchk").text('사용가능한 아이디 입니다.');
	                  $(".idbox").attr('style','background-color:rgba( 204, 255, 204, 0.5 ) !important')
	                        $(".idchk").css("color","blue");
	               }
	            },
	            errer: function(data){
	               console.log("실패");   
	            }
	         });

	      }
	   }
	
	

</script>

</head>
<body>
<%   
	String user_id = null;
   user_id = (String) session.getAttribute("login");
%>
	<!-- partial:index.partial.html -->
	<div id="mask"></div>
	<div class="main_visual">
		<div class="header">
			<div class="header-title"
				onclick="location.href='pagemove?command=mainLoad'"
				style="cursor: pointer;">
				DOM<span>Critic</span>
			</div>
			<div class="main_menu">
				<span class="menu_pc"
					onclick="location.href='pagemove?command=platform&platform=1'">PC</span>
				<span class="menu_ps4"
					onclick="location.href='pagemove?command=platform&platform=2'">PS4</span>
				<span class="menu_xbox"
					onclick="location.href='pagemove?command=platform&platform=3'">XBOX</span>
				<span class="menu_switch"
					onclick="location.href='pagemove?command=platform&platform=4'">Switch</span>
			</div>

			<form action="pagemove" method="post" class="searchForm">
				<input type="hidden" name="command" value="search">
				<div class="browse">
					<div class="search-bar">
						<input type="search" placeholder="Search Games" name="search"
							value="" />
					</div>
					<input type="submit" class="searchBtn" style="display: none;">
				</div>
			</form>
			<div class="profile">
			<%	
				if (session.getAttribute("login") == null || session.getAttribute("login").equals(null)) { 
			%>
				<div class="user-profile" style="display : none;">
					<img onclick="location.href='pagemove?command=user_dashboard'"
						src="https://png.pngtree.com/png-vector/20190919/ourmid/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_1742031.jpg"
						alt="" class="user-img">
				</div>
				<%
						} else {
				%>
				<div class="user-profile" >
					<img onclick="location.href='pagemove?command=user_dashboard&user_id=<%=user_id %>' "
						src="https://png.pngtree.com/png-vector/20190919/ourmid/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_1742031.jpg"
						alt="" class="user-img">
				</div>
				<%
						}
				%>
				<div class="profile-menu">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
						fill="none" stroke="currentColor" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-menu">
    </svg>

					<%
						if (session.getAttribute("login") == null || session.getAttribute("login").equals(null)) {
					%>
					<div class="login_button1" style="display: block;">
						<span class="login_text" style="cursor: pointer;"
							onclick="loginPopup();">Log In</span>
					</div>
					&nbsp;&nbsp;
					<div class="login_button2">
						<span class="signup_text" style="cursor: pointer;"
							onclick="SignUpPopup();">Sign Up</span>
					</div>
					<%
						} else {
					%>
					<div class="logout_button">
						<span class="logout_text" style="cursor: pointer;"
							onclick="location.href='LogController?command=log_out'">Log
							Out</span>
					</div>
					<%
						}
					%>
					<!-- 로그인 및 회원가입 폼 -->
					<div class="login-popup">
						<form action="LogController" method="post" class="form-container">
							<input type="hidden" name="command" value="login"> <label
								for="email"><b>아이디</b></label> <input type="text"
								placeholder="Enter ID" name="user_id" required> <label
								for="psw"><b>비밀번호</b></label> <input type="password"
								placeholder="Enter Password" name="user_pw" required>
							
							
							
							
							<button type="submit" class="btn" value="login">로그인</button>
							<button type="button" class="btn cancel" onclick="closeForm()">닫기</button>
							
							<!-- 카카오  -->
							<br><br>&nbsp;&nbsp;&nbsp;&nbsp; <a
								id="login-form-btn" href="javascript:loginFormWithKakao()">
								<img
								src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
								 />
							</a>


							<script type="text/javascript">
              // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
              // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
              Kakao.init('47d73b8d037921f48c0d4e6c800d3af3');
              
              function loginFormWithKakao(){
                 Kakao.Auth.loginForm({
                   success: function(authObj) {
                           Kakao.API.request({
                                   url: '/v2/user/me',
                                   success: function(res) {
                                           var no = res.id;
                                           var name = res.properties["nickname"];
                                           var id = res.kakao_account["email"];
                                           location.href='pagemove?command=kakaologin&no='+ no+'&name='+name+ '&id='+ id;
                                   },
                                   fail: function(error) {
                                           alert(
                                             'login success, but failed to request user information: ' +
                                               JSON.stringify(error)
                                           )
                                   },
                           })
                   },
                   fail: function(err) {
                           alert('failed to login: ' + JSON.stringify(err))
                   },
                 })
              }
            </script>
						</form>
					</div>


					<div class="signup-popup">
						<form action="LogController" method="post" class="sign-container">
							<input type="hidden" name="command" value="Insert"> <label
								for="id"><b>아이디</b></label> <input type="text"
								placeholder="Enter ID" name="user_id"  class="idbox" oninput="idChk()"> 
								<div class="idchk"></div>
								 <label for="psw"><b>비밀번호</b></label>
							<input type="password" placeholder="Enter Password"
								name="user_pw" required> <label for="name"><b>이름</b></label>
							<input type="text" placeholder="Enter Name" name="user_name"
								required> <label for="email"><b>이메일</b></label> <input
								type="email" placeholder="Enter Email" name="user_email"
								required>
								
								<label for="ImgUrl"><b>프로필 사진</b></label>
                     <input type="text" placeholder="원하는 사진의 url을 넣어주세요" name="user_image"
                        required>
							
							<button type="submit" class="btn" value="Insert">회원가입</button>
							<button type="button" class="btn cancel"
								onclick="closeSignForm()">닫기</button>
								<!-- 카카오  -->
						&nbsp;&nbsp;&nbsp;&nbsp; <a
								id="login-form-btn" href="javascript:loginFormWithKakao()">
								<img
								src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
								 />
							</a>


							<script type="text/javascript">
              // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
              // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
              Kakao.init('47d73b8d037921f48c0d4e6c800d3af3');
              
              function loginFormWithKakao(){
                 Kakao.Auth.loginForm({
                   success: function(authObj) {
                           Kakao.API.request({
                                   url: '/v2/user/me',
                                   success: function(res) {
                                           var no = res.id;
                                           var name = res.properties["nickname"];
                                           var id = res.kakao_account["email"];
                                           location.href='pagemove?command=kakaologin&no='+ no+'&name='+name+ '&id='+ id;
                                   },
                                   fail: function(error) {
                                           alert(
                                             'login success, but failed to request user information: ' +
                                               JSON.stringify(error)
                                           )
                                   },
                           })
                   },
                   fail: function(err) {
                           alert('failed to login: ' + JSON.stringify(err))
                   },
                 })
              }
            </script>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>