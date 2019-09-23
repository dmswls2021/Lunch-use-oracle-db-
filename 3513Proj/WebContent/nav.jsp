<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="nav.css">
</head>
<body>
<nav>
    <ul class="left">
      <li>
        <a href="index.jsp">HOME</a>
      </li>
      <li>
        <a href="search.jsp">메뉴검색</a>
      </li>
<% if(session.getAttribute("id") == null){%>
      <li>
        <a href="#">메뉴등록</a>
      </li>
<% }else{%>
	  <li>
        <a href="menu.jsp">메뉴등록</a>
      </li>	
<% } %>
    </ul>
<%
	if(session.getAttribute("id") == null){
%>
    <ul class="right">
      <li class="right">
        <a href="join.jsp">Join</a>
      </li>
      <li class="right">
        <a href="login.jsp">Login</a>
      </li>
    </ul>
<%
	} else{
%>
	<ul class="right">
      <li class="right">
        <a href="logout.jsp">Logout</a>
      </li>
      <li class="right">
        <a href="mypage.jsp">Mypage</a>
      </li>
    </ul>
<%
	}
%>
</nav>
</body>
</html>