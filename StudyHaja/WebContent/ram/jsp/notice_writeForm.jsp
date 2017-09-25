<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!-- <link rel="stylesheet" type="text/css" href="ram/se2/css/smart_editor2.css" /> -->
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항 글쓰기</title>
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
          $("#frm").submit();
      });   
      
     
});
function pasteHTML(filepath){
     var sHTML = '<img src="<%=request.getContextPath()%>/ram/se2/upload/'+filepath+'">'; 
/* var sHTML = '<img src="C:/Users/AHN/git/StudyHaja_1/StudyHaja/WebContent/ahn/se2/upload/'+filepath+'">'; */ 
       oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
   }
</script>

<style type="text/css">
#sub {
	color: #4B8FCC;
    font-weight: 600;
    width: 60px;
}
#text2{
	width:600px;
}
#text {
    -webkit-border-radius: 3px;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    transition: all 0.5s ease;
    background-color: white;
    border: 2px solid #C8C8C8;
    color: #777;
    font: 13px Helvetica, Arial, sans-serif;
    margin: 0 0 10px;
    padding: 10px 10px 15px 40px;
    width: 600px;
    
}
#text:focus {
    -webkit-box-shadow: 0 0 2px #4b8fcc inset;
    -moz-box-shadow: 0 0 2px #4b8fcc inset;
    -ms-box-shadow: 0 0 2px #4b8fcc inset;
    -o-box-shadow: 0 0 2px #4b8fcc inset;
    box-shadow: 0 0 2px #4b8fcc inset;
    background-color: #FFF;
    border: 1px solid #4b8fcc;
    outline: none;
}


</style>
</head>
<center>
<form action = "notice_writePro.do" method="post"  id = "frm" name = "writeform" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${ num }" >  <!-- ?????????????????????????????????????????????????????????? -->

<table id="tab" >
<th colspan="2"><h3>공지사항 작성</h3></th>
<!-- <tr>
	<td id="sub"> 이  름</td>
	<td><input type="text" name ="writer" id="text"></td>
</tr> -->
<tr>
	<td id="sub"> 제  목</td>
	<td>
<!-- 	답변인것에 대한 처리 -->

<c:if test="${ num == 0 }">  <!-- 제목글 -->
	
	<input type= "textarea"  name = "subject" id="text"></td>
</c:if>
</tr>

<tr>
	<!-- <td align = "center" id="sub"> 내  용</td> -->
	<!-- <textarea id = "contents" name = "contents" maxlength="4000"></textarea> -->
	<td colspan="2" id="text2"><textarea id = "content"  name = "content" style="width:100%; height: 400px; "></textarea></td>
	
</tr>
<%-- <tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 비밀번호</td>
	<td width="330"><input type="password" size= "8" maxlenth="10" name ="passwd"></td>
</tr>
 --%>
 <tr>
	<td align="center" colspan="2">
	<!-- <input type = "submit" value = "확인" id="btnRegister"> -->
	<input type="image" src="ram/images/write.png" id="btnRegister" />
	</td>
</tr>
</table>
</form>
<center>
</body>
</html>