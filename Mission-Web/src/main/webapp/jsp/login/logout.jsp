<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	session.invalidate(); // 세션 제거


%>

<script>
	alert('로그아웃 되었습니다.')
	location.href = "/Mission-Web"   /*welcome file에 index.jsp 써놓았기 때문에 이렇게만 적어도됨  */
	
</script>