package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.UserDao;
import com.company.dto.UserDto;

public class UUpdate implements UAction {
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String newPass = request.getParameter("user_pass");
        String newPhone = request.getParameter("user_phone");
        String userId = (String) request.getSession().getAttribute("user_id");
        
		UserDao dao = new UserDao();
		UserDto dto = new UserDto();
		
		dto.setUser_id(userId);
		
		if(!newPass.isEmpty()) {
			dto.setUser_pass(newPass);
		}
		if(!newPhone.isEmpty()) {
			dto.setUser_phone(newPhone);
		}

		if(dao.update(dto)<0) {
			out.println("<script>alert('정보 수정에 실패했습니다. 변경하고자 하는 내용을 입력해주세요.'); location.href='userModify_view.do'; </script>");
			return;
		}
	}
}
