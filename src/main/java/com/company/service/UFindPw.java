package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.UserDao;
import com.company.dto.UserDto;

public class UFindPw implements UAction {
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		UserDao dao = new UserDao();
		UserDto dto = new UserDto();
		
		dto.setUser_id(request.getParameter("user_id"));
		
		if(dao.resetPass(dto)<0) {
			out.println("<script>alert('가입되어 있지 않은 계정입니다. 계정을 다시 확인해주세요.'); location.href='pwInquiry_view.do'; </script>");
			return;
		}
		
        request.setAttribute("user_id", dto.getUser_id());
        request.setAttribute("resetPass", dto);
	}

}
