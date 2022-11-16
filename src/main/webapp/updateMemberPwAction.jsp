<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*"%>
<%@ page import = "java.net.URLEncoder" %>

<%
	//1. 요정분석
	request.setCharacterEncoding("utf-8");
	String memberOldPw = request.getParameter("memberOldPw");
	String memberNewPw = request.getParameter("memberNewPw");
	String memberId = (String)session.getAttribute("loginMemberId");

	//2. 요청 처리
	// db 연결
	Class.forName("org.mariadb.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/gdj58", "root", "java1234");
	
	// 2-1 현재 비밀번호 확인 및 수정
	/*
	UPDATE member SET member_pw = PASSWORD(?) WHERE member_id=? AND member_pw=PASSWORD(?);
	*/
	String sql = "UPDATE member SET member_pw = PASSWORD(?) WHERE member_id=? AND member_pw=PASSWORD(?)";
	PreparedStatement stmt = conn.prepareStatement(sql); 
	stmt.setString(1, memberNewPw);
	stmt.setString(2, memberId);
	stmt.setString(3, memberOldPw);

	// 실행 및 디버깅 변수 선언
	int row = stmt.executeUpdate();
	
	// 디버깅
	if (row == 1) {
		String msg = URLEncoder.encode("비밀번호 수정완료","utf-8");
		System.out.println("수정 성공");
		response.sendRedirect(request.getContextPath()+"/memberOne.jsp?msg="+msg);
	} else {
		String msg = URLEncoder.encode("비밀번호를 확인해주세요.","utf-8");
		System.out.println("수정 실패");
		response.sendRedirect(request.getContextPath()+"/updateMemberPwForm.jsp?msg="+msg);
	}
	
	stmt.close();
	conn.close();
	// 3. 출력 -> 없음
%>