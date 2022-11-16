<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. 요청분석
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	
	if(session.getAttribute("loginMemberId") != null){
		response.sendRedirect(request.getContextPath()+"/memberIndex.jsp");
		System.out.println("1.로그인실패");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Form</title>
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
		<h1 Style="text-align:center;">로그인</h1>
		<div class = "container">
			<form action="<%=request.getContextPath()%>/loginAction.jsp" method="post">
				<!-- msg 파라미터값이 있으면 출력 -->
				<%
				if(msg != null){
				%>
					<div class="text-center"><%=msg%></div>
				<%
				}
				%>
				<table class="table table-bordered table-hover w-50 rounded" style="margin-left: auto; margin-right: auto;">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="memberId">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="memberPw">
						</td>
					</tr>
					<tr>
						<td colspan ="2">
							<button type="submit" class="btn text-black .bg-dark.bg-gradient"  style="background-color:#D4D4D4;">로그인</button>
						</td>							
					</tr>
				</table>
			</form>		
		</div>
		<div Style="text-align:center;">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=request.getContextPath()%>/insertMemberForm.jsp'">회원가입</button>
		</div>
	</body>
</html>