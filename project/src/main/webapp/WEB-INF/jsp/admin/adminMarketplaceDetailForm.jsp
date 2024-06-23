<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMarketplaceDetailForm</title>
<link href="/style/community/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">관리자 장터 상세보기</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<c:if test="${!empty requestScope.communityDTO}">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">
			<caption>[장터 상세글 보기]</caption>
			<tr>
				<th bgColor="lightgray">이름</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.communityDTO.nickname}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">제목</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 제목 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.communityDTO.subject}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">조회수</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.communityDTO.readcount}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">내 용</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 내용 표현하기 -->
				<!--------------------------------------------------- -->
				<td><textarea name="content" class="content" rows="13"
						cols="40" maxlength="500" readonly>${requestScope.communityDTO.content}</textarea></td>
			</tr>
		</table>

		<center>
			<!--------------------------------------------------- -->
			<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
			<!--------------------------------------------------- -->
			<span style="cursor: pointer"
				onclick="location.replace('/adminMarketplaceBoardForm.do')">
				[목록 화면으로] 
			</span>
				<input type="button" value="수정/삭제" onclick="document.marketplaceUpDelForm.submit();">

		








			<!-- Form 에 설정된  액션 값 URL 주소로 이동 -->


			<!-- <input type="button" value="댓글쓰기"  onclick="document.boardUpDelForm.submit();">-->
		</center>
		<!--------------------------------------------------- -->
		<!-- [수정/삭제] 버튼 클릭하면 <form name="boardUpDelForm" ~> 태그에 설정한
					정보를 이용하여 WAS 에 접속하기 -->
		<!--------------------------------------------------- -->
		<form name="marketplaceUpDelForm" action="/adminMarketplaceboardUpDelForm.do" method="post">
			<input type="hidden" name="b_no" 		value="${requestScope.communityDTO.b_no}">
			<input type="hidden" name="table_name" 	value="${requestScope.communityDTO.table_name}">
		</form>



	</c:if>



	<!-- <p><input type="submit" name="submit" value="가입">&nbsp;<input type="reset" name="reset" value="초기화">
            &nbsp;<a href="loginForm.html">[로그인화면으로]</a></p> -->

</body>
</html>