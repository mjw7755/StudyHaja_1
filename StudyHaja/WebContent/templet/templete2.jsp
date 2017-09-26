<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!-- <link rel="stylesheet" href="ram/css/templete2.css"> -->
<!-- <link rel="stylesheet" href="ram/css/templete3.css"> -->
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>


<style type="text/css">
#a_tag:hover {
color:gray;/* a선택자에 마우스 올렸을때 color gray 지정 */
}
#a_tag{
	font-weight : 800;
	color:#000;
	text-decoration:none;
}
#templete_top{
    height: 100px;
}
#main_icon{
	float: left;
	width:23%;
	text-align: right;
}
#top{
	float: left;
	width:53%;
}
#login{
	float: left;
	width:23%;
}
#topMenu{/* 메뉴바 스타일 지정 */
	list-style: none;
    text-align: center;
    margin-top: 30px;
    font-size: 20px;
}
 #topMenu li{
	display: inline;
    padding-left: 30px;
} 
 #login2{
 	list-style: none;
    text-align: center;
    padding-bottom: 30px;
 }

 #login2 li{
	display:inline;
	padding-right: 15px;
}
 #login3{
 	list-style: none;
    text-align: center;
    padding-bottom: 30px;
    padding-top: 15px;
 }

 #login3 li{
	display:inline;
	padding-right: 15px;
}
.scroll_top {
        position: fixed;
        left: 95%;
        bottom: 400px;
        display: none;
}
.scroll_bottom {
        position: fixed;
        left: 95%;
        bottom: 350px;
        display: none;
}
.round-button {
<<<<<<< HEAD
   	/* display:block; */ 
    width:100px;
    height:100px;
/*     line-height:50px; 
 */    border: 2px solid #f5f5f5;
=======
	width: 50px;
    height: 50px;
    line-height: 50px;
    border: 1px solid #690000;
>>>>>>> branch 'master' of https://github.com/mjw7755/StudyHaja_1.git
    border-radius: 50%;
    text-align: center;
    background: #690000;
    box-shadow: 0 0 3px grey;
    font-size: 11px;
    font-weight: bold;
    float: right;
}
.round-button:hover {
    background: #ccc;
    border:1px solid #BDBDBD;
}
  /* alert */   
.close {
   float: right;
   font-size: 21px;
   font-weight: 700;
   line-height: 1;
   color: #000;
   text-shadow: 0 1px 0 #fff;
   filter: alpha(opacity = 20);
   opacity: .2
}

.close:hover, .close:focus {
   color: #000;
   text-decoration: none;
   cursor: pointer;
   filter: alpha(opacity = 50);
   opacity: .5
}

button.close {
   -webkit-appearance: none;
   padding: 0;
   cursor: pointer;
   background: 0 0;
   border: 0
}

.modal-open {
   overflow: hidden
}

.modal {
   position: fixed;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   z-index: 1050;
   display: none;
   overflow: hidden;
   -webkit-overflow-scrolling: touch;
   outline: 0
}

.modal.fade .modal-dialog {
   -webkit-transition: -webkit-transform .3s ease-out;
   -o-transition: -o-transform .3s ease-out;
   transition: transform .3s ease-out;
   -webkit-transform: translate3d(0, -25%, 0);
   -o-transform: translate3d(0, -25%, 0);
   transform: translate3d(0, -25%, 0)
}

.modal.in .modal-dialog {
   -webkit-transform: translate3d(0, 0, 0);
   -o-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0)
}

.modal-open .modal {
   overflow-x: hidden;
   overflow-y: auto
}

.modal-dialog {
   position: relative;
   width: auto;
   margin: 10px
}

 .modal-content {
   position: relative;
   background-color: #fff;
   -webkit-background-clip: padding-box;
   background-clip: padding-box;
   border: 1px solid #999;
   border: 1px solid rgba(0, 0, 0, .2);
   border-radius: 6px;
   outline: 0;
   -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
   box-shadow: 0 3px 9px rgba(0, 0, 0, .5)
} 

.modal-backdrop {
   position: fixed;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   z-index: 1040;
   background-color: #000
}

.modal-backdrop.fade {
   filter: alpha(opacity = 0);
   opacity: 0
}

.modal-backdrop.in {
   filter: alpha(opacity = 50);
   opacity: .5
}

.modal-header {
   min-height: 16.43px;
   padding: 15px;
   border-bottom: 1px solid #e5e5e5
}

.modal-header .close {
   margin-top: -2px
}

.modal-title {
    margin: 0;
    line-height: 1.42857143;
    font-size: 20px;
    color: #4b8fcc;
}

.modal-body {
   position: relative;
    padding: 15px;
    font-weight: 800;
    font-size:15px;
    height: 40px;
}

.modal-footer {
   padding: 15px;
   text-align: right;
   border-top: 1px solid #e5e5e5;
   background: #ECF0F1;
}

.modal-footer .btn+.btn {
   margin-bottom: 0;
   margin-left: 5px
}

.modal-footer .btn-group .btn+.btn {
   margin-left: -1px
}

.modal-footer .btn-block+.btn-block {
   margin-left: 0
}

.modal-scrollbar-measure {
   position: absolute;
   top: -9999px;
   width: 50px;
   height: 50px;
   overflow: scroll
}

@media ( min-width :768px) {
   .modal-dialog {
      width: 600px;
      margin: 30px auto
   }
   .modal-content {
      box-shadow: 0 5px 15px rgba(0,0,0,.5);
         width: 400px;
   }
   .modal-sm {
      width: 300px
   }
}

.sr-only {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0
}

.sr-only-focusable:active, .sr-only-focusable:focus {
   position: static;
   width: auto;
   height: auto;
   margin: 0;
   overflow: visible;
   clip: auto
}

.btn-default, .btn-default2 {
    color: #fff;
    background-color: #BDC3C7;
    border-radius: 4px;
}
#a_tag:focus{
	outline-color: #fff;
}
#name{
	margin-right: 30%;
	width:50%;
}
#logout{
	width:50%;
}

</style>

<script>
/* var result = "${sessionScope.sessionid}";
if(result==null){ */
$(document).ready(function(){
	$(".btn-default").click(function(){
    	window.location.href="loginForm.do";
    });
    $(".btn-default2").click(function(){
    	window.location.href="InsertForm.do";
    });
});
//}
</script>
</head>
<body>

<div id = "templete_top" >

<div id = "main_icon">
<a href="mainlist.do" id="a_tag"><img src="ram/images/logo3_2.png"/></a>
</div>

<div id = "top">
<ul id = "topMenu">
	<input type="hidden" id = "loginid" value="${sessionScope.sessionid}">
	<c:if test="${sessionScope.sessionid==null}">
	<li><a href="#" onMouseOver="this.innerHTML='스터디 모집'" 
		onMouseOut="this.innerHTML='Study Together'" id="a_tag" class="btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
	Study Together</a></li></c:if>
	
	<c:if test="${sessionScope.sessionid!=null}">
	<li><a href="registerForm.do" onMouseOver="this.innerHTML='스터디 모집'" 
		onMouseOut="this.innerHTML='Study Together'" id="a_tag" border="0">
	Study Together</a></li>
	</c:if>
	
	
	<li><a href="searchPage.do" onMouseOver="this.innerHTML='스터디 검색'" onMouseOut="this.innerHTML='Study Search'"  id="a_tag">Study Search</a></li>
	<li><a href="roomList.do" onMouseOver="this.innerHTML='스터디카페'" onMouseOut="this.innerHTML='Study Cafe'" id="a_tag">Study Cafe</a></li>
	<li><a href="notice_list.do" onMouseOver="this.innerHTML='공지사항'" onMouseOut="this.innerHTML='Notice'" id="a_tag">Notice</a></li>	
	<li><a href="list.do" onMouseOver="this.innerHTML='자유게시판'" onMouseOut="this.innerHTML='Bulletin Board'" id="a_tag">Bulletin Board</a></li>	
</ul>
</div>

<div id = "login">
	<c:if test="${sessionScope.result!=1}">
	<ul id="login3">
		<li><a href="loginForm.do" onMouseOver="this.innerHTML='로그인'" onMouseOut="this.innerHTML='LOGIN'" id="a_tag">LOGIN</a></li>
		<li><a href="InsertForm.do" onMouseOver="this.innerHTML='회원가입'" onMouseOut="this.innerHTML='SIGN-UP'" id="a_tag">SIGN-UP</a></li>
	</ul>
	</c:if>
	
	<c:if test="${sessionScope.result==1 && sessionScope.sessionid != 'admin'}">
	<ul id="login2">
		<div id="name">
		<li><a href="memberModifyForm.do"  class="round-button" id="a_tag"><font color="#fff">${sessionScope.memname}</font></a></li>
		</div>
		<!-- <li><a href="insertForm.do" onMouseOver="this.innerHTML='회원정보수정'" onMouseOut="this.innerHTML='MODIFY'" id="a_tag">MODIFY</a></li> -->
		<div id="logout">
		<li><a href="logout.do" onMouseOver="this.innerHTML='로그아웃'" onMouseOut="this.innerHTML='LOG-OUT'" id="a_tag">LOG-OUT</a></li>
		</div>
		<%-- <font color="blue">${sessionScope.memname}님 환영합니다</font> --%>
		</ul>
	</c:if>
	
	<c:if test="${sessionScope.sessionid eq 'admin'}">
	<ul id="login3">
		<li><a href="ListForm.do" onMouseOver="this.innerHTML='회원리스트'" onMouseOut="this.innerHTML='MemberList'" id="a_tag">MemberList</a></li>
		<li><a href="logout.do" onMouseOver="this.innerHTML='로그아웃'" onMouseOut="this.innerHTML='LOG-OUT'" id="a_tag">LOG-OUT</a></li>
	</ul>
	</c:if>
	
</ul>
</div>
</div>

 <!-- 모달 팝업 --> 
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
   <div class="modal-dialog"> 
   <div class="modal-content"> 
   <div class="modal-header"> 
   <button type="button" class="close" data-dismiss="modal">
      <span aria-hidden="true">&times</span>
      <span class="sr-only">Close</span>
   </button><h4 class="modal-title" id="myModalLabel">로그인 필요</h4></div> 
   <div class="modal-body"> 스터디 모집은 로그인이 필요합니다. </div> 
   <div class="modal-footer"> 
   <button type="button" class="btn-default" data-dismiss="modal">로그인</button>
   <button type="button" class="btn-default2" data-dismiss="modal">회원가입</button> 
 </div> 
 </div> 
 </div> 
 </div>
 <!-- --------------- -->
<div>
	<jsp:include page="${ CONTENT }"  flush="false"/>
</div>
<%-- 
<div class="botton">
	<jsp:include page="../module/bottom.jsp"  flush="false"/>
</div> --%>

<div class="scroll">
      <a href="#" class="scroll_top" id="a_tag"><img src="ram/images/scroll_top.png"/></a>
      <a href="#" class="scroll_bottom" id="a_tag"><img src="ram/images/scroll_bottom.png"/></a>
</div>
<script src="ram/js/scroll.js"></script>

</body>
</html>