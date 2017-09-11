function doChange2(place_select,targetId){
   var val = place_select.options[place_select.selectedIndex].value; //mainSel = 첫번째 select
   var targetE = document.getElementById(targetId); //targetId = 두번째 select
   removeAll(targetE);
   if(val == '서울시'){
      addOption('강남구',targetE);
      addOption('강동구',targetE);
      addOption('강북구',targetE);
      addOption('강서구',targetE);
      addOption('관악구',targetE);
      addOption('광진구',targetE);
      addOption('구로구',targetE);
      addOption('금천구',targetE);
      addOption('노원구',targetE);
      addOption('도봉구',targetE);
      addOption('동대문구',targetE);
      addOption('동작구',targetE);
      addOption('마포구',targetE);
      addOption('서대문구',targetE);
      addOption('서초구',targetE);
      addOption('성동구',targetE);
      addOption('송파구',targetE);
      addOption('양천구',targetE);
      addOption('영등포구',targetE);
      addOption('용산구',targetE);
      addOption('은평구',targetE);
      addOption('종로구',targetE);
      addOption('중구',targetE);
      addOption('중랑구',targetE);
   }
   else if(val=="강원도"){
	   addOption('고성군',targetE);
	   addOption('동해시',targetE);
	   addOption('삼척시',targetE);
	   addOption('속초시',targetE);
	   addOption('양구군',targetE);
	   addOption('양양군',targetE);
	   addOption('영월군',targetE);
	   addOption('원주시',targetE);
	   addOption('인제군',targetE);
	   addOption('정선군',targetE);
	   addOption('철원군',targetE);
	   addOption('춘천시',targetE);
	   addOption('태백시',targetE);
	   addOption('평창군',targetE);
	   addOption('홍천군',targetE);
	   addOption('화천군',targetE);
	   addOption('횡성군',targetE);
   }
   
   else if(val == '경기도'){
	   addOption('가평군',targetE);
	   addOption('고양시 덕양구',targetE);
	   addOption('고양시 일산동구',targetE);
	   addOption('고양시 일산서구',targetE);
	   addOption('과천시',targetE);
	   addOption('광명시',targetE);
	   addOption('광주시',targetE);
	   addOption('구리시',targetE);
	   addOption('군포시',targetE);
	   addOption('김포시',targetE);
	   addOption('남양주시',targetE);
	   addOption('동두천시',targetE);
	   addOption('부천시',targetE);
	   addOption('성남시',targetE);
	   addOption('수원시',targetE);
	   addOption('시흥시',targetE);
	   addOption('안산시',targetE);
	   addOption('양주시',targetE);
	   addOption('양평군',targetE);
	   addOption('여주군',targetE);
	   addOption('연천군',targetE);
	   addOption('용인시',targetE);
	   addOption('의왕시',targetE);
	   addOption('의정부시',targetE);
	   addOption('이천시',targetE);
	   addOption('파주시',targetE);
	   addOption('평택시',targetE);
	   addOption('포천시',targetE);
	   addOption('하남시',targetE);
	   addOption('화성시',targetE); 
   }
   else if(val == '경상남도'){
	   addOption('김해시',targetE);
	   addOption('밀양시', targetE);
	   addOption('사천시', targetE);
	   addOption('진주시',targetE);
	   addOption('창원시', targetE);
	   addOption('통영시', targetE);
	   addOption('합천군', targetE);
	  
   }
   else if(val == '경상북도'){
	   addOption('경주시',targetE);
	   addOption('김천시', targetE);
	   addOption('경산시',targetE);
	   addOption('문경시', targetE);
	   addOption('안동시', targetE);
	   addOption('영양군', targetE);
	   addOption('포항시', targetE);
   }
   else if(val == '광주시'){
	   addOption('광산구',targetE);
	   addOption('남구', targetE);
	   addOption('동구',targetE);
	   addOption('북구', targetE);
	   addOption('서구', targetE);
   }
   
   else if(val == '대구시'){
	   addOption('남구',targetE);
	   addOption('달서구', targetE);
	   addOption('달성군',targetE);
	   addOption('동구',targetE);
	   addOption('북구', targetE);
	   addOption('서구', targetE);
	   addOption('수성구', targetE);
	   addOption('중구', targetE);  
   }
   else if(val == '대전시'){
	   addOption('대덕구',targetE);
	   addOption('동구', targetE);
	   addOption('서구',targetE);
	   addOption('유성구',targetE);
	   addOption('중구', targetE);
   }
   else if(val == '부산시'){
	   addOption('강서구',targetE);
	   addOption('금정구', targetE);
	   addOption('기장군',targetE);
	   addOption('남구', targetE);
	   addOption('동구', targetE);
	   addOption('동래구', targetE);
	   addOption('부산진구', targetE);
	   addOption('북구', targetE);
	   addOption('사상구', targetE);
	   addOption('서하구', targetE);
	   addOption('서구', targetE);
	   addOption('수영구', targetE);
	   addOption('연제구', targetE);
	   addOption('영도구', targetE);
	   addOption('중구', targetE);
	   addOption('해운대구', targetE);
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