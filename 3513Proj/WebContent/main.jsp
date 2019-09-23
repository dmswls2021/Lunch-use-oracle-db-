<%@page import="java.util.Calendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<div class="box">
	<h2>급식 알림이</h2><br>
	<h3>오늘의 급식</h3>
	<table class="main_tbl">
	<%
		request.setCharacterEncoding("utf-8");
      	  		
		Connection conn = null; 
      	PreparedStatement pstmt = null;
      	ResultSet rs = null;
      	
      	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      	Calendar c = Calendar.getInstance();
      	String time = sdf.format(c.getTime());      	
      	Date day = Date.valueOf(time);
	      		
	    int cnt = 0;
	      		
      	try{
	    	String url="jdbc:oracle:thin:@localhost:1521:xe";
	      	String user="lunch";
	      	String password="1234";
	      	Class.forName("oracle.jdbc.driver.OracleDriver");
	      	conn = DriverManager.getConnection(url, user, password);
      	  			
      	  	String sql = "select * from food where day = ? order by day";
      	  	pstmt = conn.prepareStatement(sql);
      	  	pstmt.setDate(1, day);
      	  	rs = pstmt.executeQuery();
      	  			
      	  	while(rs.next()){
      	  		String food = rs.getString("menu");
      	  		String f[] = food.split("/");
      	  		    	
      	  		cnt++;
%>
				<tr>
				<%if(cnt == 1) {%>
					<td class="title">조식</td>
				<%} else if(cnt == 2) {%>
					<td class="title">중식</td>
				<%} %>
				</tr>
				<tr>
				<%if(cnt < 3) {%>
					<td class="text">
					<%
						for(int i = 0; i < f.length; i++){
							out.print(f[i] + "<br>");
						}
						out.print("<br>");
					%>
					</td>
				<%} %>
				</tr>
<%				if(cnt == 3){ %>
				<tr>
					<td class="title">석식</td>
				</tr>
				<tr>
					<td class="text">
					<%
						for(int i = 0; i < f.length; i++){
							out.print(f[i] + "<br>");
						}
					%>
					</td>
				</tr>
<%				}
      	  	}
      	  	
      	  	if(cnt == 0){
      	  		out.println("<tr class='focus'><td>▲오늘은 급식이 없는 날입니다.▲</td></tr>");
      	  	}else if(cnt == 2){
      	  		out.println("<tr class='focus'><td>▲오늘은 석식이 없는 날입니다.▲</td></tr>");
      	  	}
      	}catch(Exception e){
      	  	e.printStackTrace();
      	  			
	      	out.println("<script>");
	      	out.println("alert('연결오류')");
	      	out.println("location.href='index.jsp'");
	      	out.println("</script>");
      	}finally{
	      	try{rs.close();}catch(Exception e){}
	      	try{pstmt.close();}catch(Exception e){}
	      	try{conn.close();}catch(Exception e){}
      	}
%>
	</table>
</div>
</body>
</html>