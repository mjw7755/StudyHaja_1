<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ include file="../view/color.jsp"%>
<!DOCTYPE html>

<html>
<head>
<title>게시판</title>
<style type="text/css">
#a_tag:hover {
color:gray;/* a선택자에 마우스 올렸을때 color gray 지정 */
}
#a_tag{
	font-weight : 800;
	text-decoration:none;
}
  #notice_list {
  	margin-top: 50px;
    margin-right: 3%;
    margin-left: 22%;
    border-top: 2px solid #4B8FCC;
    border-bottom: 2px solid #4B8FCC;
    border-collapse: collapse;
  }
	#notice_w{
	text-align: right;
	margin-top: 5%;
	margin-right: 3%;
	}
	td {
    border-bottom: 1px solid #BDBDBD;
    padding: 10px;
  }
  	#list_table{
	width:100%;
	height:63%;
	margin-bottom: 30px;
	}
	#subject2{
	    width: 80%;
	}
	#num{
	width: 50px;
    font-style: inherit;
    color: #4B8FCC;
    font-weight: 600;
	}
	#listpage{
	text-align: right;
    margin-right: 3%;
	}
	#focus a{
	color: #4B8FCC;
	}
	
	/* -------left box css------- */	
	#box_board{
	border: 2px solid #4B8FCC;
	}
	#box_notice a{
    display: block;
    text-align: center;
    font-size: 20px;
}
	#box_board a{
    display: block;
    text-align: center;
    font-size: 20px;
}
	#box{
	margin-top: 4.5%;
    margin-left: 5%;
    float: left;
    border: 1px solid gray;
    border-collapse: collapse;
	}
	#box tr{
	height: 60px;
	}
</style>
</head>
<!-- <link href="juju/view/mystyle.css" rel="stylesheet" type="text/css"> -->
<body >
<div>
<table id="box">
	<tr id="box_notice"><td><a href="notice_list.do" id="a_tag">NOTICE</a></td></tr>
	<tr id="box_board"><td><a href="list.do" id="a_tag">BULLETIN BOARD</a></td></tr>
</table>
</div>

<c:if test="${ check == 1 }">
<div id="notice_w">
	<a href="writeForm.do" id="a_tag">글쓰기</a>
</div>
</c:if>

<c:if test="${ count == 0 }">	
	<table id="notice_list">
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>	
</c:if>
	
<c:if test="${ count > 0 }">	
	<div id="list_table">
	<table id="notice_list">
		
	<c:forEach var="list"  items="${ list }">    		
	
		<tr>
			<td id="num">
				<c:out value="${ number }" />
				<c:set  var="number"   value="${ number - 1 }" />
			</td>
			<td id="subject2">
			
	<c:if test="${ list.re_level > 0 }">  <!-- 답변글이라면..... -->
	       <img src="images/level.gif" width="${ 5 * list.re_level  }" height="16"> 
			<img src="images/re.png"> 
	</c:if>
	<c:if test="${ list.re_level == 0 }"> 
		<img src="images/level.gif" width="${ 5 * list.re_level  }" height="16"> 
	</c:if>
	   
	  <a href="jujucontent.do?num=${list.num }&pageNum=${ currentPage }" id="a_tag">
					${ list.title }</a> 
	
	<c:if test="list.readcount >= 3">
	 	<img src="images/hot.gif" border="0" height="16"> 
	</c:if>
			</td>
			<td>${ list.reg_date }</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</c:if>

 <c:if test="${ count > 0 }"> <!--  전체 페이지의 수를 연산 -->
	    <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
		<c:set  var="startPage"  value="${ 1 }" />  <!-- 차후 수정!! -->
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
		<div id="listpage">
		<c:if test="${startPage >5 }" >
			<a href="list.do?pageNum=${ startPage-5  }" id="a_tag">[이전] </a>
		</c:if>
		<div id="focus">
		<c:forEach  var="i" begin="${startPage }" end="${ endPage }">
			<a href="list.do?pageNum=${i}" id="a_tag">[${ i }] </a>
	   </c:forEach>
		</div>
	<c:if test="${ endPage < pageCount }" >
		<a href="list.do?pageNum=${ startPage+5 }" id="a_tag">[다음] </a>
	</c:if>
	</div>
</c:if>
</body>
</html>
