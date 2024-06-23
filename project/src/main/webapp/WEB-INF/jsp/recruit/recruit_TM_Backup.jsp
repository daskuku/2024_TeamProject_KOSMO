<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitTeamMemBoardForm</title>
<link href="/style/recruitTeamBoardFormStyle.css" rel="stylesheet">
<link href="/style/job.css" rel="stylesheet">
<link href="/style/sub.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>

<script>

$(document).ready(function(){
	$(".teamRecruit").click(function(){
		$(".teamRecruit").removeClass("onvalue");
		$(this).addClass("onvalue");
	});
	
	sort_All();
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
	var boardSearchFormObj = $("[name='recruitTeamMemSearchForm']");

	var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

	var keyword1 = keyword1Obj.val();
	  
	if(typeof(keyword1)!='string' ){keyword1=""; }
    
    keyword1 = $.trim(keyword1);
    
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

		}

		,
		error : function() {

			alert("검색 실패! 관리자에게 문의 바랍니다.");
		}

	});

}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardFormTitle">
    	<img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">팀 / 팀원 모집</p>
    </div>
    <br>
   <div>
   		 <center>
   			<table style="border-collapse:collapse" border="1">
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
			<br>
			<div class="newRecruitTeamMemBoardBtnDiv">
				<input type="button" class="newRecruitTeamBoardBtn" value="새 글 쓰기" onclick="location.href='/newRecruitTeamBoardForm.do'">
			</div>
		</center>
		
		<form name="recruitTeamMemSearchForm" onsubmit="return false">
		<center>
   			<table align="center">
				<tr>
					<td>
					<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:50px; width:1000px;" cellpadding="7" align="center">
					
						<tr>
							<th>
								검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
							</th>
							<td>
								<select name="searchType1">
									<option value="all">전체</option>
									<option value="writer">글작성자</option> 
									<option value="title">제목</option>
									<option value="content">내용</option>
									추가적인 검색 조건을 샐렉트 박스에 추가
								</select> 
								<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()"> 
							</td>
						</tr>
						
						<tr>
							<th>
								지역선택
							</th>
							<td colspan="5" align="center">
							<div class="search_boxes">
				
					            <select name="sido" id="" onchange="categoryChange(this)">
					              <option value="">시/도 선택</option>
					              <option value="general01">강원</option>
					              <option value="general02">경기</option>
					              <option value="general03">경남</option>
					              <option value="general04">경북</option>
					              <option value="general05">광주</option>
					              <option value="general06">대구</option>
					              <option value="general07">대전</option>
					              <option value="general08">부산</option>
					              <option value="general09">서울</option>
					              <option value="general10">울산</option>
					              <option value="general11">인천</option>
					              <option value="general12">전남</option>
					              <option value="general13">전북</option>
					              <option value="general14">제주</option>
					              <option value="general15">충남</option>
					              <option value="general16">충북</option>
					            </select>
				
					            <select name="gungu" id="state">
					              <option>군/구 선택</option>
					            </select>
					         </div>
					         </td>
						</tr>
						
						<tr>
							<th>선호 요일</th>
							<td>
								<input type="checkbox" id="workweekcdGroupA" name="allweekday" onclick="setweekgroup()">평일(월,화,수,목,금)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="workweekcdGroupB" name="allweekend" onclick="setweekgroup()">주말(토,일)
								<br>
								<input type="checkbox" id="day1" name="day" onclick="setweekDay()" value="mon">월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="day2" name="day" onclick="setweekDay()" value="tue">화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="day3" name="day" onclick="setweekDay()" value="wed">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="day4" name="day" onclick="setweekDay()" value="thr">목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="day5" name="day" onclick="setweekDay()" value="fri">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="day6" name="day" onclick="setweekDay()" value="sat">토&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="day7" name="day" onclick="setweekDay()" value="sun">일
								<br>
								<input type="checkbox" id="day0" name="day" value="everyday" onclick="allday()">상관없음
							</td>
						</tr>
						
						<tr>
							<th>
								선호 시간
							</th>
							<td colspan="5" align="center">
								<input type="checkbox" id="morning" name="time" onclick="timeset()" value="morning">새벽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="am" name="time" onclick="timeset()" value="am">오전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="pm" name="time" onclick="timeset()" value="pm">오후&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="night" name="time" onclick="timeset()" value="night">야간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="everytime" name="time" onclick="everyset()" value="everytime">상관없음
							</td>
						</tr>
						
					</table>
				</td>
				
			</tr>
			<tr align="center">
				<td>
					<input type="button" value="검색" onclick="search()">
				</td>
			</tr>
			</tbody></table>
		</center>
		</form>
			
		<div class="recruitTeamMemBoard">
			<table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
				<tr>
					<th style="width:50px;">번호</th>
					<th style="width:300px;">제목</th>
					<th style="width:80px;">글쓴이</th>
					<th style="width:100px;">조회수</th>
					<th style="width:100px;">등록일</th>
					<c:forEach var="list" items="${requestScope.boardList}" varStatus="status">
						<tr style="cursor:pointer" onClick="">
							<td align="center">${list.b_no}</td>
							<td align="center">${list.title}</td>
							<td align="center">${list.writer}</td>
							<td align="center">${list.readcount}</td>
							<td align="center">${list.reg_date}</td>
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.boardList}">
					<center>
					<br><br><br><br>
					<b>조건에 맞는 결과물이 없습니다.</b>
					</center>
			</c:if>
			
		</div>
	</div>
	
	<form action="/newRecruitTeamBoardForm.do" method="post">
	
	</form>
	   
</body>
</html>