<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 화면</title>
<script language="javascript" >

	function begin(){
		document.myform.id.focus();
	}
	
	function checkIt(){
		if(!document.myform.id.value){
			alert("ID를 입력하지 않았습니다.");
			document.myform.id.focus();
			return false;
		}
		
		if(!document.myform.pwd.value){
			alert("비밀번호를 입력하지 않았습니다.");
			document.myform.passwd.focus();
			return false;
		}
	}
	
</script>

<link rel="stylesheet"  href="ahn/css/ahnLogin.css">
<link rel="stylesheet" href="ahn/css/ahnTable.css">
</head>

<body  onload="begin()">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<form name="myform" method="post" action="loginPro.do" onSubmit="return checkIt()">

<div class="box">
<table align="center">
<h3 id="loginh3">Let us Study</h3>
	<tr>
		<td>
			<input type="text" name="id" placeholder="아이디"  id="idtxt" />
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="passwd" placeholder="비밀번호(6~10자)" id="pwdtxt" />
		</td>
	</tr>
	<tr>
		<td>
			<button id="btnLogin">Login</button>
		</td>
	</tr>
	
	
</table>  
</div> <!-- End Box -->
</form>

<p>Forgot your password? <a href="#"><u style="color:#f1c40f;">Click Here!</u></a></p>
</body>
</html>