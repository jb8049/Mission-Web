<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.jb.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.jb.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%
	
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAll();
	pageContext.setAttribute("list", list);

 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>

	$(document).ready(function(){
		
		$('#addBtn').click(function(){
			
			/*이 버튼 클릭하면 글을쓸 수 있는 곳으로 이동시켜야함 location 객체 이용 콘솔 찍어보면 나옴 */
			location.href = "writeForm.jsp"
			
		})
		
	
	})
	
	/*자바스크립트는 웹 브라우저가, jstl은 서버가 해석, 클라이언트가 요청을 하면, 서버가 먼저 자기 jsp에서 jstl을 해석해가지고 */
	function doAction(no){  /* document 안에서 밖으로 빼니까 작동됨 */

		/* 로그인 되어있는 경우에만 가능 */
		<c:choose>
		<c:when test="${ not empty userVO }">
			location.href = 'detail.jsp?no='+ no + '&type=list'; /* detail에서 조회수 올려줄 때, 리스트에서 접근하는 경우만 */
		</c:when>
		<c:otherwise>
			if(confirm('로그인이 필요한 서비스입니다\n로그인페이지로 이동하시겠습니까?'))
				location.href = "/Mission-Web/jsp/login/login.jsp"
		</c:otherwise>
	</c:choose>
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
			<h2>게시판 목록</h2>
			<hr width="80%">
			<br>
			<table style="width: 100%" id="list">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">작성자</th>
					<th width="20%">등록일</th>
				</tr>

				<%-- list[0].no 에서 list[0]를 변수화 + html 주석을 사용하면 태그가 섞여서 이상하게 나올 수 있음
				<c:forEach items="${ list }" var="board">
				이렇게 써주면, <c:set var="board" value="${list[0]}"을 의미 --%>

				<c:forEach items="${ list }" var="board" varStatus="loop">
					<tr <c:if test="${ loop.index mod 2 ne 0 }">class="odd"</c:if>> <!--한 행에 적용 -->
						<td>${ board.no }</td>
						<td>
							<%-- <a href="detail.jsp?no=${board.no}"> --%>  <!--'로그인을 한 경우에만' 이라는 조건을 넣어주기 위해 doAction() 메소드를 쓰자 -->
							<!-- <a href="#" onclick="doAction()"> -->
							
							 <a href="javascript:doAction(${board.no})">   <!-- onclick을 안쓴 이유??, 상세 게시물 조회에 필요한 board.no넘김 -->
								 <c:out value="${ board.title }" />	  <!-- EL 해석 후, 자바스크립트가 실행됨!!! 해석 순서 매우 중요함 -->
							</a>										  <!-- 자바스크립트에서 set태그를 사용할 수 없다?-->
						</td>
						<td><c:out value="${ board.writer }" /></td>
						<td><c:out value="${ board.regDate }" /></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty userVO }">
				<button id="addBtn">새글등록</button>
			</c:if>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp"%>
	</footer>
</body>
</html>

