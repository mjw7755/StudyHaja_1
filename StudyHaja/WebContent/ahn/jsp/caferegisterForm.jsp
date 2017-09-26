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
          elPlaceHolder: "contents", //textarea���� ������ id�� ��ġ�ؾ� �մϴ�. 
          //SmartEditor2Skin.html ������ �����ϴ� ���
          sSkinURI: "<%=request.getContextPath()%>/ahn/se2/SmartEditor2Skin.html",  
          fCreator: "createSEditor2"
      });
      //�����ư Ŭ���� form ����
      $("#btnCafe").click(function(){
          oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });   
      
     
});
function pasteHTML(filepath){
     var sHTML = '<img src="<%=request.getContextPath()%>/ahn/se2/upload/'+filepath+'">'; 
/* var sHTML = '<img src="C:/Users/AHN/git/StudyHaja_1/StudyHaja/WebContent/ahn/se2/upload/'+filepath+'">'; */ 
       oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
   }
</script>
</head>
<center>
<body>
<form action="caferegisterPro.do?pageNum=1" id = "frm" method="post">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="r_no" value="${r_no }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<label><font color="gray" size="10px">Let's form a Study-Group</font></label>
	<table border="1" class="mytable">
		<tr>
			<th scope="row" style="min-width:100px;"><font color="red" size="2em">* </font>�� �� </th>
			<td><input type="text" name="subject"  id="subject" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>���� ���� </th>
			<td><input type="text" name="images" id="images" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�� �� </th>
			<td><input type="text" name="address"  id="address" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�� �� </th>
			<td><input type="text" name="area"  id="area" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�� ġ </th>
			<td><input type="text" name="location"  id="location" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�̿� ��� </th>
			<td><input type="text" name="pay"  id="pay" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�±� �ɼǵ� </th>
			<td><input type="text" name="options"  id="options" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�޹��� </th>
			<td><input type="text" name="c_day"  id="c_day" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>� �ð� </th>
			<td><input type="text" name="working_hour"  id="working_hour" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>� �ð�2</th>
			<td><input type="text" name="working_hour2"  id="working_hour2" size=60 class="textbox1"></td>
		</tr>
		<!-- <tr>
			<th scope="row"><font color="red" size="2em">* </font>�󼼻��� </th>
			<td><input type="text" name="textarea"  id="textarea" size=60 class="textbox1"></td>
		</tr>
		<tr> -->
			<th scope="row" text-align="center">������</th>
			<td>
					<textarea id = "contents" name = "contents" maxlength="4000"></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>��ȭ ��ȣ </th>
			<td><input type="text" name="tel"  id="tel" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�¼� ���� </th>
			<td><input type="text" name="seats"  id="seats" size=60 class="textbox1"></td>
		</tr>
	</table>
<div class="first">
	<input type="submit" value="����ϱ�" id="btnCafe">
	<!-- <button id="btnCafe">����ϱ�</button>	 -->
</div>
</form>
</body>
</center>
</html>