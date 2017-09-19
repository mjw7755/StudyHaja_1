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
<c:if test="${result==1 }">
	<script>alert("수정됬습니다")</script>
	<meta http-equiv="Refresh" content="0; url=Room2.do?num=${num}&pageNum=${pageNum}">
</c:if>
<c:if test="${result!=1 }">
	<script type="text/javascript">alert("수정이 안됬습니다.");</script>
</c:if>
</body>
</html>