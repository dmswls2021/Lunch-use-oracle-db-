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
				
		String sql = "select * from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(pw.equals(rs.getString("pw"))){
				session.setAttribute("id", id);
				
				out.print("<script>");
				out.print("alert('로그인에 성공했습니다.');");
				out.print("location.href='index.jsp'");
				out.print("</script>");
			}else{
				out.print("<script>");
				out.print("alert('비밀번호가 틀렸습니다.');");
				out.print("location.href='login.jsp'");
				out.print("</script>");
			}
		}else{
			out.print("<script>");
			out.print("alert('없는 아이디입니다.');");
			out.print("location.href='join.jsp'");
			out.print("</script>");
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