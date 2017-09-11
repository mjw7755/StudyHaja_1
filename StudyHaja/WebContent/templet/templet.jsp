<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../ahn/css/ahnSignup.css">
<link rel="stylesheet" href="../ahn/css/ahnTable.css">
<link rel="stylesheet" href="../ahn/css/toggle.css">
<link rel="stylesheet"  href="../ahn/css/ahnCheckbox.css">
<link rel="stylesheet" href="../ahn/css/ahnTable.css">
<link rel="stylesheet" href="../ahn/css/ahnSelect.css">
<link rel="stylesheet" href="../ahn/css/ahnText.css">
<link rel="stylesheet" href="../ahn/css/ahnButton.css">
<link rel="stylesheet" href="../ahn/css/bootstrap.css"> -->
<link rel="stylesheet" type="text/css" href="../ram/css/ram4.css" />

<script src="jquery-1.9.1.js"></script>
<script src="jquery-ui.js"></script>
<script src="js/bootstrap.js"></script>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link href="/view/mystyle.css" rel="stylesheet" type="text/css"> 
</head>
<body>
<div id= "top">
	<a href="#"><img src = "../ram/images/search.png" /></a>&nbsp;&nbsp;&nbsp;
	<a href="#" >LOGIN</a>&nbsp;&nbsp;&nbsp;
	<a href="signupForm.do" >SIGN-UP</a>
</div>
<div class="tpm">
<ul id = "topMenu">
	<li><a href="#" >Study Together</a></li>
	<li><a href="#" >Study Search</a></li>
	<li><a href="#" >Study Room</a></li>
	<li><a href="#" >Notice</a></li>	
	<li><a href="#" >Q&A</a></li>	
</ul>
</div>

<div>
	<jsp:include page="${ CONTENT }"  flush="false"/>
</div>
<%-- <div class="center">
<jsp:include page="main_center.jsp"></jsp:include>
</div> --%>
<%-- 
<div class="botton">
	<jsp:include page="../module/bottom.jsp"  flush="false"/>
</div> --%>

<div class="scroll">
      <a href="#" class="scroll_top"><img src="../ram/images/scroll_top5.png"/></a>
      <a href="#" class="scroll_bottom"><img src="../ram/images/scroll_bottom5.png"/></a>
</div>
</body>
</html>