<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 글쓰기</title>

</head>

<form action = "notice_writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${ num }" >  <!-- ?????????????????????????????????????????????????????????? -->

<table width='400' border='1' cellspacing='0' cellpadding='0' align="center">


<tr>
	<td width="70" align = "center"> 이  름</td>
	<td width="330"><input type="text" size= "10" maxlenth="10" name ="writer"></td>
</tr>
<tr>
	<td width="70" align = "center"> 제  목</td>
	<td width="330">
<!-- 	답변인것에 대한 처리 -->

<c:if test="${ num == 0 }">  <!-- 제목글 -->
	<input type= "text" size = "40" maxlength="50" name = "subject"></td>
</c:if>
</tr>
<!--  --------------------------------------------------------------------------------------------- -->

<tr>
	<td width="70" align = "center"> 내  용</td>
	<td width="330"><textarea rows="13" cols="40" name = "content"></textarea></td>
</tr>
<%-- <tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 비밀번호</td>
	<td width="330"><input type="password" size= "8" maxlenth="10" name ="passwd"></td>
</tr>
 --%>
 <tr>
	<td align="center" colspan="2">
	<input type = "submit" value = "확인">
	<input type= "reset" value = "다시작성">
	</td>
</tr>
</table>
</form>
</body>
</html>