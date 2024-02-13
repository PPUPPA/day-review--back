package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.service.UAction;
import com.company.service.UDelete;
import com.company.service.UFindId;
import com.company.service.UFindPw;
import com.company.service.UJoin;
import com.company.service.ULogin;
import com.company.service.UUpdate;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionUser(request, response);
	}
	
	protected void actionUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path = request.getServletPath();
		
		PrintWriter out = response.getWriter();
		String url="", msg="";
		
		UAction controller;
		
		// ***** 메인
		if(path.equals("/main.do")) {
			//1. X
			//2. 경로: main.jsp
			url = "main.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		// ***** 로그인
		else if(path.equals("/login.do")) {
			//1. X
			//2. 경로: views/user/login.jsp
			url="views/user/login.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/login_action.do")) {
			//1. DB - 로그인
			controller = new ULogin();
			controller.exec(request, response);
			
			//2. 경로: main.do
			url="main.do";
			out.print("<script>location.href='"+url+"';</script>");
		}
		// ***** 로그아웃
		else if(path.equals("/logout.do")) {
			HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();  // 세션 무효화
	            response.getWriter().write("success");  // Ajax 요청에 성공을 응답
	        } else {
	            response.getWriter().write("failure");  // Ajax 요청에 실패를 응답
	        }
		}
		// ***** 회원가입
		else if(path.equals("/join_view.do")) {
			//1. X
			//2. 경로: views/user/join.jsp
			url="views/user/join.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/join.do")) {
			//1. DB - 회원가입
			controller = new UJoin();
			controller.exec(request, response);
			
			//2. 경로: joinNotice.do
			url="joinNotice.do?user_id="+request.getParameter("user_id");
			out.print("<script>location.href='"+url+"';</script>");
		}
		else if(path.equals("/joinNotice.do")) {
			//1. DB - 회원가입
			
			//2. 경로: views/user/joinNotice.jsp
			url="views/user/joinNotice.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		// ***** 아이디 찾기
		else if(path.equals("/idInquiry_view.do")) {
			//1. X
			//2. 경로: views/user/idInquiry.jsp
			url="views/user/idInquiry.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/idInquiry.do")) {
			//1. DB - 아이디 찾기
			controller = new UFindId();
			controller.exec(request, response);
			
			//2. 경로: idNotice.do
			url="idNotice.do";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/idNotice.do")) {
			//1. X
			//2. 경로: views/user/idNotice.jsp
			url="views/user/idNotice.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		// ***** 비밀번호 재발급
		else if(path.equals("/pwInquiry_view.do")) {
			//1. X
			//2. 경로: views/user/pwInquiry.jsp
			url="views/user/pwInquiry.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/pwInquiry.do")) {
			//1. DB - 임시 비밀번호 발급
			controller = new UFindPw();
			controller.exec(request, response);
			
			//2. 경로: login.do
			url="login.do";
			out.print("<script>alert('"+request.getParameter("user_id")+" 메일로 임시 비밀번호를 발송하였습니다.');location.href='"+url+"';</script>");
		}
		// ***** 정보수정
		else if(path.equals("/userModify_view.do")) {
			//1. X
			//2. 경로: views/user/userModify.jsp
			url="views/user/userModify.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/userModify.do")) {
			//1. DB - 정보 수정
			controller = new UUpdate();
			controller.exec(request, response);
			
			//2. 완료 후 팝업 + 메인으로
			url="main.do";
			out.print("<script>alert('정보 수정이 완료되었습니다.');location.href='"+url+"';</script>");
		}
		// ***** 회원탈퇴
		else if(path.equals("/withdraw_view.do")) {
			//1. X
			//2. 경로: views/user/withdraw.jsp
			url="views/user/withdraw.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if(path.equals("/withdraw.do")) {
			//1. DB-삭제기능
			controller = new UDelete();
			controller.exec(request, response);
			
			HttpSession session = request.getSession();
		    session.removeAttribute("user_id");

			//2. 경로: views/user/withdrawNotice.jsp
			url="views/user/withdrawNotice.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
