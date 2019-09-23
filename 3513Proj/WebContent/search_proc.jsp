<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="table.css">
<title>Insert title here</title>
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
	<table class="main_tbl">
	<%
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String d = request.getParameter("day");
		String time = request.getParameter("time");
		
		Date day = Date.valueOf(d);
		
		try{
  	  		String url="jdbc:oracle:thin:@localhost:1521:xe";
  			String user="lunch";
  			String password="1234";
  			Class.forName("oracle.jdbc.driver.OracleDriver");
  			conn = DriverManager.getConnection(url, user, password);
	  			
	  			String sql = "select * from food where day = ? and time = ?";
	  			pstmt = conn.prepareStatement(sql);
	  			pstmt.setDate(1, day);
	  			pstmt.setString(2, time);
	  			rs = pstmt.executeQuery();
	  			
	  			if(rs.next()){
	  				String food = rs.getString("menu");
	  				String f[] = food.split("/");
	  				%>
	  					<tr>
							<td class="title"><%= rs.getDate("day") + "<br>" + rs.getString("time") %></td>
						</tr>
						<tr>
							<td class="text">
							<%
								for(int i = 0; i < f.length; i++){
									out.print(f[i] + "<br>");
								}
								out.print("<br>");
							%>
							</td>
						</tr>
<%
	  			}else{
	  				out.println("<tr class='focus'><td>▲선택하신 급식이 없습니다.▲</td></tr>");
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
</div>
</body>
</html>