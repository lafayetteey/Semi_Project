package com.game.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.game.dao.GameDao;
import com.game.dao.LoginDao;
import com.game.dto.GameDto;
import com.game.dto.MainDto;

@WebServlet("/pagemove")
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.printf("{%s}\n", command);

		GameDao dao = new GameDao();

		if (command.equals("other_user_dashboard")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			System.out.println("user_no : " + user_no);

			List<GameDto> list = dao.otherUserSelect(user_no);
			request.setAttribute("list", list);

			GameDto dto = dao.selectOtherUser(user_no);
			request.setAttribute("dto", dto);

			dispatch("other_user_dashboard.jsp", request, response);
			
		} else if(command.equals("other_user_dashboard2") ) {
			String user_id = request.getParameter("user_id");
			System.out.println("user_name : " + user_id);
			
			List<GameDto> list = dao.otherUserSelect(user_id);
			request.setAttribute("list", list);

			GameDto dto = dao.selectOtherUser(user_id);
			request.setAttribute("dto", dto);

			dispatch("other_user_dashboard.jsp", request, response);
			

		} else if (command.equals("contentpage")) {
			int game_no = Integer.parseInt(request.getParameter("game_no"));
			GameDto dto = dao.selectGame(game_no);
			request.setAttribute("dto", dto);

			List<GameDto> list = dao.reviewselectAll(dto);
			request.setAttribute("list", list);

			dispatch("contentpage.jsp", request, response);

		} else if (command.equals("contentpage_review")) {
			String rv_user_id = request.getParameter("rv_user_id");
			int game_no = Integer.parseInt(request.getParameter("game_no"));
			int rv_platform = Integer.parseInt(request.getParameter("game_platform"));
			String rv_content = request.getParameter("rv_content");
			int starPoint = Integer.parseInt(request.getParameter("starPoint"));
			System.out.println("starpoint" + starPoint);

			GameDto dto = new GameDto(game_no, starPoint, rv_platform, rv_content, rv_user_id);
			int user_count = dao.GetCount(rv_user_id);
			user_count = user_count+1;
			int res = dao.reviewInsert(dto);
			int res_count = dao.user_count_up(user_count, rv_user_id);

			double starAvg = Double.parseDouble(request.getParameter("star_avg"));
			System.out.println("staravg" + starAvg);
			List<Integer> count = dao.count(game_no);

			System.out.println(count.get(0));

			double starAll = 0;
			if (count.get(0) != 1) {
				starAll = starAvg * (count.get(0) - 1);
			} else {
				starAll = starAvg * (count.get(0));
			}

			System.out.println("starAll" + starAll);
			double starRes = starAll + starPoint;
			System.out.println("starres" + starRes);
			double starAvg_res = starRes / (count.get(0));
			System.out.println("staravg_res" + starAvg_res);

			int res2 = dao.starUpdate(game_no, starAvg_res);

			if (res2 > 0) {
				System.out.println("수정성공");
			}

			if (res > 0) {
				jsResponse("리뷰 등록 성공!",
						"pagemove?command=contentpage&game_no=" + game_no + "&game_platform=" + rv_platform, response);
			} else {
				dispatch("pagemove?command=contentpage&game_no=" + game_no + "&game_platform=" + rv_platform, request,
						response);
			}

		} else if (command.equals("contentpage_review2")) {
			
			String rv_user_id = request.getParameter("rv_user_id");
			int game_no = Integer.parseInt(request.getParameter("game_no"));
			int rv_platform = Integer.parseInt(request.getParameter("game_platform"));
			String rv_content = request.getParameter("rv_content");
			int starPoint = Integer.parseInt(request.getParameter("starPoint"));

			GameDto dto = new GameDto(game_no, starPoint, rv_platform, rv_content, rv_user_id);

			int res = dao.reviewInsert(dto);

			double starAvg = Double.parseDouble(request.getParameter("star_avg"));
			List<Integer> count = dao.count(game_no);

			System.out.println(count.get(0));

			double starAll = 0;
			if (count.get(0) != 1) {
				starAll = starAvg * (count.get(0) - 1);
			} else {
				starAll = starAvg * (count.get(0));
			}

			double starRes = starAll + starPoint;
			double starAvg_res = starRes / (count.get(0));

			int res2 = dao.starUpdate(game_no, starAvg_res);

			if (res2 > 0) {
				System.out.println("수정성공");
			}

			if (res > 0) {
				jsResponse("리뷰 등록 성공!",
						"pagemove?command=contentpage_more&game_no=" + game_no + "&game_platform=" + rv_platform, response);
			} else {
				dispatch("pagemove?command=contentpage_more&game_no=" + game_no + "&game_platform=" + rv_platform, request,
						response);
			}
			

		} else if (command.equals("platform")) {
			int platform = Integer.parseInt(request.getParameter("platform"));

			List<GameDto> res1 = dao.selectAll(platform, 1);
			request.setAttribute("list1", res1);

			List<GameDto> res2 = dao.selectAll(platform, 2);
			request.setAttribute("list2", res2);

			List<GameDto> res3 = dao.selectAll(platform, 3);
			request.setAttribute("list3", res3);

			List<MainDto> list = dao.mContentSelectAll(); 
			request.setAttribute("list", list);

			List<GameDto> reviewerlist = dao.selectReview();
			request.setAttribute("reviewer", reviewerlist);

			dispatch("platform.jsp", request, response);

		} else if (command.equals("search")) {
			String search = request.getParameter("search");
			System.out.println(search);

			// gamedto
			List<GameDto> dto = dao.search(search);
			request.setAttribute("dto", dto);

			List<MainDto> list = dao.mContentSelectAll(); 
			request.setAttribute("list", list);
			
			List<GameDto> reviewerlist = dao.selectReview();
			request.setAttribute("reviewer", reviewerlist);

			dispatch("search.jsp", request, response);

		} else if (command.equals("contentpage_more")) {
			int game_no = Integer.parseInt(request.getParameter("game_no"));
			GameDto dto = dao.selectGame(game_no);
			request.setAttribute("dto", dto);
			List<GameDto> list = dao.reviewselectAll(dto);

			request.setAttribute("list", list);
			dispatch("contentpage_more.jsp", request, response);

		} else if (command.equals("mainLoad")) {
			
			List<MainDto> list = dao.mContentSelectAll(); 
			request.setAttribute("list", list);

			List<GameDto> reviewerlist = dao.selectReview();
			request.setAttribute("reviewer", reviewerlist);
			
			dispatch("main.jsp", request, response);

		} else if (command.equals("user_dashboard")) {
			String user_id = request.getParameter("user_id");

			List<GameDto> list_pc = dao.selectPc(user_id);
			List<GameDto> list_ps4 = dao.selectPs4(user_id);
			List<GameDto> list_xbox = dao.selectXbox(user_id);
			List<GameDto> list_switch = dao.selectSwitch(user_id);
			
			LoginDao Ldao = new LoginDao();
			GameDto user_image = Ldao.selectUserImg(user_id);
			System.out.println("user_no: "+user_image);
			
			request.setAttribute("user_img", user_image);

			request.setAttribute("list_pc", list_pc);
			request.setAttribute("list_ps4", list_ps4);
			request.setAttribute("list_xbox", list_xbox);
			request.setAttribute("list_switch", list_switch);

			dispatch("user_dashboard.jsp", request, response);

		} else if (command.equals("user_dashboard_pop_pc")) { // 마이페이지 리뷰 더보기 /pc
			//페이징
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			System.out.println("--"+pageNum);
			int currentPage =Integer.parseInt(pageNum);
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			String user_id = request.getParameter("user_id");
			
			List<GameDto> list = dao.selectReviewPc(startRow, endRow, user_id);

			request.setAttribute("list", list);
			dispatch("user_dashboard_pop_pc.jsp", request, response);

		} else if (command.equals("user_dashboard_pop_ps4")) { // 마이페이지 리뷰 더보기 /pc
			// 페이징
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			String user_id = request.getParameter("user_id");

			List<GameDto> list = dao.selectReviewPs4(startRow, endRow, user_id);

			request.setAttribute("list", list);
			dispatch("user_dashboard_pop_ps4.jsp", request, response);

		} else if (command.equals("user_dashboard_pop_xbox")) { // 마이페이지 리뷰 더보기 /ps4
			// 페이징
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			String user_id = request.getParameter("user_id");

			List<GameDto> list = dao.selectReviewXbox(startRow, endRow, user_id);

			request.setAttribute("list", list);
			dispatch("user_dashboard_pop_xbox.jsp", request, response);

		} else if (command.equals("user_dashboard_pop_switch")) { // 마이페이지 리뷰 더보기 /switch
			// 페이징
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			String user_id = request.getParameter("user_id");

			List<GameDto> list = dao.selectReviewSwitch(startRow, endRow, user_id);

			request.setAttribute("list", list);
			dispatch("user_dashboard_pop_switch.jsp", request, response);

		} else if (command.equals("deleteform")) { // 삭제 //PC

			int seq = Integer.parseInt(request.getParameter("rv_no"));
			int platform = Integer.parseInt(request.getParameter("rv_platform"));
			String user_id = request.getParameter("user_id");
			
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			int currentPage =Integer.parseInt(pageNum);
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			
			int user_count = dao.GetCount(user_id);
			user_count = user_count-1;
			int res_count = dao.user_count_up(user_count, user_id);

			
			System.out.println("platform " + platform);

			int res = dao.deleteRv(seq, user_id);

			switch (platform) {
			case 1:
				if (res > 0 & platform == 1) {
					jsResponse("글 삭제 성공", "pagemove?command=user_dashboard_pop_pc&pageNum="+pageNum, response);
				} else {
					jsResponse("글 삭제 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_pc&pageNum="+pageNum, response);
				}
				break;
			case 2:
				if (res > 0 & platform == 2) {
					jsResponse("글 삭제 성공", "pagemove?command=user_dashboard_ps4", response);
				} else {
					jsResponse("글 삭제 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_ps4&pageNum="+pageNum, response);
				}
				break;

			case 3:
				if (res > 0 & platform == 3) {
					jsResponse("글 삭제 성공", "pagemove?command=user_dashboard_pop_xbox&pageNum="+pageNum, response);
				} else {
					jsResponse("글 삭제 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_xbox&pageNum="+pageNum, response);
				}
				break;
			case 4:
				if (res > 0 & platform == 4) {
					jsResponse("글 삭제 성공", "pagemove?command=user_dashboard_pop_switch&pageNum="+pageNum, response);
				} else {
					jsResponse("글 삭제 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_switch&pageNum="+pageNum, response);
				}
				break;
			}

		} else if (command.equals("updateform")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			String user_id = request.getParameter("user_id");

			GameDto dto = dao.selectOne_RV(rv_no, user_id);

			request.setAttribute("dto", dto);
			dispatch("user_dashboard_update.jsp", request, response);

		} else if (command.equals("user_dashboard_update")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			System.out.println(rv_no);
			int rv_star = Integer.parseInt(request.getParameter("rv_star"));
			System.out.println(rv_star);
			String rv_content = request.getParameter("rv_content");
			System.out.println(rv_content);
			int rv_platform = Integer.parseInt(request.getParameter("rv_platform"));
			System.out.println(rv_platform);
			String rv_user_id = request.getParameter("user_id");
			System.out.println(rv_user_id);

			/*페이징*/
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			int currentPage =Integer.parseInt(pageNum);
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			
			GameDto dto = new GameDto(rv_no, rv_star, rv_content, rv_platform, rv_user_id);
			int res = dao.updateRv(dto);
			

			switch (rv_platform) {
			case 1:
				if (res > 0 & rv_platform == 1) {
					jsResponse("글 수정 성공", "pagemove?command=user_dashboard_pop_pc&pageNum="+pageNum, response);
				} else {
					jsResponse("글 수정 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_pc&pageNum="+pageNum, response);
				}
				break;
			case 2:
				if (res > 0 & rv_platform == 2) {
					jsResponse("글 수정 성공", "pagemove?command=user_dashboard_pop_ps4&pageNum="+pageNum, response);
				} else {
					jsResponse("글 수정 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_ps4&pageNum="+pageNum, response);
				}
				break;

			case 3:
				if (res > 0 & rv_platform == 3) {
					jsResponse("글 수정 성공", "pagemove?command=user_dashboard_pop_xbox&pageNum="+pageNum, response);
				} else {
					jsResponse("글 수정 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_xbox&pageNum="+pageNum, response);
				}
				break;
			case 4:
				if (res > 0 & rv_platform == 4) {
					jsResponse("글 수정 성공", "pagemove?command=user_dashboard_pop_switch&pageNum="+pageNum, response);
				} else {
					jsResponse("글 수정 실패ㅜㅜ", "pagemove?command=user_dashboard_pop_switch&pageNum="+pageNum, response);
				}
				break;
			}
		} else if (command.equals("backform")) { // 마이페이지 리뷰 슈정 - 취소 버튼 누르면
			int rv_platform = Integer.parseInt(request.getParameter("rv_platform"));


			/*페이징*/
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			int currentPage =Integer.parseInt(pageNum);
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			
			switch (rv_platform) {
			case 1:
				dispatch("pagemove?command=user_dashboard_pop_pc&pageNum="+pageNum, request, response);
				break;
			case 2:
				dispatch("pagemove?command=user_dashboard_pop_ps4&pageNum="+pageNum, request, response);
				break;
			case 3:
				dispatch("pagemove?command=user_dashboard_pop_xbox&pageNum="+pageNum, request, response);
				break;
			case 4:
				dispatch("pagemove?command=user_dashboard_pop_switch&pageNum="+pageNum, request, response);
				break;


			}

		}else if(command.equals("kakaologin")) {
	         int user_no = Integer.parseInt(request.getParameter("no").trim());
	         String user_id = request.getParameter("id").trim();
	         String user_name = request.getParameter("name");
	         System.out.println(user_no);
	         System.out.println(user_id);
	         System.out.println(user_name);
	         
	         
	         GameDto kdto = new GameDto(user_no, user_id, user_name);
	         
	         System.out.println(kdto.toString());
	         
	         request.setAttribute("kdto", kdto);
	         dispatch("LogController?command=kakaologin",request, response);
	      }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {

		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		PrintWriter out = response.getWriter();
		out.print(s);

	}

}
