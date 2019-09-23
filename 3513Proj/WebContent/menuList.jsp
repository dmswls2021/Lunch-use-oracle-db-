<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
<div class="box">
	<h2>학생 등록 메뉴</h2>
	<table class="main_tbl">
		<tr>
			<td class="title">NO.</td>
			<td class="title">아이디</td>
			<td class="title">메인메뉴</td>
			<td class="title">국물</td>
			<td class="title">반찬1</td>
			<td class="title">반찬2</td>
			<td class="title">반찬3</td>
			<td class="title">반찬4</td>
			<td class="title">반찬5</td>
		</tr>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="lunch";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
				
		String sql = "select * from menu";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int row = 0;
		while(rs.next()){
%>			
		<tr>
			<td><%= rs.getInt("num") %></td>
			<td><%= rs.getInt("id") %></td>
			<td><%= rs.getString("main") %></td>
			<td><%= rs.getString("soup") %></td>
			<td><%= rs.getString("side1") %></td>
			<td><%= rs.getString("side2") %></td>
			<td><%= rs.getString("side3") %></td>
			<td><%= rs.getString("side4") %></td>
			<td><%= rs.getString("side5") %></td>
		</tr>
<%
			row++;
		}
		
		if(row == 0){
%>
		<tr>
			<td colspan="9">등록된 게시물이 없습니다.</td>
		</tr>
<%
		}
	}catch(Exception e){
			e.printStackTrace();
			
			out.print("<script>");
			out.print("alert('디비연결 실패');");
			out.print("location.href='index.jsp'");
			out.print("</script>");
	}finally{
		try{rs.close();}catch(Exception e){}
		try{pstmt.close();}catch(Exception e){}
		try{conn.close();}catch(Exception e){}
	}
%>
	</table>
	<br>
	<input type="button" value="등록" onclick="location.href='menuF.jsp'">
</div>
</body>
</html>