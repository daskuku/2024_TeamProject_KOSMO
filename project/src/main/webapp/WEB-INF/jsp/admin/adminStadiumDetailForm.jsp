<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminStadiumDetailForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">경기장 상세보기</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>


	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.stadim2DTO}">
		<script>
			alert("경기장이 삭제됨.");
			location.replace("/adminStadiumDetailForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.stadim2DTO}">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">
			<caption>[경기장 상세글 보기]</caption>
			<tr>
				<th bgColor="lightgray">사진</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td><img src="/image/st.jpg" ></td>
			</tr>
			<tr>
			
				<th bgColor="lightgray">경기장이름</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadim2DTO.stadium_name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">지역</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 제목 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadim2DTO.sido_name}-${requestScope.stadim2DTO.sigungu_name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">등록일</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadim2DTO.reg_date}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">상태</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadim2DTO.stadium_status}</td>
			</tr>
			
			<tr>
				<th bgColor="lightgray">비 고</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 내용 표현하기 -->
				<!--------------------------------------------------- -->
				<td><textarea name="content" class="content" rows="13"
						cols="20" maxlength="50" readonly>${requestScope.stadim2DTO.content}</textarea></td>
			</tr>
		</table>

		<center>
			<!--------------------------------------------------- -->
			<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
			<!--------------------------------------------------- -->
			<span style="cursor: pointer"
				onclick="location.replace('/adminStadiumForm.do')"> [목록
				화면으로] </span> <input type="button" value="수정/삭제"
				onclick="document.adminStadiumUpDelForm.submit();">








			<!-- Form 에 설정된  액션 값 URL 주소로 이동 -->


			<!-- <input type="button" value="댓글쓰기"  onclick="document.boardUpDelForm.submit();">-->
		</center>
		<!--------------------------------------------------- -->
		<!-- [수정/삭제] 버튼 클릭하면 <form name="boardUpDelForm" ~> 태그에 설정한
					정보를 이용하여 WAS 에 접속하기 -->
		<!--------------------------------------------------- -->
		<form name="adminStadiumUpDelForm"
			action="/adminStadiumUpDelForm.do" method="post">
			<input type="hidden" name="stadium_no"
				value="${requestScope.stadim2DTO.stadium_no}">
		</form>



	</c:if>


</body>
</html>