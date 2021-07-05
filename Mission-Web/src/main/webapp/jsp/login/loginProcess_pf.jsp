<%@page import="kr.ac.kopo.login.vo.LoginVO"%>
<%@page import="kr.ac.kopo.login.dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%


	response.setCharacterEncoding("utf-8");
	
	// 파라미터 추출
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 객체 생성 및 초기화
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	// DB에서 로그인 수행
	LoginDAO dao = new LoginDAO();
	
	LoginVO userVO = dao.login(loginVO); /* dao.login() 메소드의 반환값을 userVO  */
	
	// userVO null이면 로그인 실패
	// uesrVO null이 아니면, 로그인 성공
	
	String msg = null;
	String url = null;
	
	if(userVO == null){
		msg = "아이디 또는 패스워드를 잘못입력하셨습니다.";
		url = "/Mission-Web/jsp/login/login.jsp";
		
	}else{
		msg = userVO.getName() + "님 환영합니다.";
		url = "/Mission-Web/index.jsp";
		
		// 로그인 성공 시 session에 등록
		session.setAttribute("userVO", userVO);
		
	}
	
//	response.sendRedirect(url); 이 방식은 가능함, 자바스크립트가 깔끔함
	
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);  /*포워드, 인클루드 web.xml의 슬래쉬는.. Mission-Web/이다.  */
	
%>

<script>
	alert('${ msg }')
	location.href = '${ url }'

</script>









