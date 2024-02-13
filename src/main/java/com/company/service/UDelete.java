package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.UserDao;
import com.company.dto.UserDto;

public class UDelete implements UAction {
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String userId = (String) request.getSession().getAttribute("user_id");
		String userPass = request.getParameter("user_pass");
        
		UserDao dao = new UserDao();
		UserDto dto = new UserDto();
		
		dto.setUser_id(userId);
		dto.setUser_pass(userPass);

		if(dao.withdraw(dto)<0) {
			out.println("<script>alert('회원 탈퇴에 실패했습니다. 비밀번호를 확인해주세요.'); location.href='withdraw_view.do'; </script>");
			return;
		}
	}
}
