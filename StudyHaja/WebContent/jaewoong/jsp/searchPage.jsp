<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<link rel="stylesheet" type="text/css" href="../css1/moonCss.css" />

<script src="../js1/select_Js.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
 <script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="../js1/jquery.bpopup.min.js"></script>
 
<script src="../js/bootstrap.js"></script>

<script type="text/javascript">



 $(function(){
		 
	 var checkedValues = [];  
	    $("input[name=oneChk]").click(function(){
	    	
	    	
	    	$("#tableAjax > tbody").empty();
	    		var i;
	    		 if($(this).is(":checked")){
	    		 checkedValues.push($(this).val());
	    		 }else {
	    			 for(i = 0;i<checkedValues.length;i++){
	    				 if(checkedValues[i]==$(this).val()){
			    			 checkedValues.splice(i,1);
	    				 }
	    			 } 
	    		 }
	  	    
	  	   jQuery.ajaxSettings.traditional = true;
	  	   
	 	    $.ajax(
	 				{
	 					type:"post",
	 					url:"../../searchPageServlet",
	 					data:{"check":checkedValues,		
	 					},
	 					
	 					success:function(data){
	 						var d = eval("("+data+")");
	 						var dd = d.result;
	 						/*페이징 처리  */
	 						for(var i=0;i<dd.length;i++){
	 							/* $("#ajaxTable").append('<tr style="cursor:pointer;" id="record'+i+'" onclick="layer_open();return false">'); */
	 							for(var j=0;j<dd[i].length;j++){
	 								
	 								$("#ajaxTable").append('<td>'+dd[i][j].value+'</td>');
	 							}
	 							$("#ajaxTable>td").wrapAll('<tr style="cursor:pointer;" id="record"></tr>');
	 						}		
	 						/*페이징처리 끝  */
	 						
	 					},
	 					error : function(msg, error) {
	 						alert(error);
	 					}
	 					
	 				}		
	 			)
	 			
	 			
	 			
	    }); 

	    $(document).on("click","#record",function(){
	    	var tr = $(this);
	    	var td = tr.children();
	    	$("pophead").empty();
	    	$("#popcontent").empty();
	    	
				
	    	$.ajax(
	    			
	    			{
	    				type:"post",
	 					url:"../../searchPageServlet",
	 					data:{"td":td.eq(0).text()},
	    				
	 						success:function(data){
	 							alert(data);
	 							$("#popup").bPopup({
	 								
	 					    		modalClose:true,
	 					    		follow: [false,false],
	 					    		position:[500,400]
	 					    	});
	 							
		 					},
		 					error : function(msg, error) {
		 						alert(error);
		 					}
	    			
	    			
	    			}
	    		)	

	    });
	    
	    
});


/*------------------------------------------------*/
	
</script>
<script>
	$(function(){
		$("#findjob").click(function(){
			/*클릭시 닫아주기  */
			if($(".detail2").is(":visible")){
				$(".detail2").slideUp("fast");
			}
			if($(".detail3").is(":visible")){
				$(".detail3").slideUp("fast");
			}
			if($(".detail4").is(":visible")){
				$(".detail4").slideUp("fast");
			}
			if($(".detail5").is(":visible")){
				$(".detail5").slideUp("fast");
			}
			/*  */
			
			if($(".detail").is(":hidden")){
			$(".detail").slideDown("fast");
			} else {
				$(".detail").slideUp("fast");
			}
		});
		
		$("#language").click(function(){
			if($(".detail").is(":visible")){
				$(".detail").slideUp("fast");
			}
			if($(".detail3").is(":visible")){
				$(".detail3").slideUp("fast");
			}
			if($(".detail4").is(":visible")){
				$(".detail4").slideUp("fast");
			}
			if($(".detail5").is(":visible")){
				$(".detail5").slideUp("fast");
			}
			
			
			 if($(".detail2").is(":hidden")){
				$(".detail2").slideDown("fast");
				}else {
				$(".detail2").slideUp("fast");
				}
		});
		
		$("#bank").click(function(){
			
			if($(".detail").is(":visible")){
				$(".detail").slideUp("fast");
			}
			if($(".detail2").is(":visible")){
				$(".detail2").slideUp("fast");
			}
			if($(".detail4").is(":visible")){
				$(".detail4").slideUp("fast");
			}
			if($(".detail5").is(":visible")){
				$(".detail5").slideUp("fast");
			}
			
			
			 if($(".detail3").is(":hidden")){
				$(".detail3").slideDown("fast");
				}else {
				$(".detail3").slideUp("fast");
				}
		});
		
		$("#allChkOne").click(function(){
			if($("#allChkOne").prop('checked')){
			$("input[name='oneChk']:checkbox").prop("checked",true);
			} else {
				$("input[name='oneChk']:checkbox").prop("checked",false);
			}
		});
		
	});
	
</script>

<style type="text/css">

	#contentTable {
		cellspacing:50;
		text-align:left;
	}

	#popup {
	display: none; 
	background-color: white; 
	
	position: fixed;
    width: 500;
    left: 50%;
    margin-left: -20%; /* half of width */
    height: 600px;
    top: 50%;
    margin-top: -150px; /* half of height */
    overflow: auto;

    /* decoration */
    border: 1px solid #000;
    background-color: #eee;
    padding: 1em;
    box-sizing: border-box;
	}
	/* #pophead{
	width:100px;
	} */
	#pophead ol{
	width : 100px;
	}
	/* #popcontent{
	width:200px;
	} */
	#popcontent ol{
	width : 300px;
	}
</style>
</head>
<body>
	<div>
		<div>
			<div class="" align="center" >
		
				<div class="tableDIV" style="text-align:left" >
				<h2>카테고리별 검색</h2>
				<hr>
				<table class="categoryOne">
					<tr>
					<td>		
						<a href="#" class="button" id="findjob">취업</a>
					</td>
						
					<td>
					<a href="#" class="button" id="language">어학</a>
						
					</td>
					
					<td>
					<a href="#" class="button" id="bank">금융</a>
					
					</td>
					
					<td>
					<a href="#" class="button">프로그래밍</a>
					
					</td>
					
					<td>
					<a href="#" class="button">자기계발</a>
					
					</td>
					</tr>
					<tr>
						<td colspan="5">
							<div class="detail">
							<table cellpadding="20px" text-align="center" >
							<tr >
								<td>전체 <input type="checkbox" id ="allChkOne" name="oneChk"/></td>
								<td>토익 <input type="checkbox" id ="oneChk" name="oneChk" value="토익"/></td>
								<td>토익스피킹 <input type="checkbox" id ="oneChk" name = "oneChk" value="토익스피킹"/></td>
								<td>오픽 <input type="checkbox" id ="oneChk" name="oneChk" value="오픽"/></td>
								<td>텝스 <input type="checkbox" id ="oneChk" name = "oneChk" value="텝스"/></td>
								<td>인적성 <input type="checkbox" id ="oneChk" name="oneChk" value="인적성"/></td>
							</tr>
							<tr>
								<td>면접 <input type="checkbox" id ="check" name = "oneChk" value="면접"/></td>
								<td>자기소개서 <input type="checkbox" id ="check" name="oneChk" value="자기소개서"/></td>
								<td>대외활동 <input type="checkbox" id ="check" name = "oneChk" value="대외활동"/></td>
								<td>공모전 <input type="checkbox" id ="check" name="oneChk" value="공모전"/></td>
								<td>토플 <input type="checkbox" id ="check" name = "oneChk" value="토플"/></td>
								<td>기타 <input type="checkbox" id ="check" name="oneChk" value="기타"/></td>
							</tr>
							</table>
						</div>
						
							<div class="detail2">
							<table cellpadding="20px" text-align="center" >
							<tr >
								<td>전체 <input type="checkbox" id ="allChk" name = "allChk"/></td>
								<td>영어 <input type="checkbox" id ="toeChk" name="toeChk" value="영어"/></td>
								<td>일본어 <input type="checkbox" id ="tsChk" name = "tsChk" value="일본어"/></td>
								<td>중국어 <input type="checkbox" id ="opChk" name="opChk" value="중국어"/></td>
								<td>스페인어 <input type="checkbox" id ="tpsChk" name = "tpsChk" value="스페인어"/></td>
								<td>독일어 <input type="checkbox" id ="perChk" name="perChk" value="독일어"/></td>
							</tr>
							<tr>
								<td>프랑스어 <input type="checkbox" id ="interChk" name = "interChk" value="프랑스어"/></td>
								<td>아랍어 <input type="checkbox" id ="introChk" name="introChk" value="아랍어"/></td>
								<td>러시아어 <input type="checkbox" id ="actChk" name = "actChk" value="러시아어"/></td>
								<td>이탈리아어 <input type="checkbox" id ="conChk" name="conChk" value="이탈리아어"/></td>
								<td>기타 <input type="checkbox" id ="etcChk" name="etcChk" value="기타"/></td>
							</tr>
							</table>
						</div>
						
						<div class="detail3">
							<table cellpadding="20px" text-align="center" >
							<tr >
								<td>전체 <input type="checkbox" id ="allChk" name = "allChk"/></td>
								<td>주식 <input type="checkbox" id ="toeChk" name="toeChk" value="주식"/></td>
								<td>부동산 <input type="checkbox" id ="tsChk" name = "tsChk" value="부동산"/></td>
								<td>경매 <input type="checkbox" id ="opChk" name="opChk" value="경매"/></td>
								<td>재태크 <input type="checkbox" id ="tpsChk" name = "tpsChk" value="재태크"/></td>
								<td>경제 <input type="checkbox" id ="perChk" name="perChk" value="경제"/></td>
							</tr>
							<tr>
								<td>회계 <input type="checkbox" id ="interChk" name = "interChk" value="회계"/></td>
								<td>기타 <input type="checkbox" id ="introChk" name="introChk" value="기타"/></td>
							</tr>
							</table>
						</div>
						
						<div class="detail4">
							<table cellpadding="20px" text-align="center" >
							<tr >
								<td>전체 <input type="checkbox" id ="allChk" name = "allChk"/></td>
								<td>JAVA <input type="checkbox" id ="toeChk" name="toeChk" value="JAVA" value="JAVA"/></td>
								<td>C/C++ <input type="checkbox" id ="tsChk" name = "tsChk" value="C/C++" value="C/C++"/></td>
								<td>Python <input type="checkbox" id ="opChk" name="opChk" value="Python" value="Python"/></td>
								<td>Ruby <input type="checkbox" id ="tpsChk" name = "tpsChk" value="Ruby" value="Ruby"/></td>
								<td>Android <input type="checkbox" id ="perChk" name="perChk" value="Android" value="Android"/></td>
							</tr>
							<tr>
								<td>Objective-C <input type="checkbox" id ="interChk" name = "interChk" value="Objective-C"/></td>
								<td>LINUX <input type="checkbox" id ="introChk" name="introChk" value="LINUX"/></td>
								<td>웹프로그래밍 <input type="checkbox" id ="actChk" name = "actChk" value="웹프로그래밍"/></td>
								<td>게임프로그래밍 <input type="checkbox" id ="conChk" name="conChk" value="게임프로그래밍"/></td>
								<td>시스템프로그래밍 <input type="checkbox" id ="tpleChk" name = "tpleChk" value="시스템프로그래밍"/></td>
								<td>임베디드 <input type="checkbox" id ="etcChk" name="etcChk" value="임베디드"/></td>
							</tr>
							<tr>
								<td>데이터베이스 <input type="checkbox" id ="introChk" name="introChk" value="데이터베이스"/></td>
								<td>빅데이터 <input type="checkbox" id ="introChk" name="introChk" value="빅데이터"/></td>
								<td>소프트웨어공학 <input type="checkbox" id ="introChk" name="introChk" value="소프트웨어공학"/></td>
								<td>기타 <input type="checkbox" id ="introChk" name="introChk" value="기타"/></td>
							</tr>
							</table>
						</div>
						
						<div class="detail5">
							<table cellpadding="20px" text-align="center" >
							<tr >
								<td>전체 <input type="checkbox" id ="allChk" name = "allChk"/></td>
								<td>발표 <input type="checkbox" id ="toeChk" name="toeChk" value="발표"/></td>
								<td>자격증 <input type="checkbox" id ="tsChk" name = "tsChk" value="자격증"/></td>
								<td>악기 <input type="checkbox" id ="opChk" name="opChk" value="악기"/></td>
								<td>바리스타 <input type="checkbox" id ="tpsChk" name = "tpsChk" value="바리스타"/></td>
								<td>베이킹 <input type="checkbox" id ="perChk" name="perChk" value="베이킹"/></td>
							</tr>
							<tr>
								<td>번역 <input type="checkbox" id ="interChk" name = "interChk" value="번역"/></td>
								<td>기타 <input type="checkbox" id ="introChk" name="introChk" value="기타"/></td>
							</tr>
							</table>
						</div>
						</td>
					</tr>
					
					<tr margin-top=5px;>
					<td>
					<a href="#" class="button">취미</a>
					
					</td>
					
					<td>
					<a href="#" class="button">고시</a>
					
					</td>
					
					<td>
					<a href="#" class="button">학생</a>
					
					</td>
					<td>
					<a href="#" class="button">기타</a>
					
					</td>
					</tr>
					<tr>
						<td>
						
						</td>
					</tr>
				</table>
				<br><br>
				<h2>지역별 검색</h2>
				<hr>
				<table>
					<th>지역선택</th><th>시군구 선택</th>
					<tr>
					<td>
						<select id="area" class="soflow1" onchange="doChange(this, 'subSel')">
						  	  <option value="default">---지역---</option>
							  <option value="gangwon">강원</option>
							  <option value="gyonggi">경기</option>
							  <option value="gyongnam">경남</option>
						  </select>
					</td>
					<td>
						<select id="subSel" class="soflow1">
							<option value="default">---시.군.구---</option>
						</select>
					</td>
					</tr>
				</table>
				<br><br>
				<h2>상세검색</h2>
				<div class="ddd">
				<hr>
				<select id="soflow">
						  <option>전체</option>
						  <option>제목</option>
						  <option>장소</option>
						  <option>모집장 아이디</option>
						  <option>모집장 이름</option>
						  <option>댓글 아이디</option>
						  <option>댓글 이름</option>
				</select>
				
				<input type="text" id="subject" class="tb6">
				<input type="button" id="searchBtn" value="검색">
				</div>
				<br><br>
				<h2>모집중인 스터디</h2>
					<hr>
				
				</div>
				<br><br>
				
				
				<div class="tableDIV">
				
					
					<table class="table" id="tableAjax" style="text-align:center; border:1px solid #dddddd">
						<thead>
							<tr>
								<td style="background-color: #fafafa; text-align:center;">글번호</td>
								<td style="background-color: #fafafa; text-align:center;">분류</td>
								<td style="background-color: #fafafa; text-align:center;">제목</td>
								<td style="background-color: #fafafa; text-align:center;">시간</td>
								<td style="background-color: #fafafa; text-align:center;">날짜</td>
								<td style="background-color: #fafafa; text-align:center;">조회수</td>
							</tr>
						</thead>
						<tbody id="ajaxTable">
							
							
						</tbody>
						
						</div>
					</table>
					</div>	
						<div id="popup" style="border:5px solid">
							<div id="popupInner" style="border:1px soild gray">
								<table id="contentTable">
								<tr>
									<td>제  목</td><td>${vo.subject }</td>		
								</tr>
								<tr>
									<td>분  류</td><td>${vo.kind2 }</td>		
								</tr>
								<tr>
									<td>기  간</td><td>${vo.s_date } ~ ${vo.e_date }</td>		
								</tr>
								<tr>
									<td>요  일</td><td>${vo.day }</td>		
								</tr>
								<tr>
									<td>시  간</td><td>${vo.s_hour }:${vo.s_minute }&nbsp;~&nbsp;${vo.e_hour}:${vo.e_minute}</td>		
								</tr>
								<tr>
									<td>지  역</td><td>${vo.place1 }&nbsp;${vo.place2 }</td>		
								</tr>
								<tr>
									<td>장  소</td><td>${vo.place3 }</td>		
								</tr>
								<tr>
									<td>인  원</td><td>${vo.people }</td>		
								</tr>
								</table>
								<br>
								<div>
									<h4>스터디 커리큘럼</h4>
								</div>
								<br>
								<div style="border:3px solid black">
										${vo.content }
								</div>
										
									
							</div>
						</div>
					</div>	
			
		</div>
		
		<div>
		
		</div>
	</div>
</body>
</html>