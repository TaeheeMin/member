<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav class="navbar navbar-expand-sm bg-light navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/memberIndex.jsp">GOODEE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/memberIndex.jsp">HOME</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">내정보</a>
          <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="<%=request.getContextPath()%>/memberOne.jsp">내정보</a></li>
			<li><a class="dropdown-item" href="<%=request.getContextPath()%>/updateMemberPwForm.jsp">비밀번호 변경</a></li>
		    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/updateMemberForm.jsp">개인정보 변경</a></li>
		    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/deleteMemberForm.jsp">회원탈퇴</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/logout.jsp">LOGOUT</a>
         </li>
      </ul>
    </div>
  </div>
</nav>