<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitHiredBoardForm</title>
<link href="/style/recruitHiredBoardDetailFormStyle.css" rel="stylesheet">
<script src="/js/recruitHiredBoardFormScript.js"></script>


<script>
function goWaitingHiredList()
{
	var formObj = $("[name='waitingHiredList']");
	
	if (confirm("신청 하시겠습니까?") == false) {
		return;
	}
	
	$.ajax({
		url : "/goWaitingHiredList.do",
		type : "post",
		data : formObj.serialize(),
		success : function(json) {
			var result = json["result"];
			if (result == 1) {
				alert("신청이 완료되었습니다.");
			}
			else {
				alert("이미 신청한 팀입니다.");
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
    <div class="recruitHiredBoardFormTitle">
    	<p class="titleBackgoundText">용병 모집</p>
    </div>
    
    
    
	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.hireddetailList}">
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("/recruitHiredBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.hireddetailList}">
	
			<table align="center" cellpadding="7" style="width:1100px; border-collapse: collapse; margin-top: 50px;">
				<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
					
					<td colspan="2"><span>${requestScope.hireddetailList.title}</span><span style="float: right;"><span style="color: #999999; margin-top: 15px;">작성자&nbsp;</span>/&nbsp;${requestScope.hireddetailList.nickname}<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${requestScope.hireddetailList.readcount}</span></td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">지역</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.hireddetailList.sido_c} ${requestScope.hireddetailList.sigungu_c}</td>
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
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.hireddetailList.pos}</td>
				</tr>
				<tr>
					<th style="width: 100px; height:250px; color: #000000; border-bottom: 1px solid #999999;">내 용</th>
					<td style="border-bottom: 1px solid #999999;">
						${requestScope.hireddetailList.content}
					</td>
				</tr>
				<c:if test="${sessionScope.nickname ne requestScope.hireddetailList.nickname}">
					<tr>
						<td colspan="2" style="text-align: center; border-top: 1px solid #999999;">
							<input type="button" value="신청" style="cursor:pointer" class="hireRequestBtn" onclick="goWaitingHiredList()" >
						</td>
					</tr>
				</c:if>
			</table>
			<div class="recruitHiredBoardDetailBtnDiv">
				<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/recruitHiredBoardForm.do')">
				<c:if test="${sessionScope.nickname eq requestScope.hireddetailList.nickname}">
					<input type="button" value="수정/삭제" class="recruitHiredBoardDetailUpDelBtn" onclick="document.recruitHiredboardUpDelForm.submit()">
				</c:if>
			</div>
			<!--------------------------------------------------- -->
			<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
			<!--------------------------------------------------- -->
			<%-- <c:if test="${sessionScope.nickname ne requestScope.hireddetailList.nickname}">
         	 	<input type="button" value="신청" style="cursor:pointer" onclick="goWaitingHiredList()" >
         	</c:if> --%>
			<%-- <span style="cursor: pointer"
				onclick="location.replace('/recruitHiredBoardForm.do')">
				[목록 화면으로] </span>
        	<c:if test="${sessionScope.nickname eq requestScope.hireddetailList.nickname}">
				<input type="button" value="수정/삭제" style="cursor:pointer" onclick="document.recruitHiredboardUpDelForm.submit()" >
			</c:if> --%>
				
    	</c:if>
    	
    	
    	<!--------------------------------------------------------------------------->
		<!-- WAS에 "/recruitTeamMemBoardUpDelForm.do" 주소로 접속하기 위한 form 태그 선언하기 -->
		<!--------------------------------------------------------------------------->
		<form name="recruitHiredboardUpDelForm" action="/recruitHiredBoardUpDelForm.do" method="post">
		<!------------------------------------------------------------------------>
		<!-- 게시판 고유번호가 저장된 hidden 태그 선언하기 -->
		<!------------------------------------------------------------------------>
		<input type="hidden" name="recruitment_no"value="${requestScope.hireddetailList.recruitment_no}">
		</form>
    
    	<!-- 용병모집 게시물일때 신청버튼을 누르면 넘어갈 정보들 -->
		<form name="waitingHiredList">
			<input type="hidden" name="m_no"value="${sessionScope.m_no}">
			<input type="hidden" name="recruitment_no"value="${requestScope.hireddetailList.recruitment_no}">
		</form>
		
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>