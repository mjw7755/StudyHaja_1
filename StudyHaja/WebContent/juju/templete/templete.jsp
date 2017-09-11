<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="../view/color.jsp" %>

<!DOCTYPE>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿 페이지를 사용한 웹어플리케이션</title>
<style type="text/css">
	table {	margin-top: 50px;	}
</style>
</head>
<link href="../view/style.css" rel = "stylesheet" type = "text/css">

<body>
<table width="700" border="1"  cellpadding="2" cellspacing="0" align="center" >
	<tr>
		<td colspan="2">
			<jsp:include page="../module/top.jsp" flush="false" />
		</td>
	</tr>
	
	<tr>
		<td width="150" valign="top">
			<jsp:include page="../module/left.jsp"  flush="false"/>
		</td>
		<td width="150" valign="top">
			<jsp:include page="${ CONTENT }"  flush="false"/>
		</td>
	</tr>
	
	<tr>
		<td width="150" valign="top" algin="center">
			  <img src="images/logo.gif"  width="100"  height="100" flush="false" />  
		</td>
		
		<td width="600" valign="top" >
			<jsp:include page="../module/bottom.jsp"  flush="false"/>
		</td>
	</tr>
</table>

</body>
</html>
