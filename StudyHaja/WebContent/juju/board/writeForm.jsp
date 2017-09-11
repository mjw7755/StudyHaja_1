<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 글쓰기</title>

<script type="text/javascript" src="<%=ctx %>/SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "./SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
</script>

<link href = "./view/mystyle.css" rel = "stylesheet" type = text/css">
<script type = "text/javascript" src = "./view/script.js"></script>
</head>

<body bgcolor = "${ bodyback_c }" >
<center><b>글쓰기</b></center><br>
<form action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${ num }" >
<input type="hidden" name="ref" value="${ ref }">
<input type="hidden" name="re_step" value="${ re_step }">
<input type="hidden" name="re_level" value="${ re_level }">

<table width='1000' border='1' cellspacing='0' cellpadding='0' bgcolor="${ bodyback_c }"
align="center">

<tr>
	<td align = "right" colspan="2"  bgcolor="${ value_c }">
	<a href = "list.do"> 글목록 보기</a>
	</td>
</tr>
<tr>
	<td width="70" bgcolor = "${ value_c }" align = "center"> 이  름</td>
	<td width="330"><input type="text" size= "10" maxlenth="10" name ="writer"></td>
</tr>
<tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 제  목</td>
	<td width="330">
<!-- 	답변인것에 대한 처리 -->

<c:if test="${ num == 0 }">  <!-- 제목글 -->
	<input type= "text" size = "40" maxlength="50" name = "subject"></td>
</c:if>
<%-- <c:if test="${ num != 0 }">  <!-- 답변글 -->
	<input type= "text" size = "40" maxlength="50" name = "subject" value ="[답변] "></td>
</c:if> --%>
</tr>
<!--  --------------------------------------------------------------------------------------------- -->
<tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> EMAIL</td>
	<td width="330"><input type="text" size= "40" maxlenth="30" name ="email"></td>
</tr>
<tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 내  용</td>
	<td width="330"><textarea id="ir1" rows="13" cols="125" name = "content">
	<%
		System.out.println("dkfjakdjfkalsdf" + ctx);
	%>
	</textarea></td>
</tr>
<tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 비밀번호</td>
	<td width="330"><input type="password" size= "8" maxlenth="10" name ="passwd"></td>
</tr>
<tr>
	<td align="center" colspan="2" bgcolor="${ value_c }"">
	<input type = "submit" value = "글쓰기">
	<input type= "reset" value = "다시작성">
	<input type ="button" value = "목록보기" onclick="window.location='list.do' ">
</tr>
</table>
</form>
</body>
</html>