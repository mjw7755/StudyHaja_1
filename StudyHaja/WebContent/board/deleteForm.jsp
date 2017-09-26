<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/color.jsp"%>  


 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">

   function confirmFunction(){
      var test = confirm("정말 삭제 하시겠습니까?");

      if (test == true ) { 
         alert("삭제 되었습니다.");
         document.getElementById('frm').submit();

      } else {
         alert("취소 되었습니다.");
         return false;
          // 취소
      }
   }
<title>게시판</title>

<link href="./view/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../view/script.js"></script>

</head>
<body bgcolor="${ bodyback_c }">  
<center><b>글삭제</b> <br>
<form action="deletePro.do?pageNum=${ pageNum }"  method="post"
		  onsubmit="return deleteSave()"	 name="delForm">
	<input type = "hidden">
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center"> 삭제되었습니다 데헿 </td>
			<input type="button"  value="글목록" 	onclick="document.location.href='list.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>



