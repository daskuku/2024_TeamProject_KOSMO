function isEmpty( str ) {
	if ( typeof( str ) != "string" ) { 
		str = ""; 
	}	
	
	str = str.trim( );	
	
	return str == "";
}

function checkDateRange(minYearObj, minMonthObj, maxYearObj, maxMonthObj, title) {
	/*	1. 년도 선택 후 월 선택하기
	2. maxYear, Month 가 minYear, Month 보다 커야한다.
	3. minYear 가 maxYear 선택시 onchange 라는걸 만들어 2024년 01월 ~ 2024년 12월

	체크1 - 4개 다 들어간 상태 min 이 max 보다 크면 안돼!
	체크2 - min년은 없는데 min월은 있으면 안돼!
	체크3 - min년월 중에 min 년도만 선택했으면 max 을 선택하게 하면 min 과 크거나 같아야해		*/
	
	try {
		var minYear = minYearObj.val();
		
		if (minYearObj.length == 0) {
			alert("checkDateRange 함수 호출 시 들어오는 1번째 인자에 대응하는 태그가 없습니다.");
			return; 
		}
		
		var minMonth = minMonthObj.val();
		
		if (minMonthObj.length == 0) {
			alert("checkDateRange 함수 호출 시 들어오는 2번째 인자에 대응하는 태그가 없습니다.");
			return; 
		}
		
		var maxYear = maxYearObj.val();
		
		if (maxYearObj.length == 0) {
			alert("checkDateRange 함수 호출 시 들어오는 3번째 인자에 대응하는 태그가 없습니다.");
			return; 
		}
		
		var maxMonth = maxMonthObj.val();
		
		if (maxMonthObj.length == 0) { 
			alert("checkDateRange 함수 호출 시 들어오는 4번째 인자에 대응하는 태그가 없습니다.");
			return; 
		}
		
		if (title == undefined) {
			title = ""; 
		}
		
		var emptyMinYear = (minYear == "");
		var emptyMinMonth = (minMonth == "");
		var emptyMaxYear = (maxYear == "");
		var emptyMaxMonth = (maxMonth == "");
		
		var hasMinYear = (minYear != "");
		var hasMinMonth = (minMonth != "");
		var hasMaxYear = (maxYear != "");
		var hasMaxMonth = (maxMonth != "");
		
		var minYearMonth = minYear + minMonth;
		var maxYearMonth = maxYear + maxMonth;
		
		if (hasMinYear && emptyMinMonth) {
			minMonthObj.val("01");
			minMonth = "01";
		}
		
		if (hasMaxYear && emptyMaxMonth) {
			maxMonthObj.val("12");
			maxMonth = "12";
		}
		
		if (hasMinYear && hasMinMonth && hasMaxYear && hasMaxMonth) {
			if (minYearMonth > maxYearMonth) {
				alert(title + " 미니멈 년월이 맥시멈 년월보다 크면 안됩니다.");
				maxYearObj.val("");
				maxMonthObj.val("");
				return;
			}
		}
		
		if (emptyMinYear && hasMinMonth) {
			alert(title + "미니멈 년도를 먼저 선택하세요.");
			minMonthObj.val("");
			return;
		}
		
		if (emptyMaxYear && hasMaxMonth) {
			alert(title + "멕시멈 년도를 먼저 선택하세요.");
			maxMonthObj.val("");
			return;
		}
		
		if (hasMinYear && hasMaxYear) {
			if (minYear > maxYear) {
				alert(title + "미니멈 년이 맥시멈 년보다 크면 안됩니다.");
				minYearObj.val("");
				return;
			}
		}
	}
	catch(ex) {
		alert("checkDateRange 함수에서 예외 발생! " + ex.message);
	}
}

function getOptionWithYear(minYear, maxYear) {
	if ( minYear > maxYear ) {
		var tmp = minYear;
		minYear = maxYear;
		maxYear = tmp;
	}
	
	var arr = [];
	for (var i = maxYear; i >= minYear; i--) {
		arr.push("<option value='" + i + "'>" + i + "</option>");
	}
	
	return arr.join("");
}

function thisYear( ) {
	return new Date().getFullYear();
}

// 지역 검색



function categoryChange(e) {
    const state = document.getElementById("state");

    const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
    const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
    const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
    const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
    const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
    const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
    const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
    const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    const ulsan = ["남구","동구","북구","중구","울주군"];
    const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
    const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
    const jeju = ["서귀포시","제주시","남제주군","북제주군"];
    const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
    const chungnam = ["천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시","금산군","부여군","서천군","청양군","홍성군","예산군","태안군"];

    let add;
    let startValue;

    switch (e.value) {
        case "1":
            add = gangwon;
            startValue = 1;
            break;
            
        case "2":
            add = gyeonggi;
            startValue = 19;
            break;
            
        case "3":
            add = gyeongsangnam;
            startValue = 50;
            break;
            
        case "4":
            add = gyeongsangbuk;
            startValue = 70;
            break;
            
            
        case "5":
            add = gwangju;
            startValue = 93;
            break;
            
        case "6":
            add = daegu;
            startValue = 98;
            break;
            
        case "7":
            add = daejeon;
             startValue = 106;
            break;
            
        case "8":
            add = busan;
             startValue = 111;
            break;
            
        case "9":
            add = seoul;
            startValue = 127;
            break;
            
        case "10":
            add = ulsan;
            startValue = 152;
            break;
            
        case "11":
            add = incheon;
            startValue = 157;
            break;
            
        case "12":
            add = jeonnam;
            startValue = 167;
            break;
            
        case "13":
            add = jeonbuk;
            startValue = 189;
            break;
            
        case "14":
            add = jeju;
            startValue = 203;
            break;
            
        case "15":
            add = chungnam;
            startValue = 207;
            break;
            
        case "16":
            add = chungbuk;
            startValue = 219;
            break;
            
        default:
            add = [];
    }

    state.options.length = 1;

	 for (let i = 0; i < add.length; i++) {
        let opt = document.createElement("option");
        opt.value = startValue + i; // 각각의 군/구에 숫자 할당
        opt.innerHTML = add[i];
        state.appendChild(opt);
    }
	
    
}