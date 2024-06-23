<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardDetailForm</title>
<link href="/style/community/communityNoticeBoardDetailFormStyle.css" rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<p class="titleBackgoundText">공지사항</p>
	</div>





	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.communityDTO}">
		<script>
			alert("공지사항이 삭제되었습니다.");
			location.replace("/communityNoticeBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.communityDTO}">
		<table align="center" cellpadding=7 style="width:1100px; border-collapse: collapse; border-bottom: 1px solid #999999; margin-top: 50px;">
			<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
				<td>${requestScope.communityDTO.subject}</td>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td style="text-align: right; margin-top: 15px;"><span style="color: #999999;">작성자&nbsp;</span>/&nbsp;${requestScope.communityDTO.writer}<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${requestScope.communityDTO.readcount}</td>
			</tr>
			<tr style="width: 900px; height: 400px;">
				
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 내용 표현하기 -->
				<!--------------------------------------------------- -->
				<td colspan="2">${requestScope.communityDTO.content}</td>
			</tr>
		</table>

		<div class="noticeBoardBtnDiv">
			<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/communityNoticeBoardForm.do')">
			
			<!-- 추후에 수정 -->
			<!-- <input type="button" value="수정/삭제" class="noticeBoardUpDelBtn" onclick="document.noticeboardUpDelForm.submit();"> -->
			
		</div>

		<!--------------------------------------------------- -->
		<!-- [수정/삭제] 버튼 클릭하면 <form name="boardUpDelForm" ~> 태그에 설정한
					정보를 이용하여 WAS 에 접속하기 -->
		<!--------------------------------------------------- -->
		<form name="noticeboardUpDelForm" action="/noticeboardUpDelForm.do" method="post">
			<input type="hidden" name="b_no"
				value="${requestScope.communityDTO.b_no}">
		</form>



	</c:if>



	<!-- <p><input type="submit" name="submit" value="가입">&nbsp;<input type="reset" name="reset" value="초기화">
            &nbsp;<a href="loginForm.html">[로그인화면으로]</a></p> -->
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>