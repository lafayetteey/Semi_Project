<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semi_Project_ContentPage</title>
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
	function loginChk() {
		alert("리뷰를 작성하시려면 먼저 로그인을 해주세요");
		location.href = "pagemove?command=contentpage_more&game_no=${dto.game_no}";
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
</script>

<!-- 부트스트랩  / css-->
<link rel="stylesheet" href="./resource/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/contentpage_more.css">

<!-- BootStrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="./header.jsp"%>
<%   
   user_id = (String) session.getAttribute("login");
%>
	<%@include file="./contentpage_header.jsp"%>
	<section class="main">

		<%
			if (session.getAttribute("login") == null || session.getAttribute("login").equals(null)) {
		%>
		<div class="wrapper style2_1">
			<div class="reveiew-form">
				<h3 class="h1">Review this game</h3>
			</div>
			<div class="form-body">
				<form action="pagemove" method="post" class="review_writeform">
					<input type="hidden" name="command" value="contentpage_review2">
					<input type="hidden" name="game_no" value="${dto.game_no }">
					<input type="hidden" name="game_platform"
						value="${dto.game_platform }">
					<div class="starRev">
						<span class="starR on" name="rv_star1" value="1">별1</span> <span
							class="starR" name="rv_star2">별2</span> <span class="starR"
							name="rv_star3">별3</span> <span class="starR" name="rv_star4">별4</span>
						<span class="starR" name="rv_star5">별5</span>
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="10"
							placeholder="리뷰를 작성 해 주세요." name="rv_content" id="review"
							onclick="loginChk();"></textarea>
					</div>
				</form>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="wrapper style2_1">
			<div class="reveiew-form">
				<h3 class="h1">Review this game</h3>
			</div>
			<div class="form-body">
				<form action="pagemove" method="post" class="review_writeform">
					<input type="hidden" name="command" value="contentpage_review2">
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
						placeholder="리뷰를 작성해 주세요." style="font-size: 30px; margin-top : 3%;"></textarea>
					<input type="submit" class="btn btn-default" value="작성" style="float:right;">
				</form>
			</div>
		</div>
		<%
			}
		%>

		<div class="review_list">
			<h1 class="h1">Reviews</h1>
			<c:forEach var="list" items="${list }">
				<div class="review_box">
					<div class="date_write">${list.rv_date }</div>
						<div class="product_score">
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
					<div class="writer" onclick="location.href='pagemove?command=other_user_dashboard2&user_id=${list.rv_user_id }' ">${list.rv_user_id }</div>
					<div class="content_box">
						<div readonly="readonly" class="content">
							<c:out value="${list.rv_content }"></c:out>
						</div>
					</div>

					</div>
			</c:forEach>

			<div class="star"></div>
		</div>

		<div style="text-align: center;">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

		</div>
	</section>
	<!—부트 스트랩 js  사용—>
	<script type="text/javascript" src="./resource/js/bootstrap.js"></script>
	<%@include file="./footer.jsp"%>
</body>
</html>