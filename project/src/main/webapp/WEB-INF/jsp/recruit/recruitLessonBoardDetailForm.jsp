<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitLessonBoardForm</title>
<link href="/style/recruitLessonBoardDetailFormStyle.css" rel="stylesheet">
<script src="/js/recruitLessonBoardFormScript.js"></script>
<script>
function goWaitingLessonList()
{
	var formObj = $("[name='waitingLessonList']");
	
	

	if (confirm("신청 하시겠습니까?") == false) {
		return;
	}
	
	$.ajax({
		url : "/goWaitingLessonList.do",
		type : "post",
		data : formObj.serialize(),
		success : function(json) {
			var result = json["result"];
			if (result == 1) {
				alert("신청이 완료되었습니다.");
			}
			else {
				alert("이미 신청한 레슨입니다.");
			}
		},
		error : function() {
			alert("신청 실패! 관리자에게 문의 바랍니다.");
		}
	});
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitLessonBoardFormTitle">
    	<p class="titleBackgoundText">레슨 모집</p>
    </div>
    
    
    
	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.lessondetailList}">
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("/recruitLessonBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.lessondetailList}">
			<table align="center" cellpadding="7" style="width:1100px; border-collapse: collapse; margin-top: 50px;">
				<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
					
					<td colspan="2"><span>${requestScope.lessondetailList.title}</span><span style="float: right;"><span style="color: #999999; margin-top: 15px;">작성자&nbsp;</span>/&nbsp;${requestScope.lessondetailList.nickname}<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${requestScope.lessondetailList.readcount}</span></td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">지역</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.lessondetailList.sido_c} ${requestScope.lessondetailList.sigungu_c}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">요일</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.day}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">시간</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.time}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">포지션</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.lessondetailList.money}</td>
				</tr>
				<tr>
					<th style=" width: 100px; height:250px; color: #000000; border-bottom: 1px solid #999999;">내 용</th>
					<td style="border-bottom: 1px solid #999999;">
						${requestScope.lessondetailList.content}
					</td>
				</tr>
				<c:if test="${sessionScope.nickname ne requestScope.lessondetailList.nickname}">
					<tr>
						<td colspan="2" style="text-align: center; border-top: 1px solid #999999;">
							<input type="button" value="신청" style="cursor:pointer" class="lessonRequestBtn" onclick="goWaitingLessonList()" >
						</td>
					</tr>
				</c:if>
			</table>
			<div class="recruitLessonBoardDetailBtnDiv">
				<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/recruitLessonBoardForm.do')">
				<c:if test="${sessionScope.nickname eq requestScope.lessondetailList.nickname}">
					<input type="button" value="수정/삭제" class="recruitLessonBoardDetailUpDelBtn" onclick="document.recruitLessonBoardUpDelForm.submit()">
				</c:if>
			</div>
	    
	    	</c:if>
	   
    	<!--------------------------------------------------------------------------->
		<!-- WAS에 "/recruitTeamMemBoardUpDelForm.do" 주소로 접속하기 위한 form 태그 선언하기 -->
		<!--------------------------------------------------------------------------->
		<form name="recruitLessonBoardUpDelForm" action="/recruitLessonBoardUpDelForm.do" method="post">
		<!------------------------------------------------------------------------>
		<!-- 게시판 고유번호가 저장된 hidden 태그 선언하기 -->
		<!------------------------------------------------------------------------>
		<input type="hidden" name="recruitment_no"value="${requestScope.lessondetailList.recruitment_no}">
		</form>
		
		<!-- 레슨모집 게시물일때 신청버튼을 누르면 넘어갈 정보들 -->
		<form name="waitingLessonList">
			<input type="hidden" name="m_no"value="${sessionScope.m_no}">
			<input type="hidden" name="recruitment_no"value="${requestScope.lessondetailList.recruitment_no}">
			<input type="hidden" name="writer" value="${requestScope.lessondetailList.m_no}">
		</form>
    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>