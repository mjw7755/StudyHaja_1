<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" type="text/css" href="ram/css/notice_update.css" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 글쓰기</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/ram/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
	
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=request.getContextPath()%>/ram/se2/SmartEditor2Skin.html",  
          fCreator: "createSEditor2"
      });
      //저장버튼 클릭시 form 전송
      $("#btnRegister").click(function(){
          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm2").submit();
      });   
      
     
});
function pasteHTML(filepath){
     var sHTML = '<img src="<%=request.getContextPath()%>/ram/se2/upload/'+filepath+'">'; 
/* var sHTML = '<img src="C:/Users/AHN/git/StudyHaja_1/StudyHaja/WebContent/ahn/se2/upload/'+filepath+'">'; */ 
       oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
   }
</script>

</head>
<!-- 답변글의 경우 : 부모글의 글번호, 그룹화번호, 그룹화내의 순서, 들여쓰기  
		<=== content.jsp 페이지에서 넘어옴.....
-->
<body>
<form action = "notice_updatePro.do?pageNum=${ pageNum }" method="post" id="frm2" name = "updateForm" onsubmit="return writeSave()">
<center>
<table>
<th colspan="2"><h3>공지사항 작성</h3></th>
<tr>
	<td id="sub"> 이  름</td>
	<td>${ vo.writer }
		<input type="hidden" name="num" value="${ vo.num }"></td>
	</td>
	
</tr>
<tr>
	<td id="sub"> 제  목</td>
	<td>
<!-- 	답변인것에 대한 처리 -->
<input type= "text" id="text" name = "subject" value = "${ vo.subject }"></td>
</tr>

<tr>
	<td colspan="2" id="text2"><textarea id = "content"  name = "content" style="width:100%; height: 400px; ">${ vo.content }</textarea></td>
</tr>
 <tr>
	<td align="center" colspan="2">
	<input type="image" src="ram/images/change.png" id="btnRegister" />
	</td>
</tr>
<%-- <tr>
	<td align="center" colspan="2" >
	<input type = "submit" value = "글수정" id="btnRegister">
	<p><a href="notice_list.do?pageNum=${ pageNum }">목록목록</a></p>
</tr> --%>
</table>
</center>
</form>
</body>
</html>