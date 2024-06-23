<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewMatchingBoardForm</title>
<link href="/style/newMatchingBoardFormStyle.css" rel="stylesheet">
<script src="/js/newMatchingBoardFormScript.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newMatchingBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">매칭 등록</p>
    </div>
    <div class="newMatchingBoardFormContainer">
		<form name="newMatchingBoardForm">
			<table class="newMatchingBoardFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="subject" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<input type="text" name="writer" class="writer" size="40" maxlength="15">
					</td>
				<tr>
					<th>
					지역
					</th>
					<td colspan="5">
						<div class="search_boxes">
				            <select name="sido" class="sido" id="" onchange="categoryChange(this)">
					        	<option value>시/도 선택</option>
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
				            <select name="gungu" class="gungu" id="state">
				              <option>군/구 선택</option>
				            </select>
				            <p class="searchBoxText">* 필수 입력</p>
				         </div>
			         </td>
				</tr>
				<tr>
					<th>
						시간
					</th>
					<td colspan="5">
						<input type="radio" class="newMatchingBoardTime" name="time" value="00" checked>00 ~ 02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="02">02 ~ 04&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="04">04 ~ 06&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="06">06 ~ 08<br>
						<input type="radio" class="newMatchingBoardTime" name="time" value="08">08 ~ 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="10">10 ~ 12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="12">12 ~ 14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="14">14 ~ 16<br>
						<input type="radio" class="newMatchingBoardTime" name="time" value="16">16 ~ 18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="18">18 ~ 20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="20">20 ~ 22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" class="newMatchingBoardTime" name="time" value="22">22 ~ 24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" id="day1" name="day" onclick="setweekDay()" value="mon" checked>월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="day2" name="day" onclick="setweekDay()" value="tue">화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="day3" name="day" onclick="setweekDay()" value="wed">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="day4" name="day" onclick="setweekDay()" value="thr">목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="day5" name="day" onclick="setweekDay()" value="fri">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="day6" name="day" onclick="setweekDay()" value="sat">토&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="day7" name="day" onclick="setweekDay()" value="sun">일
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40" maxlength="4">
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
		</form>
	</div>
</body>
</html>