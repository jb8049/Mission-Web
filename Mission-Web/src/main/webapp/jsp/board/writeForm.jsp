<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>

	if('${ userVO }' == ''){  /* userVO 빈칸이면, 새글등록 버튼을 없앰 */
		
		location.href ="/Mission-Web/jsp/login/login.jsp"
		
	}
	
	$(document).ready(function(){
		
		$('#goListBtn').click(function(){
										/*콜백 함수가 실행되면 해당 경로로 이동하겠다 */
			location.href = "list.jsp"  /*같은 경로에 있어서 그냥 써주면 됨 */
			
			
		})
		
		
	})
	
	function doWrite(){
		
		let f = document.writeForm
		
		if(f.title.value == ''){    // title에 입력한 값 => value
			
			alert('제목을 입력하세요.')
			f.title.focus()
			return false
		}
		
		/* if(f.writer.value == ''){
			
			alert('작성자를 입력하세요.')
			f.writer.focus()
			return false
		} */
		
		if(f.content.value ==''){
			
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		// 파일 확장자 체크
		if(checkExt(f.attachfile1)){   /* 확장자 위반 시 true로 실행  */
			
			return false 
		}
		
		/* if(checkExt(f.attachfile2)){
			
			return false
		} */
		
		return true
	}
	
	function checkExt(obj) {
		
		/* 업로드한 파일의 확장자를 체크해서 업로드가 가능한지 확인 */
		
		let forbidName = ['exe', 'java', 'jsp', 'js', 'class']
		let fileName = obj.value
		
		// fileName = obj.value /*콘솔창에서 확장자만 뽑아내기 */
		// console.log(fileName)
		
		let ext = fileName.substring(fileName.lastIndexOf('.')+1)
		
		
		for(let i = 0; i< forbidName.length; i++){
			
			if(forbidName[i] == ext){  /* forbidName의 확장자와 동일하면,  */
				
				alert(ext + ' 확장자는 파일업로드 정책에 위배됩니다.')
				return true
				
			}
			
		}

		 
		return false
	}



</script>

<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">

</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<!-- action include  -->
	</header>
	<section>

		<div align="center">
			<hr width="80%">
			<h2>게시글 등록폼</h2>
			<hr width="80%">

			<form action="write.jsp" method="post" name="writeForm"
				onsubmit="return doWrite()" enctype="multipart/form-data">
				<input type="hidden" name="writer" value="${ userVO.id }">
				
				<!--onsubmit이라는 속성을 활용해서 빈 칸 제어 , name도 추가-->
				<table border="1" style="width: 80%">
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" size="60" name="title"></td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td>
							<%-- <input type="text" size="60" name="writer" value="${userVO.id }" readonly> --%>
							<c:out value= "${ userVO.id }" />
						</td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td><textarea rows="8" cols="60" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="attachfile1">
							<input type="file" name="attachfile2">
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="등록"> 
				<input id=goListBtn type="button" value="목록">
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