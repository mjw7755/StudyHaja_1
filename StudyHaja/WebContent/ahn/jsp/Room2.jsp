<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="edu.kosta.roomModel.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf869b304e885100a1c641995b42e394&libraries=services"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
/*--- MBL Custom Label Cloud With CSS3 --- */

#option{
padding-left:20px;
background:#FF4848;
padding:0 20px;
color:#fff!important;
border-radius:100px;
-moz-border-radius:100px;
height:32px;
line-height:32px;
text-transform:uppercase;
text-decoration:none;
border:none !important;
-webkit-transition:all .3s ease-in-out !important;t: 30pxt: 30px;
float:left;
margin-left:5px;
margin-top:5px;
font-size:14px; 
cursor: pointer;
font-weight: 600;
}

#option:hover{
color:gray !important;
background:#D5D5D5; }

#b{
	width:130px;
}
body{
  font-family: "����", dotum, "����", gulim, arial, helvetica, sans-serif;
}
</style>

<title>�� �� ����</title>
<script type="text/javascript">

   function confirmFunction(){
      var test = confirm("���� ���� �Ͻðڽ��ϱ�?");

      if (test == true ) { 
         
         alert("���� �Ǿ����ϴ�.");
         document.getElementById('frm').submit();
         

      } else {
         
         alert("��� �Ǿ����ϴ�.");
         return false;
          // ���
      }
   }
</script> 
<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/ahnButton.css">
<link rel="stylesheet" href="ahn/css/ahnText.css">
</head>
<body>
	
	<b><font size="5" color="red">�⺻����</font></b>
	<hr border-width="3">
	<center>
	<table>
		<tr>
			<td>
				<img src="ahn/images/${list.images}" width="550px" height="350px">
			</td>
			<td>
			<div id="map" style= "width:600px;height:350px;"></div>
			</td>
		</tr>
			<script>
				var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
				mapOption = {
				    center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
				    level: 3 // ������ Ȯ�� ����
				};  
				//������ �����մϴ�    
				var map = new daum.maps.Map(mapContainer, mapOption);
				
				//�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
				var geocoder = new daum.maps.services.Geocoder();
				
				// �ּҷ� ��ǥ�� �˻��մϴ�
				geocoder.addressSearch('${list.address}', function(result, status) {
				
				    // ���������� �˻��� �Ϸ������ 
				     if(status === daum.maps.services.Status.OK) {
				
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
				        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${list.subject}</div>'
				        });
				        
				        infowindow.open(map, marker);
				
				        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
				        map.setCenter(coords);
				    } 
				});    
			</script>
			<tr>
				<td>
				<font size="6.5"><b>${list.subject }</b></font>
				<table>
           <%--  <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>�̸� : </b></font></td>
            <td><font size="4.5" color="black">${list.subject}</font></td>
            </tr> --%>
            
            <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>���� : </b></font></td>
            <td><font size="4.5" color="black">${list.area}</font></td>
            </tr>
         
            <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>��ġ : </b></font></td>
            <td><font size="4.5" color="black">${list.location }</font></td>
            </tr>
            
            <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>��� : </b></font></td>
            <!-- <img src="images/dollar1.jpg" width="40" height="40"> -->
            <td><font size="4.5" color="black">${list.pay}</font></td>
            </tr>
            
            <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>��ð� : </b></font></td>
            <!-- <img src="images/clock.png" width="40" height="40"> -->
            <td><font size="4.5" color="black">${list.working_hour}</font></td>
            </tr>
            
            <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>�޹��� : </b></font></td>
            <td><font size="4.5" color="#FF5A5A"><b>${list.c_day}</b></font></td>
            </tr>
            
            <tr >
            <td id="b"><font size="4.5" color="#BDBDBD"><b>�¼����� : </b></font></td>
            <td><font size="4.5" color="black">${list.seats}</font></td>
            </tr>
            
            <tr>
            <td id="b"><font size="4.5" color="#BDBDBD"><b>��ȭ��ȣ : </b></font></td> 
            <!-- <img src="images/phone.png" width="40" height="40"> -->
            <td><font size="4.5" color="black">${list.tel}</font></td>
            </tr>
            
            <tr>
            <td colspan="2"> 
            <c:set var="options" value="${list.options.split(',')}"/>
            <c:forEach var="i" items="${options }">
            
            <c:set var="cnt" value="${cnt+1}"/>
            	<label id="option" name="a">#${i}</label>
            	<c:if test="${cnt%5==0 }">
					</td>
					</tr>
					<tr>
					<td colspan="2">
				</c:if>
             </c:forEach>
             </tr>
            <tr> 
            <td colspan="2">
            &nbsp;
            <img src="ahn/images/parking.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="ahn/images/wifi.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="ahn/images/projector.png">&nbsp;&nbsp;&nbsp;&nbsp;<br/>
            <font size="3" color="gray">&nbsp;&nbsp;&nbsp;&nbsp;��������</font>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <font size="3" color="gray">��������</font>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <font size="3" color="gray">����������</font>
            <!-- <span color="gray">��������</span> -->
            </td>
            </tr>
             <br/><br/><br/>
              </table>
				</td>
			</tr>
	</table>
</center>
	<br><br><br><br><br><br>
	<b><font size="5" color="red">������</font></b>
	<hr border-width="3">
	<center>
	<br/><br/>
	<table>
			<tr>
			<td>${list.contents}</td>
			</tr>
	</table>
	<center>
	<hr border-width="3">
	<div class="first">
		<input type="button" id="btnModify" value="�����ϱ�" onclick="document.location.href='cafeupdateForm.do?num=${list.num}&pageNum=${pageNum}'" >
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
 -->	
 		<form id="frm" action="cafedeletePro.do">
		<input type="button" value="�����ϱ�" id="btnDelete" onclick="confirmFunction()">�����ϱ�</button>
		
		
		<input type="hidden" name="num" value="${list.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
	</form>
	</div>
</body>

</html>