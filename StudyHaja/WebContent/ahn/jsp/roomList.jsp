<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="ahn/css/figcaption.css">
<link rel="stylesheet" href="ahn/css/ahnButton2.css">
<script src="http://code.jquery.com/jquery-2.1.4js"></script>
<title>룸 소개</title>
<style>
.textbox { 
    height: 25px; 
    width: 180px; 
    background-color: transparent;  
    border-style: solid;  
    border-width: 0px 0px 3px 0px;  
    border-color: #A6A6A6; 
    outline:0; 
    font-size : 17px;
 } 
</style>
<script>
function play(){
	$("#number1").css('color','red');
}
</script>
</head>
<body>
<br/><br/>
	
	<form action="cafesearchlist.do">
	<input class ="textbox" type="text" name="searchlocation" id="searchlocation" placeholder="지역명을 입력하세요">
	<input type="image" src="ahn/images/search1.png" width="30" height="30"/>
	</form>
	
	
	<div class="back">
    <div class="button_base b05_3d_roll"  onclick="location.href='caferegisterForm.do'">
        <div>스터디까페 등록</div>
        <div>스터디까페 등록</div>
    </div>
	</div>

	<center>
	<c:if test="${ count > 0 }">
	<table cellpadding="20">
	<tr>
	<c:forEach var="list" items="${list }" begin="0" end="8">
		<c:set var="cnt" value="${cnt+1}"/>
		<td>
		<%-- <a href="Room2.jsp?num=${list.num}&pageNum=${pageNum}"> --%>
		<%-- <a href="jsp/Room2.jsp?num=${list.num}"> --%>
		
		<a href="Room2.do?num=${list.num }&pageNum=${currentPage}">
		<div style="border: 1px; float: left; width: auto;">
		<figure class="snip1384">
		<img src = "ahn/images/${list.images}" id="mainphoto" alt="sample92" />
		<figcaption>
		<h3>${list.subject }</h3>
		<br/><br/>
		<table cellspacing="10px">
			<tr id="font">
				<td>지역</td><td>${list.area}</td>
			</tr>
			<tr id="font">
				<td>위치</td><td>${list.location}</td>
			</tr>
			<tr id="font">
				<td>비용</td><td>${list.pay}</td>
			</tr>
			<tr id="font">
				<td>휴무일</td><td>${list.c_day}</td>
			</tr>
			<tr id="font">
				<td width="100">운영시간</td><td>${list.working_hour}</td>
			</tr>
			<tr id="font">
				<td></td><td>${list.working_hour2}</td>
			</tr>
			
			<tr id="font">
				<td align="center" colspan="2" ><br><br><br><br><br><br><br><img src="ahn/images/phonedining.png" width="30" height="30" id="phone" >&nbsp;&nbsp;${list.tel}</td>
			</tr>
		</table>
			<i class="ion-ios-arrow-right"></i>
		</figcaption>
		</figure></a><br>
		
		<div id="eye">
		<img src="ahn/images/eyeram.png" width="40" height="40">&nbsp;
		</div>
		<div id= "readc">
		<font size="3" color="gray"><b>${ list.readcount }</b></font>
		</div>
		&nbsp;&nbsp;
		<div id="hot">
		<c:if test="${list.readcount>=30}">
			<img src="ahn/images/hot5.jpg" height="40" weight="50">
		</c:if><br><br><br>
		</div>
		<%-- <font size="4" color="gray"><b>${ list.subject }</b></font> --%> 
		<%-- <hr>
		<font size="3" color="skyblue"><b>지역</b></font>&nbsp;&nbsp;
		<font size="3" color="gray">${ list.area }</font><br><br>
		<font size="3" color="skyblue"><b>위치</b>&nbsp;&nbsp; 
		<font size="3" color="gray">${ list.location }</font><br><br>
		<font size="3" color="skyblue"><b>비용</b>&nbsp;&nbsp;
		<font size="3" color="gray"> ${ list.pay }</font><br><br>
		<font size="3" color="skyblue"><b>휴무</b>&nbsp;&nbsp;
		<font size="3" color="#FF5A5A"><b>${list.c_day }</b><br><br> --%>
		</div></td>
		
		
		<c:if test="${cnt%3==0 }">
			</tr>
			<tr>
		</c:if>
	</c:forEach>
	</tr>
		</c:if>
		</table>
		
		<c:if test="${ count > 0 }"> 	<!-- 전체 페이지의 수를 연산 -->
   		<c:set var="pageCount" value="${ count / pageSize + ( count % pageSize == 0 ? 0 : 1 ) }" />
   		<c:set var="startPage" value="${ 1 }"/>
   		<c:set var="pageBlock" value="${ 5 }"/>
   		<c:set var="endPage" value="${ startPage + pageBlock - 1 }"/>
   		
   		<fmt:parseNumber var="result" value="${ currentPage / pageBlock }" integerOnly="true" />
   		<c:if test="${ currentPage % pageBlock != 0 }">
   			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
   		
   		</c:if>
   		
   		<c:if test="${ currentPage % pageBlock == 0 }">
   			<c:set var="startPage" value="${(result-1) * pageBlock + 1 }" />
   		</c:if>
   		
   		<c:if test="${ endPage > pageCount }">
   			<c:set var="endPage" value="${ pageCount }" />
   		</c:if>
   		
   		<c:if test="${ startPage > 5 }">
         <a href="roomList.do?pageNum=${ startPage - 5 }"><img src="ahn/images/previous.png" width="50" height="50"/></a>
        </c:if>      

   		<%-- <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
   		 <c:if test="${i==1}">
        	<a href="roomList.do?pageNum=${ i }">[${ i }]</a>
        </c:forEach> --%>
        
        <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
   		 <c:if test="${i==1}">
        	<a href="roomList.do?pageNum=${ i }"><img src="ahn/images/number1.png" id="number1" width="50" height="50"/></a>
        </c:if>
         <c:if test="${i==2}">
        	<a href="roomList.do?pageNum=${ i }"><img src="ahn/images/number2.png"  id="number2" width="50" height="50"/></a>
        </c:if>
         <c:if test="${i==3}">
        	<a href="roomList.do?pageNum=${ i }"><img src="ahn/images/number3.png" id="number3" width="50" height="50"/></a>
        </c:if>
         <c:if test="${i==4}">
        	<a href="roomList.do?pageNum=${ i }"><img src="ahn/images/number4.png" id="number4" width="50" height="50"/></a>
        </c:if>
        <c:if test="${i==5}">
        	<a href="roomList.do?pageNum=${ i }"><img src="ahn/images/number5.png" id="number5" width="50" height="50"/></a>
        </c:if>
        <c:if test="${i==6}">
        	<a href="roomList.do?pageNum=${ i }"><img src="ahn/images/number6.png" id="number6" width="50" height="50"/></a>
        </c:if>
        
        </c:forEach>
         
        <c:if test="${ endPage < pageCount }">
      		<a href="roomList.do?pageNum=${ startPage + 5 }"><img src="ahn/images/next.png"  width="50" height="50"/></a>   
        </c:if>
</c:if>	
	<input type="hidden" name="pageNum" value="${currentPage}">
</body>
</html>