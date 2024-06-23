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
<title>장터 상세보기</title>
<link href="/style/community/communityMarketplaceDetailFormStyle.css" rel="stylesheet">
<!-- <script src="/js/community/communityNoticeBoardFormScript.js"></script> -->

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityMarketplaceFormTitle">
		<p class="titleBackgoundText">장터 상세보기</p>
	</div>




	<c:if test="${!empty requestScope.communityDTO}">
			<table align="center" cellpadding=7 style="width:1100px; border-collapse: collapse; border-bottom: 1px solid #999999; margin-top: 50px;">
			
			<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
				<td>${requestScope.communityDTO.subject}</td>
				<td style="text-align: right; margin-top: 15px;"><span style="color: #999999;">작성자&nbsp;</span>/&nbsp;${requestScope.communityDTO.nickname}<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${requestScope.communityDTO.readcount}</td>
			</tr>
			<tr style="width: 1100px; height: 400px;">
				<td colspan="2">
					<div class="communityMarketplaceImageDiv">
						<img src="/image/SoccerBall.jpg" class="communityMarketplaceImage">
					</div>
					${requestScope.communityDTO.content}
				</td>
			</tr>
		</table>
		<div class="marketplaceDetailBtnDiv">
			<c:if test="${requestScope.communityDTO.writer == sessionScope.m_no}">
				<input type="button" value="수정/삭제" class="marketplaceUpDelBtn" onclick="document.marketplaceUpDelForm.submit();">
			</c:if>
			<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/communityMarketplaceBoardForm.do')">
		</div>
		<form name="marketplaceUpDelForm" action="/marketplaceboardUpDelForm.do" method="post">
			<input type="hidden" name="b_no" 		value="${requestScope.communityDTO.b_no}">
			<input type="hidden" name="table_name" 	value="${requestScope.communityDTO.table_name}">
		</form>
	</c:if>



	<!-- <p><input type="submit" name="submit" value="가입">&nbsp;<input type="reset" name="reset" value="초기화">
            &nbsp;<a href="loginForm.html">[로그인화면으로]</a></p> -->
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>