<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>

<script language="JavaScript"></script>

</head>
<body>  
<form action="notice_deletePro.do?pageNum=${ pageNum }"  method="post"
		  onsubmit="return deleteSave()"	 name="delForm">
	<input type="hidden" >
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
	<input type="hidden"  name="num"  value="${ num }">
		<tr height="30"> 
			<td align="center">
			<input type ="button" value ="�Խù� ����" name="del" id = "del" onclick="confirmFunction()">
			<input type="button"  value="�۸��" 	onclick="document.location.href='notice_list.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>

 --%>
 
 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">

   function confirmFunction(){
      var test = confirm("���� ���� �Ͻðڽ��ϱ�?");

      if (test == true ) { 
         alert("���� �Ǿ����ϴ�.");
         document.getElementById('frm').submit();

      } else {
         alert("��� �Ǿ����ϴ�.");
         return false;
          // ���
      }
   }
</script>  
</head>
<body>  
<form action="notice_deletePro.do?pageNum=${ pageNum }"  method="post"
		  onsubmit="return deleteSave()"	 name="delForm">
	<input type="hidden" >
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
	<input type="hidden"  name="num"  value="${ num }">
		<tr height="30"> 
			<td align="center">
			<input type ="button" value ="�Խù� ����" name="del" id = "del" onclick="confirmFunction()">
			<input type="button"  value="�۸��" 	onclick="document.location.href='notice_list.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>