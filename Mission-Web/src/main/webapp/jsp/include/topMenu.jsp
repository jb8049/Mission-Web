<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="width: 50px">
			<img width="200px" src="/Mission-Web/resources/img/logo.jpg"> 
		</td>
		<td align="right">
			즐겨찾기
			<c:if test="${ not empty userVO }">  <!-- 로그인 성공하면, session 공유 영역에 userVO 객체를 등록하니까  -->
				[${ userVO.name }]님으로 로그인 중...
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${ userVO.type eq 'S' }">
					회원관리 ||
				</c:if>
				<a href="/Mission-Web/jsp/board/list.jsp">게시판</a> ||
				<c:choose>
					<c:when test="${ empty userVO }">
						<a href="/Mission-Web/jsp/member/siginUpForm.jsp">회원가입</a>||
						<a href="/Mission-Web/jsp/login/login.jsp">로그인</a>||
					</c:when>
					<c:otherwise>
						마이페이지 ||
						<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</td>
	</tr>
</table>
    
	
    
    
    
   	