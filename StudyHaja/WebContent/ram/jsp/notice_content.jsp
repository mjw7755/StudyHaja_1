<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" type="text/css" href="ram/css/notice_content.css" />

<html>
<head>
<script type="text/javascript">

   function confirmFunction(){
      var test = confirm("정말 삭제 하시겠습니까?");

      if (test == true ) { 
         alert("삭제 되었습니다.");
         document.getElementById('delForm').submit();

      } else {
         alert("취소 되었습니다.");
         return false;
          // 취소
      }
   }
</script> 
<title>게시판</title>

</head>
<body>
<div id="content28">

<div id = "view_top">
	<div id="top_noti">
	<img src="ram/images/notice2.png"/>
	</div>
	<div id="top_subj">
<h3 align="center">${vo.subject }</h3>
	</div>
	<div id="top_canc">
<a href="notice_list.do?pageNum=${ pageNum }" id="a_tag"><img src= "ram/images/cancel.png"/></a>
	</div>
</div>

<div id="view_con">

<div id="view_info">
<ul id = "info_list">
	<li>${vo.writer }</li>
	<li>|</li>
	<li>${vo.reg_date }</li>
	<li>|</li>
	<li>조회수 : ${vo.readcount }</li>
</ul>
</div>

<div id="con_data">
${vo.content }
</div>


<c:set var="maxnum" value="${max_num}"/>
<c:if test="${vo.num!=maxnum}">
<div id="prev">
<p id="con"><a href="content.do?num=${vo.num }&pageNum=${ pageNum }&result=next" id="a_tag">
	<img src="ram/images/scroll_top3.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo3.subject }</a></p>
</div>
</c:if>

<c:if test="${vo.num==maxnum}">
<br/>
</c:if>


<c:set var="minnum" value="${min_num}"/>
<c:if test="${vo.num!=minnum}">
<div id="next">
<p id="con"><a href="content.do?num=${vo.num }&pageNum=${ pageNum }&result=previous" id="a_tag">
	<img src="ram/images/scroll_bottom3.png"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo2.subject}</a></p>
</div>
</c:if>
<c:if test="${vo.num==minnum}">
<br/>
</c:if>

</div> 
<div id="bottom_btn">
	<a href="notice_list.do?pageNum=${ pageNum }"><img src="ram/images/list.png"/ id="a_tag"></a>
   <c:if test="${sessionid eq 'admin' }">
   <a href="notice_updateForm.do?num=${ vo.num }&pageNum=${ pageNum }" id="a_tag"><img src="ram/images/change.png"/></a>
   </c:if>
   <%-- <a href="notice_deleteForm.do?num=${ vo.num }&pageNum=${ pageNum }">글 삭제</a> --%>
   <c:if test="${sessionid eq 'admin' }">
   <form action="notice_deletePro.do" name="delForm" id="delForm">
   <input type="image" src="ram/images/delete.png" name="del" id = "del" onclick="confirmFunction()" />
   
  <input type="hidden" name="num" value="${vo.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
   </form>
   </c:if>
</div>

</div>
</body>
</html>