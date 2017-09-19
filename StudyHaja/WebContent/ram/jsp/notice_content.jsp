<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>


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
<style type="text/css">
/* div{
	margin: auto;
} */
/* #content28{
	margin-top: 50%;
} */

#view_top{
	border: 1px solid;
	border-color: gray;
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
</style>
</head>

<div id="content28">

<div id = "view_top">
<h3 align="center">${vo.subject }</h3>
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

<div id="prev">
<p><a href="#">△ 이전내용</a></p>
</div>
<div id="next">
<p><a href="#">▽ 이후내용</a></p>
</div>
</div>
<p><a href="notice_list.do?pageNum=${ pageNum }">목록</a>
   <a href="notice_updateForm.do?num=${ vo.num }&pageNum=${ pageNum }">글 수정</a>
   <%-- <a href="notice_deleteForm.do?num=${ vo.num }&pageNum=${ pageNum }">글 삭제</a> --%>
   
   <form action="notice_deletePro.do" name="delForm" id="delForm">
   <input type ="button" value ="게시물 삭제" name="del" id = "del" onclick="confirmFunction()">
  <input type="hidden" name="num" value="${vo.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
   </form>
</p>

</div>
</body>
</html>