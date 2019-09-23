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
		if(!document.join.id.value){
            alert("아이디(학번)를 입력하세요.");
            return false;
        }
		
		var id = document.join.id.value;
		id *= 1;
		
		if(id < 1101 || id > 3620){
            alert("올바른 아이디(학번)를 입력하세요.");
            return false;
        }
        
        if(!document.join.pw.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        if(document.join.pw2.value != document.userInfo.passwordcheck.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        
        if(!document.join.name.value){
            alert("이름을 입력하세요.");
            return false;
        }
	}
</script>
</head>
<body>
<div class="box">
	<h2>회원가입</h2>
	<form action="joinProc.jsp" method="post" name="join" onsubmit="return check()">
		<table class="main_tbl">
			<tr>
				<td class="title">아이디(학번)</td>
				<td class="text">
					<input type="text" name="id" maxlength="4">
				</td>
			</tr>
			<tr>
				<td class="title">비밀번호</td>
				<td>
					<input type="password" name="pw">
				</td>
			</tr>
			<tr>
				<td class="title">비밀번호 확인</td>
				<td>
					<input type="password" name="pw2">
				</td>
			</tr>
			<tr>
				<td class="title">이름</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td colspan="2" height="100px"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>