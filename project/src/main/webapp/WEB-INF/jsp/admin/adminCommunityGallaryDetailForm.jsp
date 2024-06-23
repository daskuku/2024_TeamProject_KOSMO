<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html><html>
<head>
	<meta charset="UTF-8">
	<title>관리자 갤러리 상세보기</title>
	<link href="/style/community/communityNoticeBoardFormStyle.css" rel="stylesheet">
	<script src="/js/community/communityNoticeBoardFormScript.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">관리자 갤러리 상세보기</p>
	</div>
   	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<c:if test="${!empty requestScope.communityDTO}">
		<table align="center" bordercolor="gray" border=1 cellpadding=7 style="border-collapse: collapse">
			<caption>[갤러리 상세글 보기]</caption>
			
			<tr>
				<th bgColor="lightgray">이름</th>
				<td>${requestScope.communityDTO.nickname}</td>
			</tr>
			
			<tr>
				<th bgColor="lightgray">제목</th>
				<td>${requestScope.communityDTO.subject}</td>
			</tr>
			
			<tr>
				<th bgColor="lightgray">조회수</th>
				<td>${requestScope.communityDTO.readcount}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">내 용</th>
				<td><textarea name="content" class="content" rows="13"
						cols="40" maxlength="500" readonly>${requestScope.communityDTO.content}</textarea></td>
			</tr>
		</table>

		<center>
			<span style="cursor: pointer" onclick="location.replace('/adminGallaryForm.do')"> 
				[목록 화면으로] 
			</span> 
				<input type="button" value="수정/삭제" onclick="document.communityGallaryUpDelForm.submit();">
			
			<!-- Form 에 설정된  액션 값 URL 주소로 이동 -->
			<!-- <input type="button" value="댓글쓰기"  onclick="document.boardUpDelForm.submit();">-->
			
		</center>
		                                                   
		<form name="communityGallaryUpDelForm" action="/adminCommunityGallaryUpDelForm.do" method="post">
			<input type="hidden" name="b_no" value="${requestScope.communityDTO.b_no}">
		</form>

	</c:if>
</body>
</html>