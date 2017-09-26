<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" href="ahn/css/ahnTable.css">
	<link rel="stylesheet" href="ahn/css/toggle2.css">
	<link rel="stylesheet" href="ahn/css/ahnSignup2.css">

	<form name="Insertform" method="post" action="InsertPro.do" onsubmit="return writeSave()">
		<input type="hidden" name="reg_date" value="${reg_date}">
		<center>
			<h3 id="signuph3">ȸ������</h3>
			<div class="box">
				<table text-align="center">
					<tr>
						<td>���̵�</td>
						<td>
							<input type="text" name="id" class="txt" id="idtxt" value="${sessionScope.sessionid }">
						</td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td>
							<input type="password" name="passwd" class="txt" id="passwdtxt" value="${list.passwd}"><br>
							<label id="checkMessage2"></label></td>
					</tr>

					<tr>
						<td>��й�ȣ Ȯ��</td>
						<td>
							<input type="password" name="passwd2" class="txt" id="passwdtxt2" value="${list.passwd}"><br>
							<label id="checkMessage3"></label>
						</td>
					</tr>

					<tr>
						<td>��ȭ��ȣ</td>
						<td>
							<input type="text" name="hp" id="teltxt" class="txt" value="${list.hp}"><br> 
							<label id="checkMessage4"></label>
						</td>
					</tr>

					<tr>
						<td>�̸���</td>
						<td>
							<input type="email" name="email" id="emailtxt" class="txt" value="${list.email}"><br>
							<label id="checkMessage5"></label>
						</td>
					</tr>

					<tr>
						<th width="20%">�ּ�</th>
						<td width="80%" style="text-align: left;">
							<input type="text" name="addr1" id="addr1" style="width: 70%" placeholder="�ּ�ã�⸦ �����ּ���">
							<button type="button" class="btngray btn" onclick="openDaumPostcode()">�ּ� ã��</button><br>
							 <input type="text" name="addr2" id="addr2" style="width: 70%">
						</td>
					</tr>
				</table>

				<input type="submit" value="�����ϱ�" id="btnReg">
				<a href="ListForm.do"><button type="button" id="btnMain">�������</button></a>
		</center>
		</div>
	</form>
</body>
</html>