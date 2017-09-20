<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!-- <link rel="stylesheet" type="text/css" href="css/notice_list.css" /> -->
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 공지사항리스트 </title>
<style type="text/css">

  #notice_list {
  	margin-top:50px;
  	margin-right:3%;
    border-top: 2px solid #4B8FCC;
    border-bottom :2px solid #4B8FCC;
    border-collapse: collapse;
    float:right;
  }
  td {
    border-bottom: 1px solid #BDBDBD;
    padding: 10px;
  }
	#num{
	width: 50px;
    font-style: inherit;
    color: #4B8FCC;
    font-size: 20;
    font-weight: 600;
	}
	
	#subject2{
	    width: 80%;
	}
	#notice_w{
	text-align: right;
	margin-top: 5%;
	margin-right: 3%;
	}
	#list_table{
	width:100%;
	height: 63%;
	margin-bottom: 30px;
	}
	#listpage{
	text-align: right;
    margin-right: 3%;
	}
	#focus a{
	color: #4B8FCC;
	}
</style>
</head>

<body>
<div id="notice_w">
	<a href="notice_writeForm.do">글쓰기</a>
</div>
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
	<td id="subject2"><a href="content.do?num=${list2.num }&pageNum=${ currentPage }">
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
			<a href="notice_list.do?pageNum=${ startPage-5  }">[이전] </a>
		</c:if>

		<div id="focus">
		<c:forEach  var="i" begin="${startPage }" end="${ endPage }">
			<a href="notice_list.do?pageNum=${i}">[${ i }] </a>
	   </c:forEach>
		</div>
		
	<c:if test="${ endPage < pageCount }" >
		<a href="notice_list.do?pageNum=${ startPage+5 }">[다음] </a>
	</c:if>
		</diV>
		
</c:if>
</body>
</html>