<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${not empty sessionScope.user_id}">
		<% response.sendRedirect("main.do"); %>
	</c:when>
	<c:otherwise>
		<% response.sendRedirect("login.do"); %>
	</c:otherwise>
</c:choose>