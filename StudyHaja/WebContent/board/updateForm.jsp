<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../view/color.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 글쓰기</title>
<link href = "./view/mystyle.css" rel = "stylesheet" type = text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/view/script.js"></script>

<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<!-- 답변글의 경우 : 부모글의 글번호, 그룹화번호, 그룹화내의 순서, 들여쓰기  
		<=== content.jsp 페이지에서 넘어옴.....
-->
<body bgcolor = "${ bodyback_c }">
<center><b>글 수정하기</b></center><br>
<form action = "updatePro.do?pageNum=${ pageNum }" method="post" name = "updateForm" onsubmit="return updateSave()">

<table width='935' border='1' cellspacing='0' cellpadding='0' bgcolor="${ bodyback_c }"
align="center">
<input type="hidden"  name ="id" value="${ vo.id }">
<input type="hidden" name="num" value="${ vo.num }">
<tr>
	<td align = "right" colspan="2"  bgcolor="${ value_c }">
	<a href = "list.do"> 글목록 보기</a>
	</td>
</tr>
<tr>
</tr>

<tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 제  목</td>
	<td width="330">
<!-- 	답변인것에 대한 처리 -->
<input type= "text" size = "40" maxlength="50" name = "title" value = "${ vo.title }"></td>
</tr>

<tr>
	<td width="70" bgcolor = "${ value_c }"" align = "center"> 내  용</td>
	<td width="330"><textarea rows="13" cols="40" name = "content" id="content" style="width:766px; height:412px; display:none;">${ vo.content }</textarea></td>
</tr>
<tr>
	<td align="center" colspan="2" bgcolor="${ value_c }"">
	<input type = "submit" value = "글수정" onclick="submitContents(this)">
	<input type= "reset" value = "다시작성">
	<input type = "button" value = "목록보기" onclick="windows.location='list.do?pageNum=${ pageNum }'">
</tr>

</table>
</form>

<script type="text/javascript">
			//form변수로 지정하여 이미지업로드 페이지에서 호출하여 사용됨. form.filepath.value
	
					var oEditors = [];
				
					nhn.husky.EZCreator.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "content",
						sSkinURI : "<%=request.getContextPath()%>/editor/SmartEditor2Skin.html",
						htParams : {
							bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							fOnBeforeUnload : function() {
								alert("사진 업로드 됨");
							}
						}
						//fCreator : "createSEditor2"
					});

				function pasteHTML(filepath) {
						alert(document.getElementById("content").value);
						var sHTML = '<img src="<%=request.getContextPath()%>/editor/upload/'+filepath+'">';
						oEditors.getById["content"].exec("PASTE_HTML",	[ sHTML ]);
					}

					//이미지삽입 - 업로드 완료페이지에서 호출됨.
				function insertIMG(fname){
						var filepath = form.filepath.value;
						var sHTML = "<img src='" + filepath + "/" + fname + "' style='cursor:hand;' border='0'>";  
						// filepath 는 변수처리 혹은 직접 코딩해도 상관없음. 
						// imageUpload.asp 에서 insertIMG 호출시 경로를 포함하여 넣어주는 방법을 추천.
					oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
					}

					function submitContents(elClickedObj) {

						oEditors.getById["content"].exec(
								"UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

						// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
						var content = $('#content')
						if(content.val() == '<br>')
							content.val('');
					}
 		</script>


</body>
</html>