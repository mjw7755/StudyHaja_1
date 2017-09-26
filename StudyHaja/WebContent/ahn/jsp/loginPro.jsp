<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result==1}">
<!-- <script type="text/javascript">
	alert("로그인 성공");
</script> -->
<body onload="window.location.href='mainlist.do'">	
</c:if>

<c:if test="${result==0}">
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>
</c:if>

<c:if test="${result==-1}">
<script type="text/javascript">
	alert("id가 존재하지 않습니다.");
	history.go(-1);
</script>
</c:if>
</body>
</html>