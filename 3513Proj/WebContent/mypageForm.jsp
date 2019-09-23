<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<script>
    function changeForm(val){
    	var id = document.mypage.id.value;
    	var pw = document.mypage.pw.value;
    	var name = document.mypage.name.value;
    	
        if(val == "0"){
            location.href="update.jsp?id=" + id + "&pw=" + pw;
        }else if(val == "1"){
        	location.href="delete.jsp?id=" + id;
        }
     }
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int id = (int)session.getAttribute("id");
	
	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="lunch";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
				
		String sql = "select * from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
%>
<div class="box">
    <h2>마이페이지</h2>
	<form action="loginProc.jsp" method="post" name="mypage" onsubmit="return check()">
		<table class="main_tbl">
			<tr>
				<td class="title">아이디</td>
				<td>
					<input type="text" name="id" maxlength="4" value="<%= rs.getInt("id")%>" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td class="title">비밀번호</td>
				<td>
					<input type="password" name="pw">
				</td>
			</tr>
			<tr>
				<td class="title">이름</td>
				<td>
					<input type="text" name="name" value="<%= rs.getString("name")%>" disabled="disabled">
				</td>
			</tr>
		</table>
	</form>
    <br>
    <input type="button" value="회원정보 변경" onclick="changeForm(0)">
    <input type="button" value="회원탈퇴" onclick="changeForm(1)">
</div>
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
</body>
</html>