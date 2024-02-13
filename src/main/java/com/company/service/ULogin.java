package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.dao.UserDao;
import com.company.dto.UserDto;

public class ULogin implements UAction {
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pass");

		session.setAttribute("user_id", id);
		session.setAttribute("user_pass", pass);
		
		UserDao dao = new UserDao();
		UserDto dto = dao.login(id, pass);
		
		if (dto == null) {
            // 로그인 실패한 경우
            session.removeAttribute("user_id");
            out.println("<script>alert('아이디와 비밀번호를 확인해주세요!');location.href='login.do';</script>");
            return;
        }

        // 로그인 성공한 경우
        session.setAttribute("user_id", id);
        session.setAttribute("user_pass", pass);

        Cookie cookie1 = new Cookie("user_id", id);
        cookie1.setMaxAge(60 * 60 * 24); // 하루
        response.addCookie(cookie1);

        request.setAttribute("dto", dto);
	}
}
