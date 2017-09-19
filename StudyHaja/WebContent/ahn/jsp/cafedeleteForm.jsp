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
</script>  
</head>
<body>
<form id="frm" action="cafedeletePro.do">
      <input align="right" type ="button" value ="게시물 삭제" name="del"    id = "del"
           onclick="confirmFunction()">
       </form>
</body>
</html>