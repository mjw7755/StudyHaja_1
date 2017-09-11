<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>�����ϱ�</title>
<link rel="stylesheet"  href="ahn/css/ahnCheckbox.css">
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/ahnSelect.css">
<link rel="stylesheet" href="ahn/css/ahnText.css">
<link rel="stylesheet" href="ahn/css/ahnButton.css">
<link rel="stylesheet" href="ahn/css/bootstrap.css">

<script src="ahn/js/selectKind.js"></script>
<script src="ahn/js/selectAddr.js"></script>
<script src="jquery-1.9.1.js"></script>
<script src="jquery-ui.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<center>
<body>
<form action="registerPro.do" method="post">
	<input type="hidden" name="num" value="${num }">
	<table border=2 class="mytable">
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>���� TITLE</th>
			<td><input type="text" name="subject"  id="titletxt" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�з�</th>
			<td>
			<!-- <label for="ex_select">1�� �з�</label> -->
			<select id="first_select" name="kind1" onchange= "doChange(this,'second_select');">
									<option value="1���з�">--1�� �з�--</option> 
									<option value="���">���</option> 
									<option value="����">����</option> 
									<option value="����">����</option> 
									<option value="���α׷���">���α׷���</option>
									<option value="���">���</option>
									<option value="��Ÿ">��Ÿ</option>
							
									
			</select>
			&nbsp;
			<select id="second_select" name="kind2">
									<option value = "dafault">--2�� �з�--</option> 
									
			</select>
			</td>
		</tr>
		
			<tr>
			<th scope="row"><font color="red" size="2em">* </font>��¥</th>
	
			<td><input type= "date" name="s_date">
				&nbsp;<b> - </b> &nbsp;
				<input type="date" name="e_date"
			</td>
			
			<!-- <select id="date_select"><option selected>2017</option></select><b>&nbsp;��</b>
							<select id="date_select"><option selected>08</option></select><b>&nbsp;��</b>			
							<select id="date_select"><option selected>30</option></select><b>&nbsp;��</b>			
							&nbsp;<b>~</b>&nbsp;
							<select id="date_select"><option selected>2017</option></select><b>&nbsp;��</b>
							<select id="date_select"><option selected>09</option></select><b>&nbsp;��</b>
							<select id="date_select"><option selected>30</option></select><b>&nbsp;��</b>			
							</td> -->
			</tr>
		</div>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>����</th>
			<td>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="������"><font color="#cbd1d8">
				Mon</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="ȭ����"><font color="#cbd1d8">
				Tues</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="������"><font color="#cbd1d8">
				Wends</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="�����"><font color="#cbd1d8">
				Thurs</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="�ݿ���"><font color="#cbd1d8">
				Fri</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="�����"><font color="#cbd1d8">
				Sat</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="�Ͽ���"><font color="#cbd1d8">
				Sun</font></label>				
			</td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>���� �ð�</th>

			<td><select id="time_select" name="s_hour"><option value="default">��</option>
										 <c:forEach var="i" begin="0" end="24" step="1">
										 <option value="${i }">${i }</option>
										 </c:forEach>
										 
			</select><b>&nbsp;��</b>
							<select id="time_select" name="s_minute">
										<option value="default">��</option>
										<c:forEach var="i" begin="0" end="50" step="10">
										<c:if test="${i == 0}">
											<option value="00">00</option>
										</c:if>
										<c:if test="${i!=0}">
										<option value="${i }">${i }</option>
										</c:if>
										</c:forEach>
										</select><b>&nbsp;��</b>			
							&nbsp;<b>~</b>&nbsp;
							
							<select id="time_select" name="e_hour">
							 			 <option value="default">��</option>
										 <c:forEach var="i" begin="0" end="24" step="1">
										 <option value="${i }">${i }</option>
										 </c:forEach>
										 </select><b>&nbsp;��</b>
										
							<select id="time_select" name="e_minute">
												<option value="default">��</option>
												<c:forEach var="i" begin="0" end="50" step="10">
												<c:if test="${i == 0}">
													<option value="00">00</option>
												</c:if>
												<c:if test="${i!=0}">
													<option value="${i }">${i }</option>
												</c:if>
												</c:forEach>
													</select><b>&nbsp;��</b>		
							</td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>��/��/��</th>
			<td><select id="place_select" name="place1" onchange= "doChange2(this,'place2_select');">
										<option value="default">����</option>
										  <option value="�����">�����</option>
										  <option value="������">������</option>
										  <option value="��⵵">��⵵</option>
										  <option value="��󳲵�">��󳲵�</option>
										  <option value="���ϵ�">���ϵ�</option>
										  <option value="���ֽ�">���ֽ�</option>
										  <option value="�뱸��">�뱸��</option>
										  <option value="������">������</option>
										  <option value="�λ��">�λ��</option>
										  <option value="������">������</option>
										  <option value="����">����</option>
										  <option value="��õ��">��õ��</option>
										  <option value="���󳲵�">���󳲵�</option>
										  <option value="����ϵ�">����ϵ�</option>
										  <option value="���ֽ�">���ֽ�</option>
										  <option value="��û����">��û����</option>
										  <option value="��û�ϵ�">��û�ϵ�</option>
										  
										  
				</select>
				<select id="place2_select" name="place2"><option value="default">��/��</option>
														 
				
				</select>		
			</td>
		</tr>
		
		<tr>
			<th scope="row">���</th>
			<td><input type="text" name="place3" size=60 class="placetxt" id="place"></td>
		</tr>
		
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>�ο�</th>
			<td>
			<select id="num_select" name="people"> <option selected>�ο�</option> 
									 <c:forEach var="i" begin="1" end="10" step="1">
										 <option value="${i }">${i }</option>
									 </c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<th scope="row">���͵� ���λ���</th>
			<td width="80%">
					<textarea name = "content" rows="15" cols="100" placeholder = "���͵� Ŀ��ŧ�� �� ���λ����� �����ּ���"></textarea>
			</td>
		</tr>
</table>
<div class="first">
	<button id="btnReg">�����ϱ�</button>	
</div>
</form>
</body>
</center>
</html>
	