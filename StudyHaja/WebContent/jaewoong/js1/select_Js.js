


/*function searchFunction(){
	var request = new XMLHttpRequest();

	alert("dd");
	request.open("Post","../../searchPageServlet?subject="+encodeURIComponent(document.getElementById("subject").value),true);
	request.onreadystatechange = searchProcess;
	request.send(null);
}

function searchProcess(){
	alert("t");
	var table = document.getElementById("ajaxTable");
	table.innerHTML = "";
	if(request.readyState == 4 && request.status == 200){
		var object = eval('('+request.responseText+')');
		var result = object.result;
		
		for(var i=0;i<result.length;i++){
			var row = table.insertRow(0);
			for(var j=0;j<result[i].length;j++){
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}
		}
	}
} */

function doChange(mainSel,targetId){
	var val = mainSel.options[mainSel.selectedIndex].value;
	var targetE = document.getElementById(targetId);
	removeAll(targetE);
	
	if(val == 'gangwon'){
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
	
	else if(val == 'gyonggi'){
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
		addOption('부천시 소사구',targetE);
		addOption('부천시 오정구',targetE);
		addOption('부천시 원미구',targetE);
		addOption('성남시 분당구',targetE);
		addOption('성남시 수정구',targetE);
		addOption('성남시 중원구',targetE);
		addOption('수원시 권선구',targetE);
		addOption('수원시 영통구',targetE);
		addOption('수원시 장안구',targetE);
		addOption('수원시 팔달구',targetE);
		addOption('시흥시',targetE);
		addOption('안산시 단원구',targetE);
		addOption('안산시 상록구',targetE);
		addOption('안성시',targetE);
		addOption('안양시 동안구',targetE);
		addOption('안양시 만안구',targetE);
		addOption('양주시',targetE);
		addOption('용인시 처인구',targetE);
		addOption('의왕시',targetE);
		addOption('의정부시',targetE);
		addOption('이천시',targetE);
		addOption('파주시',targetE);
		addOption('평택시',targetE);
		addOption('포천시',targetE);
		addOption('하남시',targetE);
		addOption('화성시',targetE);
	}
	
	else if(val == 'gyongnam'){
		addOption('거제시',targetE);
		addOption('거창군',targetE);
		addOption('고성군',targetE);
		addOption('김해시',targetE);
		addOption('남해군',targetE);
		addOption('밀양시',targetE);
		addOption('사천시',targetE);
		addOption('산청군',targetE);
		addOption('양산시',targetE);
		addOption('의령군',targetE);
		addOption('진주시',targetE);
		addOption('창녕군',targetE);
		addOption('창원시 마산합포구',targetE);
		addOption('창원시 성산구',targetE);
		addOption('창원시 의창구',targetE);
		addOption('창원시 진해구',targetE);
		addOption('통영시',targetE);
		addOption('하동군',targetE);
		addOption('함안군',targetE);
		addOption('함양군',targetE);
		addOption('합천군',targetE);
	}
	
	else if(val == 'gyongbuk'){
		addOption('경산시',targetE);
		addOption('경주시',targetE);
		addOption('고령군',targetE);
		addOption('구미시',targetE);
		addOption('군위군',targetE);
		addOption('김천시',targetE);
		addOption('문경시',targetE);
		addOption('봉화군',targetE);
		addOption('상주시',targetE);
		addOption('성주군',targetE);
		addOption('안동시',targetE);
		addOption('영덕군',targetE);
		addOption('영양군',targetE);
		addOption('영주시',targetE);
		addOption('영천시',targetE);
		addOption('예천군',targetE);
		addOption('울릉군',targetE);
		addOption('울진군',targetE);
		addOption('의성군',targetE);
		addOption('청도군',targetE);
		addOption('청송군',targetE);
		addOption('칠곡군',targetE);
		addOption('포항시 남구',targetE);
		addOption('포항시 북구',targetE);
	}
	
	else if(val == 'guangju'){
		addOption('광산구',targetE);
		addOption('남구',targetE);
		addOption('동구',targetE);
		addOption('북구',targetE);
		addOption('서구',targetE);
	}
	
	else if(val == 'daegu'){
		addOption('남구',targetE);
		addOption('달서구',targetE);
		addOption('달성군',targetE);
		addOption('동구',targetE);
		addOption('북구',targetE);
		addOption('서구',targetE);
		addOption('수성구',targetE);
		addOption('중구',targetE);
	}
	
	else if(val == 'daejeon'){
		addOption('대덕구',targetE);
		addOption('동구',targetE);
		addOption('서구',targetE);
		addOption('유성구',targetE);
		addOption('중구',targetE);
	}
	
	else if(val == 'busan'){
		addOption('강서구',targetE);
		addOption('금정구',targetE);
		addOption('기장군',targetE);
		addOption('남구',targetE);
		addOption('동구',targetE);
		addOption('동래구',targetE);
		addOption('부산진구',targetE);
		addOption('북구',targetE);
		addOption('사상구',targetE);
		addOption('사하구',targetE);
		addOption('서구',targetE);
		addOption('수영구',targetE);
		addOption('연제구',targetE);
		addOption('영도구',targetE);
		addOption('중구',targetE);
		addOption('해운대구',targetE);
	}
	
	else if(val == 'seoul'){
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
		addOption('성북구',targetE);
		addOption('송파구',targetE);
		addOption('양천구',targetE);
		addOption('영등포구',targetE);
		addOption('용산구',targetE);
		addOption('은평구',targetE);
		addOption('종로구',targetE);
		addOption('중구',targetE);
		addOption('중랑구',targetE);
	}
	
	else if(val == 'saejong'){
		addOption('세종시',targetE);
	}
	
	else if(val == 'ulsan'){
		addOption('남구',targetE);
		addOption('동구',targetE);
		addOption('북구',targetE);
		addOption('울주군',targetE);
		addOption('중구',targetE);
	}
	
	else if(val == 'inchoen'){
		addOption('강화군',targetE);
		addOption('계양구',targetE);
		addOption('남구',targetE);
		addOption('남동구',targetE);
		addOption('동구',targetE);
		addOption('부평구',targetE);
		addOption('서구',targetE);
		addOption('연수구',targetE);
		addOption('옹진군',targetE);
		addOption('중구',targetE);
	}
	
	else if(val == 'junnam'){
		addOption('강진군',targetE);
		addOption('고흥군',targetE);
		addOption('곡성군',targetE);
		addOption('광양시',targetE);
		addOption('구례군',targetE);
		addOption('나주시',targetE);
		addOption('담양군',targetE);
		addOption('목포시',targetE);
		addOption('무안군',targetE);
		addOption('보성군',targetE);
		addOption('순천시',targetE);
		addOption('신안군',targetE);
		addOption('여수시',targetE);
		addOption('영광군',targetE);
		addOption('영암군',targetE);
		addOption('완도군',targetE);
		addOption('장성군',targetE);
		addOption('장흥군',targetE);
		addOption('진도군',targetE);
		addOption('함평군',targetE);
		addOption('해남군',targetE);
		addOption('화순군',targetE);
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