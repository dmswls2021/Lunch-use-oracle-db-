<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<!DOCTYPE html>
<html>
<head>
  <title>3513 9월 급식</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="template.css">
</head>
<body>
<table class="wrap">
	<tr>
		<td class="header"><h1>미림 9월 급식</h1></td>
	</tr>
	<tr>
		<td class="nav-line"><jsp:include page="nav.jsp"/></td>
	</tr>
	<tr>
		<td><jsp:include page="<%= contentPage %>"/></td>
	</tr>
	<tr class="footer">
		<td><p>3513 이은진 / 급식페이지</p></td>
	</tr>
</table>
</body>
</html>
