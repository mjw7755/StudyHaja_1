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