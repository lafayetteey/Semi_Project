<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/mainpagestyle.css">
</head>
<body>

<!-- 메인 슬라이드 -->
<div class="book-slide">
  <div class="book js-flickity" data-flickity-options='{ "wrapAround": true , "autoPlay": 1500 }'>
  <c:forEach var="list" items="${list }" begin="0" end="4">
   <div class="book-cell" style="background-image : url('./m_img/${list.m_game_no}/${list.m_game_slideimage }.jpg'); background-size : cover;">
    <div class="book-img">
     <img src="./m_img/${list.m_game_no }/${list.m_game_image}.jpg" alt="#" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title" style="font-size : 25px;"  onclick="location.href='pagemove?command=contentpage&game_no=${list.m_game_no}&game_platform=${list.m_game_platform }'"><c:out value="${list.m_game_name }"></c:out></div>
     <div class="book-author"><c:out value="${list.m_game_company }"></c:out></div>
      <div class="circle-wrap">
     <div class="circle-wrap2">
     <div class="rate">
      <c:choose>
        <c:when test="${list.game_staravg >= 5 }">
            <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" checked="checked" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" onclick="return false" />
             <label class="full" for="star1"></label>
      </fieldset>
       <div class="rate_image" style="margin-top : 15%;">
     		<img alt="" src="https://opencritic.com/assets/tiers/mighty-man.png" style="height : 50px;">
     	</div>
      </c:when>
      <c:when test="${list.game_staravg >= 5 }">
            <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" checked="checked" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" onclick="return false" />
             <label class="full" for="star1"></label>
      </fieldset>
      <div class="rate_image" style="margin-top : 15%;">
     		<img alt="" src="https://opencritic.com/assets/tiers/mighty-man.png" style="height : 50px;">
     		</div>
      </c:when>
      <c:when test="${list.game_staravg < 5 and list.game_staravg >= 4 }">
            <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" checked="checked" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" onclick="return false" />
             <label class="full" for="star1"></label>
             
      </fieldset>
      <div class="rate_image" style="margin-top : 15%;">
     		<img alt="" src="https://opencritic.com/assets/tiers/strong-man.png" style="height : 50px;">
     		</div>
      </c:when>
      <c:when test="${list.game_staravg < 4 and list.game_staravg >= 3 }">
            <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" checked="checked" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" onclick="return false" />
             <label class="full" for="star1"></label>            
      </fieldset>
      <div class="rate_image" style="margin-top : 15%;">
     		<img alt="" src="https://opencritic.com/assets/tiers/fair-man.png" style="height : 50px;">
     		</div>
      </c:when>
      <c:when test="${list.game_staravg < 3 and list.game_staravg >= 2 }">
            <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" checked="checked" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" onclick="return false" />
             <label class="full" for="star1"></label>
             
      </fieldset>
      <div class="rate_image" style="margin-top : 15%;">
     		<img alt="" src="https://opencritic.com/assets/tiers/weak-man.png" style="height : 50px;">
     		</div>
      </c:when>
      <c:when test="${list.game_staravg < 2 and list.game_staravg >= 1 }">
            <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" checked="checked" onclick="return false" />
             <label class="full" for="star1"></label>
      </fieldset>
      		 <div class="rate_image" style="margin-top : 15%;">
     		<img alt="" src="https://opencritic.com/assets/tiers/weak-man.png" style="height : 50px;">
     		</div>
      </c:when>
      <c:otherwise>
         <fieldset class="rating2">
            <input type="checkbox" id="star5" name="rating" value="5" onclick="return false" />
             <label class="full" for="star5"></label>
             <input type="checkbox" id="star4" name="rating" value="4" onclick="return false" />
             <label class="full" for="star4"></label>
             <input type="checkbox" id="star3" name="rating" value="3" onclick="return false" />
             <label class="full" for="star3"></label>
             <input type="checkbox" id="star2" name="rating" value="2" onclick="return false" />
             <label class="full" for="star2"></label>
             <input type="checkbox" id="star1" name="rating" value="1" onclick="return false" />
             <label class="full" for="star1"></label>
             </fieldset>
      </c:otherwise>
      </c:choose>
     </div>
     <div class="circle_box2	">
					<div class="circle2">
						<div class="circle_star2">
							<fmt:formatNumber value="${list.game_staravg }" pattern=".0" />
						</div>
					</div>
		</div>
  	</div>
  	</div>
    </div>
   </div>
   </c:forEach>
  </div>
 </div>
<!--   -->


</body>
</html>