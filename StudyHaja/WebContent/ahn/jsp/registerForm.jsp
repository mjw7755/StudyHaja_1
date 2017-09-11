<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>모집하기</title>
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
			<th scope="row"><font color="red" size="2em">* </font>모집 TITLE</th>
			<td><input type="text" name="subject"  id="titletxt" size=60 class="textbox1"></td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>분류</th>
			<td>
			<!-- <label for="ex_select">1차 분류</label> -->
			<select id="first_select" name="kind1" onchange= "doChange(this,'second_select');">
									<option value="1차분류">--1차 분류--</option> 
									<option value="취업">취업</option> 
									<option value="어학">어학</option> 
									<option value="금융">금융</option> 
									<option value="프로그래밍">프로그래밍</option>
									<option value="고시">고시</option>
									<option value="기타">기타</option>
							
									
			</select>
			&nbsp;
			<select id="second_select" name="kind2">
									<option value = "dafault">--2차 분류--</option> 
									
			</select>
			</td>
		</tr>
		
			<tr>
			<th scope="row"><font color="red" size="2em">* </font>날짜</th>
	
			<td><input type= "date" name="s_date">
				&nbsp;<b> - </b> &nbsp;
				<input type="date" name="e_date"
			</td>
			
			<!-- <select id="date_select"><option selected>2017</option></select><b>&nbsp;년</b>
							<select id="date_select"><option selected>08</option></select><b>&nbsp;월</b>			
							<select id="date_select"><option selected>30</option></select><b>&nbsp;일</b>			
							&nbsp;<b>~</b>&nbsp;
							<select id="date_select"><option selected>2017</option></select><b>&nbsp;년</b>
							<select id="date_select"><option selected>09</option></select><b>&nbsp;월</b>
							<select id="date_select"><option selected>30</option></select><b>&nbsp;일</b>			
							</td> -->
			</tr>
		</div>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>요일</th>
			<td>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="월요일"><font color="#cbd1d8">
				Mon</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="화요일"><font color="#cbd1d8">
				Tues</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="수요일"><font color="#cbd1d8">
				Wends</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="목요일"><font color="#cbd1d8">
				Thurs</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="금요일"><font color="#cbd1d8">
				Fri</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="토요일"><font color="#cbd1d8">
				Sat</font></label>
				<label><input type="checkbox" class="option-input checkbox" name="day" value="일요일"><font color="#cbd1d8">
				Sun</font></label>				
			</td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>진행 시간</th>

			<td><select id="time_select" name="s_hour"><option value="default">시</option>
										 <c:forEach var="i" begin="0" end="24" step="1">
										 <option value="${i }">${i }</option>
										 </c:forEach>
										 
			</select><b>&nbsp;시</b>
							<select id="time_select" name="s_minute">
										<option value="default">분</option>
										<c:forEach var="i" begin="0" end="50" step="10">
										<c:if test="${i == 0}">
											<option value="00">00</option>
										</c:if>
										<c:if test="${i!=0}">
										<option value="${i }">${i }</option>
										</c:if>
										</c:forEach>
										</select><b>&nbsp;분</b>			
							&nbsp;<b>~</b>&nbsp;
							
							<select id="time_select" name="e_hour">
							 			 <option value="default">시</option>
										 <c:forEach var="i" begin="0" end="24" step="1">
										 <option value="${i }">${i }</option>
										 </c:forEach>
										 </select><b>&nbsp;시</b>
										
							<select id="time_select" name="e_minute">
												<option value="default">분</option>
												<c:forEach var="i" begin="0" end="50" step="10">
												<c:if test="${i == 0}">
													<option value="00">00</option>
												</c:if>
												<c:if test="${i!=0}">
													<option value="${i }">${i }</option>
												</c:if>
												</c:forEach>
													</select><b>&nbsp;분</b>		
							</td>
		</tr>
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>시/군/구</th>
			<td><select id="place_select" name="place1" onchange= "doChange2(this,'place2_select');">
										<option value="default">지역</option>
										  <option value="서울시">서울시</option>
										  <option value="강원도">강원도</option>
										  <option value="경기도">경기도</option>
										  <option value="경상남도">경상남도</option>
										  <option value="경상북도">경상북도</option>
										  <option value="광주시">광주시</option>
										  <option value="대구시">대구시</option>
										  <option value="대전시">대전시</option>
										  <option value="부산시">부산시</option>
										  <option value="세종시">세종시</option>
										  <option value="울산시">울산시</option>
										  <option value="인천시">인천시</option>
										  <option value="전라남도">전라남도</option>
										  <option value="전라북도">전라북도</option>
										  <option value="제주시">제주시</option>
										  <option value="충청남도">충청남도</option>
										  <option value="충청북도">충청북도</option>
										  
										  
				</select>
				<select id="place2_select" name="place2"><option value="default">구/군</option>
														 
				
				</select>		
			</td>
		</tr>
		
		<tr>
			<th scope="row">장소</th>
			<td><input type="text" name="place3" size=60 class="placetxt" id="place"></td>
		</tr>
		
		<tr>
			<th scope="row"><font color="red" size="2em">* </font>인원</th>
			<td>
			<select id="num_select" name="people"> <option selected>인원</option> 
									 <c:forEach var="i" begin="1" end="10" step="1">
										 <option value="${i }">${i }</option>
									 </c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<th scope="row">스터디 세부사항</th>
			<td width="80%">
					<textarea name = "content" rows="15" cols="100" placeholder = "스터디 커리큘럼 및 세부사항을 적어주세요"></textarea>
			</td>
		</tr>
</table>
<div class="first">
	<button id="btnReg">모집하기</button>	
</div>
</form>
</body>
</center>
</html>
	