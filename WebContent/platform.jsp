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
<title>Semi_Project_Platfrom_Page</title>
<link rel="stylesheet" href="assets/css/platform.css">
<link rel='stylesheet'
   href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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
</head>
<body>
   <div class="platfrom_main">
      <%@ include file="./header.jsp"%>

      
         
      

<%@ include file="./mainSlide.jsp" %>
      <div class="platform_main">
	
         <div class="platfrom_left">
            <div class="books-of">
               <%@ include file="./ROTW.jsp"%>
                  <%@ include file="./GOTY.jsp"%>
               <div class="overlay"></div>
            </div>
         </div>


         <div class="platform_right" style="margin-left: 0%">
            <div class="main-menu">
               <div class="genre">Games Ranking</div>

               <table class="sort_pf" style="float: right">
                  <tr>
                     <td style="padding-left: 60%;"><span>정렬방법</span> <span
                        class="sort"> <select id="sort" name="sort"
                           style="width: 20%">
                              <option value="1">평점순</option>
                              <option value="2">이름순</option>
                              <option value="3">출시일순</option>
                        </select>
                     </span></td>
                  </tr>
               </table>
            </div>
            <br>
            <div class="ranking">
               <table class="ranking_table1">
                  <thead>
                     <tr>
                        <th>순위</th>
                        <th>별점</th>
                        <th>이름</th>
                        <th>출시일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="dto1" items="${list1 }">
                        <tr>
                           <td class="rank">${dto1.row_num}</td>
                           <td class="star_point">
                              <div class="rate">
                                 <c:choose>
                              <c:when test="${dto1.game_staravg >=5 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" checked="checked" onclick="return false" >
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto1.game_staravg < 5 and dto1.game_staravg >= 4 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false" >
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" checked="checked" onclick="return false">
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto1.game_staravg < 4 and dto1.game_staravg >= 3 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4"  onclick="return false">
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" checked="checked" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto1.game_staravg < 3 and dto1.game_staravg >= 2 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5"  onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" checked="checked" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto1.game_staravg < 2 and dto1.game_staravg >= 1 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" checked="checked" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:otherwise>
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" >
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:otherwise>
                                 </c:choose>
                                <fmt:formatNumber value= "${dto1.game_staravg }" pattern= ".0" />
                              </div>
                           </td>
                           <td class="name"><a
                              href="pagemove?command=contentpage&game_no=${dto1.game_no}&game_platform=${dto1.game_platform }">
                                 ${dto1.game_name } </a></td>
                           <td class="date"><fmt:formatDate
                                 value="${dto1.game_release}" pattern="yyyy년 MM월  dd일" /></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <table class="ranking_table2" style="display: none;">
                  <thead>
                     <tr>
                        <th>순위</th>
                        <th>별점</th>
                        <th>이름</th>
                        <th>출시일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="dto2" items="${list2 }">
                        <tr>
                           <td class="rank">${dto2.row_num}</td>
                           <td class="star_point">
                              <div class="rate">
                                 <c:choose>
                              <c:when test="${dto2.game_staravg >=5 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" checked="checked" onclick="return false" >
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto2.game_staravg < 5 and dto2.game_staravg >= 4 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false" >
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" checked="checked" onclick="return false">
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto2.game_staravg < 4 and dto2.game_staravg >= 3 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4"  onclick="return false">
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" checked="checked" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto2.game_staravg < 3 and dto2.game_staravg >= 2 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5"  onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" checked="checked" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto2.game_staravg < 2 and dto2.game_staravg >= 1 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" checked="checked" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:otherwise>
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" >
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:otherwise>
                                 </c:choose>
                                <fmt:formatNumber value= "${dto2.game_staravg }" pattern= ".0" />
                              </div>
                           </td>
                           <td class="name"><a
                              href="pagemove?command=contentpage&game_no=${dto2.game_no}&game_platform=${dto2.game_platform }">
                                 ${dto2.game_name } </a></td>
                           <td class="date"><fmt:formatDate
                                 value="${dto2.game_release}" pattern="yyyy년 MM월  dd일" /></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <table class="ranking_table3" style="display: none;">
                  <thead>
                     <tr>
                        <th>순위</th>
                        <th>별점</th>
                        <th>이름</th>
                        <th>출시일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="dto3" items="${list3 }">
                        <tr>
                           <td class="rank">${dto3.row_num}</td>
                           <td class="star_point">
                              <div class="rate">
                                 <c:choose>
                              <c:when test="${dto3.game_staravg >=5 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" checked="checked" onclick="return false" >
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto3.game_staravg < 5 and dto3.game_staravg >= 4 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false" >
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" checked="checked" onclick="return false">
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto3.game_staravg < 4 and dto3.game_staravg >= 3 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4"  onclick="return false">
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" checked="checked" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto3.game_staravg < 3 and dto3.game_staravg >= 2 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5"  onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" checked="checked" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:when test="${dto3.game_staravg < 2 and dto3.game_staravg >= 1 }">
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" checked="checked" onclick="return false">
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:when>
                                 <c:otherwise>
                                 <fieldset class="rating book-rate">
                                    <input type="checkbox" id="star-c1" name="rating" value="5" onclick="return false">
                                    <label class="full" for="star-c1"></label> <input
                                       type="checkbox" id="star-c2" name="rating" value="4" onclick="return false" >
                                    <label class="full" for="star-c2"></label> <input
                                       type="checkbox" id="star-c3" name="rating" value="3" onclick="return false">
                                    <label class="full" for="star-c3"></label> <input
                                       type="checkbox" id="star-c4" name="rating" value="2" onclick="return false">
                                    <label class="full" for="star-c4"></label> <input
                                       type="checkbox" id="star-c5" name="rating" value="1" onclick="return false" >
                                    <label class="full" for="star-c5"></label>
                                 </fieldset>
                                 </c:otherwise>
                                 </c:choose>
                                 <fmt:formatNumber value= "${dto3.game_staravg }" pattern= ".0" />
                              </div>
                           </td>
                           <td class="name"><a
                              href="pagemove?command=contentpage&game_no=${dto3.game_no}&game_platform=${dto3.game_platform }">
                                 ${dto3.game_name } </a></td>
                           <td class="date"><fmt:formatDate
                                 value="${dto3.game_release}" pattern="yyyy년 MM월  dd일" /></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <!-- partial -->
   <script
      src='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js'></script>
   <script
      src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <%@include file="./footer.jsp" %>
</body>
</html>