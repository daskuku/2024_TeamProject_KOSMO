<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitTeamBoardDetailForm</title>
<link href="/style/matchingDetailFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>

<script>
	function goWaitingList()
	{
		var formObj = $("[name='waitingList']");
		
		if (confirm("신청 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/goMatchWaitingList.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 1) {
					alert("신청이 완료되었습니다.");
				}
				else if (result == 2) {
					alert("이미 신청한 팀입니다.");
				}
				else{
					alert("매칭신청을 위해서 용병포함 팀원이 최소 11명 있어야합니다.")
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
	
	function checkButton(checking) {
        if (checking == '매칭완료') {
            alert('매칭이 완료된 글은 수정이 불가능합니다.');
            return false;
        } 
        else {
            document.matchingUpDelForm.submit();
        }
    }
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardDetailFormTitle">
       <p class="titleBackgoundText">매칭 찾기</p>
    </div>
        <table class="newMatchingBoardFormRegTable" cellpadding="7" style="width:1100px; border-collapse: collapse; margin-top: 50px;">
        	<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
					
				<td colspan="2"><span>${requestScope.detail.title}<b>(${requestScope.detail.checking})</b></span><span style="float: right;"><span style="color: #999999; margin-top: 15px;">작성자&nbsp;</span>/&nbsp;${requestScope.detail.nickname}<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${requestScope.detail.readcount}</span></td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">팀명</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.detail.team_name}</td>
			</tr>
            <tr>
				<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">경기장명</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.detail.stadium_name}</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">일시<br>(날짜)</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.detail.booking_date}</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">시간</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.detail.time_range}</td>
			</tr>
			<tr>
				<th style=" width: 100px; height:250px; color: #000000; border-bottom: 1px solid #999999;">내 용</th>
				<td style="border-bottom: 1px solid #999999;">
					${requestScope.detail.content}
				</td>
			</tr>
			<c:if test="${requestScope.myInfo.team_master eq sessionScope.m_no}">
          	 	<c:if test="${sessionScope.nickname ne requestScope.detail.nickname}">
					<tr>
						<td colspan="2" style="text-align: center; border-top: 1px solid #999999;">
							<c:if test="${requestScope.detail.checking eq '매칭대기중'}">
								<input type="button" value="경기신청" style="cursor:pointer" class="matchingRequestBtn" onclick="goWaitingList()" >
							</c:if>
						</td>
					</tr>
				</c:if>
			</c:if>
         </table>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
          <div class="matchingDetailBtnDiv">
			<c:if test="${sessionScope.nickname eq requestScope.detail.nickname}">
				<input type="button" value="수정 / 삭제" style="cursor:pointer" class="matchingUpDelBtn" 
						onclick="checkButton('${requestScope.detail.checking}')" >
			</c:if>
			<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/matchingForm.do')">
		 </div>

     <form name="matchingUpDelForm" action="/matchingUpDelForm.do" method="post">
	 <!------------------------------------------------------------------------>
	 <!-- 게시판 고유번호가 저장된 hidden 태그 선언하기 -->
	 <!------------------------------------------------------------------------>
	 <input type="hidden" name="match_no"value="${requestScope.detail.match_no}">
	 </form>
	 
	 <!-- 매칭 게시물일때 신청버튼을 누르면 넘어갈 정보들 -->
		<form name="waitingList">
			<input type="hidden" name="m_no"value="${sessionScope.m_no}">
			<input type="hidden" name="match_team"value="${requestScope.detail.team_no}">
			<input type="hidden" name="vs_team"value="${requestScope.myInfo.team_no}">
			<input type="hidden" name="stadium_no"value="${requestScope.detail.stadium_no}">
			<input type="hidden" name="time_no"value="${requestScope.detail.time_no}">
			<input type="hidden" name="day"value="${requestScope.detail.booking_date}">
		</form>
 	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>