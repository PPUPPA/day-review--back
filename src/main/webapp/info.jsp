<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>000.</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container panel panel-info">
		<h3 class="panel-heading"></h3>
		<pre>
----- portfolio
create database dayreview;
use dayreview;

create table userinfo (
  user_id varchar(50) not null primary key,
  user_pass varchar(50) not null,
  user_phone varchar(11) UNIQUE not null,
  user_join timestamp not null default current_timestamp,
  user_ip varchar(20) not null
);

create table record_type (
  type_no int not null primary key default 1,
  type_name varchar(20) not null
);

create table category (
  cate_no int not null primary key default 1,
  cate_name varchar(50) not null,
  foreign key(type_no) references record_type(type_no) on delete cascade on update cascade
);

create table record (
  record_id int not null auto_increment primary key,
  foreign key(user_id) references userinfo(user_id) on delete cascade on update cascade,
  record_date timestamp not null default current_timestamp,
  foreign key(type_no) references record_type(type_no) on delete cascade on update cascade,
  foreign key(cate_no) references category(cate_no) on delete cascade on update cascade,
  record_price decimal not null,
  record_text text
);

-- 회원가입
				-- id, pass, phone, join, ip
insert into userinfo value (?,?,?,?,?);
- return(실패/성공) : -1/1
- parameter : UserDto userDto

-- 로그인
select user_id, user_pass from userinfo where user_id=?;
- return : UserDto
- parameter : UserDto userDto

-- 아이디 찾기
select * from userinfo where user_phone=?;
- return : UserDto
- parameter : String userPhone

-- 비밀번호 찾기
update userinfo set user_pass=? where user_id=?;
- return(실패/성공) : -1/1
- parameter : String user_id

-- 정보수정
update userinfo set += user_pass=?,
					+= user_phone=?
					+= where user_id=?
- return(실패/성공) : -1/1
- parameter : UserDto userDto

-- 회원 탈퇴
delete from userinfo where user_id=? and user_pass=?;
- return(실패/성공) : -1/1
- parameter : UserDto userDto
		</pre>
	</div>
</body>
</html>