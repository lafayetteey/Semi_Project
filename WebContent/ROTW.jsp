<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="week">
    <div class="author-title">Reviewer Of The Week</div>
    <c:forEach var="rotw" items="${reviewer }">
    <div class="author">
     <img src="${rotw.user_image }" alt="" class="author-img">
     <div class="author-name" onclick="location.href='pagemove?command=other_user_dashboard&user_no=${rotw.user_no}' "><c:out value="${rotw.user_name }"></c:out>	</div>
    </div>
   </c:forEach>
   </div>

</body>
</html>