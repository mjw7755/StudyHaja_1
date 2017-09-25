<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입 화면</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
		var count = 0;

	  function idcheck(){   // 아이디 중복확인 
		var id = $("#idtxt").val();
		$.ajax({
			type : 'post',
			url  : "./IdCheckAction",
			data : {
				  "id" : id	
			},
			success : function(result){
			
				if(! /^[a-z][a-z0-9_$@#]{4,9}$/i.test(id)){    
		        	alert("5~10자리의 영문과 숫자로만 입력해주세요.")
		        		return false;
	        	  
				}else if (result == -1){
					
					count = 1;
					alert("사용 할 수 있는 아이디 입니다.");
				
				}else{
					
					count = 0;
					$("#idtxt").val().remove;
					$("#checkMessage").text("이미 사용중인 아이디 입니다.").css('color','red');
			    	alert("이미 사용중인 아이디 입니다.")
			   			return false;
					}
			},
			error : function(data){
				alert(error);
			}
			}) 
	} // 아이디 중복확인 end

		function writeSave(){  							// 가입하기 버튼 눌렀을때 유효성 검사

			 var username = $("#nametxt").val();		// 이름 변수 생성
 			 var userid = $("#idtxt").val(); 		    // 아이디 변수 생성
 			 var userpasswd = $("#passwdtxt").val();	// 비밀번호 변수 생성
			 var usertel = $("#teltxt").val();		    // 전화번호 변수 생성
			 var useremail = $("#emailtxt").val();		// 이메일 변수 생성
			 var useraddr1 = $("#addr1").val();
			 var useraddr2 = $("#addr2").val();

	 	 if(username=="" || username==" "){                   // 이름 유효성
			    alert("이름을 입력해주세요.")
		  			return false;
	 	 }else if(!/^[가-힣]{2,10}$/i.test(username)){
	 		 	alert("이름은 2~10글자의 한글로 입력해주세요.")
	 	 
		 }else if(userid=="" || userid==" "){     			  // 아이디 유효성
 	    		alert("아이디를 입력해주세요.")
 	 				return false;
 	    	
   		 }else if(! /^[a-z][a-z0-9_$@#]{4,9}$/i.test(userid)){      
 				alert("아이디는 5~10자리의 영문과 숫자로만 입력해주세요.")
 	  				return false;
   		
   		 }else if(count == 0){
 	      		alert("아이디 중복확인을 눌러주세요");
 	      			return false;

   		 }else if(userpasswd=="" || userpasswd==" "){         // 비밀번호 유효성
				alert("비밀번호를 입력해주세요.")          
					return false;
	 
   		 }else if(!/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(userpasswd)){      
	 	 		alert("비밀번호는 숫자와 영문자 조합으로 6~20자리를 사용해야 합니다.")
					return false;
	  		
   		 }else if($("#passwdtxt").val()!=$("#passwdtxt2").val()){
		   	    alert("비밀번호가 틀립니다.")
       				return false;
   	    
   		}else if(usertel=="" || usertel==" "){			 // 전화번호 유효성
	  			alert("전화번호를 입력해주세요.")
	      		    return false;
	  			
	    }else if(! /^\d{3}-\d{3,4}-\d{4}$/i.test(usertel)){
			  	alert("전화번호는 ex) 010-1234-1234 형식으로 작성해주세요.")
			  	    return false;
			  	    
	    }else if(useremail=="" || useremail==" "){
				alert("이메일을 입력해주세요.")    		  
			  		return false;
			
	    }else if(!/[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/i.test(useremail)){
			  	alert("사용 할 수 없는 이메일 형식입니다.")
			  		return false;
			  	
     	}else if(useraddr1=="" || useraddr1==" "){
     			alert("주소찾기를 눌러주세요.");
     				return false;
     				
     	}else if(useraddr2=="" || useraddr2==" "){
     			alert("상세주소를 입력해주세요.");
     				return false;
     	}else
     			alert(userid + " 님 회원가입을 축하드립니다.");
		}
	
   $(document).ready(function(){            // 회원 입력 값 유효성 검사 start
            $("#idtxt").keyup(function(){   // 아이디 유효성
    		$("#checkMessage").show();  
         var userid = $("#idtxt").val();
         if(userid=="" || userid==" "){
        	 $("#checkMessage").text("아이디를 입력해주세요.").css('color','red');
        	 return false;
        	 
          }else if(! /^[a-z][a-z0-9_$@#]{4,9}$/i.test(userid)){      
        	  $("#checkMessage").text("5~10자리의 영문과 숫자로만 입력해주세요.").css('color','red');
        	  return false;
        	  
          } else {
        	 $("#checkMessage").text("유효한 아이디 입니다. 중복확인을 눌러주세요.").css('color','#2F9D27');
        	 
          }	  
      });// 아이디 유효성 end
      
      $("#passwdtxt").keyup(function(){  // 비밀번호 유효성
  		$("#checkMessage2").show();  
       var userpasswd = $("#passwdtxt").val();
       if(userpasswd=="" || userpasswd==" "){
      	 $("#checkMessage2").text("비밀번호를 입력해주세요.").css('color','red');
      		return false;
      	 
        }else if(!/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(userpasswd)){      
      	  $("#checkMessage2").text("숫자와 영문자 조합으로 6~20자리를 사용해야 합니다.").css('color','red');
      		return false;
      		
        }else{
        	$("#checkMessage2").text("사용 가능한 비밀번호 입니다.").css('color','#2F9D27');
        }
    }); // 비밀번호 유효성 버튼 end 
    
    $("#passwdtxt2").keyup(function(){  // 비밀번호 확인 유효성
        $("#checkMessage3").show();
        if($("#passwdtxt").val()!=$("#passwdtxt2").val()){
           $("#checkMessage3").text("비밀번호가 틀립니다.").css('color','red');
            return false;
           	
        }else{
           $("#checkMessage3").text("비밀번호가 일치합니다.").css('color','#2F9D27');
        }
     }); // 비밀번호 확인 유효성 end
    
      $("#teltxt").keyup(function(){   // 전화번호 유효성
    	  $("#checkMessage4").show();
    	  var usertel = $("#teltxt").val();
    	  if(usertel=="" || usertel==" "){
    		  $("#checkMessage4").text("전화번호를 입력해주세요.").css('color', 'red');
    			  return false;
    	  }else if(! /^\d{3}-\d{3,4}-\d{4}$/i.test(usertel)){
    		  $("#checkMessage4").text("사용 할 수 없는 전화번호 입니다.").css('color','red');
    		  	  return false;
    	  }else{
    		  $("#checkMessage4").text("사용 가능한 전화번호 입니다.").css('color','#2F9D27');
    	  }  
      }); // 전화번호 확인 유효성 end
    
      $("#emailtxt").keyup(function(){   // 이메일 유효성
    	  $("#checkMessage5").show();
    	  var useremail = $("#emailtxt").val();
    	  if(useremail=="" || useremail==" "){
    		  $("#checkMessage5").text("이메일을 입력해주세요.").css('color', 'red');
    		  		return false;
    	  }else if(!/[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/i.test(useremail)){
    		  $("#checkMessage5").text("사용 할 수 없는 이메일 입니다.").css('color','red');
    		  		return false;
    	  }else{
    		  $("#checkMessage5").text("사용 가능한 이메일 입니다.").css('color','#2F9D27');
    	  }  
      }); // 이메일 유효성 end
  }); // 회원 입력 값 유효성 검사 end

	
      function openDaumPostcode() {   // 우편번호 검색
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                  document.getElementById("addr1").value = data.postcode1;
                  document.getElementById("addr2").value = data.postcode2;
                  document.getElementById("addr1").value = data.address;
                  document.getElementById("addr2").focus();
              }
          }).open();
      } // 우편번호 검색 end
   	  
</script>
</head>
<body>

	<link rel="stylesheet" href="../css/ahnTable.css">
	<link rel="stylesheet" href="../css/toggle.css">
	<link rel="stylesheet" href="../css/ahnSignup.css">

	<form name="Insertform" method="post" action="InsertPro.do" onsubmit="return writeSave()">
		<input type="hidden" name="reg_date" value="${reg_date}">
		<center>
			<h3 id="signuph3">회원가입</h3>
			<div class="box">
				<table text-align="center">
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" class="txt" id="nametxt"
							placeholder="이름을 입력해주세요"></td>
					</tr>

					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="id" class="txt" id="idtxt" placeholder="영문과 숫자만 입력해주세요">
							<button type="button" id="btnCheck" onclick="idcheck()">중복확인</button><br>
							<label id="checkMessage"></label>
						</td>
					</tr>

					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="passwd" class="txt" id="passwdtxt" placeholder="비밀번호를 입력해주세요(6~12자)"><br>
							<label id="checkMessage2"></label></td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" name="passwd2" class="txt" id="passwdtxt2" placeholder="비밀번호를 한번 더 입력해주세요"><br>
							<label id="checkMessage3"></label>
						</td>
					</tr>

					<tr>
						<td>성별</td>
						<td class="switch-field">
							<input type="radio" id="switch_left" name="sex" value="male" checked /> <label for="switch_left">남자</label>
							<input type="radio" id="switch_right" name="sex" value="female" />
							<label for="switch_right">여자</label>
						</td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td>
							<input type="text" name="hp" id="teltxt" class="txt" placeholder="전화번호를 입력해주세요"><br> 
							<label id="checkMessage4"></label>
						</td>
					</tr>

					<tr>
						<td>이메일</td>
						<td>
							<input type="email" name="email" id="emailtxt" class="txt" placeholder="이메일을 입력해주세요"><br>
							<label id="checkMessage5"></label>
						</td>
					</tr>

					<tr>
						<th width="20%">주소</th>
						<td width="80%" style="text-align: left;">
							<input type="text" name="addr1" id="addr1" style="width: 70%" placeholder="주소찾기를 눌러주세요">
							<button type="button" class="btngray btn" onclick="openDaumPostcode()">주소 찾기</button><br>
							 <input type="text" name="addr2" id="addr2" style="width: 70%">
						</td>
					</tr>
				</table>

				<input type="submit" value="가입하기" id="btnReg">
				<a href="ListForm.do"><button type="button" id="btnMain">가입취소</button></a>
		</center>
		</div>
	</form>