<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요합니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewMatchingBoardForm</title>
<link href="/style/newMatchingBoardFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
<script>
	$(function() {
		
		loadStadiumNo();
		
	});

	function checkBoardRegForm()
	{
		var formObj = $("[name='newMatchingBoard']")
		
		$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/newMatchingBoardProc.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,
			type : "post"
	
			,
			data : formObj.serialize()
	
			,
			success : function(json) {
	
				var result = json["result"];
				
				if(result == 1)
				{
					alert("게시물 입력 성공!");
					location.href='/matchingForm.do';
				}
				else
				{
					alert("게시물 입력 실패!")
				}
	
				
	
			}
	
			,
			error : function() {
	
				alert("입력 실패! 관리자에게 문의 바랍니다.");
			}
	
		});	
	}
	
	function loadStadiumNo() {
		var formObj = $("[name='newMatchingBoard']");
	
	    $.ajax({
	        url: '/machingStadiumSelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	        	
	            var options = '';
	            for (var i = 0; i < json.length; i++) {
	            	var s = json[i];
	            	options += '<option value="' + s.stadium_no + '">' + s.stadium_name + '</option>';
	            }
	            
	            $("select[name='stadium_no']").html(options); // select 요소에 추가
	            
	            loadMachingDay();
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });
	}
	
	function loadMachingDay() {
		
		var formObj = $("[name='newMatchingBoard']");
		
	    $.ajax({
	        url: '/machingDaySelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	            var options = '';
	            for (var i = 0; i < json.length; i++) {
	            	var b = json[i];
	            	options += '<option value="' + b.booking_date + '">' + b.booking_date + '</option>';
	            }
	            
	            $("select[name='day']").html(options); // select 요소에 추가
	            
	            loadMachingTime();
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });		
	}
	
	function loadMachingTime() {
		
		var formObj = $("[name='newMatchingBoard']");
		
	    $.ajax({
	        url: '/machingTimeSelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	            var options = '';
	            for (var i = 0; i < json.length; i++) {
	            	var t = json[i];
	            	options += '<option value="' + t.time_no + '">' + t.time_range + '</option>';
	            }
	            
	            $("select[name='matchingTime']").html(options); // select 요소에 추가
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });		
	}
		
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardDetailFormTitle">
       <p class="titleBackgoundText">매칭 찾기</p>
    </div>

   	<form name="newMatchingBoard">
      <table class="newMatchingBoardFormRegTable" align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
      		<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<input type="text" name="title" class="title" size="113" maxlength="100" style="padding: 5px 15px;">
				</td>
			</tr>
            <tr>
				<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					${sessionScope.nickname}
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">팀명</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					${requestScope.myInfo.team_name}
				</td>
			</tr>
            <!-- 	주석처리
            <tr>
                <th bgColor="lightgray">지역</th>
                <td>
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
		              <option>군/구 선택</option>
		            </select>
				</td>
             </tr>
			-->
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">경기장명</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<select name="stadium_no" id="stadium_no" onchange="loadMachingDay()">
						<option value="0">매칭예약 미신청 상태</option>
					</select>
				</td>
			</tr>
             <!-- 	주석처리
             <tr>
                <th bgColor="lightgray">시간</th>
                <td>
                	<select name="matchingTime" id="">
		              	<option value="0">시간 선택</option>
						<option value="1">AM06시~AM08시</option>
						<option value="2">AM08시~AM10시</option>
						<option value="3">AM10시~AM12시</option>
						<option value="4">PM12시~PM14시</option>
						<option value="5">PM14시~PM16시</option>
						<option value="6">PM16시~PM18시</option>
						<option value="7">PM18시~PM20시</option>
						<option value="8">PM20시~PM22시</option>
						<option value="9">PM22시~PM24시</option>
						<option value="10">AM02시~AM04시</option>
						<option value="11">AM04시~AM06시</option>
	            	</select>
                </td>
             </tr>
              -->
              <tr>
				<th style="border-bottom: 1px solid #FFFFFF;">일시<br>(날짜)</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<select name="day" id="day" onchange="loadMachingTime()">
						<option value="0">매칭예약 미신청 상태</option>
					</select>
				</td>
			</tr>
            <tr>
				<th style="border-bottom: 1px solid #FFFFFF;">시간</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<select name="matchingTime" id="time">
                		<option value="0">매칭예약 미신청 상태</option>
                	</select>
				</td>
			</tr>  
			
             <!-- 	주석처리 순서 위치도 바꿈 
             <tr>
                <th bgColor="lightgray">일시</th>
                <td>
					<input type="date" id="date" name="day">
				</td>
             </tr>
			-->
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<textarea name="content" class="content" rows="20" cols="115" maxlength="1000" style="resize:none; padding: 5px 15px;"></textarea>
				</td>
			</tr>
         </table>
      	<div class="newMatchingBoardFormBtnDiv">
			<div class="resetBtnDiv">
				<input type="reset" class="boardResetBtn"value="다시 작성">
			</div>
			<div class="boardRegAndMoveList">
				<input type="button" class="boardRegBtn" value="저장" onClick="checkBoardRegForm();">
				<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/matchingForm.do')">
			</div>
		</div>
      <input type="hidden" name="writer" value="${sessionScope.m_no}">
      <input type="hidden" name="m_no" value="${sessionScope.m_no}">
      <input type="hidden" name="team_no" value="${requestScope.myInfo.team_no}">
      
     </form>

      
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
        <!--  <span style="cursor: pointer"
            onclick="location.href='/matchingForm.do'">
            [목록 화면으로] </span>
         <input type="button" value="등록" style="cursor:pointer" onclick="checkBoardRegForm()" > -->
      
     
    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>