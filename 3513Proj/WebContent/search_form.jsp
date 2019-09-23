<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	String s = format.format(c.getTime());
%>
<div class="box">
	<form action="searchP.jsp" method="post" name="search">
		<table>
			<tr>
				<td><input type="date" value="<%= s %>" min="2019-09-01" max="2019-09-30" name="day"></td>
				<td>
					<select name="time">
						<option value="조식">조식</option>
						<option value="중식">중식</option>
						<option value="석식">석식</option>
					</select>
				</td>
				<td>
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>