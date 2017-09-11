<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입 화면</title>
<!-- <link href="/view/mystyle.css" rel="stylesheet" type="text/css">  -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#passwdtxt2").keyup(function(){
			$("#checkMessage").show();
			if($("#passwdtxt").val()!=$("#passwdtxt2").val()){
				$("#checkMessage").text("비밀번호가 틀립니다.").css('color','red');
			}else{
				$("#checkMessage").text("비밀번호가 일치합니다.").css('color','blue');
			}
		});
		$("#birthtxt").blur(function(){
			$("#checkMessage").hide();
		});
		 $("#btnCheck").click(function(){
			var userid = $("#idtxt").val();
			if(userid=="" || userid==" "){
				alert("아이디를 입력해주세요");
				
			}else{
				alert("사용가능한 아이디 입니다.");
			}
		});//아이디체크 버튼 end  
	});
	
	/* function registerCheckFunction(){
		var id = $("#idtxt").val();
		$.ajax({
			type : 'post',
			url : "./SignupProAction",
			data : { id : id },
			success : function(result){
				if(result == 1){
					$('#checkMessage').html("사용할 수 있는 아이디입니다.");
					$('#checkType').attr('class','modal-content panel-success');
				}else{
					$('#checkMessage').html("사용할 수 없는 아이디입니다.");
					$('#checkType').attr('class','modal-content panel-warning');
				}//if end
				$('#checkModal').modal("show");
			}//success end
		}) */
	//}
</script>
</head>
<body>
<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'> -->

<link rel="stylesheet" href="ahn/css/ahnTable.css">
<link rel="stylesheet" href="ahn/css/toggle.css">
<link rel="stylesheet" href="ahn/css/ahnSignup.css">
<form name="signupform" method="post" action="signupPro.do">
<input type="hidden" name="reg_date" value="${reg_date}">
<div class="box">
	<table align="center">
	<h3 id="signuph3">회원가입</h3>
		<tr>
			<td><input type="text" name="name" class="txt" id="nametxt" placeholder="이름을 입력해주세요"></td>
		</tr>
	
		<tr>
			<td><input type="text" name="id" class="txt" id="idtxt" placeholder="아이디를 입력해주세요"></td>
		</tr>	
	
		<tr>
			<td><input type="password" name="passwd" class="txt" id="passwdtxt"  placeholder="비밀번호를 입력해주세요(6~12자)"></td>
		</tr>
	
		<tr>
			<td><input type="password" name="passwd2" class="txt" id="passwdtxt2" placeholder="비밀번호를 한번 더 입력해주세요"> 
				  &nbsp;&nbsp;<label id="checkMessage"></label></td>
		
		</tr>
		
		<tr>
			<td><input type="text" name="birth" id="birthtxt" class="txt" placeholder="생년월일을 입력해주세요(19901123)"></td>
		</tr>
		<tr>
			<td class="switch-field">
			 <input type="radio" id="switch_left" name="sex" value="male" checked/>
     		 <label for="switch_left">남자</label>
    	 	 <input type="radio" id="switch_right" name="sex" value="female" />
    	 	 <label for="switch_right">여자</label>
    		</td>
		</tr>
	
		<tr>
			<td><input type="text" name="tel" id="teltxt" class="txt" placeholder="전화번호를 입력해주세요(01055102869)"></td>
		</tr>
	
		<tr>
			<td><input type="email" name="email" id="emailtxt" class="txt" placeholder="이메일을 입력해주세요"></td>
		</tr>
	
		<tr>
			<td><input type="submit" value = "가입하기" id="btnReg"></td>
		</tr>
</table>
<button type="button" id="btnEmail">인증코드 발송</button>
<button type="button" id="btnCheck" onclick= "registerCheckFunction();">중복체크</button>
</div>
</form>
<%-- <%
	String messageContent = null;
    if(session.getAttribute("messageContent")!=null){
    	messageContent=(String)session.getAttribute("messageContent");
    }
    String messageType = null;
    if(session.getAttribute("messageType")!=null){
    	messageContent=(String)session.getAttribute("messageType");
    }
    if(messageContent != null){
%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" "<% if(messageType.equals("오류 메세지")) out.println("panel-warning");
				else out.println("panel-success");%>>
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#messageModal").modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
    	} 
    %> --%>
    <!-- <div class="modal_fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id = "checkType" class="modal-content panel-info">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden = "true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">
						확인메세지
					</h4>
					</div>
					<div class="modal-body" id="checkMessage">
	 
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div> -->
</body>
</html>
