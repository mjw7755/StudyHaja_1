<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
<title>게시판</title>
</head>
<link href="../view/mystyle.css" rel="stylesheet" type="text/css">
<body bgcolor="${ bodyback_c }">

   <center>
      <b>회원 정보(회원 수 : ${ count })</b>
<c:if test="${ count == 0 }">   
   <table width="700" border="1" cellpadding="0" cellspacing="0">
      <tr>
         <td align="center">회원이 없습니다.</td>
      </tr>
   </table>   
</c:if>
   
<c:if test="${ count > 0 }">   
   <table width="700" border="1" cellpadding="0" cellspacing="0"
      align="center">
      <tr height="30" bgcolor="${ value_c }">
         <td align="center" width="30">번 호</td>
         <td align="center" width="50">회원 아이디</td>
         <td align="center" width="50">비밀 번호</td>
         <td align="center" width="50">전화 번호</td>
         <td align="center" width="70">이메일</td>
      </tr>
   <c:forEach var="list"  items="${ list }">          
   
      <tr height="30">
        <%--   <td align="center" width="50">
            <c:out value="${ number }" />
            <c:set  var="number"   value="${ number - 1 }" />
         </td>  
    	   <td width="250">
   
         </td>  --%>
         <td align="center" width="50">${ list.num }</td>
         <td align="center" width="150">${ list.id }</td>
         <td align="center" width="150">${ list.passwd }</td>
         <td align="center" width="150">${ list.hp }</td>
         <td align="center" width="150"><a
            href="mailto:${ list.email }">${ list.email }</a></td>
      </tr>
   </c:forEach>
   </table>
</c:if>

 <c:if test="${ count > 0 }"> <!--  전체 페이지의 수를 연산 -->
       <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
      <c:set  var="startPage"  value="${ 1 }" />  <!-- 차후 수정!! -->
      <c:set  var="pageBlock"  value="${ 5 }" />
      <c:set var="endPage" value="${ startPage + pageBlock - 1 }"/>
      
      <fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" />
      <c:if  test="${ currentPage % pageBlock != 0 }" > 
         <c:set var="startPage" value="${ result * pageBlock + 1 }" />
      </c:if>
      
      <c:if  test="${ currentPage % pageBlock == 0 }" > 
         <c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
      </c:if>
   
      

      <c:if test="${ endPage > pageCount }" >
         <c:set  var="endPage"  value="${ pageCount }" />
      </c:if>
      
      <c:if test="${startPage >5 }" >
         <a href="ListForm.do?pageNum=${ startPage-5  }">[이전] </a>
      </c:if>

      <c:forEach  var="i" begin="${startPage }" end="${ endPage }">
         <a href="ListForm.do?pageNum=${i}">[${ i }] </a>
      </c:forEach>
   
   <c:if test="${ endPage < pageCount }" >
      <a href="ListForm.do?pageNum=${ startPage+5 }">[다음] </a>
   </c:if>
</c:if>


<table width="700" align="center">	
      <tr>
         <td bgcolor = "${ value_c }" align = "center" > 아이디 입력 </td>
      <form action="DeletePro.do" method="post">
         <td><input type="text" size = "40" maxlenth="20" name="id"  bgcolor="${ value_c }" align="center">
         <input type = "submit" value="회원삭제" onclick="window.location='ListForm.do'" >    							
         <input type="hidden" name="pageNum" value="${ pageNum }">
         </td>
      </tr>
      </form>
   </table>
</body>
</center>
</html>