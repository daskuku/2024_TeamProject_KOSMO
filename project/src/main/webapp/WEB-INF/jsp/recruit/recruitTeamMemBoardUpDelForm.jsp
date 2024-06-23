<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitTeamMemBoardUpDelForm</title>
<link href="/style/recruitTeamMemBoardUpDelFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>




<script>
	function checkBoardUpForm() {
		//------------------------------------------------------------------------
		// name='recruitTeamMemBoardUpDelForm" 를 가진 form 태그 관리 JQuery 객체 메위주 얻기 
		//------------------------------------------------------------------------
		var formObj = $("[name='recruitTeamMemBoardUpDelForm']");
		
		var titleObj = formObj.find(".title");
        var sidoId = formObj.find("[name='sido_id']").val();
        var sigunguId = formObj.find("[name='sigungu_id']").val();
        var dayObj = formObj.find("[name='day']:checked").val();
        var timeObj = formObj.find("[name='time']:checked").val();
        var posObj = formObj.find("[name='pos']:checked").val();
        var team_memObj = formObj.find("[name='team_mem']:checked").val();
        var contentObj = formObj.find(".content");
        
		//----------------------------------------------
		// 제목 문자 패턴 검사하기
		//----------------------------------------------
		if( new RegExp(/^.{2,30}$/).test(titleObj.val())==false ){
			//alert($(".title:checked").size());
			alert("제목은 임의 문자 2~30자 입력해야합니다");
			return;
		}

		//----------------------------------------------
		// 시도 유효성 검사하기
		//----------------------------------------------
        if (sidoId == 0) {
            alert("시/도를 선택해주세요.");
            return;
        }

		//----------------------------------------------
		// 시군구 유효성 검사하기
		//----------------------------------------------
        if (sigunguId == 0) {
            alert("군/구를 선택해주세요.");
            return;
        }

		//----------------------------------------------
		// 요일 유효성 검사하기
		//----------------------------------------------
		if (!dayObj) {
            alert("요일은 최소한 한 개 이상 선택해 주셔야 합니다.");
            return;
        }

		//----------------------------------------------
		// 시간 유효성 검사하기
		//----------------------------------------------
		if (!timeObj) {
            alert("시간은 최소한 한 개 이상 선택해 주셔야 합니다.");
            return;
        }

		//----------------------------------------------
		// 포지션 유효성 검사하기
		//----------------------------------------------
		if (!posObj) {
            alert("포지션을 선택해 주셔야 합니다.");
            return;
        }

		//----------------------------------------------
		// 종류 유효성 검사하기
		//----------------------------------------------
		if (!team_memObj) {
            alert("종류를 선택해 주셔야 합니다.");
            return;
        }
		//----------------------------------------------
		// 내용 문자 패턴 검사하기
		//----------------------------------------------
		if( 
				contentObj.val().trim().length==0 
				||
				contentObj.val().trim().length>500 
		){
			alert("내용은 임의 문자 1~500자 입력해야합니다.");
			return;
		}
		//----------------------------------------------
		// 정말 입력할 건지 확인하기
		//----------------------------------------------
		if( confirm("정말 입력하시겠습니까?")==false ){ return; }
		//-----------------------------------------------------
		// JQuery 객체의 [ajax 메소드]를 호출하여
		// WAS 에 비동기 방식으로 "/boardRegProc.do" 주소로 접속하고 
		// 게시판 입력 결과를 받아서
		// 성공했으면 경고하고 게시판 목록화면으로 이동하고
		// 실패했으면 경고하기
		//-----------------------------------------------------

		alert(formObj.serialize());
		
		$.ajax({
			url : "/recruitTeamMemBoardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				} 
				else {
					alert("수정 성공입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	
	function checkBoardDelForm() {
		var formObj = $("[name='recruitTeamMemBoardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/recruitTeamMemBoardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("이미 삭제된 글입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				} else {
					alert("게시물 삭제 성공!");
					location.href = "/recruitTeamMemBoardForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
	
</script>

</head>
<body>
	
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	
	<div class="recruitTeamMemBoardUpDelFormTitle">
		<p class="titleBackgoundText">팀 / 팀원 모집 수정 / 삭제</p>
	</div>


	<form name="recruitTeamMemBoardUpDelForm">
		<table class="recruitTeamMemBoardUpDelFormRegTable" align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<input type="text" name="title" class="title" size="115" maxlength="100" value="${requestScope.detail.title}" style="padding: 5px 15px;">
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					${requestScope.detail.nickname}
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">지역</th>
				<td colspan="5" style="border-bottom: 1px solid #c59246e0;">${requestScope.updel_sidosigungu.sido_c}-${requestScope.updel_sidosigungu.sigungu_c}->(수정)
					<select name="sido_id" id="sido_id" onchange="categoryChange(this)">
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
		              <option>군/구 선택</option>
		            </select>
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">요일</th>
				<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="1" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('월')}">checked</c:if>>월
					</label>
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="2" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('화')}">checked</c:if>>화
					</label>
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="3" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('수')}">checked</c:if>>수
					</label>
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="4" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('목')}">checked</c:if>>목
					</label>
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="5" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('금')}">checked</c:if>>금
					</label>
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="6" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('토')}">checked</c:if>>토
					</label>
					<label style="display: flex; align-items: center; margin-right: 65px;">
						<input type="checkbox" name="day" value="7" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_day.contains('일')}">checked</c:if>>일
					</label>
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">시간</th>
				<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="checkbox" name="time" value="새벽" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_time.contains('새벽')}">checked</c:if>>새벽
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="checkbox" name="time" value="오전" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_time.contains('오전')}">checked</c:if>>오전
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="checkbox" name="time" value="오후" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_time.contains('오후')}">checked</c:if>>오후
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="checkbox" name="time" value="야간" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.updel_time.contains('야간')}">checked</c:if>>야간
					</label>
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">포지션</th>
				<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="pos" value="ST" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.pos.contains('ST')}">checked</c:if>>ST
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="pos" value="CM" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.pos.contains('CM')}">checked</c:if>>CM
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="pos" value="CB" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.pos.contains('CB')}">checked</c:if>>CB
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="pos" value="GK" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.pos.contains('GK')}">checked</c:if>>GK
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="pos" value="All" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.pos.contains('ALL')}">checked</c:if>>ALL
					</label>
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">종류</th>
				<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="team_mem" value="팀" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.team_mem.contains('팀')}">checked</c:if>>팀
					</label>
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="team_mem" value="팀원" style="zoom:2.0; margin-right: 5px;" <c:if test="${requestScope.detail.team_mem.contains('팀원')}">checked</c:if>>팀원
					</label>
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<textarea name="content" class="content" rows="20" cols="118" maxlength="1000" style="resize:none; padding: 5px 15px;">${requestScope.detail.content}</textarea>
				</td>
			</tr>
		</table>
		<div class="recruitTeamMemBoardUpDelFormBtnDiv">
			<div class="resetBtnDiv">
				<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/recruitTeamMemBoardForm.do')">
				
			</div>
			<div class="boardUpDelList">
				<input type="button" class="boardUpBtn" value="수정" onClick="checkBoardUpForm();">
				<input type="reset" class="boardDelBtn"value="삭제" onclick="checkBoardDelForm();">
			</div>
		</div>
		<input type="hidden" name="b_no" value="${requestScope.detail.b_no}">
	</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>