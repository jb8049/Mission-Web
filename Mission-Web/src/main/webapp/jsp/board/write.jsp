<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
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

	String saveDirectory = "C:\\Lecture\\web-workspace\\Mission-Web\\src\\main\\webapp\\upload";
 	// deploy할 때 올바른 위치는.. C:\\Lecture\\eclipse-work\\wtpwebapps\\Mission-Web\\upload 원래 여긴데 (웹에서 보여주는 부분)
 
	MultipartRequest MultiRequest = new MultipartRequest(
			
															request,
															saveDirectory,
															1024 * 1024 * 3,
															"utf-8",
															new KopoFileNamePolicy()
															
			);
	
	
	// 1. 게시글 저장 (t_board)
	String title = MultiRequest.getParameter("title");
	String writer = MultiRequest.getParameter("writer");
	String content = MultiRequest.getParameter("content");
	
	BoardDAO dao = new BoardDAO();
	
	// 게시물 번호 추출, dao.selectNo()는 게시글의 pk가 될 번호를 추출하는 것
	int boardNo = dao.selectNo();
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setNo(boardNo);
	
	dao.insert(board); // 작성된 게시글 DB에 등록
	
	//파일에 대한 정보도 DB에 등록해야하는데, L자형 때문에 테이블을 분리했음
	
	//2. 첨부파일 저장 (t_board_file)
 	Enumeration files =MultiRequest.getFileNames();
	
	while(files.hasMoreElements()){
			
		String fileName = (String) files.nextElement();
		
		// fileName에 저장되는 값은 writeForm에서 입력한 첨부파일의 name => attachfile1 
		// System.out.println(fileName);
		
		// attachfile1을 File 객체로 저장, 만약 아무것도 없으면 null임
		// File 객체를 통해 oriname, savename, filesize를 알아냄
		File f = MultiRequest.getFile(fileName);
		
		if(f != null){
			
			String fileOriName = MultiRequest.getOriginalFileName(fileName);
			String fileSaveName = MultiRequest.getFilesystemName(fileName);
			int fileSize = (int)f.length(); // 파일의 크기, length는 long형 리턴
			
			// System.out.println(fileOriName + " : " + filesaveName);
			
			// VO객체에 값을 넣어주고, DAO에 저장해줘~ 라고 해야함
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo);
			
			dao.insertFile(fileVO);
		}
		
		
	}
	

	
	
%>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>
	alert('새글 등록이 완료되었습니다.')
	location.href ="list.jsp" /* 경로 바로 이동! */
</script>



</head>
<body>
			
</body>
</html>