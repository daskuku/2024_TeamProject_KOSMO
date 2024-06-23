<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MatchingUpDelForm</title>
<link href="/style/matchingUpDelFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>

<script>
	$(function() {		
		loadStadiumNo();		
	});

	//수정 관련 함수
	function checkBoardUpForm() {
		
		var formObj = $("[name='upDelMatching']");
		if (confirm("정말 수정하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/updateMatchingBoardProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/matchingForm.do";
				} 
				else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/matchingForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
	
	//삭제 관련 함수
	function checkBoardDelForm() {
		var formObj = $("[name='upDelMatching']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/deleteMatchingBoardProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("이미 삭제된 글입니다.");
					location.href = "/matchingForm.do";
				} else {
					alert("게시물 삭제 성공!");
					location.href = "/matchingForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
	
	function loadStadiumNo() {
		var formObj = $("[name='upDelMatching']");
	
	    $.ajax({
	        url: '/machingStadiumSelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	        	
	        	var options = '';
	        	var stadium_name = '${requestScope.upDelDetail.stadium_name}';
	        	var stadium_no = '';
	            
	            for (var i = 0; i < json.length; i++) {
	            	var s = json[i];
	            	
	            	if (s.stadium_name == stadium_name) {
	            		stadium_no = s.stadium_no;
	            	}
	            	
	            	options += '<option value="' + s.stadium_no + '">' + s.stadium_name + '</option>';	            	
	            }
	            
	            var selectBox = $("select[name='stadium_no']");	            
	            selectBox.html(options); // select 요소에 추가	            
	            selectBox.val(stadium_no).prop("selected", true);
	            
	            loadMachingDay();
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });
	}
	
	function loadMachingDay() {
		var formObj = $("[name='upDelMatching']");
		
	    $.ajax({
	        url: '/machingDaySelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	        	
	            var options = '';
	            var booking_date = '${requestScope.upDelDetail.booking_date}';
	            
	            for (var i = 0; i < json.length; i++) {
	            	var b = json[i];
	            	options += '<option value="' + b.booking_date + '">' + b.booking_date + '</option>';
	            }
	            
	            var selectBox = $("select[name='day']");
	            selectBox.html(options); // select 요소에 추가
	            selectBox.val(booking_date).prop("selected", true);
	            
	            loadMachingTime();
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });		
	}
	
	function loadMachingTime() {
		var formObj = $("[name='upDelMatching']");
		
	    $.ajax({
	        url: '/machingTimeSelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	        	
	            var options = '';
	            var time_range = '${requestScope.upDelDetail.time_range}';
	            var time_no = '';
	            
	            for (var i = 0; i < json.length; i++) {
	            	var t = json[i];
	            	
	            	if (t.time_range == time_range) {
	            		time_no = t.time_no;
	            	}
	            	
	            	options += '<option value="' + t.time_no + '">' + t.time_range + '</option>';	            	
	            }
	            
	            var selectBox = $("select[name='matchingTime']");
	            selectBox.html(options); // select 요소에 추가
	            selectBox.val(time_no).prop("selected", true);
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
       <p class="titleBackgoundText">매칭 찾기 수정 / 삭제</p>
    </div>

   
     	<form name="upDelMatching">
         <table class="matchingUpDelTable" align="center" cellpadding=7
            style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
            <tr>
				<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<input type="text" name="title" class="title" size="113" maxlength="100" value="${requestScope.upDelDetail.title}" style="padding: 5px 15px;">
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					${requestScope.upDelDetail.nickname}
				</td>
			</tr>
            
            <!-- 주석 처리 
            <tr>
                <th bgColor="lightgray">지 역</th>
                <td colspan="5" >${requestScope.upDelDetail.sido_c}-${requestScope.upDelDetail.sigungu_c}(수정)
		            <select name="sido_id" id="" onchange="categoryChange(this)">
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
		            <select name="sigungu_id" id="state">
		              <option value ="0">군/구 선택</option>
		            </select>
				</td>
             </tr>
              -->
             <!-- 
             <tr>
                <th bgColor="lightgray">시 간</th>
                <td>
                	<select name="matchingTime" id="" value="${requestScope.upDelDetail.time_no}">
		              	<option value="0" <c:if test="${requestScope.upDelDetail.time_no == 0}">selected</c:if>>시간 선택</option>
					    <option value="1" <c:if test="${requestScope.upDelDetail.time_no == 1}">selected</c:if>>AM06시~AM08시</option>
					    <option value="2" <c:if test="${requestScope.upDelDetail.time_no == 2}">selected</c:if>>AM08시~AM10시</option>
					    <option value="3" <c:if test="${requestScope.upDelDetail.time_no == 3}">selected</c:if>>AM10시~AM12시</option>
					    <option value="4" <c:if test="${requestScope.upDelDetail.time_no == 4}">selected</c:if>>PM12시~PM14시</option>
					    <option value="5" <c:if test="${requestScope.upDelDetail.time_no == 5}">selected</c:if>>PM14시~PM16시</option>
					    <option value="6" <c:if test="${requestScope.upDelDetail.time_no == 6}">selected</c:if>>PM16시~PM18시</option>
					    <option value="7" <c:if test="${requestScope.upDelDetail.time_no == 7}">selected</c:if>>PM18시~PM20시</option>
					    <option value="8" <c:if test="${requestScope.upDelDetail.time_no == 8}">selected</c:if>>PM20시~PM22시</option>
					    <option value="9" <c:if test="${requestScope.upDelDetail.time_no == 9}">selected</c:if>>PM22시~PM24시</option>
					    <option value="10" <c:if test="${requestScope.upDelDetail.time_no == 10}">selected</c:if>>AM02시~AM04시</option>
					    <option value="11" <c:if test="${requestScope.upDelDetail.time_no == 11}">selected</c:if>>AM04시~AM06시</option>
	            	</select>
	            </td>
             </tr>
              -->
             <!-- 
             <tr>
                <th bgColor="lightgray">날 짜</th>
                <td><input type="date" id="date" name="date" value="${requestScope.upDelDetail.day}"></td>
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
			 <tr>
				<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<textarea name="content" class="content" rows="20" cols="115" maxlength="1000" style="resize:none; padding: 5px 15px;">${requestScope.upDelDetail.content}</textarea>
				</td>
			</tr>
         </table>
         <div class="matchingUpDelFormBtnDiv">
			<div class="resetBtnDiv">
				<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/matchingForm.do')">
			</div>
			<div class="boardRegAndMoveList">
				<input type="button" value="수정" class="boardRegBtn" style="cursor:pointer" onclick="checkBoardUpForm();" >
	         	<input type="button" value="삭제" class="boardDelBtn" style="cursor:pointer" onclick="checkBoardDelForm();" >
				
			</div>
		</div>
		<input type="hidden" name="match_no" value="${requestScope.upDelDetail.match_no}">
		<input type="hidden" name="m_no" value="${requestScope.upDelDetail.m_no}">
        </form>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>