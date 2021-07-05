<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>

<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">


<script src="/Mission-Web/resources/js/myJS.js"></script>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>


<script>

	$(document).ready(function() {

		$('#goList').click(function() {
			location.href = "memberList.jsp"
		})

	})
	
	function checkBlank(){
		
		let f = document.myForm
		
		if(isNull(f.id, '아이디를 입력하세요.')){
			
			return false
		}
		
		if(isNull(f.pwd,  '비밀번호를 입력하세요.')){
			
			return false
		}
		
		
		if(isNull(f.name,  '이름을 입력하세요.')){
			
			return false
		}
		

		return true
		
		
	}
	
	
	
	
	
</script>


</head>
<body>


<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<!-- action include  -->
	</header>
	<section>

		<div align="center" >
		<h2 style="font-weight: bold;">[회원가입]</h2>
		
			<form name="myForm" id="myForm" action="singUp.jsp" method="post" onsubmit="return checkBlank()">
				<table border="1" style="width: 50%">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" size="10"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" size="10"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" size="10"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							남<input type="radio" name="type" value="M">
							여<input type="radio" name="type" value="F">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email_id" size="10">@
							<input type="text" name="email_domain" size="10">
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="tel1" size="2">-
							<input type="text" name="tel2" size="2">-
							<input type="text" name="tel3" size="2">
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" name="post" size="4"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="basic_addr"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="detail_addr"></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="회원등록">
				<input id=goList type="button" value="회원목록">
			</form>
		
		
						

		
	</div>
		
		




	</section>
	<footer>
		<!-- bottom.jsp는 지시자 include를 사용해서 넣어보자 -->
		<!-- xml, include, forward의 '/'도 web.xml과 마찬가지로 /는  -->
		<!-- http://localhost:9999/Mission-Web'/' 바로 여기!! jsp/board/list.jsp  -->

		<%@ include file="/jsp/include/bottom.jsp"%>
	</footer>
















	
</body>
</html>