<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<script>
	function check() {
		if(!document.menu.main.value){
            alert("메인메뉴(밥)를 입력하세요.");
            return false;
        }
        
        if(!document.menu.side1.value){
            alert("반찬1를 입력하세요.");
            return false;
        }
        
        if(!document.menu.side2.value){
            alert("반찬2를 입력하세요.");
            return false;
        }
        
        if(!document.menu.side3.value){
            alert("반찬3를 입력하세요.");
            return false;
        }
	}
</script>
</head>
<body>
<div class="box">
	<h2>메뉴 등록</h2>
	<h5>*표시는 필수 기재 항목입니다.</h5>
	<form action="menuProc.jsp" method="post" name="menu" onsubmit="return check()">
		<table class="main_tbl">
			<tr>
				<td class="title">*아이디</td>
				<td>
					<input type="text" name="id" maxlength="4" value="<%= session.getAttribute("id")%>" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td class="title">*메인</td>
				<td>
					<input type="text" name="main">
				</td>
			</tr>
			<tr>
				<td class="title">국물</td>
				<td>
					<input type="text" name="soup">
				</td>
			</tr>
			<tr>
				<td class="title">*반찬1</td>
				<td>
					<input type="text" name="side1">
				</td>
			</tr>
			<tr>
				<td class="title">*반찬2</td>
				<td>
					<input type="text" name="side2">
				</td>
			</tr>
			<tr>
				<td class="title">*반찬3</td>
				<td>
					<input type="text" name="side3">
				</td>
			</tr>
			<tr>
				<td class="title">반찬4</td>
				<td>
					<input type="text" name="side4">
				</td>
			</tr>
			<tr>
				<td class="title">반찬5</td>
				<td>
					<input type="text" name="side5">
				</td>
			</tr>
		</table>
		
		<input type="submit" value="확인">
	</form>
</div>
</body>
</html>