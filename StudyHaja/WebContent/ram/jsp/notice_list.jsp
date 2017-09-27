<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<link rel="stylesheet" type="text/css" href="ram/css/notice_list.css" />

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 공지사항리스트 </title>

</head>

<body>
<div id="n_list">
<div>
<table id="box">
	<tr id="box_notice"><td><a href="notice_list.do" id="a_tag">NOTICE</a></td></tr>
	<tr id="box_board"><td><a href="list.do" id="a_tag">BULLETIN BOARD</a></td></tr>
</table>
</div>

<c:if test="${sessionid eq 'admin' }">
<div id="notice_w">
	<a href="notice_writeForm.do" id="a_tag">글쓰기</a>
</div>
</c:if>
<!-- <table width="700">
		<tr>
			<td align="right">
				<a href="notice_writeForm.do">글쓰기</a>
			</td>
		</tr>
</table> -->
<div id="list_table">
<table id="notice_list" >
<c:forEach var="list2" items="${list2}">
<tr>
	<td id="num">${list2.num }</td>
	<td id="subject2"><a href="content.do?num=${list2.num }&pageNum=${ currentPage }&result=just" id="a_tag">
					${ list2.subject }</a> </td>
	<td>${list2.reg_date }</td>
</tr>
</c:forEach>
</table>
</div>
 <c:if test="${ count > 0 }"> <!--  전체 페이지의 수를 연산 -->
	    <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
		<c:set  var="startPage"  value="${ 1 }" /> 
		<c:set  var="pageBlock"  value="${ 5 }" />
		
		<fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" />
		<c:if  test="${ currentPage % pageBlock != 0 }" > 
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
		</c:if>
		
		<c:if  test="${ currentPage % pageBlock == 0 }" > 
			<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
		</c:if>
	
		<c:set  var="endPage"  value="${ startPage + pageBlock -1 }" />

		<c:if test="${ endPage > pageCount }" >
			<c:set  var="endPage"  value="${ pageCount }" />
		</c:if>
		
		<diV id="listpage">
		<c:if test="${startPage >5 }" >
			<a href="notice_list.do?pageNum=${ startPage-5  }" id="a_tag">[이전] </a>
		</c:if>

		<div id="focus">
		<c:forEach  var="i" begin="${startPage }" end="${ endPage }">
			<a href="notice_list.do?pageNum=${i}" id="a_tag" data-bg="red">${ i } </a>
	   </c:forEach>
		</div>
		
	<c:if test="${ endPage < pageCount }" >
		<a href="notice_list.do?pageNum=${ startPage+5 }" id="a_tag">[다음] </a>
	</c:if>
		</diV>
		
</c:if>
</div>

</body>
</html>