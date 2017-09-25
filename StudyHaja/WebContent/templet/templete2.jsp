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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="ahn/css/ahnSignup.css">
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/toggle.css">
<link rel="stylesheet" href="ahn/css/ahnCheckbox.css">
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/ahnSelect.css">
<link rel="stylesheet" href="ahn/css/ahnText.css">
<link rel="stylesheet" href="ahn/css/ahnButton.css">
<link rel="stylesheet" href="ahn/css/bootstrap.css">
 --> 
<!-- <script src="jquery-1.9.1.js"></script>
<script src="jquery-ui.js"></script>
<script src="js/bootstrap.js"></script> -->

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
    margin-top: 30px;
 }

 #login2 li{
	display:inline;
	padding-right: 15px;
}

  .scroll_top {
        position: fixed;
        left: 90%;
        bottom: 400px;
        display: none;
      }
       .scroll_bottom {
        position: fixed;
        left: 90%;
        bottom: 350px;
        display: none;
      }


 </style>
<script type="text/javascript">
	function checkId(){
		var loginid = $("#loginid").val();
		if(loginid==""){
			alert("로그인이 필요합니다");
			window.location.href="mainlist.do";
		}else{
			window.location.href="registerForm.do";
		}
	}
</script>
</head>
<body>
<!-- <div id= "top">
	<a href="#"><img src = "../ram/images/search.png" /></a>&nbsp;&nbsp;&nbsp;
	<a href="loginForm.do" >LOGIN</a>&nbsp;&nbsp;&nbsp;
	<a href="signupForm.do" >SIGN-UP</a>
</div> -->
<div id = "templete_top" >

<div id = "main_icon">
<a href="mainlist.do" id="a_tag"><img src="ram/images/logo3_2.png"/></a>
</div>

<div id = "top">
<ul id = "topMenu">
	<input type="hidden" id = "loginid" value="${sessionScope.sessionid}">
	<li><a href="#" onMouseOver="this.innerHTML='스터디 모집'" onMouseOut="this.innerHTML='Study Together'" id="a_tag" onclick="checkId()">
	
	Study Together</a></li>
	<li><a href="searchPage.do" onMouseOver="this.innerHTML='스터디 검색'" onMouseOut="this.innerHTML='Study Search'"  id="a_tag">Study Search</a></li>
	<li><a href="roomList.do" onMouseOver="this.innerHTML='스터디카페'" onMouseOut="this.innerHTML='Study Cafe'" id="a_tag">Study Cafe</a></li>
	<li><a href="notice_list.do" onMouseOver="this.innerHTML='공지사항'" onMouseOut="this.innerHTML='Notice'" id="a_tag">Notice</a></li>	
	<li><a href="list.do" onMouseOver="this.innerHTML='자유게시판'" onMouseOut="this.innerHTML='Bulletin Board'" id="a_tag">Bulletin Board</a></li>	
</ul>
</div>

<div id = "login">
<ul id="login2">
<<<<<<< HEAD
	<c:if test="${sessionScope.sessionid==null}">
		<li><a href="loginForm.do" onMouseOver="this.innerHTML='로그인'" onMouseOut="this.innerHTML='LOGIN'" id="a_tag">LOGIN</a></li>
		<li><a href="InsertForm.do" onMouseOver="this.innerHTML='회원가입'" onMouseOut="this.innerHTML='SIGN-UP'" id="a_tag">SIGN-UP</a></li>
=======
	<c:if test="${sessionScope.result!=1}">
		<li><a href="loginForm.do" onMouseOver="this.innerHTML='로그인'" onMouseOut="this.innerHTML='LOGIN'">LOGIN</a></li>
		<li><a href="InsertForm.do" onMouseOver="this.innerHTML='회원가입'" onMouseOut="this.innerHTML='SIGN-UP'">SIGN-UP</a></li>
>>>>>>> branch 'master' of https://github.com/mjw7755/StudyHaja_1.git
	</c:if>
<<<<<<< HEAD
	<c:if test="${sessionScope.sessionid!=null}">
		<li><a href="insertForm.do" onMouseOver="this.innerHTML='회원정보수정'" onMouseOut="this.innerHTML='MODIFY'" id="a_tag">MODIFY</a></li>
		<li><a href="logout.do" onMouseOver="this.innerHTML='로그아웃'" onMouseOut="this.innerHTML='LOG-OUT'" id="a_tag">LOG-OUT</a></li>
=======
	<c:if test="${sessionScope.result==1}">
		<li><a href="insertForm.do" onMouseOver="this.innerHTML='회원정보수정'" onMouseOut="this.innerHTML='MODIFY'">MODIFY</a></li>
		<li><a href="logout.do" onMouseOver="this.innerHTML='로그아웃'" onMouseOut="this.innerHTML='LOG-OUT'">LOG-OUT</a></li>
>>>>>>> branch 'master' of https://github.com/mjw7755/StudyHaja_1.git
		<br>
		<font color="blue">${sessionScope.memname}님 환영합니다</font>
	</c:if>
</ul>
</div>
</div>


<div>
	<jsp:include page="${ CONTENT }"  flush="false"/>
</div>
<%-- 
<div class="botton">
	<jsp:include page="../module/bottom.jsp"  flush="false"/>
</div> --%>

<div class="scroll">
      <a href="#" class="scroll_top" id="a_tag"><img src="ram/images/scroll_top5.png"/></a>
      <a href="#" class="scroll_bottom" id="a_tag"><img src="ram/images/scroll_bottom5.png"/></a>
</div>
<script src="ram/js/scroll.js"></script>
</body>
</html>