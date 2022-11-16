<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert Member Form</title>
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
				widtd: 100%;
				border-collapse: collapse;
				border-radius: 5px;
				overflow: hidden;
				text-align:center;
			}
			a {
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
	<h1 Style="text-align:center;">회원가입</h1>
		<form method="post" action="<%=request.getContextPath()%>/insertMemberAction.jsp">
			<div class = "container">
				<%
				if(request.getParameter("msg") != null){
				%>
				<div class="text-center"><%=request.getParameter("msg")%></div>
				<%
				}
				%>
				<table  class="table table-bordered table-hover w-50 rounded" style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="memberId">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="memberPw1"> <br>
							<input type="password" name="memberPw2">
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="memberName">
						</td>
					</tr>
					<tr>
						<td colspan ="2">
							<button type="submit" class="btn text-black .bg-dark.bg-gradient"  style="background-color:#D4D4D4;">회원가입</button>
						</td>							
					</tr>
				</table>	
			</div>
		</form>
	</body>
</html>