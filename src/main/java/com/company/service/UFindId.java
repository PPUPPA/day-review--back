package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.dao.UserDao;
import com.company.dto.UserDto;

public class UFindId implements UAction {
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
        
		String phone = request.getParameter("user_phone");
		
		UserDao dao = new UserDao();
		UserDto dto = dao.findId(phone);
		
		if (dto == null) {
            // 계정 찾기 실패한 경우
            out.println("<script>alert('해당 연락처로 가입된 계정이 없습니다!');location.href='idInquiry_view.do';</script>");
            return;
        }

        // 성공한 경우
        request.setAttribute("dto", dto);
        request.setAttribute("user_id", dto.getUser_id());
	}

}
