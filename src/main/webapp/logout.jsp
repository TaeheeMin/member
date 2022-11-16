<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그아웃하고 로그인 폼으로 이동
	session.invalidate(); //세션 초기화
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
%>