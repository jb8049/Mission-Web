<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.jb.util.JDBCClose"%>
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

<!--
	1. form 태그로 날아오는 파라미터를 추출 (제목, 작성자, 내용)
	2. 추출된 데이터를 DB에 저장해주어야함
	3. 화면에 뭐 뜰 필요없이 목록 페이지로 가면됨 (html 코드가 필요가 없다)
	
-->
<%
 	request.setCharacterEncoding("utf-8"); // post방식으로 넘어오는 form encoding
	
	String title = request.getParameter("title");  /*클라이언트가 입력한 정보 추출*/
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insert(board);
	
//  새글등록 작성자 폼 이런 방식으로도 사용할 수 있었음, session 객체에 저장되어있으니까
//	String writer = ((UserVO)session.getAttribute("userVO")).getId(); 
	
	
%>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>
	alert('새글 등록이 완료되었습니다.')
	location.href ="list.jsp"   /* 경로 바로 이동!  */
</script>



</head>
<body>
			
</body>
</html>