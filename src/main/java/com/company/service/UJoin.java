package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.UserDao;
import com.company.dto.UserDto;


public class UJoin implements UAction {
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		UserDao dao = new UserDao();
		UserDto dto = new UserDto();
		LocalDate joinDate = LocalDate.now();
		
		String email = request.getParameter("user_id");
        String phone = request.getParameter("user_phone");

        // 이메일 중복 확인
        if (dao.isEmailDuplicate(email)) {
            out.println("<script>alert('" + email + "는 이미 가입된 계정입니다. 다른 이메일 주소를 사용해주세요.'); location.href='join_view.do'; </script>");
            return;
        }

        // 연락처 중복 확인
        if (dao.isPhoneDuplicate(phone)) {
            out.println("<script>alert('해당 연락처 " + phone + "는 이미 사용중입니다. 다른 연락처를 사용해주세요.'); location.href='join_view.do'; </script>");
            return;
        }

        // 중복이 없는 경우 가입 처리
        dto.setUser_id(email);
        dto.setUser_pass(request.getParameter("user_pass"));
        dto.setUser_phone(phone);
        dto.setUser_join(joinDate.toString());
        dto.setUser_ip(InetAddress.getLocalHost().getHostAddress());
        dao.join(dto);
	}

}
