<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/ahnButton.css">
<link rel="stylesheet" href="ahn/css/ahnText.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/ahn/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<!-- Smart Editor -->
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "contents", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=request.getContextPath()%>/ahn/se2/SmartEditor2Skin.html",  
          fCreator: "createSEditor2"
      });
      //저장버튼 클릭시 form 전송
      $("#btnCafe").click(function(){
          oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });   
      
     
});
function pasteHTML(filepath){
       var sHTML = '<img src="<%=request.getContextPath()%>/ahn/se2/upload/'+filepath+'">';
       oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
   }
</script>
</head>
<center>
<body>
<form action="cafeupdatePro.do?pageNum=${pageNum }" id = "frm" method="post">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="r_no" value="${r_no }">
	<table border="1" class="mytable">
		<tr>
			<th scope="row" style="min-width:100px;"><font color="red" size="2em">* </font>이 름 </th>
			<td><input type="text" name="subject"  id="subject" size=60 class="textbox1" value="${list.subject }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>메인 사진 </th>
			<td><input type="text" name="images" id="images" size=60 class="textbox1" value="${list.images }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>주 소 </th>
			<td><input type="text" name="address"  id="address" size=60 class="textbox1" value="${list.address }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>지 역 </th>
			<td><input type="text" name="area"  id="area" size=60 class="textbox1" value="${list.area }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>위 치 </th>
			<td><input type="text" name="location"  id="location" size=60 class="textbox1" value="${list.location }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>이용 요금 </th>
			<td><input type="text" name="pay"  id="pay" size=60 class="textbox1" value="${list.pay }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>태그 옵션들 </th>
			<td><input type="text" name="options"  id="options" size=60 class="textbox1" value="${list.options }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>휴무일 </th>
			<td><input type="text" name="c_day"  id="c_day" size=60 class="textbox1" value="${list.c_day }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>운영 시간 </th>
			<td><input type="text" name="working_hour"  id="working_hour" size=60 class="textbox1" value="${list.working_hour }"></td>
		</tr>
		<!-- <tr>
			<th scope="row"><font color="red" size="2em">* </font>상세사진 </th>
			<td><input type="text" name="textarea"  id="textarea" size=60 class="textbox1"></td>
		</tr>
		<tr> -->
			<th scope="row" text-align="center">상세정보</th>
			<td>
					<textarea id = "contents" name = "contents" value="${list.contents}"></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>전화 번호 </th>
			<td><input type="text" name="tel"  id="tel" size=60 class="textbox1" value="${list.tel }"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>좌석 정보 </th>
			<td><input type="text" name="seats"  id="seats" size=60 class="textbox1" value="${list.seats }"></td>
		</tr>
	</table>
	<center>
	
	<div class="first">
        <input type="submit" value="수정하자">
    </div>
    
</center>
</form>
</body>
</center>
</html>