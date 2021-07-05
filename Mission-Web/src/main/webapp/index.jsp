<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">

</head>


<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>  <!-- action include  -->
	</header>
	<section>
		section부분
	</section>
	<footer>
		<!-- bottom.jsp는 지시자 include를 사용해서 넣어보자 -->
		<!-- xml, include, forward의 '/'도 web.xml과 마찬가지로 /는  -->
		<!-- http://localhost:9999/Mission-Web'/' 바로 여기!! jsp/board/list.jsp  -->
		
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>