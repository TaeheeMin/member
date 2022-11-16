<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*"%>
<%@ page import = "java.net.URLEncoder" %>

<%
	// 1. 요청분석
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
	String pw1 = request.getParameter("memberPw1");
	String pw2 = request.getParameter("memberPw2");
	String memberName = request.getParameter("memberName");
	String memberPw = null;
	
	// 작성 확인
	if(memberId == null || pw1 == null || pw2 == null || memberName == null || 
		memberId.equals("") || pw1.equals("") || pw2.equals("") || memberName.equals("")){
		String insertMsg = URLEncoder.encode("내용을 입력하세요", "utf-8");
		response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp?msg="+insertMsg);
		return;
	} // 내용 미입력시 메세지, 폼이동
	
	// 비밀번호 확인
	if(pw1.equals(pw2)){
		memberPw = pw1;
	} else {
		String msg = URLEncoder.encode("비밀번호를 확인해 주세요", "utf-8");
		response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp?msg="+msg);
		return;
	} // 비밀번호 불일치시 메세지, 폼이동
		
	Member meb = new Member();
	meb.memberId = memberId;
	meb.memberPw = memberPw;
	meb.memberName = memberName;
	
	// 2. 요청처리
	//db연결
	Class.forName("org.mariadb.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/gdj58", "root", "java1234");
	
	// 2-1. 중복검사
	// select해서 데이터에 입력값과 동일한 값이 있는지 먼저 찾고 비교
	String sql = "select * from member where member_id=?";
	PreparedStatement stmt1 = conn.prepareStatement(sql);
	stmt1.setString(1, meb.memberId);
	
	ResultSet rs = stmt1.executeQuery();
	if(rs.next()) { // 결과물이 있으면 동일값 존재 -> 에러 메세지, 추가폼이동
		String msg = URLEncoder.encode("아이디가 중복되었습니다.","utf-8");
		response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp?msg="+msg);
		return;
	}
	
	// 2-2 insert
	String insertSql = "INSERT INTO member(member_id, member_name, member_pw) VALUES(?, ?, PASSWORD(?))";
	PreparedStatement stmt = conn.prepareStatement(insertSql);
	stmt.setString(1, memberId); 
	stmt.setString(2, memberName); 
	stmt.setString(3, memberPw);
	
	// 디버깅
	int row = stmt.executeUpdate();
	if(row == 1) {
		System.out.println("가입성공");
	} else {
		System.out.println("가입실패");
	}
	
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
	rs.close();
	stmt.close();
	conn.close();
	// 3. 출력 -> 없음
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert Member Action</title>
	</head>
	
	<body>
	</body>
</html>