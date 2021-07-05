<%@page import="kr.ac.kopo.board.vo.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

    	
<%--
	1. login.jsp에서 날라오는 파라미터 추출(id,password)
	2. 추출된 ID, PASSWORD에 맞는 회원의 존재여부 판단(DB, t_member)
	3. 만일 로그인 성공 시 '세션'에 회원 정보를 등록해야함
	4. 존재 여부에 따른 페이지를 이동(로그인 성공 : index.jsp, 로그인 실패 : login.jsp)
	우선순위는 jsp 태그 -> html태그 (<script></script>)
 --%>

<%

	request.setCharacterEncoding("utf-8");

	/* post방식은 body로, encoding 해주어야함  */
 	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	
	sql.append(" select * from t_member ");
	sql.append(" where id= ? and password=? ");  /* 아이디 비밀번호를 한 번에 처리 */

	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	
	ResultSet rs = pstmt.executeQuery();
		
	MemberVO member = new MemberVO();
	
	boolean check = rs.next();
	
	if(check){ /* 아이디가 존재하면 바로 입력? 비밀번호 체크는?  */
			
		member.setId(id);
		member.setPwd(password);
		
		/* 세션등록 */
		session.setAttribute("member", member);
	}
	
	JDBCClose.close(conn,pstmt);
	
%>

<script>
	
	
	if(<%=check %>){
		
		alert('로그인 되었습니다.')
		location.href="/Mission-Web/index.jsp"  /*로그인 성공  */
		
	}else{
		
		alert('로그인 실패했습니다.')
		location.href="login.jsp"
		
	}
</script>





 