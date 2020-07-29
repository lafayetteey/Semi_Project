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
<%@page import ="com.game.dao.GameDao"  %>
<%@page import ="com.game.dto.GameDto"  %>
<%@page import = "java.util.List" %>

<%

	int pageSize = 10; // 한 페이지에 출력할 코드 수

	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	int count = 0;
	GameDao  dao= new GameDao();
	count = dao.getCount3(); // 데이터베이스에 저장된 총 갯수

	List<GameDto> list = null;
	String user_id = (String)session.getAttribute("login");
	
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		

		
		list = dao.selectReviewXbox(startRow, endRow, user_id);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>User dashboard popup</title>
<!--스타일 css-->

<link rel="stylesheet" href="assets/css/popup.css">
<link rel="stylesheet" href="assets/css/platform.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
window.opener.location.reload();
</script>
</head>
<body>
	<div class="popup_wrap" style="padding:10px 20px;">
		<h1 class="h1"
			style="font-size: 30px; text-align: center; font-weight: 500;">
			PS4</h1>
		<div>
						<table class="popup">
						<col width="110px">
						<col width="150px">
						<col width="100px">
						<col width="500px">
						<col width="140px">
						<col width="140px">
			<thead>
					<tr>
						<th>게임번호</th>
						<th>게임이름</th>
						<th>별점</th>
						<th>게임리뷰</th>
						<th>작성일</th>
						<th>수정 or 삭제</th>
					</tr>
				</thead>
				<tbody>
			<%
				if (count > 0) { // 데이터베이스에 데이터가 있으면
					int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
					for (int i = 0; i < list.size(); i++) {
						GameDto board = list.get(i); // 반환된 list에 담긴 참조값 할당
			%>
			<tr>
				<td><%=board.getRv_no()%></td>
				<td><%=board.getGame_name() %></td>
				<td><%=board.getRv_star() %></td>
				<td><%=board.getRv_content()%></td>
				<td><%=board.getRv_date()%></td>
				<td>
									<input type="button" value="수정" onclick="location.href='pagemove?command=updateform&rv_no=<%=board.getRv_no() %>&user_id=<%=user_id %>&pageNum=<%=pageNum %>'" >
									<input type="button" value="삭제" onclick="location.href='pagemove?command=deleteform&rv_no=<%=board.getRv_no()%>&rv_platform=<%=board.getRv_platform()%>&user_id=<%=user_id%>&pageNum=<%=pageNum%>'">
									</td>
			</tr>
			<%
					}
				} else { // 데이터가 없으면
			%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
				<%
					}
				%>
			<tr>
				<td colspan="6" align="center" style="text-align: center">
					<%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="pagemove?command=user_dashboard_pop_xbox&pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="pagemove?command=user_dashboard_pop_xbox&pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="pagemove?command=user_dashboard_pop_xbox&pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
			</tbody>
		</table>


		</div>
	</div>
<%@include file="./footer.jsp" %>
</body>
</html>