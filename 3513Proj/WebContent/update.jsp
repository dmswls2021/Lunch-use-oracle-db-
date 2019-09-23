<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("pw");

	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="lunch";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
				
		String sql = "update member set pw = ? where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setInt(2, id);
		pstmt.executeUpdate();
		
		out.print("<script>");
		out.print("alert('회원정보 변경이 완료되었습니다');");
		out.print("location.href='index.jsp'");
		out.print("</script>");
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