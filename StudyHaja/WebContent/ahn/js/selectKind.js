function doChange(first_select,targetId){
   var val = first_select.options[first_select.selectedIndex].value; //mainSel = 첫번째 select
   var targetE = document.getElementById(targetId); //targetId = 두번째 select
   removeAll(targetE);
   if(val == '취업'){
      addOption('토익',targetE);
      addOption('토익스피킹',targetE);
      addOption('토플',targetE);
      addOption('오픽',targetE);
      addOption('텝스',targetE);
      addOption('자격증',targetE);
      addOption('인적성',targetE);
      addOption('면접',targetE);
      addOption('자기소개서',targetE);
      addOption('대외활동',targetE);
      addOption('공모전',targetE);
      addOption('기타',targetE);
   }
   
   else if(val == '어학'){
      addOption('영어',targetE);
      addOption('일어',targetE);
      addOption('중국어',targetE);
      addOption('독일어',targetE);
      addOption('프랑스어',targetE);
      addOption('아랍어',targetE);
      addOption('러시아어',targetE);
      addOption('이탈리야어',targetE);
      addOption('기타',targetE);
   }
   else if(val == '금융'){
	   addOption('주식',targetE);
	   addOption('부동산', targetE);
	   addOption('경매', targetE);
	   addOption('제테크', targetE);
	   addOption('경제', targetE);
	   addOption('회계', targetE);
	   addOption('기타', targetE);
   }
   else if(val == '프로그래밍'){
	   addOption('C/C++', targetE);
	   addOption('JAVA', targetE);
	   addOption('Python', targetE);
	   addOption('Ruby', targetE);
	   addOption('Android', targetE);
	   addOption('Objective-C', targetE);
	   addOption('Linux', targetE);
	   addOption('웹프로그래밍', targetE);
	   addOption('게임프로그래밍', targetE);
	   addOption('시스템프로그래밍', targetE);
	   addOption('임베디드', targetE);
	   addOption('데이터베이스', targetE);
	   addOption('빅데이터', targetE);
	   addOption('소프트웨어공학', targetE);
	   addOption('기타', targetE); 
   }
   else if(val == '고시'){
	   addOption('사법',targetE);
	   addOption('행정', targetE);
	   addOption('외무', targetE);
	   addOption('CPA', targetE);
	   addOption('공무원', targetE);
	   addOption('임용', targetE);
	   addOption('감정평가사', targetE);
	   addOption('공인노무사', targetE);
	   addOption('변리사', targetE);
	   addOption('세무사', targetE);
	   addOption('기타', targetE);
   }
   else if(val == '기타'){
	   addOption('입시',targetE);
	   addOption('기타', targetE);
   }
   else if(val =="1차분류"){
	   
	   
	   alert("1차 분류를 선택해주세요.");
   }
}
function addOption(value, e){
   var o = new Option(value);
   try{
      e.add(o);
   }catch(ex){
      e.add(o, null);
   }
}

function removeAll(e){
   for(var i=0, end = e.options.length; i< end-1; ++i){
      e.remove(1);
   }
}

function checkFirst(first_select){
	 var val = first_select.options[first_select.selectedIndex].value;
	 if(val == "1차분류"){
		 alert("1차 분류부터 선택해주세요");
	 }
}