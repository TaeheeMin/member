<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//1. 요청분석
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	if(session.getAttribute("loginMemberId") == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	} 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MY PAGE</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		<style>
			body {
				padding:1.5em;
				background: #f5f5f5
			}
			table {
			 	border: 1px #a39485 solid;
				font-size: .9em;
				box-shadow: 0 2px 5px rgba(0,0,0,.25);
				width: 100%;
				border-collapse: collapse;
				border-radius: 5px;
				overflow: hidden;
				text-align:center;
			}
			a {
				text-decoration: none;
			}
			a:link { 
				color: black;
				text-decoration: none;
			}
			a:visited { 
				color: black;
				text-decoration: none;
			}
			a:hover { 
				color: blue; 
				text-decoration: none;
			}
			input {
				font-size: 15px;
				border: 0;
				border-radius: 15px;
				outline: none;
				padding-left: 10px;
				background-color: rgb(233, 233, 233);
			}
		</style>
	</head>
	
	<body>
		<!-- 메뉴 partial jsp 구성-->
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		<h1 style="text-align:center">내정보</h1>
		<!-- msg 파라미터값이 있으면 출력 -->
			<%
			if(msg != null){
			%>
				<div class="text-center"><%=msg%></div>
			<%
			}
			%>
		<div class = "container" style="text-align:center">
			<!-- 수정전 pw 수정후 pw 두개 입력 -->
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=request.getContextPath()%>/updateMemberPwForm.jsp'">비밀번호 수정</button>
			<!-- 비밀번호 안됨, 수정 정보 필요 -->
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=request.getContextPath()%>/updateMemberForm.jsp'">개인정보 수정</button>
			<!-- 비밀번호 session없애기-->
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=request.getContextPath()%>/deleteMemberForm.jsp'" >회원탈퇴</button>
		</div>
	</body>
</html>