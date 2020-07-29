<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE HTML>

<html>
<head>
<title>Semi_Project_ContentPage</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/contentpagestyle.css" />
<link rel="stylesheet" href="assets/css/platform.css" />

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".starRev span").click(function() {
			$(this).parent().children("span").removeClass("on");
			$(this).addClass("on").prevAll("span").addClass("on");
			return false;
		})
	});

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

	function showImage() {
		$(".img-resizecontainer_1").fadeIn(300);
		wrapWindowByMask();
	}
	function hideImage() {
		$(".img-resizecontainer_1").fadeOut(300);
		$('#mask').hide();
	}

	function showImage2() {
		$(".img-resizecontainer_2").fadeIn(300);
		wrapWindowByMask();
	}
	function hideImage2() {
		$(".img-resizecontainer_2").fadeOut(300);
		$('#mask').hide();
	}
	function showImage3() {
		$(".img-resizecontainer_3").fadeIn(300);
		wrapWindowByMask();
	}
	function hideImage3() {
		$(".img-resizecontainer_3").fadeOut(300);
		$('#mask').hide();
	}
	function showImage4() {
		$(".img-resizecontainer_4").fadeIn(300);
		wrapWindowByMask();
	}
	function hideImage4() {
		$(".img-resizecontainer_4").fadeOut(300);
		$('#mask').hide();
	}

	function showVid() {
		$(".video-playwrapper_1").show();
		wrapWindowByMask();
	}
	function hideVid() {
		$(".video-playwrapper_1").hide();
		$('#mask').hide();
		var videoURL = $('#playerID').prop('src');
		videoURL = videoURL.replace("?autoplay=1", "");
		$('#playerID').prop('src', '');
		$('#playerID').prop('src', videoURL);
	}
	function showVid2() {
		$(".video-playwrapper_2").show();
		wrapWindowByMask();
	}
	function hideVid2() {
		$(".video-playwrapper_2").hide();
		$('#mask').hide();
		var videoURL = $('#playerID2').prop('src');
		videoURL = videoURL.replace("?autoplay=1", "");
		$('#playerID2').prop('src', '');
		$('#playerID2').prop('src', videoURL);
	}
	function showVid3() {
		$(".video-playwrapper_3").show();
		wrapWindowByMask();
	}
	function hideVid3() {
		$(".video-playwrapper_3").hide();
		$('#mask').hide();
		var videoURL = $('#playerID3').prop('src');
		videoURL = videoURL.replace("?autoplay=1", "");
		$('#playerID3').prop('src', '');
		$('#playerID3').prop('src', videoURL);
	}
	function showVid4() {
		$(".video-playwrapper_4").show();
		wrapWindowByMask();
	}
	function hideVid4() {
		$(".video-playwrapper_4").hide();
		$('#mask').hide();
		var videoURL = $('#playerID4').prop('src');
		videoURL = videoURL.replace("?autoplay=1", "");
		$('#playerID4').prop('src', '');
		$('#playerID4').prop('src', videoURL);
	}
	function moveToReview() {
		window.open("https://bbs.ruliweb.com/news/board/11/read/1851");
	}
	function moveToReview2() {
		window.open("http://www.inven.co.kr/webzine/news/?news=239452");
	}
	function moveToReview3() {
		window
				.open("http://www.kyeonggi.com/news/articleView.html?idxno=2300653");
	}

	function po1() {
		var point = $("#sstar").val("1");
	}
	function po2() {
		var point = $("#sstar").val("2");
	}
	function po3() {
		var point = $("#sstar").val("3");
	}
	function po4() {
		var point = $("#sstar").val("4");
	}
	function po5() {
		var point = $("#sstar").val("5");
	}
	$(function() {
		$("#sort").change(function() {
			var sort = document.getElementsByName("sort")[0];
			var idx = sort.selectedIndex;

			if (idx == 0) {
				$(".ranking_table1").css("display", "");
				$(".ranking_table2").css("display", "none");
				$(".ranking_table3").css("display", "none");
			} else if (idx == 1) {
				$(".ranking_table1").css("display", "none");
				$(".ranking_table2").css("display", "");
				$(".ranking_table3").css("display", "none");
			} else if (idx == 2) {
				$(".ranking_table1").css("display", "none");
				$(".ranking_table2").css("display", "none");
				$(".ranking_table3").css("display", "");
			}
		});
	})
	function loginChk() {
		alert("리뷰를 작성하시려면 먼저 로그인을 해주세요");
		location.href = "pagemove?command=contentpage&game_no=${dto.game_no}";
	}
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="./header.jsp"%>
	<%   
   user_id = (String) session.getAttribute("login");
%>

	<!-- Nav -->

	<!-- Banner -->

	<%@include file="./contentpage_header.jsp" %>

	<!-- Main -->
	<div id="main">

		<!-- Section -->
		<section class="wrapper style1">
			<div class="articles">
				<div class="game_summary">Summary & General Information</div>
				<div class="line"></div>
				<p class="lastofus_summary" style="color:black;">${dto.game_content }</p>
				<p class="lastofus_summary_2" style="color:black;">
					개발 :
					<c:out value="${dto.game_company }"></c:out>
					<br> 플랫폼 :
					<c:choose>
						<c:when test="${dto.game_platform eq 1 }">
							<c:out value="PC"></c:out>
						</c:when>
						<c:when test="${dto.game_platform eq 2}">
							<c:out value="PS4"></c:out>
						</c:when>
						<c:when test="${dto.game_platform eq 3  }">
							<c:out value="Xbox"></c:out>
						</c:when>
						<c:when test="${dto.game_platform eq 4} ">
							<c:out value="Switch"></c:out>
						</c:when>
					</c:choose>
					<br> 출시일자 : <c:out value="${dto.game_release }"></c:out>
					<br> 장르 :
					<c:choose>
						<c:when test="${dto.game_genre eq 1 }">
							<c:out value="ACTION"></c:out>
						</c:when>
						<c:when test="${dto.game_genre eq 2 }">
							<c:out value="ADVENTURE"></c:out>
						</c:when>
						<c:when test="${dto.game_genre eq 3 }">
							<c:out value="RPG"></c:out>
						</c:when>
						<c:when test="${dto.game_genre eq 4 }">
							<c:out value="SIMULATION"></c:out>
						</c:when>
						<c:when test="${dto.game_genre eq 5 }">
							<c:out value="AOS"></c:out>
						</c:when>
						<c:when test="${dto.game_genre eq 6 }">
							<c:out value="FPS"></c:out>
						</c:when>
						<c:when test="${dto.game_genre eq 7 }">
							<c:out value="RACING"></c:out>
						</c:when>
					</c:choose>
					<br>
				</p>
			</div>
		</section>


		<!-- Section -->
		<section class="wrapper style2">
			<div class="title">Reviews</div>
			<div class="line"></div>
			<div class="review-container">
				<c:forEach var="list" items="${list }" begin="0" end="7">
					<div>
						<div class="review-wrap1">
							<table>
								<tr>
									<td class="star_point">
										<div class="rate">
											<c:choose>
												<c:when test="${list.rv_star >=5 }">
													<fieldset class="rating book-rate">
														<input type="checkbox" id="star-c1" name="rating"
															value="5" checked="checked" onclick="return false">
														<label class="full" for="star-c1"></label> <input
															type="checkbox" id="star-c2" name="rating" value="4"
															onclick="return false"> <label class="full"
															for="star-c2"></label> <input type="checkbox"
															id="star-c3" name="rating" value="3"
															onclick="return false"> <label class="full"
															for="star-c3"></label> <input type="checkbox"
															id="star-c4" name="rating" value="2"
															onclick="return false"> <label class="full"
															for="star-c4"></label> <input type="checkbox"
															id="star-c5" name="rating" value="1"
															onclick="return false"> <label class="full"
															for="star-c5"></label>
													</fieldset>
												</c:when>
												<c:when test="${list.rv_star < 5 and list.rv_star >= 4 }">
													<fieldset class="rating book-rate">
														<input type="checkbox" id="star-c1" name="rating"
															value="5" onclick="return false"> <label
															class="full" for="star-c1"></label> <input
															type="checkbox" id="star-c2" name="rating" value="4"
															checked="checked" onclick="return false"> <label
															class="full" for="star-c2"></label> <input
															type="checkbox" id="star-c3" name="rating" value="3"
															onclick="return false"> <label class="full"
															for="star-c3"></label> <input type="checkbox"
															id="star-c4" name="rating" value="2"
															onclick="return false"> <label class="full"
															for="star-c4"></label> <input type="checkbox"
															id="star-c5" name="rating" value="1"
															onclick="return false"> <label class="full"
															for="star-c5"></label>
													</fieldset>
												</c:when>
												<c:when test="${list.rv_star < 4 and list.rv_star >= 3 }">
													<fieldset class="rating book-rate">
														<input type="checkbox" id="star-c1" name="rating"
															value="5" onclick="return false"> <label
															class="full" for="star-c1"></label> <input
															type="checkbox" id="star-c2" name="rating" value="4"
															onclick="return false"> <label class="full"
															for="star-c2"></label> <input type="checkbox"
															id="star-c3" name="rating" value="3" checked="checked"
															onclick="return false"> <label class="full"
															for="star-c3"></label> <input type="checkbox"
															id="star-c4" name="rating" value="2"
															onclick="return false"> <label class="full"
															for="star-c4"></label> <input type="checkbox"
															id="star-c5" name="rating" value="1"
															onclick="return false"> <label class="full"
															for="star-c5"></label>
													</fieldset>
												</c:when>
												<c:when test="${list.rv_star < 3 and list.rv_star >= 2 }">
													<fieldset class="rating book-rate">
														<input type="checkbox" id="star-c1" name="rating"
															value="5" onclick="return false"> <label
															class="full" for="star-c1"></label> <input
															type="checkbox" id="star-c2" name="rating" value="4"
															onclick="return false"> <label class="full"
															for="star-c2"></label> <input type="checkbox"
															id="star-c3" name="rating" value="3"
															onclick="return false"> <label class="full"
															for="star-c3"></label> <input type="checkbox"
															id="star-c4" name="rating" value="2" checked="checked"
															onclick="return false"> <label class="full"
															for="star-c4"></label> <input type="checkbox"
															id="star-c5" name="rating" value="1"
															onclick="return false"> <label class="full"
															for="star-c5"></label>
													</fieldset>
												</c:when>
												<c:when test="${list.rv_star < 2 and list.rv_star >= 1 }">
													<fieldset class="rating book-rate">
														<input type="checkbox" id="star-c1" name="rating"
															value="5" onclick="return false"> <label
															class="full" for="star-c1"></label> <input
															type="checkbox" id="star-c2" name="rating" value="4"
															onclick="return false"> <label class="full"
															for="star-c2"></label> <input type="checkbox"
															id="star-c3" name="rating" value="3"
															onclick="return false"> <label class="full"
															for="star-c3"></label> <input type="checkbox"
															id="star-c4" name="rating" value="2"
															onclick="return false"> <label class="full"
															for="star-c4"></label> <input type="checkbox"
															id="star-c5" name="rating" value="1" checked="checked"
															onclick="return false"> <label class="full"
															for="star-c5"></label>
													</fieldset>
												</c:when>
												<c:otherwise>
													<fieldset class="rating book-rate">
														<input type="checkbox" id="star-c1" name="rating"
															value="5"> <label class="full" for="star-c1"></label>
														<input type="checkbox" id="star-c2" name="rating"
															value="4"> <label class="full" for="star-c2"></label>
														<input type="checkbox" id="star-c3" name="rating"
															value="3"> <label class="full" for="star-c3"></label>
														<input type="checkbox" id="star-c4" name="rating"
															value="2"> <label class="full" for="star-c4"></label>
														<input type="checkbox" id="star-c5" name="rating"
															value="1"> <label class="full" for="star-c5"></label>
													</fieldset>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
							</table>
							</div>
							<div class="review-star" style="color : black;">
							</div>
							<div class="review-user-id">
								<c:out value="${list.rv_user_id }"></c:out>
							</div>
							<div class="review-wrap1-date" style="color:black">
								<span> <c:out value="${list.rv_date }"></c:out>
								</span>
							</div>

						<div class="review-wrap2" style="color : black;">
							<c:out value="${list.rv_content }"></c:out>
						</div>

					</div>
				</c:forEach>
			</div>
			<a href="pagemove?command=contentpage_more&game_no=${dto.game_no}&game_platform=${dto.game_platform}"
				class="button">리뷰 더 보기</a>
		</section>
		<%
			if (session.getAttribute("login") == null || session.getAttribute("login").equals(null)) {
		%>
		<section class="wrapper">
			<div class="reveiew-form">
				<div class="head">
					<div class="title">Review this game</div>
				</div>
			</div>
			<div class="line"></div>
			<div class="form-body">
				<form action="pagemove" method="post" class="review_writeform">
					<input type="hidden" name="command" value="contentpage_review">
					<input type="hidden" name="game_no" value="${dto.game_no }">
					<input type="hidden" name="game_platform"
						value="${dto.game_platform }"> <input type="hidden"
						id="sstar" name="starPoint" value=1> <input type="hidden"
						name="star_avg" value="${dto.game_staravg }"> <input
						type="hidden" name="rv_user_id" value="<%=user_id%>">
					<div class="starRev">
						<span class="starR on" onclick="po1();">별1</span> <span
							class="starR" onclick="po2();">별2</span> <span class="starR"
							onclick="po3();">별3</span> <span class="starR" onclick="po4();">별4</span>
						<span class="starR" onclick="po5();">별5</span>
					</div>
					<textarea rows="5" cols="30" name="rv_content" class="review_area"
						placeholder="리뷰를 작성해 주세요." style="font-size: 30px" onclick="loginChk();"></textarea>
				
				</form>
			</div>
	</div>
	</section>
	<%
			} else {
	%>
	<section class="wrapper">
			<div class="reveiew-form">
				<div class="head">
					<div class="title">Review this game</div>
				</div>
			</div>
			<div class="line"></div>
			<div class="form-body">
				<form action="pagemove" method="post" class="review_writeform">
					<input type="hidden" name="command" value="contentpage_review">
					<input type="hidden" name="game_no" value="${dto.game_no }">
					<input type="hidden" name="game_platform"
						value="${dto.game_platform }"> <input type="hidden"
						id="sstar" name="starPoint" value=1> <input type="hidden"
						name="star_avg" value="${dto.game_staravg }"> <input
						type="hidden" name="rv_user_id" value="<%=user_id%>">
					<div class="starRev">
						<span class="starR on" onclick="po1();">별1</span> <span
							class="starR" onclick="po2();">별2</span> <span class="starR"
							onclick="po3();">별3</span> <span class="starR" onclick="po4();">별4</span>
						<span class="starR" onclick="po5();">별5</span>
					</div>
					<textarea rows="5" cols="30" name="rv_content" class="review_area"
						placeholder="리뷰를 작성해 주세요.(50자 제한)" style="font-size: 30px"></textarea>
					<input type="submit" value="작성">
				</form>
			</div>
	</div>
	</section>
		<%
			}
		%>
	<!-- Section -->
	<section id="main">
		<div class="wrapper">
			<div class="title">Screen Shots</div>
			<div class="line"></div>
			<div class="screenshot-container">
				<div>
					<img src="./img/${dto.game_no }/${dto.image1 }.jpg"
						style="width: 400px; height: 250px; margin-top: -20px; border-radius: 5px;"
						onclick="showImage();">
					<div class="img-resizecontainer_1">
						<div class="click-resize">
							<img src="./img/${dto.game_no }/${dto.image1 }.jpg"
								style="width: 900px; height: 500px; border-radius: 5px; animation-duration: 0.7s;"
								onclick="hideImage();">
						</div>
					</div>
				</div>
				<div>
					<img src="./img/${dto.game_no }/${dto.image2 }.jpg"
						style="width: 400px; height: 250px; margin-top: -20px; border-radius: 5px;"
						onclick="showImage2();">
					<div class="img-resizecontainer_2">
						<div class="click-resize">
							<img src="./img/${dto.game_no }/${dto.image2 }.jpg"
								style="width: 900px; height: 500px; border-radius: 5px; animation-duration: 0.7s;"
								onclick="hideImage2();">
						</div>
					</div>
				</div>
				<div>
					<img src="./img/${dto.game_no }/${dto.image3 }.jpg"
						style="width: 400px; height: 250px; margin-top: -20px; border-radius: 5px;"
						onclick="showImage3();">
					<div class="img-resizecontainer_3">
						<div class="click-resize">
							<img src="./img/${dto.game_no }/${dto.image3 }.jpg"
								style="width: 900px; height: 500px; border-radius: 5px; animation-duration: 0.7s;"
								onclick="hideImage3();">
						</div>
					</div>
				</div>
				<div>
					<img src="./img/${dto.game_no }/${dto.image4 }.jpg"
						style="width: 400px; height: 250px; margin-top: -20px; border-radius: 5px;"
						onclick="showImage4();">
					<div class="img-resizecontainer_4">
						<div class="click-resize">
							<img src="./img/${dto.game_no }/${dto.image4 }.jpg"
								style="width: 900px; height: 500px; border-radius: 5px; animation-duration: 0.7s;"
								onclick="hideImage4();">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="main">
		<div class="wrapper">
			<div class="title">Trailers</div>
			<div class="line"></div>
			<div class="tr_container">
				<div>
					<img src="./img/${dto.game_no }/${dto.video_image1 }.jpg "
						style="width: 300px; height: 170px; margin-top: -20px; border-radius: 5px;"
						onclick="showVid();">
					<p>
						<br><c:out value="${dto.video_title1 }"></c:out>
					</p>
					<div class="video-playwrapper_1">
						<div class="videoplay">
							<iframe width="900px" height="500px" src="${dto.video1 }"
								frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen id="playerID"></iframe>
							<input type="button" value="Close" onclick="hideVid();"
								class="vidClosebBtn">
						</div>
					</div>
				</div>
				<div>
					<img src="./img/${dto.game_no }/${dto.video_image2 }.jpg  "
						style="width: 300px; height: 170px; margin-top: -20px; border-radius: 5px;"
						onclick="showVid2();">
					<p>
						<br><c:out value="${dto.video_title2 }"></c:out>
					</p>
					<div class="video-playwrapper_2">
						<div class="videoplay">
							<iframe width="900px" height="500px" src="${dto.video2 }"
								frameborder="0"
								allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen id="playerID2"></iframe>
							<input type="button" value="Close" onclick="hideVid2();"
								class="vidClosebBtn">
						</div>
					</div>
				</div>
				<div>
				
					<img src="./img/${dto.game_no }/${dto.video_image3 }.jpg "
						style="width: 300px; height: 170px; margin-top: -20px; border-radius: 5px;"
						onclick="showVid3();">
					<p>
						<br><c:out value="${dto.video_title3 }"></c:out>
					</p>
					<div class="video-playwrapper_3">
						<div class="videoplay">
							<iframe width="900px" height="500px" src="${dto.video3 }"
								frameborder="0"
								allow="accelerometer;  encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen id="playerID3"></iframe>
							<input type="button" value="Close" onclick="hideVid3();"
								class="vidClosebBtn">
						</div>
					</div>
				</div>
				<div>
					<img src="./img/${dto.game_no }/${dto.video_image4 }.jpg  "
						style="width: 300px; height: 170px; margin-top: -20px; border-radius: 5px;"
						onclick="showVid4();">
					<p>
						<br><c:out value="${dto.video_title4 }"></c:out>
					</p>
					<div class="video-playwrapper_4">
						<div class="videoplay">
							<iframe width="900px" height="500px" src="${dto.video4 }"
								frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen id="playerID4"></iframe>
							<input type="button" value="Close" onclick="hideVid4();"
								class="vidClosebBtn">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="main">
		<div class="wrapper">
			<div class="title">Recent News & Article</div>
			<div class="line"></div>
			<div class="article-wrapper">
				<div class="card-header">
					<img alt="#" src="./img/${dto.game_no }/${dto.a_image1}.jpg"
						style="width: 300px; height: 200px; margin-top: 0%;"
						onclick="location.href='${dto.article1}'">
					<div class="card-body">
						<h4>
							<c:out value="${dto.article_title1 }"></c:out>
						</h4>
						<p class="article-p">${dto.article_summary1 }"</p>
					</div>
				</div>
				<div class="card-header">
					<img alt="#" src="./img/${dto.game_no }/${dto.a_image2}.jpg"
						style="width: 300px; height: 200px; margin-top: 0%;"
						onclick="location.href='${dto.article2}'">
					<div class="card-body">
						<h4>
							${dto.article_title2 }"
						</h4>
						<p class="article-p">${dto.article_summary2 }"</p>
					</div>
				</div>
				<div class="card-header">
					<img alt="#" src="./img/${dto.game_no }/${dto.a_image3}.jpg"
						style="width: 300px; height: 200px; margin-top: 0%;"
						onclick="location.href='${dto.article3}'" >
					<div class="card-body">
						<h4>${dto.article_title3 }"</h4>
						<p class="article-p">${dto.article_summary3 }"</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	</div>

	<!-- Footer -->
	<footer id="footer">
		<div class="copyright">

			<p>
				Copyright &copy; KH Academy All right reserved <a
					href="https://templated.co"></a>
			</p>
		</div>
	</footer>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>