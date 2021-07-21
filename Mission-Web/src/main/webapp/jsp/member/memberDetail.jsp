<%@page import="kr.ac.kopo.member.dao.memberDAO"%>
<%@page import="kr.ac.kopo.member.vo.memberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.jb.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">



<%
	String id = request.getParameter("id");

	// 해당 아이디의 회원 정보가 입력된 객체를 반환받는다
	memberVO member = new memberVO();
	
	memberDAO dao = new memberDAO();

	member = dao.selectOne(id);
	
	// 해당 회원의 정보가 memberVO 객체인 member에 저장됨
	
	pageContext.setAttribute("member", member);
	

%>

<script>

	function goMemberList(){
		
		location.href ="memberList.jsp";
		
	}

</script>



</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<!-- action include  -->
	</header>
	<section>
		<div align="center">
		<h2 style="font-weight: bold">[회원 상세 정보]</h2>
		<hr>
		<table>
			<tr>
				<th>아이디</th><td>${member.id }</td>
			</tr>
			<tr>
				<th>이름</th><td>${member.name }</td>
			</tr>
			<tr>
				<th>비밀번호</th><td>${member.password }</td>
			</tr>
			<tr>
				<th>이메일</th><td>${member.email }</td>
			</tr>
			<tr>
				<th>전화번호</th><td>${member.telphone }</td>
			</tr>
			<tr>
				<th>우편번호</th><td>${member.post }</td>
			</tr>
			<tr>
				<th>주소</th><td>${member.addr }</td>
			</tr>
			<tr>
				<th>성별</th><td>${member.type }</td>
			</tr>
			<tr>
				<th>등록일자</th><td>${member.regDate }</td>
			</tr>

		
		</table>
	
		<br>
		<input type="button" onclick="goMemberList()" value=회원목록>
	</div>
		

	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp"%>
	</footer>















	

</body>
</html>