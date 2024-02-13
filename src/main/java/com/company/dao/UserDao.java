package com.company.dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.company.dbmanager.DBManager;
import com.company.dto.UserDto;

public class UserDao {
	/*
	-- 회원가입
					-- id, pass, phone, join, ip
	insert into userinfo value (?,?,?,?,?);
	- return(실패/성공) : -1/1
	- parameter : UserDto userDto
	*/
	public int join(UserDto userDto) {
		String sql="insert into userinfo value (?,?,?,?,?)";
		int result=-1;
		  
		Connection conn = null; PreparedStatement pstmt=null;
		DBManager db = new DBManager();
		conn = db.getConnection();
		  
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userDto.getUser_id());
			pstmt.setString(2, userDto.getUser_pass());
			pstmt.setString(3, userDto.getUser_phone());
			pstmt.setString(4, userDto.getUser_join());
			pstmt.setString(5, userDto.getUser_ip());
			
			if(pstmt.executeUpdate()>0) {
				result=1;
			}
		} catch (SQLException e) { e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		System.out.println("성공여부 : "+result);
		
		return result;
	}
	// 이메일 중복 확인
    public boolean isEmailDuplicate(String user_id) {
    	String sql = "select count(*) from userinfo where user_id=?";
    	
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
		DBManager db = new DBManager();

        try {
            conn = db.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                int count = rset.getInt(1);
                return count > 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (rset != null) { try { rset.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
        }

        return false;
    }

    // 연락처 중복 확인
    public boolean isPhoneDuplicate(String user_phone) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
		DBManager db = new DBManager();

        try {
            conn = db.getConnection();
            String sql = "select count(*) from userinfo where user_phone=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_phone);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                int count = rset.getInt(1);
                return count > 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (rset != null) { try { rset.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
        }

        return false;
    }
	
	/*
	-- 로그인
	select user_id, user_pass from userinfo where user_id=?;
	- return : UserDto
	- parameter : UserDto userDto
	*/
	public UserDto login(String userId, String userPass) {
		String sql = "select * from userinfo where user_id=? and user_pass=?";
		UserDto result=null;
		  
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		  
		DBManager db = new DBManager();
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPass);
			rset = pstmt.executeQuery();
				
			while(rset.next()) {
				result = (new UserDto(
					rset.getString("user_id"),
					rset.getString("user_pass"),    
					rset.getString("user_phone"),    
					rset.getString("user_join"),   
					rset.getString("user_ip")
				));
			}
		} catch (SQLException e) { e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (rset != null) { try { rset.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
			
		return result;
	}
	
	/*
	-- 아이디 찾기
	select * from userinfo where user_phone=?;
	- return : UserDto
	- parameter : String userPhone
	*/
	public UserDto findId(String userPhone) {
		String sql = "select * from userinfo where user_phone=?";
		UserDto result=null;
		  
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		  
		DBManager db = new DBManager();
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPhone);
			rset = pstmt.executeQuery();
				
			while(rset.next()) {
				result = (new UserDto(
					rset.getString("user_id"),
					rset.getString("user_pass"),    
					rset.getString("user_phone"),    
					rset.getString("user_join"),   
					rset.getString("user_ip")
				));
			}
		} catch (SQLException e) { e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (rset != null) { try { rset.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
			
		return result;
	}
	
	/*
	-- 비밀번호 찾기
	update userinfo set user_pass=? where user_id=?;
	- return(실패/성공) : -1/1
	- parameter : String user_id
	*/
	public int resetPass(UserDto userDto) {
		String sql = "update userinfo set user_pass=? where user_id=?";
		int result = -1;
		String tempPass = generateTempPass();
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		DBManager db = new DBManager();
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempPass);
			pstmt.setString(2, userDto.getUser_id());
			
			if (pstmt.executeUpdate() > 0) {
	            result = 1;
	            // 비밀번호를 성공적으로 업데이트했을 때 메일 발송
	            sendEmail(userDto.getUser_id(), tempPass);
	        }
		} catch (SQLException e) { e.printStackTrace();
		} finally {
			if(pstmt!=null) {try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }}
			if(conn!=null) {try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }}
		}
		
		return result;
	}
	
	// 비밀번호 생성
	private static String generateTempPass() {
        String upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerChars = "abcdefghijklmnopqrstuvwxyz";
        String numberChars = "0123456789";
        String specialChars = "$@$!%*#?&";

        String allChars = upperChars + lowerChars + numberChars + specialChars;
        String password = getRandomChar(upperChars) +
                getRandomChar(lowerChars) +
                getRandomChar(numberChars) +
                getRandomChar(specialChars);

		SecureRandom random = new SecureRandom();
		
		// 나머지 길이를 랜덤으로 채우기
		for (int i = password.length(); i < 8 + (int) (Math.random() * 9); i++) {
		  int index = random.nextInt(allChars.length());
		  password += allChars.charAt(index);
		}
		
		return password;
    }
	private static String getRandomChar(String charSet) {
        SecureRandom random = new SecureRandom();
        int index = random.nextInt(charSet.length());
        return charSet.substring(index, index + 1);
    }
	
	// 임시 비밀번호 발송
	private static void sendEmail(String to, String tempPass) {
		final String host = "smtp.naver.com";
		final String username = "rweu0572@naver.com";  // 발신자 이메일 주소
	    final String password = "8Y1D9YDJWGMU";   // 발신자 이메일 비밀번호

	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.host", host);  // 현재는 Gmail을 사용한 예제입니다.
	    props.put("mail.smtp.port", "587");
	    
	    props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust"      , host);
		props.put("mail.smtp.ssl.protocols"  , "TLSv1.2");

	    Session session = Session.getInstance(props, new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	        }
	    });

	    Message message = new MimeMessage(session);
	    try {
	        message.setFrom(new InternetAddress(username));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	        message.setSubject("[하루사용기] 임시 비밀번호 발급");
	        message.setContent("임시 비밀번호가 생성되었습니다: " + tempPass, "text/html; charset=UTF-8");

	        Transport.send(message);

	        System.out.println("임시 비밀번호 발급 완료!");

	    } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }
    }
		
	/*
	-- 정보수정
	update userinfo set += user_pass=?,
						+= user_phone=?
						+= where user_id=?
	- return(실패/성공) : -1/1
	- parameter : UserDto userDto
	*/
	public int update(UserDto userDto) {
		String sql = "update userinfo set ";
		if(userDto.getUser_pass() != null && userDto.getUser_phone() != null) {
			sql += "user_pass=?, user_phone=? ";
		}else {			
			if(userDto.getUser_pass() != null) {
				sql += "user_pass=? ";
			}
			if(userDto.getUser_phone() != null) {
				sql += "user_phone=? ";
			}
		}
		sql += "where user_id=?";
		
		int index = 1;
		int result = -1;

		Connection conn = null; PreparedStatement pstmt=null;
		DBManager db = new DBManager();
		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			
			if (userDto.getUser_pass() != null) {
	            pstmt.setString(index++, userDto.getUser_pass());
	        }
	        if (userDto.getUser_phone() != null) {
	            pstmt.setString(index++, userDto.getUser_phone());
	        }
	        pstmt.setString(index, userDto.getUser_id());
	        
			if (pstmt.executeUpdate() > 0) {
	            result = 1;
			}
		} catch (SQLException e) { e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
			if (conn != null) { try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } }
		}
		System.out.println("성공여부 : "+result);
		
		return result;
	}
		
	/*
	-- 회원 탈퇴
	delete from userinfo where user_id=? and user_pass=?;
	- return(실패/성공) : -1/1
	- parameter : UserDto userDto
	*/
	public int withdraw(UserDto userDto) {
		String sql="delete from userinfo where user_id=? and user_pass=?";
		int result=-1;
		      
		Connection conn = null;
		PreparedStatement pstmt = null;

		DBManager db = new DBManager();
		conn = db.getConnection();
		      
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userDto.getUser_id());
			pstmt.setString(2, userDto.getUser_pass());
			
			if (pstmt.executeUpdate() > 0) { result = 1; }
		} catch (SQLException e) { e.printStackTrace();
		} finally {
			if(pstmt != null) {  try { pstmt.close() ; } catch (SQLException e) { e.printStackTrace(); }}
			if(conn  != null) {  try { conn.close() ; } catch (SQLException e) { e.printStackTrace(); }}
		}
		System.out.println("성공여부 : "+result);
		
		return result;
	}
}
