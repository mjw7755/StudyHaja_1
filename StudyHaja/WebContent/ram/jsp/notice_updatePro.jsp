<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<fmt:requestEncoding value="utf-8"/>

<meta http-equiv="Refresh" content="0; url=notice_list.do?pageNum=${ pageNum }" >

  <c:if test="${ check == 0 }">
	<script type="text/javascript">
		<!--
			alert("비밀 번호가 맞지 않습니다.");
			history.go(-1);
		//-->
	</script>
  </c:if>

 <a href="javascript:history.go(-1)">[글삭제 폼으로 돌아가기]</a>