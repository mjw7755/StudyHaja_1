<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>

<script language="JavaScript"></script>

</head>
<body>  
<form action="notice_deletePro.do?pageNum=${ pageNum }"  method="post"
		  onsubmit="return deleteSave()"	 name="delForm">
	<input type="hidden" >
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center">
			<input type="submit"  value="글삭제">
			<input type="button"  value="글목록" 	onclick="document.location.href='notice_list.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>



