<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="ram/css/templete2.css">
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

<!-- <style type="text/css">
 </style> -->

</head>
<body>
<!-- <div id= "top">
	<a href="#"><img src = "../ram/images/search.png" /></a>&nbsp;&nbsp;&nbsp;
	<a href="loginForm.do" >LOGIN</a>&nbsp;&nbsp;&nbsp;
	<a href="signupForm.do" >SIGN-UP</a>
</div> -->
<div id = "templete_top">

<div id = "main_icon">
<a href="list.do" id= "icon"><img src="ram/images/logo3_2.png"/></a>
</div>

<div id = "top">
<ul id = "topMenu">
	<li><a href="registerForm.do" >Study Together</a></li>
	<li><a href="#" >Study Search</a></li>
	<li><a href="roomList.do" >Study Room</a></li>
	<li><a href="#" >Notice</a></li>	
	<li><a href="#" >Q&A</a></li>	
</ul>
</div>

<div id = "login">
<ul id="login2">
	<li><a href="#">LOGIN</a></li>
	<li><a href="#">SIGN-UP</a></li>
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
      <a href="#" class="scroll_top"><img src="ram/images/scroll_top5.png"/></a>
      <a href="#" class="scroll_bottom"><img src="ram/images/scroll_bottom5.png"/></a>
</div>
<script src="ram/js/scroll.js"></script>
</body>
</html>