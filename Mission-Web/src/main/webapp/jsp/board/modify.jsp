<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/* modifyForm 으로 전달받은 인자를 객체에 넣고, dao로 전달 => dao에서 update */	
	
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int no = Integer.parseInt(request.getParameter("no"));  // 파라미터 get으로 받아오면 String

	BoardVO board = new BoardVO();
	
	board.setNo(no);
	board.setTitle(title);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.modify(board);
	

%>

<script>

	alert(' [${param.no}]번 수정이 완료되었습니다.');
	location.href = '/Mission-Web/jsp/board/detail.jsp?no=${param.no}'
	

</script>
