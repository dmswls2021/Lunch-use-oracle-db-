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

	int id = (int)session.getAttribute("id");
	String main = request.getParameter("main");
	String soup = request.getParameter("soup");
	String side1 = request.getParameter("side1");
	String side2 = request.getParameter("side2");
	String side3 = request.getParameter("side3");
	String side4 = request.getParameter("side4");
	String side5 = request.getParameter("side5");

	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="lunch";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
				
		String sql = "insert into menu values(seq.nextval,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setString(2, main);
		pstmt.setString(3, soup);
		pstmt.setString(4, side1);
		pstmt.setString(5, side2);
		pstmt.setString(6, side3);
		pstmt.setString(7, side4);
		pstmt.setString(8, side5);
		pstmt.executeUpdate();
		
		out.print("<script>");
		out.print("alert('메뉴가 등록되었습니다.');");
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