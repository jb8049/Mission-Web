<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!--
  http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=2
-->

<!-- 
1. 내가 조회하려고하는 게시물 번호를 추출, request
2. 추출된 게시물 번호를 통해서 DB에가서 추출한 번호에 해당하는 값을 가져와야함 
3. 조회된 게시물 데이터를 화면에 출력
-->

<%
	
	// 게시물 번호 추출, getParameter 리턴값은 String형
	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String type = request.getParameter("type");  /* 전체리스트에서 클릭한 경우에만!  */
	
	BoardDAO dao = new BoardDAO();
	
	BoardVO board = dao.selectOne(boardNo); // dao.selectOne()의 반환값이 BoardVO

	if( type != null && type.equals("list")){
		
	// 조회수 증가, detail 클릭하면 해당 게시물 번호에 해당하는 게시글의 조회수를 +1
		dao.viewCount(board);
	}
	
	// 2-3 t_board_file 테이블에서 게시물의 첨부파일 조회, 몇 번 게시글의 파일?
	List<BoardFileVO> fileList = dao.selectFileByNo(boardNo);
	
	
	pageContext.setAttribute("board", board);
	
	pageContext.setAttribute("fileList", fileList);
	
	
	
	
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">

<script>

	function goMemberList(){
		
		location.href="list.jsp"
	}
	

</script>


</head>
<body>

	
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>  <!-- action include  -->
	</header>
	<section>
		
		<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		
		<br>
		<table border ="1" style="width: 80%" id="list">
		
			<tr>
				<th width="25%">번호</th> 
				<td><c:out value="${ board.no }" /></td>  <!-- no 컬럼이 가지고 있는 값을 넣자  -->
			</tr>
			<tr>
				<th width="25%">제목</th> 
				<td><c:out value="${ board.title }" /></td>
			</tr>
			<tr>
				<th width="25%">작성자</th> 
				<td><c:out value="${ board.writer }"/></td>
			</tr>
			<tr>
				<th width="25%">내용</th> 
				<td><c:out value="${ board.content }"/></td>
			</tr>
			<tr>
				<th width="25%">조회수</th> 
				<td><c:out value="${ board.viewCnt }"/></td>
			</tr>
			<tr>
				<th width="25%">등록일</th> 
				<td><c:out value="${ board.regDate }"/></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:forEach items= "${ fileList }" var="file">
						<a href="/Mission-Web/upload/${ file.fileSaveName }" download>  <!--elipse-work폴더에 저장된 이미지들 -->
						<c:out value="${ file.fileOriName }" />
						</a>
						( ${ file.fileSize } bytes)
						<br>
					</c:forEach>
				</td>
			</tr>
		
		
		</table>
		<br>
		<input type="button" onclick="goMemberList()" value="게시판 목록">
	 	<!-- remove에서 해당 게시판 번호를 인식해야함 -->
		<c:if test="${ board.writer eq userVO.id }">
			<a href="modifyForm.jsp?no=${ board.no }"><input type="button" value="수정"></a>
			<a href="remove.jsp?no=${ board.no }"><input type="button" value="삭제"></a>
		</c:if>

	</div>

	</section>
	<footer>
		<!-- bottom.jsp는 지시자 include를 사용해서 넣어보자 -->
		<!-- xml, include, forward의 '/'도 web.xml과 마찬가지로 /는  -->
		<!-- http://localhost:9999/Mission-Web'/' 바로 여기!! jsp/board/list.jsp  -->
		
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
	
	


	
</body>
</html>