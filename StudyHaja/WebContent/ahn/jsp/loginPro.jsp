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
	alert("�α��� ����");
</script> -->
<body onload="window.location.href='mainlist.do'">	
</c:if>

<c:if test="${result==0}">
<script type="text/javascript">
	alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
</c:if>

<c:if test="${result==-1}">
<script type="text/javascript">
	alert("id�� �������� �ʽ��ϴ�.");
	history.go(-1);
</script>
</c:if>
</body>
</html>