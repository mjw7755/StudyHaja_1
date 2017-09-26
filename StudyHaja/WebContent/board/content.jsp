<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../view/color.jsp"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head><title>게시판</title>
<!-- <link href="../view/style.css" rel = "stylesheet" type = "text/css"> -->
<style type="text/css">
/* div{
	margin: auto;
} */
/* #content28{
	margin-top: 50%;
} */
#a_tag:hover {
color:gray;/* a선택자에 마우스 올렸을때 color gray 지정 */
}
#a_tag{
	font-weight : 800;
	color:#000;
	text-decoration:none;
}
#view_top{
	border: 1px solid;
	border-color: gray;
	background-color: #F8F8F8;
	height: 60px;
}
#view_con{
	border: 1px solid;
	border-color: gray;
}
#con_data{
	text-align: center;
}
#prev{
	border: 1px solid;
	border-color: gray;
}
#next{
	border: 1px solid;
	border-color: gray;
}
#view_info{
	margin-right: 15px;
}
#info_list{/* 메뉴바 스타일 지정 */
	list-style: none;
    text-align: right;
    font-size: 15px;
}
 #info_list li{
	display:inline;
	/* 메뉴바를 한줄로 보여줌 */
 	padding-left:15px;
} 
 #top_noti{
 	width:23%;
 	float:left;
 }
 #top_subj{
 	width:54%;
 	float:left;
 }
 #top_canc{
 	width:23%;
 	float:left;
 	text-align:right;
 }
 #bottom_btn{
    text-align: center;
    width: 400px;
    margin-left: 38%;
 }
 #delForm{
	 float: left;
 }
 #con{
 	margin-left: 20px;
 }
</style>
</head>

<body>
<div id="content28">

<div id = "view_top">
	<div id="top_noti">
	<img src="ram/images/notice2.png"/>
	</div>
	<div id="top_subj">
<h3 align="center">${vo.title }</h3>
	</div>
	<div id="top_canc">
<a href="list.do?pageNum=${ pageNum }" id="a_tag"><img src= "ram/images/cancel.png"/></a>
	</div>
</div>

<div id="view_con">

<div id="view_info">
<ul id = "info_list">
	<li>${vo.id }</li>
	<li>|</li>
	<li>${vo.reg_date }</li>
	<li>|</li>
	<li>조회수 : ${vo.readcount }</li>
</ul>
</div>

<div id="con_data">
${vo.content }
</div>
</div> 
<div id="bottom_btn">
	<c:if test="${ check == 1 }">
	<input type="image" src="ram/images/change.png" onclick="document.location.href='updateForm.do?num=${ vo.num }&pageNum=${ pageNum }'" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="image" src="ram/images/delete.png" onclick="document.location.href='deleteForm.do?num=${ vo.num }&pageNum=${ pageNum }'" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	
	<input type="image" src="ram/images/rep.png" onclick="document.location.href='writeForm.do?num=${ vo.num }&ref=${ vo.ref }&re_step=${ vo.re_step }&re_level=${ vo.re_level }'" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="image" src="ram/images/list.png" onclick="document.location.href='list.do?pageNum=${ pageNum }'" />
	
	</c:if>
	
	<c:if test="${ check == 0 }">
	<input type="image" src="ram/images/rep.png" onclick="document.location.href='writeForm.do?num=${ vo.num }&ref=${ vo.ref }&re_step=${ vo.re_step }&re_level=${ vo.re_level }'" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="image" src="ram/images/list.png" onclick="document.location.href='list.do?pageNum=${ pageNum }'" />
	</c:if>
</div>

</div>

<%-- <form>
<table width = "500" border = "1" cellspacing = "0" cellpadding = "0" 
bgcolor = "${ bodyback_c }" align="center">

<tr height="30">
	<td align="center" width = "125" bgcolor="${ value_c }">글번호</td>
	<td align="center" width = "125"> ${ vo.num }</td>
	
	<td align="center" width = "125" bgcolor="${ value_c }">조회수</td>
	<td align="center" width = "125">${ vo.readcount }</td>
</tr>
<tr height="30">
	<td align="center" width = "125" bgcolor="${ value_c }">작성자</td>
	<td align="center" width = "125">${ vo.id }</td>
	
	<td align="center" width = "125" bgcolor="${ value_c }">작성일</td>
	<td align="center" width = "125">${ vo.reg_date }</td>
</tr>
<tr height="30">
	<td align="center" width = "125" bgcolor="${ value_c }">글제목</td>
	<td align="center" width = "125">${ vo.title } </td>
	
	<td align="center" width = "125" bgcolor="${ value_c }">글내용</td>
	<td align="center" width = "125"><pre>${ vo.content }</pre></td>
</tr>

<tr height ="30">
	<td colspan="4" align="right" bgcolor="${ value_c }">
	<c:if test="${ check == 1 }">
	<input type="button" value="글수정" onclick="document.location.href='updateForm.do?num=${ vo.num }&pageNum=${ pageNum }'"> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type ="button" value ="글삭제" onclick="document.location.href='deleteForm.do?num=${ vo.num }&pageNum=${ pageNum }'">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	
<input type = "button" value = "답글작성" onclick="document.location.href='writeForm.do?num=${ vo.num }&ref=${ vo.ref }&re_step=${ vo.re_step }&re_level=${ vo.re_level }'">
	 <input type = "button" value ="답글작성" onclick="document.location.href='writeForm.do?num=${ vo.num }&ref=${ vo.ref }&re_step=${ vo.re_step }&re_level=${ vo.re_level }'">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "button" value ="목록 보기" onclick="document.location.href='list.do?pageNum=${ pageNum }'">
	</c:if>
	
	<c:if test="${ check == 0 }">
	<input type = "button" value ="답글작성" onclick="document.location.href='writeForm.do?num=${ vo.num }&ref=${ vo.ref }&re_step=${ vo.re_step }&re_level=${ vo.re_level }'">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "button" value ="목록 보기" onclick="document.location.href='list.do?pageNum=${ pageNum }'">
	</c:if>
	
	<c:if test = "${ result == 0 }">
	<input type = "button" value ="목록 보기" onclick="document.location.href='list.do?pageNum=${ pageNum }'">
	</c:if>
	</td>
</tr>
</table>
</form>
</center> --%>
</body>
</html>