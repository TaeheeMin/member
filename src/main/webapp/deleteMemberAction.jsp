<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.URLEncoder"%>
<%
	// 1. 요청분석
	request.setCharacterEncoding("utf-8");
	String memberId = (String)session.getAttribute("loginMemberId");
	String memberPw = request.getParameter("memberPw");
	// 2. 요청처리
	// db 연결
	Class.forName("org.mariadb.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/gdj58", "root", "java1234");

	// sql문 작성
	/* DELETE FROM member WHERE member_id=? AND member_pw=PASSWORD(?); */
	String sql = "DELETE FROM member WHERE member_id = ? AND member_pw=PASSWORD(?)";
	PreparedStatement stmt = conn.prepareStatement(sql); 
	stmt.setString(1, memberId);
	stmt.setString(2, memberPw);
	
	int row = stmt.executeUpdate();
	
	// 쿼리 실행결과
	if (row == 1) {
		session.invalidate();
		String msg = URLEncoder.encode("탈퇴성공","utf-8");
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp?msg="+msg);
		System.out.println("삭제 성공");
		return;
		
	} else {
		String msg = URLEncoder.encode("비밀번호를 확인해주세요","utf-8");
		response.sendRedirect(request.getContextPath()+"/deleteMemberForm.jsp?msg="+msg);
		System.out.println("삭제 실패");
	}
	
	stmt.close();
	conn.close();
	// 3. 출력 -> 없음
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		
	</body>
</html>