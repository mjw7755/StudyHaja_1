<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
<form id="frm" action="cafedeletePro.do">
      <input align="right" type ="button" value ="�Խù� ����" name="del"    id = "del"
           onclick="confirmFunction()">
       </form>
</body>
</html>