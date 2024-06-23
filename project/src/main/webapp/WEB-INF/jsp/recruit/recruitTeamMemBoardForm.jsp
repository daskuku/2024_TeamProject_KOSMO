<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitTeamMemBoardForm</title>
<link href="/style/recruitTeamBoardFormStyle.css" rel="stylesheet">
<link href="/style/sub.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
<script src="/js/common.js"></script>

<script>

$(document).ready(function(){
	$(".teamRecruit").click(function(){
		$(".teamRecruit").removeClass("onvalue");
		$(this).addClass("onvalue");
	});
	
	$('.detail_Search').hide(); // 초기에 list id를 가진 div를 보이지 않게 숨긴다.
    $('.detailBtn').click(function(){ // html 내에서 open이라는 id를 가진 요소를 클릭할 시 발생하는 이벤트 함수
        $('.detail_Search').slideToggle(); // list 라는 id를 가진 div를 slideDown
    });
	
    $(".rowCntPerPage").val("10");
	search();
	
})

sort = "all";



function enterkey()
{
	
	if(window.event.keyCode == 13)
	{
		search();
	}
}


function sort_Team()
{
	$.ajax({
		//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url : "/recruitTeamMemBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,
		type : "post"

		,
		data : "sort=team"

		,
		success : function(responseHtml) {

			var obj = $(responseHtml);

			$(".recruitTeamMemBoard").html(obj.find(".recruitTeamMemBoard").html());

			sort="team";
			
			search();
		}

		,
		error : function() {

			alert("검색 실패! 관리자에게 문의 바랍니다.");
		}

	});	
}

function sort_Mem()
{
	$.ajax({
		//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url : "/recruitTeamMemBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,
		type : "post"

		,
		data : "sort=mem"

		,
		success : function(responseHtml) {

			var obj = $(responseHtml);

			$(".recruitTeamMemBoard").html(obj.find(".recruitTeamMemBoard").html());

			sort="mem";
			
			
			
			search();
		}

		,
		error : function() {

			alert("검색 실패! 관리자에게 문의 바랍니다.");
		}

	});	
}

function sort_All()
{
	$.ajax({
		//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url : "/recruitTeamMemBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,
		type : "post"

		,
		data : "sort=all"

		,
		success : function(responseHtml) {

			var obj = $(responseHtml);

			$(".recruitTeamMemBoard").html(obj.find(".recruitTeamMemBoard").html());
			
			sort="all";
			
			
			
			search();
		}

		,
		error : function() {

			alert("검색 실패! 관리자에게 문의 바랍니다.");
		}

	});	
}

function search() {

	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='recruit_Team_mem']");

	var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

	var keyword1 = keyword1Obj.val();
	  
	if(typeof(keyword1)!='string' ){keyword1=""; }
    
    keyword1 = $.trim(keyword1);
    
    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val());
    
    
	$.ajax({
		//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url : "/recruitTeamMemBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,
		type : "post"

		,
		data : boardSearchFormObj.serialize() + "&sort=" + sort

		,
		success : function(responseHtml) {

			var obj = $(responseHtml);

			$(".recruitTeamMemBoard").html(obj.find(".recruitTeamMemBoard").html());
			
			$(".pagingNos").html(obj.find(".pagingNos").html());

		}

		,
		error : function() {

			alert("검색 실패! 관리자에게 문의 바랍니다.");
		}

	});

}

function searchAll(){
	
	var boardSearchFormObj = $("[name='recruit_Team_mem']");
	
	boardSearchFormObj.find("input[type=text]").val("");
    boardSearchFormObj.find(".sido").val("0");
    boardSearchFormObj.find(".sigungu").val("0");
    boardSearchFormObj.find(".sigungu").empty();
    boardSearchFormObj.find(".sigungu").append('<option value="0">군/구 선택</option>');
    boardSearchFormObj.find("input[type=checkbox]").prop("checked", false);
    boardSearchFormObj.find(".rowCntPerPage").val("10");
    boardSearchFormObj.find(".SelectPageNo").val("1");

    search();
}

function toggleText() {
    var detailBtn = document.querySelector('.detailBtn');
    if (detailBtn.textContent === '상세검색 열기') {
        detailBtn.textContent = '상세검색 닫기';
    } 
    else {
        detailBtn.textContent = '상세검색 열기';
    }
}


function pageNoClick(clickPageNo) {
	
	$("[name='recruit_Team_mem']").find(".selectPageNo").val(clickPageNo);

	search();

}

function goRecruitTeamMemDetailForm(b_no)
{
   $("[name='recruitTeamMemBoardDetailForm'] [name='b_no']").val(b_no); 
   document.recruitTeamMemBoardDetailForm.submit();
}

function searchWithSort(sort)
{
	$("[name='recruit_Team_mem']").find("[name='sort_date']").val(sort);
	search();
	
}

function checkReserveForm() 
{
   
   var sessionMid = '<%=session.getAttribute("mid")%>';

   if (sessionMid == "" || sessionMid == 'null') {
       alert('로그인이 필요한 서비스입니다.');
       location.href = '/loginForm.do';
       return;
   }
	else
	{
		document.newRecruitTeamMemBoard.submit();
	}
	   
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardFormTitle">
    	<p class="titleBackgoundText">팀 / 팀원 모집</p>
    </div>
    <br>
   <div>
	 	<table class="recruitTeamMemBoardCategoryTab">
			<tr>
				<td class="teamRecruit onvalue" onclick="sort_All()">
					전체
				</td>
				<td class="teamRecruit" onclick="sort_Team()">
					팀
				</td>
				<td class="teamRecruit" onclick="sort_Mem()">
					팀원
				</td>
			</tr>
		</table>
	
	<!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
		<form name="recruit_Team_mem" onsubmit="return false">
			<table align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
					<tr>
						<td>
							<table style="border-collapse: collapse; border-bottom: none;" align="center">
								<tr class="area">
									<th class="item" style="border-radius: 10px; border-bottom: none;">지역</th>
									<td class="content" colspan="5" style="text-align: center; width:200px; border-bottom: none;"><select name="sido" class="sido" id=""
										onchange="categoryChange(this)" style="width:200px; text-align: center;">
											<option value="0">시/도 선택</option>
											<option value="1">강원</option>
											<option value="2">경기</option>
											<option value="3">경남</option>
											<option value="4">경북</option>
											<option value="5">광주</option>
											<option value="6">대구</option>
											<option value="7">대전</option>
											<option value="8">부산</option>
											<option value="9">서울</option>
											<option value="10">울산</option>
											<option value="11">인천</option>
											<option value="12">전남</option>
											<option value="13">전북</option>
											<option value="14">제주</option>
											<option value="15">충남</option>
											<option value="16">충북</option>
									</select> <select name="sigungu" class="sigungu" id="state" style="width:200px; text-align: center;">
											<option value="0">군/구 선택</option>
									</select></td>
								</tr>
						<tr><td style="border-bottom: none;"></td></tr>
						<tr class="day">
						    <th class="item" style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">요일</th>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="allweekday" id="workweekcdGroupA" onClick="setweekgroup1()" style="zoom:2.0; margin-right: 5px;">
						            평일(월, 화, 수, 목, 금)
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="allweekday" id="workweekcdGroupB" onClick="setweekgroup2()" style="zoom:2.0; margin-right: 5px;">
						            주말(토, 일)
						        </label>
						    </td>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="1" id="day1" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            월
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="2" id="day2" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            화
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="3" id="day3" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            수
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="4" id="day4" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            목 
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="5" id="day5" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            금
						        </label>
						    </td>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="6" id="day6" onClick="setweekEnd()" style="zoom:2.0; margin-right: 5px;">
						            토
						        </label>
						        <label style="display: flex; align-items: center;">
						            <input type="checkbox" name="day" value="7" id="day7" onClick="setweekEnd()" style="zoom:2.0; margin-right: 5px;">
						            일
						        </label>
						    </td>
						    <td class="content" style="text-align: left; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center;">
						            <input type="checkbox" name="day" value="0" id="day0" onClick="allday()" style="zoom:2.0; margin-right: 5px;">
						            상관없음
						        </label>
						    </td>
						</tr>
						<tr><td style="border-bottom: none;"></td></tr>
						<tr class="time">
						    <th class="item" style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">시간</th>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; justify-content: center; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="morning" onClick="timeset()" value="새벽" style="zoom:2.0; margin-right: 5px;">
						            새벽
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="am" onClick="timeset()" value="오전" style="zoom:2.0; margin-right: 5px;">
						            오전
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="pm" onClick="timeset()" value="오후" style="zoom:2.0; margin-right: 5px;">
						            오후
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="night" onClick="timeset()" value="야간" style="zoom:2.0; margin-right: 5px;">
						            야간
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="everytime" onClick="everyset()" value="상관없음" style="zoom:2.0; margin-right: 5px;">
						            상관없음
						        </label>
						    </td>
						</tr>
						<tr><td style="border-bottom: none;"></td></tr>
						<tr class="pos">
						    <th class="item" style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">포지션</th>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="pos" id="st" onClick="positioncheck()" value="ST" style="zoom:2.0; margin-right: 5px;">
						            ST
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="pos" id="cm" onClick="positioncheck()" value="CM" style="zoom:2.0; margin-right: 5px;">
						            CM
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="pos" id="cb" onClick="positioncheck()" value="CB" style="zoom:2.0; margin-right: 5px;">
						            CB
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="pos" id="gk" onClick="positioncheck()" value="GK" style="zoom:2.0; margin-right: 5px;">
						            GK
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="pos" id="allPos" onClick="setposition()" value="allpos" style="zoom:2.0; margin-right: 5px;">
						            상관없음
						        </label>
						    </td>
						</tr>
								
							</table>
						<div class="search">
							<div class="content">
								<select name="searchType1" class="searchSelect">
									<option value="all">전체</option>
									<option value="writer">글작성자</option> 
									<option value="title">제목</option>
									<option value="content">내용</option>
									<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
								</select> 
							</div>
							<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()">
							<input type="button" value="검색" class="item" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;">
							<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">   
						</div>
					</tr>
					<!-- <tr align="center" style="border-top: 1px solid #c59246e0;">
						<td style="border-bottom: none;">
							<input type="button" value="검색" class="item" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 30px;">
							<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">
						</td>
					</tr> -->
				</table>
			<!-- <div class="top">
				<dl class="search">
	 				<dt class="item">검 색</dt>
					<dd  class="content">
						<select name="searchType1">
							<option value="all">전체</option>
							<option value="writer">글작성자</option> 
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> 
						<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()"> 
					</dd>
	 			</dl>
	 			<dl class="area">
	 				<dt class="item">지 역</dt>
	 					<dd class="content">	
	 						<select name="sido" id="" onchange="categoryChange(this)">
				              	<option value="0">시/도 선택</option>
								<option value="1">강원</option>
								<option value="2">경기</option>
								<option value="3">경남</option>
								<option value="4">경북</option>
								<option value="5">광주</option>
								<option value="6">대구</option>
								<option value="7">대전</option>
								<option value="8">부산</option>
								<option value="9">서울</option>
								<option value="10">울산</option>
								<option value="11">인천</option>
								<option value="12">전남</option>
								<option value="13">전북</option>
								<option value="14">제주</option>
								<option value="15">충남</option>
								<option value="16">충북</option>
			            	</select>
	
				            <select name="sigungu" id="state">
				              <option value="0">군/구 선택</option>
				            </select>
	 					</dd>
	 			</dl>
			</div>		
			
			<div class="middle">
				<dl class="day">
	  				<dt class="item">요 일</dt>
	  					<dd class="content">
							<input type="checkbox" id="workweekcdGroupA" name="allweekday" onclick="setweekgroup()">평일(월,화,수,목,금)&nbsp;&nbsp;
							<input type="checkbox" id="workweekcdGroupB" name="allweekend" onclick="setweekgroup()">주말(토,일)<br>
							<input type="checkbox" id="day1" name="day" onclick="setweekDay()" value="1">월&nbsp;&nbsp;
							<input type="checkbox" id="day2" name="day" onclick="setweekDay()" value="2">화&nbsp;&nbsp;
							<input type="checkbox" id="day3" name="day" onclick="setweekDay()" value="3">수&nbsp;&nbsp;
							<input type="checkbox" id="day4" name="day" onclick="setweekDay()" value="4">목&nbsp;&nbsp;
							<input type="checkbox" id="day5" name="day" onclick="setweekDay()" value="5">금<br>
							<input type="checkbox" id="day6" name="day" onclick="setweekDay()" value="6">토&nbsp;&nbsp;
							<input type="checkbox" id="day7" name="day" onclick="setweekDay()" value="7">일<br>
							<input type="checkbox" id="day0" name="day" value="0" onclick="allday()">상관없음
	  					</dd>
	  				</dl>
	  				
	  			<dl class="time">
	 				<dt class="item">시 간</dt>
	  					<dd  class="content">
	  						<input type="checkbox" id="morning" name="time" onclick="timeset()" value="새벽">새벽&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="am" name="time" onclick="timeset()" value="오전">오전&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="pm" name="time" onclick="timeset()" value="오후">오후&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="night" name="time" onclick="timeset()" value="야간">야간&nbsp;&nbsp;<br>
							<input type="checkbox" id="everytime" name="time" onclick="everyset()" value="alltime">상관없음&nbsp;&nbsp;
	  					</dd>
	  			</dl>
	  				
	  			<dl class="pos">
	  				<dt class="item">포 지 션</dt>
	  					<dd  class="content">
	  						<input type="checkbox" id="st" name="pos" onclick="" value="ST">ST&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="cm" name="pos" onclick="" value="CM">CM&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="cb" name="pos" onclick="" value="CB">CB&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="gk" name="pos" onclick="" value="GK">GK&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="allPos" name="pos" onclick="" value="allpos">상관없음
	  					</dd>
	  			</dl>
			</div>	
			
			<div class="detail_Search">
	 			<dl class="age">
	  				<dt class="item">연 령</dt>
	  					<dd>
	  						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="age" onclick="" value="10">10대&nbsp;&nbsp;
							<input type="radio" name="age" onclick="" value="20">20대&nbsp;&nbsp;
							<input type="radio" name="age" onclick="" value="30">30대&nbsp;&nbsp;
							<input type="radio" name="age" onclick="" value="40">40대&nbsp;&nbsp;
							<input type="radio" name="age" onclick="" value="50">50대 이상&nbsp;&nbsp;
	  					</dd>
	  				</dl>
	  				
	  			<dl class="career">
	  				<dt class="item">경 력</dt>
	  					<dd>
	  						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="career" value="newbie">1년 미만(초보)&nbsp;&nbsp;
							<input type="radio" name="career" value="1to3">1년 이상~3년 미만&nbsp;&nbsp;
							<input type="radio" name="career" value="3to5">3년 이상~5년 미만&nbsp;&nbsp;
							<input type="radio" name="career" value="up5">5년 이상&nbsp;&nbsp;
							<input type="radio" name="career" value="dirtyWater">선수 출신&nbsp;&nbsp;
	  					</dd>
	  			</dl>
	  				
	  			<dl class="leg">
	  				<dt class="item">주로쓰는 발</dt>
	  					<dd>
	  						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="mainLeg" value="rightLeg">오른발&nbsp;&nbsp;
							<input type="radio" name="mainLeg" value="leftLeg">왼발&nbsp;&nbsp;
	  						<input type="radio" name="mainLeg" value="bothLeg">양발	
	  					</dd>
	  			</dl>
	  			
	  			<dl class="enterFee">
	 				<dt class="item">가 입 비</dt>
	 					<dd>
	 						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="enterFee" value="yesEnterFee">있음&nbsp;&nbsp;
							<input type="radio" name="enterFee" value="noEnterFee">없음&nbsp;&nbsp;		
	 					</dd>
	 			</dl>
	 			<dl class="monthFee">
	 				<dt class="item">월 회 비</dt>
	 					<dd>
	 						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="monthFee" value="yesMonthFee">있음&nbsp;&nbsp;
						<input type="radio" name="monthFee" value="noMonthFee">없음&nbsp;&nbsp;		
	 					</dd>
	 			</dl>
			</div>
			s
				
			<div class="detailSpace">
	 			<dl class="detailBtn" >
	 				<dt class="item" onclick="toggleText()" style="cursor:pointer">상세검색 열기</dt>
	 			</dl>
	 		</div>
	-->		
	 		<input type="hidden" name="sort_date">
	 		<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
	 	</form>
		
<!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->  			
			
<!--			
   		 <center>
   		 <br><br>
   		 	<div class="searchBtn">
				<dl class="searchBtn" >
	 				<dt class="item" onclick="search()" class="searchBtn" style="cursor:pointer">검색</dt>
	 			</dl>
			</div>
   		 <br><br><br>
			<div class="newRecruitTeamMemBoardBtnDiv">
				<input type="button" class="newRecruitTeamBoardBtn" value="새 글 쓰기" onclick="checkReserveForm()">
			</div>
		</center> -->
		
		
		<div class="recruitTeamMemBoardTopContents">
			<%-- <span class="stadiumTransferFormFontLightGray" id="stadiumTransferAllCount">Total. ${requestScope.StadiumYangdoListAllCnt}개</span> --%>
			<div class="recruitTeamMemBoardFormRowCntPerPage">
				<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
					<option value="10">10개씩 보기
					<option value="15">15개씩 보기
					<option value="20">20개씩 보기
				</select>
			</div>
		</div>	
		<div class="recruitTeamMemBoard">
			<table class="boardListTable" cellpadding="7" align="center" style="border-collapse:collapse;">
				<tr>
					<th style="width:50px;">번호</th>
					<th style="width:300px;">제목</th>
					<th style="width:80px;">글쓴이</th>
					<th style="width:30px;">종류</th>
					<th style="width:100px;">조회수</th>
					
					<c:if test="${param.sort_date!='reg_date asc' and param.sort_date!='reg_date desc'}">
					<th width="100" onClick="searchWithSort('reg_date desc')" style="cursor:pointer">등록일</th>
					</c:if>
					<!--============================================================= -->
					<!-- 만약 파명 "sort" 의 파값이 'reg_date desc' 면 -->
					<!-- 즉 정렬 의지가 'reg_date desc' 면             -->
					<!--============================================================= -->
					<c:if test="${param.sort_date=='reg_date desc'}">
						<th width="100" onClick="searchWithSort('reg_date asc')" style="cursor:pointer">등록일 ▽</th>
					</c:if>	
					<!--============================================================= -->
					<!-- 만약 파명 "sort" 의 파값이 'reg_date asc' 면 -->
					<!-- 즉 정렬 의지가 'reg_date asc' 면             -->
					<!--============================================================= -->
					<c:if test="${param.sort_date=='reg_date asc'}">	
						<th width="100" onClick="searchWithSort('')" style="cursor:pointer">등록일 △</th>
					</c:if>
				</tr>
					<c:forEach var="list" items="${requestScope.boardList}" varStatus="status">
						<tr style="cursor:pointer" onClick="goRecruitTeamMemDetailForm(${list.b_no});">
							<td align="center" class="recruitTeamMemBoardFormFontLightGray">${requestScope.recruitMap.begin_serialNo_desc - status.index}</td>
							<td align="center">${list.title}</td>
							<td align="center" class="recruitTeamMemBoardFormFontLightGray">${list.nickname}</td>
							<td align="center" class="recruitTeamMemBoardFormFontLightGray">${list.team_mem}</td>
							<td align="center" class="recruitTeamMemBoardFormFontLightGray">${list.readcount}</td>
							<td align="center" class="recruitTeamMemBoardFormFontLightGray">${list.reg_date}</td>
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.boardList}">
					<center>
					<br><br>
					<b>조건에 맞는 결과물이 없습니다.</b>
					</center>
			</c:if>
		</div>
	<div class="newRecruitTeamMemBoardBtnDiv">
		<input type="button" class="newRecruitTeamMemBoardBtn"
			value="새 글 쓰기"
			onClick="checkReserveForm();">
	</div>
	<div class="recruitTeamMemBoardPaging">
		<span class="pagingNos">
			<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.recruitMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
			<c:forEach var="pageNo" begin="${requestScope.recruitMap.begin_pageNo}" end="${requestScope.recruitMap.end_pageNo}">
				<c:if test="${requestScope.recruitMap.selectPageNo==pageNo}">
		            <p class="activePageNo">${pageNo}</p>
		        </c:if>
				<c:if test="${requestScope.recruitMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.recruitMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
			<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
		</span>
	</div>
	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	<%-- 
	<center>

		<span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.recruitMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.recruitMap.begin_pageNo}"
				end="${requestScope.recruitMap.end_pageNo}">

				<c:if test="${requestScope.recruitMap.selectPageNo==pageNo}">
            ${pageNo}
         </c:if>

				<c:if test="${requestScope.recruitMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.recruitMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.recruitMap.last_pageNo})">[마지막]</span>
		</span> <select name="rowCntPerPage" class="rowCntPerPage"
			onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
		
	</center> --%>
	
	<form name="recruitTeamMemBoardDetailForm" action="/recruitTeamMemBoardDetailForm.do" method="post">
         <!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
         <input type="hidden" name="b_no">
      </form> 
      
      <form name="newRecruitTeamMemBoard" action="/newRecruitTeamMemBoardForm.do" method="post">
    	<!-- 내 팀이 없는 상태에서 팀원 모집글 못쓰게 하기 위해 -->
    	<input type="hidden" name="m_no" value="${sessionScope.m_no}">
    </form>
	   
</body>
</html>