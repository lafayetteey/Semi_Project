<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>
<link rel="stylesheet" href="assets/css/other_user_dashboardstyle.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<div class="main_visual">

		<div class="container">
			<div class="grid_4">
				<section class="box widget locations">
					<div class="avatar" >
						<img
							src="${dto.user_image }"  style="height : 210px; width : 200px; box-shadow: -2px 6px 19px 0px #7f818e;" />
					</div>
					<div class="details">
						<h2>
							<c:out value="${dto.user_name }"></c:out>
						</h2>
					</div>
				</section>
			</div>
			<br> <br>
			<div class="popular-books">
				<div class="main-menu">
					<div class="genre">
						<c:out value="${dto.user_name }"></c:out>
						님의 Page
					</div>
				</div>


				<c:forEach var="list" items="${list }">
					<div class="user_profile_reviews">
						<ul class="reviews user_reviews">
							<li class="user_reviewlist">
								<div class="review_product_image">
									<img
										src="./img/${list.game_no }/${list.package_img}.jpg"
										alt="#">
								</div>
								<div class="review_container">
									<div class="product_title">
										<span style="font-weight : bold; font-size : 15px; cursor : pointer;" onclick="location.href='pagemove?command=contentpage&game_no=${list.game_no}&game_platform=${list.game_platform }'"><c:out value="${list.game_name }"></c:out></span>
									</div>
									<div class="releaseDate">
									<fmt:formatDate
                                 value="${list.rv_date}" pattern="yyyy년 MM월  dd일" />
									</div>
									<div class="product_score">
										<span class="label">리뷰 점수 : 
										</span>
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

									
									<div class="review_score"></div>


									<div class="review_body">
										<span class="inline_expand_collapse inline_collapsed"
											id="review_blurb_12050815" style="font-size : 15px; font-weight : bold"><span><c:out
													value="${list.rv_content }"></c:out></span> </span>
									</div>
								</div>
								<div class="vertical_bottom"></div>
							</li>
						</ul>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>



	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<%@include file="./footer.jsp"%>
</body>
</html>