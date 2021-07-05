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
		
		if(isNull(f.password,  '비밀번호를 입력하세요.')){
			
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

	<div align="center" >
		<h2 style="font-weight: bold;">[회원가입]</h2>
		<hr>
		<div align="left" style=" width: 500px; border: 1px solid; padding: 30px;" >
		<form name="myForm" id="myForm" action="singUp.jsp" method="post" onsubmit="return checkBlank()">
			*아이디 : <input type="text" name="id" size="10"><br>
			<br>
			 *비밀번호 : <input type="password" name="pwd" size="10"><br> <br>
			*이름 : <input type="text" name="name" size="10"><br>
			<br> *성별 : 남<input type="radio" name="type" value="M">
						여<input type="radio" name="type" value="F"><br>
			<br> *이메일 : <input type="text" name="email_id" size="10">@<input
				type="text" name="email_domain" size="10"><br>
			<br> *전화번호 : <input type="text" name="tel1" size="2">-<input
				type="text" name="tel2" size="2">-<input type="text" name="tel3" size="2"><br>
			<br> *우편편호 : <input type="text" name="post" size="4">&nbsp;
			<button>우편번호 찾기</button>
			<br>
			<br> *주소 : <input type="text" name="basic_addr"><br>
			<br> *상세주소 : <input type="text" name="detail_addr"><br>
			<div align="center">
				<br> 
				<input type="submit" value="회원등록"> 
				<input id=goList type="button" value="회원목록">
			</div>
		 </form>
		 </div>
	</div>
</body>
</html>