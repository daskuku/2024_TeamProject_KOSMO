<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TournamentBoardDetail</title>
<link href="/style/tournamentBoardDetailStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
</head>



<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="tournamentBoardDetailTitle">
    	<p class="titleBackgoundText">대회 일정</p>
    </div>
    
    
    
	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.list}">
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("/recruitTeamBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.list}">
		<table align="center" cellpadding=7 style="width:1100px; border-collapse: collapse; border-bottom: 1px solid #999999; margin-top: 50px;">
				<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
					<td>${requestScope.list.subject}</td>
					<td style="text-align: right; margin-top: 15px;">${requestScope.list.regist_start} ~ ${requestScope.list.regist_end}&nbsp;&nbsp;&nbsp;<span style="color: #999999;">지역&nbsp;</span>/&nbsp;${requestScope.list.region}</td>
				</tr>
	            <tr style="width: 1100px; height: 400px; text-align: center;">
					<td colspan="2">
						<div class="tournamentBoardImageDiv" style="text-align: center; margin-bottom: 30px;">
							<img src="/image/SoccerBall.jpg" class="communityGallaryImage">
						</div>
						${requestScope.list.content}
					</td>
				</tr>
			</table>
			<div class="tournamentBoardDetailBtnDiv">
				<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/tournamentBoardForm.do')">
			</div>
    	</c:if>
    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>