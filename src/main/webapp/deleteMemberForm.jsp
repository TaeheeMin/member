<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder"%>
<%
	//1. 요청분석
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	
	//로그인 없이 주소로 들어올 경우 로그인 페이지로 이동
	if((String)session.getAttribute("loginMemberId") == null) {
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}
	
	// 2. 요청처리
	// 3. 출력
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Delete Member Form</title>
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
				width:100%;
			}
		</style>
	</head>
	
	<body>
		<!-- 메뉴 partial jsp 구성-->
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h1 Style="text-align:center;">회원탈퇴</h1>
		
		<form action="<%=request.getContextPath()%>/deleteMemberAction.jsp" method="post">
			<!-- msg 파라미터값이 있으면 출력 -->
			<%
			if(msg != null){
			%>
				<div class="text-center"><%=msg%></div>
			<%
			}
			%>
			<table  class="table table-bordered table-hover w-50 rounded" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td colspan ="2">
						<button type="submit" class="btn text-black .bg-dark.bg-gradient"  style="background-color:#D4D4D4;">탈퇴</button>
					</td>							
				</tr>
			</table>
		</form>
	</body>
</html>