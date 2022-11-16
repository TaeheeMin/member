<%@ page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*"%>
<%@ page import = "java.net.URLEncoder" %>

<%
	// 1. 요정분석 : 로그인 사용할 아이디와 비밀번호 입력받아 사용
	request.setCharacterEncoding("utf-8");
	
	// 작성 확인
	if(request.getParameter("memberId") == null || request.getParameter("memberPw") == null || request.getParameter("memberId").equals("") || request.getParameter("memberPw").equals("")){
		System.out.println("1.로그인실패");
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	} // 내용 미입력시 메세지, 폼이동
	
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	
	// 2. 요청처리 : 1에서 받아온 내용과 db와 같은지 확인
	//db연결
	String driver = "org.mariadb.jdbc.Driver"; 
	String dbUrl = "jdbc:mariadb://127.0.0.1:3306/gdj58";
	String dbUser = "root";
	String dbPw = "java1234";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
	
	String sql = "SELECT member_id FROM member WHERE member_id = ? AND member_pw = PASSWORD(?) ";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, memberId);
	stmt.setString(2, memberPw);
	ResultSet rs = stmt.executeQuery();
	// boolean loginCK = false;
	
	String targetPage = "/loginForm.jsp";
	if(rs.next()){
		// 로그인 성공 -> 값저장 -> session
		targetPage = "/memberIndex.jsp";
		session.setAttribute("loginMemberId", rs.getString("member_id")); // 세션에 뭐가 없으면ㅇ null 반환
		// Object loginMemberId =  rs.getString("memberId"); -> 다형성 오브젝트로 집어 넣음 그래서 세션에 집어널고 꺼낼때 형변환 필요
		// String loginMemberId = (String)session.getAttribute("loginMemberId"); -> 꺼낼때 object로 반환 -> 형변환 필요
		System.out.println("로그인 성공");
	}
	
	response.sendRedirect(request.getContextPath()+targetPage);
	rs.close();
	stmt.close();
	conn.close();
	
	// 3. 출력 -> 없음
%>