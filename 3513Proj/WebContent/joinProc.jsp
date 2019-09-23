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
	String name = request.getParameter("name");

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
			out.print("<script>");
			out.print("alert('중복된 아이디(학번)입니다');");
			out.print("location.href='join.jsp'");
			out.print("</script>");
		}
		
		sql = "insert into member values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		
		out.print("<script>");
		out.print("alert('회원가입에 성공했습니다.');");
		out.print("location.href='login.jsp'");
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