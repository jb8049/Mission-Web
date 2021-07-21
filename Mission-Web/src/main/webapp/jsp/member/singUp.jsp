<%@page import="kr.ac.kopo.member.dao.memberDAO"%>
<%@page import="kr.ac.kopo.member.vo.memberVO"%>
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

<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css">


<!-- name으로 request 객체를 통해 받아옴  -->

<%
	/*post방식 한글이 입력된 경우 인코딩  */
	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	String email_id = request.getParameter("email_id");
	String email_domain = request.getParameter("email_domain");
	
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	String post  = request.getParameter("post");
	String basic_addr = request.getParameter("basic_addr");
	String detail_addr = request.getParameter("detail_addr");
	String[] type = request.getParameterValues("type");  /*type[0].equals ="M" or "F"  */
	
	// 등록일자는 DB에 insert할 때 넣음, 사용자가 입력하는게 아니니까
	memberVO member = new memberVO(id, name, pwd,email_id, email_domain, tel1,tel2,tel3,post, basic_addr, type[0],detail_addr);
	
	memberDAO dao = new memberDAO();
	
	dao.signUp(member);
	
	pageContext.setAttribute("member", member);
	
	
%>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>

	alert('회원등록이 완료되었습니다.')
	alert(${member.name} + '님 가입을 환영합니다.')
	location.href = "/Mission-Web/jsp/login/login.jsp"
	
</script>




</head>


<body>

</body>
</html>