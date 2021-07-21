<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();

	BoardVO board = dao.modifyChk(no);
	
	pageContext.setAttribute("board", board);  /* 여기서 board는 선택한 게시글의 정보가 담겨있음 */
	
	
	/*객체를 받아와서 객체 내용을 폼에 두기, 수정 버튼 누르면, db에 내용 업데이트*/
%>
    
    
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
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<!-- action include  -->
	</header>
	<section>

		<div align="center">
			<hr width="80%">
			<h2>게시글 등록폼</h2>
			<hr width="80%">

			<form action="modify.jsp" method="post" name="modifyForm"
				onsubmit="return doWrite()">
				<input type="hidden" name="writer" value="${ userVO.id }">
				<input type="hidden" name="no" value="${ board.no }">   <!--해당 게시물의 번호(PK도 함께 넘겨줘야함)  -->
				
				<!--onsubmit이라는 속성을 활용해서 빈 칸 제어 , name도 추가-->
				<table border="1" style="width: 80%">
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" size="60" name="title" value="${ board.title }"></td>
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
						<td><textarea rows="8" cols="60" name="content">${ board.content }</textarea></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="수정"> 
			</form>

		</div>




	</section>
	<footer>

		<%@ include file="/jsp/include/bottom.jsp"%>
	</footer>













</body>
</html>




