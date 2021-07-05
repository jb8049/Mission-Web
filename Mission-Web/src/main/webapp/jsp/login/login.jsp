<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">


<script src="/Mission-Web/resources/js/myJS.js"></script>

<script>

	/* function isNull(obj, msg){   //처음에 여기 했다가 js폴더 myJS에다가 뺌
		
		if(obj.value == ''){ 
			
			alert(msg)
			obj.focus()
			return true
		}
		
		return false
		
	} */

	function checkForm(){
		
		/*form의 name을 지정해주었음  */
		
		let f = document.loginForm
		
		if(isNull(f.id, '아이디를 입력하세요.')){ /* isNull() 메소드의 반환값이 true이면 안으로 들어가서 최종적으로 false 리턴  */
											/* isNull()이 false로 리턴되면  */
			return false  
		}
		
		if(isNull(f.password, '패스워드를 입력하세요.')){ 
			
			
			return false		
		}

		return true
		
		/* if(f.id.value == ''){
			
			alert('아이디를 입력하세요.')
			f.id.focus()
			return false
		}
		
		if (f.password.value == ''){
			
			alert('비밀번호를 입력하세요.')
			f.password.focus()
			return false
		} */
		
		
		
	}


</script>


</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>로그인</h2>
			<hr>
			<br>
			
			<form action="loginProcess_pf.jsp" method="post" onsubmit= "return checkForm()" name="loginForm">
				<table style="width: 40%">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password"></td>
					</tr>
				
				
				</table>
			
				<br>
				<input type="submit" value="로그인">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>

</body>
</html>