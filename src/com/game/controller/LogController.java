package com.game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.game.dao.LoginDao;
import com.game.dto.GameDto;

@WebServlet("/LogController")
public class LogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		HttpSession session = null;
		System.out.printf("{%s}\n",command);
		
		if(command.equals("login")) {
			
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			
			System.out.println("ID :"+ user_id);
			System.out.println("PW :"+ user_pw);
			
			LoginDao dao = new LoginDao();
			
			GameDto dto = dao.login(user_id,user_pw);
			
			System.out.println(dto.getUser_id());
			
			//request.getSession().setAttribute("login", user_id);
			
			if(dto.getUser_id()!= null) {
				
				System.out.println("로그인");
				session = request.getSession();
				session.setAttribute("dto", dto);
				
				
				request.getSession().setAttribute("login", user_id);
				System.out.println(user_id);
				jsResponse("로그인 성공","index.jsp",response);
				System.out.println("로그인");
				
				
			}
			else {
				System.out.println("실패");
				jsResponse("로그인 실패. 아이디 또는 패스워드를 확인 해 주세요.","index.jsp",response);
				
			}
			
		}else if(command.equals("log_out")) {
			
			request.getSession().invalidate(); 		//세션에 작성된 정보 삭제 
			jsResponse("정상적으로 로그아웃 되었습니다.", "index.jsp", response);
			//response.sendRedirect("index.jsp");
			
		}else if(command.equals("Insert")) {
		
			String user_id = request.getParameter("user_id");
			System.out.println("ID :"+user_id);
			String user_pw = request.getParameter("user_pw");
			System.out.println("PW :"+user_pw);
			String user_name = request.getParameter("user_name");
			System.out.println("NAME :"+user_name);
			String user_email = request.getParameter("user_email");
			System.out.println("EMAIL :"+user_email);
			String user_enable = request.getParameter("user_enable");
			System.out.println("ENABLE :"+user_enable);
			String user_image = request.getParameter("user_image");
	         System.out.println("IMAGE :"+user_image);
	         
	         
	         GameDto dto = new GameDto(user_id,user_pw,user_name,user_email,user_enable,user_image);
	         LoginDao dao = new LoginDao();
	         int res = dao.insertLogin(dto);
			
			if(res>0) {
				System.out.println("\ninsert 성공!");
				jsResponse("회원가입 성공","index.jsp",response);
			}
			
			else {
				System.out.println("\ninsert 실패!");
				jsResponse("회원가입 실패","index.jsp",response);
			}
		}else if(command.equals("pwchk")) {
			//user pw 존재 확인
			String user_id = request.getParameter("user_id");
			String chk_result = "";
			System.out.println("chk.user_id"+user_id);
			
			
			
			LoginDao dao = new LoginDao();
			GameDto res = dao.pwchk(user_id);
			
			String Chk = res.getUser_pw();
			
			String Chk_now = request.getParameter("user_pw");
			System.out.println("Chk:"+Chk);
			System.out.println("Chk_now"+Chk_now);
			
			if(Chk.equals(Chk_now)) {
				chk_result = "1";
			} else {
				chk_result = "0";
			}
		
			System.out.println(res);
			
			PrintWriter out = response.getWriter();
			out.println(chk_result);
			
			
		} else if(command.equals("pwchk2")) {
			//2차 비밀번호 확인
			String user_pw_ud = request.getParameter("user_pw_ud");
			String user_pw_udck = request.getParameter("user_pw_udck");
			System.out.println("user_pw_ud: "+user_pw_ud);
			System.out.println("user_pw_udck: " + user_pw_udck);
			
			String ckh_result = null;
			
			if(user_pw_ud.equals(user_pw_udck)) {
				ckh_result = "1";
			}else {
				ckh_result = "0";
			}
						
			PrintWriter out = response.getWriter();
			out.println(ckh_result);
			
		}else if(command.equals("pwchk_up")){
	        //비밀번호 수정
			
			String user_id = (String)request.getSession().getAttribute("login");
			System.out.println("Controller user_id: "+user_id);
			
	         String user_pw_ud = request.getParameter("user_pw_ud");
	         System.out.println("Controller user_pw_ud :"+user_pw_ud);
	         
	         String user_pw_udck = request.getParameter("user_pw_udck");
	         System.out.println("Controller user_pw_udck :"+user_pw_udck);
	         
	         //String user_id = request.getParameter("user_id");
	         //System.out.println("Controller user_id: "+user_id);
	         
	         LoginDao dao = new LoginDao();
	         GameDto dto = new GameDto(user_id, user_pw_udck);
	         
	            
	            if(user_pw_ud.equals(user_pw_udck)) {
	               int res = dao.Update_pw(dto);
	            
	               if(res>0) {
	            	   
	            	   System.out.println("\n update 성공!");
	            	   MyjsResponse("비밀번호 수정 성공",response, "pagemove?command=user_dashboard&user_id="+user_id);
	               
	               }else {
	            	   System.out.println("\n update 실패!");
	            	   MyjsResponse("비밀번호 수정 실패",response, "pagemove?command=user_dashboard&user_id="+user_id);
	               }
	               
	            }
		}else if(command.equals("idchk")) {
	         
	         String user_id = request.getParameter("user_id");
	         String chk = null;
	         System.out.println("chk.1"+user_id);
	         
	         LoginDao dao = new LoginDao();
	         boolean res = dao.idChk(user_id);
	         
	         System.out.println("chk.2"+user_id);
	         
	         if(res) {
	            
	            chk = "1";
	            
	         } else {
	            
	            chk = "0";
	            
	         }
	      
	         
	         PrintWriter out = response.getWriter();
	         out.println(chk);
		}else if(command.equals("kakaologin")) {
			GameDto kdto = (GameDto)request.getAttribute("kdto");
			String user_id = kdto.getUser_id();
			System.out.println("로컨유저아이디" + user_id);
			System.out.println(kdto.getUser_id());
	         GameDto olddto = new GameDto();
	         
	         //kdto안에 id가 존재할 경우(sns계정이 있는 경우)
	         if(user_id != null) {
	        	 System.out.println("실행중!");
	            LoginDao dao = new LoginDao();
	            olddto = dao.sidchk(kdto.getUser_id());
	            System.out.println(olddto.getUser_id());
	            int res = 0;
	            //기존 테이블에 있는 회원인 경우
	            if(olddto.getUser_id() != null) {
	               System.out.println("sns로그인 성공");
	               
	               request.getSession().setAttribute("login", user_id);
	               System.out.println(user_id);
				   jsResponse("로그인 성공","index.jsp",response);
	            //기존 테이블에 없는 회원   
	            }else {
	            	System.out.println("2실행");
	               res = dao.insertSNSUser(kdto);
	               
	               if(res>0) {
	                  System.out.println(kdto.getUser_id()+" insert 성공 ");
	                  System.out.println("sns로그인 성공");
	                  
	                  request.getSession().setAttribute("login", user_id);
		               System.out.println(user_id);
					   jsResponse("로그인 성공","index.jsp",response);
	               }else {
	                  System.out.println(kdto.getUser_id()+" insert 실패 ");
	                  System.out.println("sns로그인 성공");
	                  
	                  request.getSession().setAttribute("login", user_id);
		               System.out.println(user_id);
					   jsResponse("로그인 성공","index.jsp",response);
	                  
	               }
	            }
	            
	         //존재하지않을 경우(계정이 존재하지 않을 경우)
	         }else {
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert(계정이 존재하지않습니다. 다시 확인해주십시요); location.href='login_resist_form.jsp';</script>");
	         }
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+
				"alert('"+msg+"');"+
				"location.href='"+url+"';"+
				"</script>";
			
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	private void MyjsResponse(String msg, HttpServletResponse response, String str) throws IOException {
	      System.out.println("myjsResponse");
	      String s = "<script type='text/javascript'>"+
	            "alert('"+msg+"');"+
	            "location.href='"+str+"';"+
	            "</script>";
	         
	      PrintWriter out = response.getWriter();
	      out.print(s);
	   }
	
	private void dispatch(String msg, String url, HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      
	      String s = "<script type='text/javascript'>"+
	            "alert('"+msg+"');"+
	            "</script>";
	      
	      RequestDispatcher dispatch = request.getRequestDispatcher(url);
	      dispatch.forward(request, response);
	      
	      PrintWriter out = response.getWriter();
	      out.print(s);
	   }

}
