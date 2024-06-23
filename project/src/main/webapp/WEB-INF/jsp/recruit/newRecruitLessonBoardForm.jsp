<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewRecruitLessonBoardForm</title>
<link href="/style/newRecruitLessonBoardFormStyle.css" rel="stylesheet">
<script src="/js/newRecruitLessonBoardFormScript.js"></script>
<script src="/js/common.js"></script>

<script>

	function checkBoardRegForm()
	{
		//------------------------------------------------------------------------
		// name='newRecruitLessonBoardForm" 를 가진 form 태그 관리 JQuery 객체 메위주 얻기 
		//------------------------------------------------------------------------
		var formObj = $("[name='newRecruitLessonBoardForm']");
		
		var titleObj = formObj.find(".title");
        var sidoId = formObj.find("[name='sido']").val();
        var sigunguId = formObj.find("[name='sigungu']").val();
        var dayObj = formObj.find("[name='day']:checked").val();
        var timeObj = formObj.find("[name='time']:checked").val();
        var moneyObj = formObj.find("[name='money']:checked").val();
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
		// 비용 유효성 검사하기
		//----------------------------------------------
		if (!moneyObj) {
            alert("비용을 선택해 주셔야 합니다.");
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
		
		$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/recruitLessonRegProc.do"
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
					location.href='/recruitLessonBoardForm.do';
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

</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newRecruitLessonBoardFormTitle">
    	<p class="titleBackgoundText">레슨 모집 등록</p>
    </div>
    <div class="newRecruitLessonBoardFormContainer">
    
		<form name="newRecruitLessonBoardForm">
			<table class="newRecruitLessonBoardFormRegTable" align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<input type="text" name="title" class="title" size="119" maxlength="100">
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						${sessionScope.nickname}
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">지역</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<select name="sido" id="sido" onchange="categoryChange(this)">
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
				
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">요일</th>
					<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="1" style="zoom:2.0; margin-right: 5px;">월
						</label>
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="2" style="zoom:2.0; margin-right: 5px;">화
						</label>
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="3" style="zoom:2.0; margin-right: 5px;">수
						</label>
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="4" style="zoom:2.0; margin-right: 5px;">목
						</label>
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="5" style="zoom:2.0; margin-right: 5px;">금
						</label>
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="6" style="zoom:2.0; margin-right: 5px;">토
						</label>
						<label style="display: flex; align-items: center; margin-right: 65px;">
							<input type="checkbox" name="day" value="7" style="zoom:2.0; margin-right: 5px;">일
						</label>
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">시간</th>
					<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
						<label style="display: flex; align-items: center; margin-right: 50px;">
							<input type="checkbox" name="time" value="새벽" style="zoom:2.0; margin-right: 5px;">새벽
						</label>
						<label style="display: flex; align-items: center; margin-right: 50px;">
							<input type="checkbox" name="time" value="오전" style="zoom:2.0; margin-right: 5px;">오전
						</label>
						<label style="display: flex; align-items: center; margin-right: 50px;">
							<input type="checkbox" name="time" value="오후" style="zoom:2.0; margin-right: 5px;">오후
						</label>
						<label style="display: flex; align-items: center; margin-right: 50px;">
							<input type="checkbox" name="time" value="야간" style="zoom:2.0; margin-right: 5px;">야간
						</label>
					</td>
				</tr>
				
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">비용</th>
					<td style="border-bottom: 1px solid #c59246e0; text-align: center; display: flex; align-items: center;">
						<label style="display: flex; align-items: center; margin-right: 50px;">
							<input type="radio" name="money" value="무료" style="zoom:2.0; margin-right: 5px;">무료
						</label>
						<label style="display: flex; align-items: center; margin-right: 50px;">
							<input type="radio" name="money" value="유료" style="zoom:2.0; margin-right: 5px;">유료
						</label>
				</tr>
				
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<textarea name="content" class="content" rows="20" cols="122" maxlength="1000" style="resize:none"></textarea>
					</td>
				</tr>
				
			</table>
			<div class="newRecruitLessonBoardFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/recruitLessonBoardForm.do')">
				</div>
			</div>
			      <input type="hidden" name="nickname" value="${sessionScope.m_no}">
		</form>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>