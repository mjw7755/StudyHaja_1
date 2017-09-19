<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="ahn/css/ahnSignup.css">
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/toggle.css">
<link rel="stylesheet" href="ahn/css/ahnCheckbox.css">
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/ahnSelect.css">
<link rel="stylesheet" href="ahn/css/ahnText.css">
<link rel="stylesheet" href="ahn/css/ahnButton.css">
<link rel="stylesheet" href="ahn/css/bootstrap.css">
<link rel="stylesheet" href="ram/css/templete.css">
 
<!-- <script src="jquery-1.9.1.js"></script>
<script src="jquery-ui.js"></script>
<script src="js/bootstrap.js"></script> -->

</head>
<body>

<table id="top" align="center">
<tr>
	<td id="main_icon"><img src="ram/images/logo.png"/></td>
	<td id="topMenu"><a href="#">Study Together</a></td>
	<td id="topMenu"><a href="#">Study Search</a></td>
	<td id="topMenu"><a href="#">Study Room</a></td>
	<td id="topMenu"><a href="#">Notice</a></td>
	<td id="topMenu"><a href="#">Q & A</a></td>
	<td id="login"><a href="#">LOGIN</a></td>
	<td id="sign-up"><a href="#">SIGN-UP</a></td>
</tr>
</table>

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