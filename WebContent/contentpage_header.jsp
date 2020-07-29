<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/contentpage_headerstyle.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
<script type="text/javascript">
(function(){
	
	$(".strong-man").attr('style','margin : 0 auto !important');
}());

</script>
</head>
<body>
	<section id="banner"
		style="background-image : url('./img/${dto.game_no}/${dto.main_image }.jpg')">
		<div class="inner">
			<header>
				<h1>
					<c:out value="${dto.game_name }" />
				</h1>
				<p>
					${dto.game_company }<br />
				</p>
				
				<div class="maingame-vertical"></div>
				
				<div class="circle-wrap">
				<div class="circle-wrap2">
				<div class="rate">
					<c:choose>
						<c:when test="${dto.game_staravg >= 5 }">
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									checked="checked" onclick="return false" /> <label
									class="full" for="star5" style="color: orange;"></label> <input
									type="checkbox" id="star4" name="rating" value="4"
									onclick="return false" /> <label class="full" for="star4"></label>
								<input type="checkbox" id="star3" name="rating" value="3"
									onclick="return false" /> <label class="full" for="star3"></label>
								<input type="checkbox" id="star2" name="rating" value="2"
									onclick="return false" /> <label class="full" for="star2"></label>
								<input type="checkbox" id="star1" name="rating" value="1"
									onclick="return false" /> <label class="full" for="star1"></label>
							</fieldset>
							<div class="strong-man">
								<img alt="" src="https://opencritic.com/assets/tiers/mighty-man.png" style="height:75px;">
							</div>
							
							
						</c:when>
						<c:when test="${dto.game_staravg >= 5 }">
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									checked="checked" onclick="return false" /> <label
									class="full" for="star5" style="color: orange;"></label> <input
									type="checkbox" id="star4" name="rating" value="4"
									onclick="return false" /> <label class="full" for="star4"
									style="color: orange;"></label> <input type="checkbox"
									id="star3" name="rating" value="3" onclick="return false" /> <label
									class="full" for="star3" style="color: orange;"></label> <input
									type="checkbox" id="star2" name="rating" value="2"
									onclick="return false" /> <label class="full" for="star2"
									style="color: orange;"></label> <input type="checkbox"
									id="star1" name="rating" value="1" onclick="return false" /> <label
									class="full" for="star1" style="color: orange;"></label>
							</fieldset>
							<div class="strong-man">
								<img alt="" src="https://opencritic.com/assets/tiers/mighty-man.png" style="height:75px;">
							</div>
							
							
							
						</c:when>
						<c:when test="${dto.game_staravg < 5 and dto.game_staravg >= 4 }">
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									onclick="return false" /> <label class="full" for="star5"></label>
								<input type="checkbox" id="star4" name="rating" value="4"
									checked="checked" onclick="return false" /> <label
									class="full" for="star4" style="color: orange;"></label> <input
									type="checkbox" id="star3" name="rating" value="3"
									onclick="return false" /> <label class="full" for="star3"
									style="color: orange;"></label> <input type="checkbox"
									id="star2" name="rating" value="2" onclick="return false" /> <label
									class="full" for="star2" style="color: orange;"></label> <input
									type="checkbox" id="star1" name="rating" value="1"
									onclick="return false" /> <label class="full" for="star1"
									style="color: orange;"></label>
							</fieldset>
							<div class="strong-man">
								<img alt="" src="https://opencritic.com/assets/tiers/strong-man.png" style="height:75px;">
							</div>



						</c:when>
						<c:when test="${dto.game_staravg < 4 and dto.game_staravg >= 3 }">
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									onclick="return false" /> <label class="full" for="star5"></label>
								<input type="checkbox" id="star4" name="rating" value="4"
									onclick="return false" /> <label class="full" for="star4"></label>
								<input type="checkbox" id="star3" name="rating" value="3"
									checked="checked" onclick="return false" /> <label
									class="full" for="star3" style="color: orange;"></label> <input
									type="checkbox" id="star2" name="rating" value="2"
									onclick="return false" /> <label class="full" for="star2"
									style="color: orange;"></label> <input type="checkbox"
									id="star1" name="rating" value="1" onclick="return false" /> <label
									class="full" for="star1" style="color: orange;"></label>
							</fieldset>
							<div class="strong-man">
								<img alt="" src="https://opencritic.com/assets/tiers/fair-man.png" style="height:75px;">
							</div>
							
							
							
						</c:when>
						<c:when test="${dto.game_staravg < 3 and dto.game_staravg >= 2 }">
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									onclick="return false" /> <label class="full" for="star5"></label>
								<input type="checkbox" id="star4" name="rating" value="4"
									onclick="return false" /> <label class="full" for="star4"></label>
								<input type="checkbox" id="star3" name="rating" value="3"
									onclick="return false" /> <label class="full" for="star3"></label>
								<input type="checkbox" id="star2" name="rating" value="2"
									checked="checked" onclick="return false" /> <label
									class="full" for="star2" style="color: orange;"></label> <input
									type="checkbox" id="star1" name="rating" value="1"
									onclick="return false" /> <label class="full" for="star1"
									style="color: orange;"></label>
							</fieldset>
							<div class="strong-man">
								<img alt="" src="https://opencritic.com/assets/tiers/weak-man.png" style="height:75px;">
							</div>
							
							
							
						</c:when>
						<c:when test="${dto.game_staravg < 2 and dto.game_staravg >= 1 }">
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									onclick="return false" /> <label class="full" for="star5"></label>
								<input type="checkbox" id="star4" name="rating" value="4"
									onclick="return false" /> <label class="full" for="star4"></label>
								<input type="checkbox" id="star3" name="rating" value="3"
									onclick="return false" /> <label class="full" for="star3"></label>
								<input type="checkbox" id="star2" name="rating" value="2"
									onclick="return false" /> <label class="full" for="star2"></label>
								<input type="checkbox" id="star1" name="rating" value="1"
									checked="checked" onclick="return false" /> <label
									class="full" for="star1" style="color: orange;"></label>
							</fieldset>
							<div class="strong-man">
								<img alt="" src="https://opencritic.com/assets/tiers/weak-man.png" style="height:75px;">
							</div>
							
							
						</c:when>
						<c:otherwise>
							<fieldset class="rating2">
								<input type="checkbox" id="star5" name="rating" value="5"
									onclick="return false" /> <label class="full" for="star5"></label>
								<input type="checkbox" id="star4" name="rating" value="4"
									onclick="return false" /> <label class="full" for="star4"></label>
								<input type="checkbox" id="star3" name="rating" value="3"
									onclick="return false" /> <label class="full" for="star3"></label>
								<input type="checkbox" id="star2" name="rating" value="2"
									onclick="return false" /> <label class="full" for="star2"></label>
								<input type="checkbox" id="star1" name="rating" value="1"
									onclick="return false" /> <label class="full" for="star1"></label>
							</fieldset>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="circle_box">
					<div class="circle">
						<div class="circle_star">
							<fmt:formatNumber value="${dto.game_staravg }" pattern=".0" />
						</div>
					</div>
				</div>
				
				
				
				</div>
				
				</div>
				
				
			</header>
		</div>
	</section>
</body>
</html>