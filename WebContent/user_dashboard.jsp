<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@page import="com.game.dto.GameDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel='stylesheet'
   href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>

<link rel="stylesheet" href="assets/css/user_dashboardstyle.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
      $('.btn btn-primary btn-block btn-large').click(function(e) {
         e.preventDefault();
         wrapWindowByMask();
      });
      $('.content-wrapper').click(function() {
         $('.popup').show().fad

      })
   });
   function changePopup() {
      $(".change-popup").fadeIn(500);
      wrapWindowByMask();

      
   }
   

   function closeChangeForm() {
      $(".change-popup").fadeOut(500);
      $('#mask').hide();
   }
   function popup_pc() {
      
      
      var popupWidth=1060;
      var popupHeight=600;
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      var popupY= (window.screen.height / 2) - (popupHeight / 2);
      
      
      window.open('pagemove?command=user_dashboard_pop_pc&pageNum=1', '팝업창',
            "width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
   }
   function popup_ps4() {

      var popupWidth=1060;
      var popupHeight=600;
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      var popupY= (window.screen.height / 2) - (popupHeight / 2);
      
      
      window.open('pagemove?command=user_dashboard_pop_ps4&pageNum=1', '팝업창',
            "width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
   }
   function popup_xbox() {

      var popupWidth=1060;
      var popupHeight=600;
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      var popupY= (window.screen.height / 2) - (popupHeight / 2);
      
      
      window.open('pagemove?command=user_dashboard_pop_xbox&pageNum=1', '팝업창',
            "width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);

   }
   function popup_switch() {

      var popupWidth=1060;
      var popupHeight=720;
      var popupX = (window.screen.width / 2) - (popupWidth / 2);
      var popupY= (window.screen.height / 2) - (popupHeight / 2);
      
      
      window.open('pagemove?command=user_dashboard_pop_switch&pageNum=1', '팝업창',
            "width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
   }
   
   function pwChk(bool){
       //var doc = document.getElementsByName("user_id").value;
       
       var doc = "<%=session.getAttribute("login") %>"
       var doc2 = document.getElementsByName("user_pw")[2].value;
       console.log(doc2);
       console.log(doc);
      
          $.ajax({ 
             url :'LogController?command=pwchk&user_id='+doc+'&user_pw='+doc2,
             type : 'post',
             dataType : 'text',
             
             
             
             success: function(data){
                console.log(data);
                if(data == 1){
                   $(".warning").text('비밀번호가 같습니다.');
                   $(".warning").css("color","blue");
                   $(".check").css("bakcground-color","#4CAF50");
                   $(".check1").attr('style','background-color:rgba( 204, 255, 204, 0.5 ) !important');
                }else {
                   $(".warning").text('비밀번호가 다릅니다.');
                   $(".warning").css("color","red");
                   $(".check").css("backoground-color","#B0F6AC");
                   $(".check1").attr('style','background-color:rgba( 255, 102, 102, 0.5 ) !important');
                   
                }
             },
             errer: function(data){
                console.log("실패");   
             }
          });
    }
 function pwChk2(){
    
       var doc3 = document.getElementsByName("user_pw_ud")[0].value;
       var doc4 = document.getElementsByName("user_pw_udck")[0].value;
       console.log(doc4);
       console.log(doc3);
       
       $.ajax({ 
             url :'LogController?command=pwchk2&user_pw_ud='+doc3+'&user_pw_udck='+doc4,
             type : 'post',
             dataType : 'text',
             
             success: function(data){
                console.log(data);
                if(data == 1){
                   $(".warningchk").text('비밀번호가 같습니다.');
                   $(".warningchk").css("color","blue");
                   $(".check").css("bakcground-color","#4CAF50");
                   $(".pk2").attr('style','background-color:rgba( 204, 255, 204, 0.5 ) !important');
                   $(".pk3").attr('style','background-color:rgba( 204, 255, 204, 0.5 ) !important');
                }else {
                   $(".warningchk").text('비밀번호가 다릅니다.');
                   $(".warningchk").css("color","red");
                   $(".check").css("backoground-color","#B0F6AC");
                   $(".pk2").attr('style','background-color:rgba( 255, 102, 102, 0.5 ) !important');
                   $(".pk3").attr('style','background-color:rgba( 255, 102, 102, 0.5 ) !important');
                   
                }
             },
             errer: function(data){
                console.log("실패");   
             }
          });
 }
 


</script>

</head>

<body>

   <!-- partial:index.partial.html -->
   <%@ include file="./header.jsp"%>
   <div class="main_visual">

      <div class="container">
         <div class="grid_4">
            <section class="box widget locations">
               <div class="avatar">
                  <img
                     src="${user_img.user_image }" style="width:227px; height:222px;"/>
               </div>
               <div class="details">
                  <h2><%=user_id %></h2>
                  <a href="#" class="btn btn-primary btn-block btn-large"
                     onclick="changePopup();">비밀번호 변경</a>
               </div>
            </section>
         </div>
         <br> <br>
         <div class="popular-books">
            <div class="main-menu">
               <div class="genre">My Page</div>
            </div>

            <div class="book_card_main">
               <div class="book-cards">


                  <div class="book-card">
                     <div class="content-top">
                        <div class="content-wrapper" onclick="popup_pc()">
                           <br>
                        </div>
                     </div>
                     <div>
                        <table>
                           <col width=180px>
                           <col width=100px>
                           <col width=243px>
                           <h3>PC 리뷰</h3>
                           <tr>
                              <th>게임이름</th>
                              <th class="star">
                                 평점
                              </th>
                              <th>게임리뷰</th>
                           </tr>
                           <c:choose>
                              <c:when test="${empty list_pc }">
                                 <tr>
                                    <td colspan="3" style="text-align: center; height:150px;">작성된 글이 없습니다.</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach var="dto_pc" items="${list_pc }" begin="0" end="4">
                                    <tr>
                                       <td>${dto_pc.game_name }</td>
                                       <td class="star">
                                          <div class="rate">
                                             <c:choose>
                                                <c:when test="${dto_pc.rv_star >=5 }">
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
                                                <c:when
                                                   test="${dto_pc.rv_star < 5 and dto_pc.rv_star >= 4 }">
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
                                                <c:when
                                                   test="${dto_pc.rv_star < 4 and dto_pc.rv_star >= 3 }">
                                                   <fieldset class="rating book-rate">
                                                      <input type="checkbox" id="star-c1" name="rating"
                                                         value="5" onclick="return false"> <label
                                                         class="full" for="star-c1"></label> <input
                                                         type="checkbox" id="star-c2" name="rating" value="4"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c2"></label> <input type="checkbox"
                                                         id="star-c3" name="rating" value="3"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c3"></label> <input
                                                         type="checkbox" id="star-c4" name="rating" value="2"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c4"></label> <input type="checkbox"
                                                         id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_pc.rv_star < 3 and dto_pc.rv_star >= 2 }">
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
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c4"></label> <input
                                                         type="checkbox" id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_pc.rv_star < 2 and dto_pc.rv_star >= 1 }">
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
                                                         id="star-c5" name="rating" value="1"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c5"></label>
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
                                       <td>${dto_pc.rv_content }</td>
                                    </tr>
                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>

                        </table>
                     </div>
                  </div>

                  <div class="book-card">
                     <div class="content-top">
                        <div class="content-wrapper" onclick="popup_ps4();">
                           <br>
                        </div>
                     </div>
                     <div>
                        <table>
                           <col width=180px>
                           <col width=100px>
                           <col width=243px>
                           <h3>PS4 리뷰</h3>
                           <tr>
                              <th>게임이름</th>
                              <th class="star">
                              평점
                              </th>
                              <th>게임리뷰</th>
                           </tr>
                           <c:choose>
                              <c:when test="${empty list_ps4 }">
                                 <tr>
                                    <td colspan="3" style="text-align: center;  height:150px;">작성된 글이 없습니다.</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach var="dto_ps4" items="${list_ps4 }" begin="0"
                                    end="4">
                                    <tr>
                                       <td>${dto_ps4.game_name }</td>
                                       <td class="star">
                                          <div class="rate">
                                             <c:choose>
                                                <c:when test="${dto_ps4.rv_star >=5 }">
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
                                                <c:when
                                                   test="${dto_ps4.rv_star < 5 and dto_ps4.rv_star >= 4 }">
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
                                                <c:when
                                                   test="${dto_ps4.rv_star < 4 and dto_ps4.rv_star >= 3 }">
                                                   <fieldset class="rating book-rate">
                                                      <input type="checkbox" id="star-c1" name="rating"
                                                         value="5" onclick="return false"> <label
                                                         class="full" for="star-c1"></label> <input
                                                         type="checkbox" id="star-c2" name="rating" value="4"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c2"></label> <input type="checkbox"
                                                         id="star-c3" name="rating" value="3"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c3"></label> <input
                                                         type="checkbox" id="star-c4" name="rating" value="2"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c4"></label> <input type="checkbox"
                                                         id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_ps4.rv_star < 3 and dto_ps4.rv_star >= 2 }">
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
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c4"></label> <input
                                                         type="checkbox" id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_ps4.rv_star < 2 and dto_ps4.rv_star >= 1 }">
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
                                                         id="star-c5" name="rating" value="1"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c5"></label>
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
                                       <td>${dto_ps4.rv_content }</td>
                                    </tr>
                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </table>
                     </div>
                  </div>

                  <div class="book-card">
                     <div class="content-top">
                        <div class="content-wrapper" onclick="popup_xbox();">
                           <br>
                        </div>
                     </div>
                     <div>
                        <table>
                           <col width=180px>
                           <col width=100px>
                           <col width=243px>
                           <h3>Xbox 리뷰</h3>
                           <tr>
                              <th>게임이름</th>
                              <th class="star">
                                 평점
                              </th>
                              <th>게임리뷰</th>
                           </tr>
                           <c:choose>
                              <c:when test="${empty list_xbox }">
                                 <tr>
                                    <td colspan="3" style="text-align: center;  height:150px;">작성된 글이 없습니다.</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach var="dto_xbox" items="${list_xbox }" begin="0"
                                    end="4">
                                    <tr>
                                       <td>${dto_xbox.game_name }</td>
                                       <td class="star">
                                          <div class="rate">
                                             <c:choose>
                                                <c:when test="${dto_xbox.rv_star >=5 }">
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
                                                <c:when
                                                   test="${dto_xbox.rv_star < 5 and dto_pc.rv_star >= 4 }">
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
                                                <c:when
                                                   test="${dto_xbox.rv_star < 4 and dto_xbox.rv_star >= 3 }">
                                                   <fieldset class="rating book-rate">
                                                      <input type="checkbox" id="star-c1" name="rating"
                                                         value="5" onclick="return false"> <label
                                                         class="full" for="star-c1"></label> <input
                                                         type="checkbox" id="star-c2" name="rating" value="4"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c2"></label> <input type="checkbox"
                                                         id="star-c3" name="rating" value="3"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c3"></label> <input
                                                         type="checkbox" id="star-c4" name="rating" value="2"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c4"></label> <input type="checkbox"
                                                         id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_xbox.rv_star < 3 and dto_xbox.rv_star >= 2 }">
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
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c4"></label> <input
                                                         type="checkbox" id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_xbox.rv_star < 2 and dto_xbox.rv_star >= 1 }">
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
                                                         id="star-c5" name="rating" value="1"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c5"></label>
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
                                       <td>${dto_xbox.rv_content }</td>
                                    </tr>
                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </table>
                     </div>
                  </div>
                  <div class="book-card">
                     <div class="content-top">
                        <div class="content-wrapper" onclick="popup_switch();">
                           <br>
                        </div>
                     </div>
                     <div>
                        <table>
                           <col width=180px>
                           <col width=100px>
                           <col width=243px>
                           <h3>Switch 리뷰</h3>
                           <tr>
                              <th>게임이름</th>
                              <th class="star">
                                 평점
                              </th>
                              <th>게임리뷰</th>
                           </tr>
                           <c:choose>
                              <c:when test="${empty list_switch }">
                                 <tr>
                                    <td colspan="3" style="text-align: center;  height:150px;">작성된 글이 없습니다.</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach var="dto_switch" items="${list_switch }" begin="0"
                                    end="4">
                                    <tr>
                                       <td>${dto_switch.game_name }</td>
                                       <td class="star">
                                          <div class="rate">
                                             <c:choose>
                                                <c:when test="${dto_switch.rv_star >=5 }">
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
                                                <c:when
                                                   test="${dto_switch.rv_star < 5 and dto_switch.rv_star >= 4 }">
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
                                                <c:when
                                                   test="${dto_switch.rv_star < 4 and dto_switch.rv_star >= 3 }">
                                                   <fieldset class="rating book-rate">
                                                      <input type="checkbox" id="star-c1" name="rating"
                                                         value="5" onclick="return false"> <label
                                                         class="full" for="star-c1"></label> <input
                                                         type="checkbox" id="star-c2" name="rating" value="4"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c2"></label> <input type="checkbox"
                                                         id="star-c3" name="rating" value="3"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c3"></label> <input
                                                         type="checkbox" id="star-c4" name="rating" value="2"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c4"></label> <input type="checkbox"
                                                         id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_switch.rv_star < 3 and dto_switch.rv_star >= 2 }">
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
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c4"></label> <input
                                                         type="checkbox" id="star-c5" name="rating" value="1"
                                                         onclick="return false"> <label class="full"
                                                         for="star-c5"></label>
                                                   </fieldset>
                                                </c:when>
                                                <c:when
                                                   test="${dto_switch.rv_star < 2 and dto_switch.rv_star >= 1 }">
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
                                                         id="star-c5" name="rating" value="1"
                                                         checked="checked" onclick="return false"> <label
                                                         class="full" for="star-c5"></label>
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
                                       <td>${dto_switch.rv_content }</td>
                                    </tr>
                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </table>
                     </div>
                  </div>

               </div>
            </div>


            <!--   -->
         </div>
      </div>

   <input type="hidden" name="user_id" value="<%=user_id %>">
      <!-- 개인정보 수정 -->
      <div class="change-popup">
         <form action="LogController" method="post" class="form-container">
         <input type="hidden" name="command" value="pwchk_up">
         <input type="hidden" name="user_id" value="<%= user_id %>">
            <label for="pswnow"><b>현재비밀번호</b></label> <input type="password" class="check1"
               placeholder="Enter Password" name="user_pw" oninput="pwChk();" style="margin-bottom: 0"
               required>
            <div class="warning"></div>
            <label for="psw"><b>비밀번호</b></label> <input type="password"
               placeholder="Enter Password" name="user_pw_ud" class="pk2" required> <label
               for="pswchk"><b>비밀번호 확인</b></label> <input type="password"
               placeholder="Checked Password" name="user_pw_udck"  class="pk3" oninput="pwChk2();"
               style="margin-bottom: 0" required>
            <div class="warningchk"></div>
            <button type="submit" class="btn">수정</button>
            <button type="button" class="btn cancel" onclick="closeChangeForm()">취소</button>
         </form>
      </div>
   </div>

   <!-- partial -->
   <script
      src='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js'></script>
   <script
      src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <%@include file="./footer.jsp"%>
</body>
</html>