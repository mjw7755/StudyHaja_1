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
<style type="text/css">
@CHARSET "EUC-KR";
body{
  font-family: 'Open Sans', sans-serif;
  background:white;
  margin: 0 auto 0 auto;  
  width:100%; 
  margin: 20px 0px 20px 0px;   
}

p{
  font-size:16px;
  text-decoration: none;
  color:#F15F5F;
}

.box{
  background:white;
  width:800px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 70px 0px;
  border: #2980b9 4px solid;
 
}

.box #idtxt{
   -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    -ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    -o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
    background: white;
    border: 2px solid #C8C8C8;
    color: #777;
    font: 16px Helvetica, Arial, serif;
    margin: 0 0 10px;
    padding: 15px 10px 15px 40px;
    width: 300px;
    height: 50px;
}
.box #idtxt:focus {
    -webkit-box-shadow: 0 0 2px #ED1C24 inset;
    -moz-box-shadow: 0 0 2px #ed1c24 inset;
    -ms-box-shadow: 0 0 2px #ed1c24 inset;
    -o-box-shadow: 0 0 2px #ed1c24 inset;
    box-shadow: 0 0 2px #ED1C24 inset;
    background-color: #FFF;
    border: 1px solid #ED1C24;
    outline: none;
}
.box #pwdtxt{
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    -ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    -o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
    background: white;
    border: 2px solid #C8C8C8;
    color: #777;
    font: 16px Helvetica, Arial, serif;
    margin: 0 0 10px;
    padding: 15px 10px 15px 40px;
     width: 300px;
    height: 50px;
}
.box #pwdtxt:focus {
   -webkit-box-shadow: 0 0 2px #ED1C24 inset;
    -moz-box-shadow: 0 0 2px #ed1c24 inset;
    -ms-box-shadow: 0 0 2px #ed1c24 inset;
    -o-box-shadow: 0 0 2px #ed1c24 inset;
    box-shadow: 0 0 2px #ED1C24 inset;
    background-color: #FFF;
    border: 1px solid #ED1C24;
    outline: none;
}

.box #loginh3{
	font-famliy : arial, helvetica, sans-serif;
  	font-style : italic;
  	font-size : 40px;
  	line-height : 1.6;
  	font-weight : bold;
  	text-align: center;
}

/*
#btnLogin:hover{
  background:#2CC06B; 
  cursor: pointer;
}

#btnSignup{
  float:left;
  background:#3498db;
  width:125px;  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #2980b9 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  margin-left:10px;
  font-weight:800;
  font-size:0.8em;
}

#btnSignup:hover{ 
	background:#3594D2; 
	cursor: pointer;
} */


.box button{
	background: salmon;
	color: #fff;
	/*color: skyblue;*/
	border: none;
	position: relative;
	weight: 20px;
	height: 40px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	border-radius: 7px;
	width: 300px;
}

.box button:hover{
	background: #fff;
	color: #1AAB8A;
}

.box button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.box button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.box button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>
<!-- <link rel="stylesheet"  href="ahn/css/ahnLogin.css"> -->
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
		<td align="center">
			<button id="btnLogin">Login</button>
		</td>
	</tr>
	
	
</table>  
</div> <!-- End Box -->
</form>

</body>
</html>