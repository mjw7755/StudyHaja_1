<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
#idlabel{
    -webkit-border-radius: 3px;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    transition: all 0.5s ease;
    background: white;
    border: 1px solid #4C4C4C;
    color: #777;
    font: 13px Helvetica, Arial, serif;
    margin: 0 0 10px;
    padding: 15px 10px 15px 20px;
    width: 250px;
    height: 30px;
}
#idlabel:focus {
    -webkit-box-shadow: 0 0 2px #ED1C24 inset;
    -moz-box-shadow: 0 0 2px #ed1c24 inset;
    -ms-box-shadow: 0 0 2px #ed1c24 inset;
    -o-box-shadow: 0 0 2px #ed1c24 inset;
    box-shadow: 0 0 2px #ED1C24 inset;
    background-color: #FFF;
    border: 1px solid #ED1C24;
    outline: none;
}
#addr1{
    -webkit-border-radius: 3px;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    transition: all 0.5s ease;
    background: white;
    border: 1px solid #4C4C4C;
    color: #777;
    font: 13px Helvetica, Arial, serif;
    margin: 0 0 10px;
    padding: 15px 10px 15px 20px;
    width: 250px;
    height: 30px;
}
#addr1:focus {
    -webkit-box-shadow: 0 0 2px #ED1C24 inset;
    -moz-box-shadow: 0 0 2px #ed1c24 inset;
    -ms-box-shadow: 0 0 2px #ed1c24 inset;
    -o-box-shadow: 0 0 2px #ed1c24 inset;
    box-shadow: 0 0 2px #ED1C24 inset;
    background-color: #FFF;
    border: 1px solid #ED1C24;
    outline: none;
}

#addr2{
    -webkit-border-radius: 3px;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    transition: all 0.5s ease;
    background: white;
    border: 1px solid #4C4C4C;
    color: #777;
    font: 13px Helvetica, Arial, serif;
    margin: 0 0 10px;
    padding: 15px 10px 15px 20px;
    width: 250px;
    height: 30px;
}
#addr2:focus {
    -webkit-box-shadow: 0 0 2px #ED1C24 inset;
    -moz-box-shadow: 0 0 2px #ed1c24 inset;
    -ms-box-shadow: 0 0 2px #ed1c24 inset;
    -o-box-shadow: 0 0 2px #ed1c24 inset;
    box-shadow: 0 0 2px #ED1C24 inset;
    background-color: #FFF;
    border: 1px solid #ED1C24;
    outline: none;
}
</style>
</head>
<body>
	<link rel="stylesheet" href="ahn/css/ahnTable.css">
	<link rel="stylesheet" href="ahn/css/toggle2.css">
	<link rel="stylesheet" href="ahn/css/ahnSignup2.css">

	<form method="post" action="memberModifyPro.do" onsubmit="return writeSave()">
		<input type="hidden" name="reg_date" value="${reg_date}">
		<center>
			<h3 id="signuph3">회원정보수정</h3>
			<div class="box">
				<table text-align="center">
					<tr>
						<td>아이디</td>
						<td>
							<label name="id" width="250px" height="30px" margin-bottom="50px">${sessionScope.sessionid }</label>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="passwd" class="txt" id="passwdtxt" value="${list.get(0).passwd}"><br>
							<label id="checkMessage2"></label></td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" name="passwd2" class="txt" id="passwdtxt2" value="${list.get(0).passwd}"><br>
							<label id="checkMessage3"></label>
						</td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td>
							<input type="text" name="hp" id="teltxt" class="txt" value="${list.get(0).hp}"><br> 
							<label id="checkMessage4"></label>
						</td>
					</tr>

					<tr>
						<td>이메일</td>
						<td>
							<input type="email" name="email" id="emailtxt" class="txt" value="${list.get(0).email}"><br>
							<label id="checkMessage5"></label>
						</td>
					</tr>

					<tr>
						<td> <!-- width="20%" -->주소</td>
						<td width="80%" style="text-align: left;">
							<input type="text" name="addr1" id="addr1" style="width: 70%" value="${list.get(0).addr1 }">
							<button type="button" class="btngray btn" onclick="openDaumPostcode()">주소 찾기</button><br>
							 <input type="text" name="addr2" id="addr2" style="width: 70%" value="${list.get(0).addr2 }">
						</td>
					</tr>
				</table>

				<input type="submit" value="정보수정" id="btnReg">
		</center>
		</div>
	</form>
</body>
</html>