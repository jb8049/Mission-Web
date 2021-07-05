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
		
		
		return true
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
				onsubmit="return doWrite()">
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
				</table>
				<br>
				<input type="submit" value="등록"> <input id=goListBtn
					type="button" value="목록">
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