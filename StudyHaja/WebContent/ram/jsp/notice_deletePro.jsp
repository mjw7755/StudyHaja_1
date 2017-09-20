<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<fmt:requestEncoding   value="utf-8" />

 <c:if test="check == 0">
		<script type="text/javascript">
			alert("비밀 번호가 맞지 않습니다.");
		</script>
</c:if>

<c:if test="check == 1">
		<meta  http-equiv="Refresh"  content="0; url=list.do?pageNum=${ pageNum }" >
</c:if>
<a href="list.do?pageNum=${ pageNum }"></a>
<br>
<a href="javascript:history.go(-1)">[글삭제 폼으로 돌아가기]</a>
<c:redirect  url="notice_list.do" />


 --%>
 
 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<meta  http-equiv="Refresh"  content="0; url=notice_list.do?pageNum=${ pageNum }" >
 