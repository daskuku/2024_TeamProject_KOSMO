<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminNoticeBoardDetailForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">공지사항</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>


	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.communityDTO}">
		<script>
			alert("공지사항이 삭제되었습니다.");
			location.replace("/adminNoticeBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.communityDTO}">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">
			<caption>[공지사항 상세글 보기]</caption>
			<tr>
				<th bgColor="lightgray">이름</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.communityDTO.writer}</td>
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
				<th bgColor="lightgray">등록일</th>
				<td>${requestScope.communityDTO.reg_date}</td>
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
				onclick="location.replace('/adminNoticeBoardForm.do')"> [목록
				화면으로] </span> <input type="button" value="수정/삭제"
				onclick="document.adminNoticeboardUpDelForm.submit();">








			<!-- Form 에 설정된  액션 값 URL 주소로 이동 -->


			<!-- <input type="button" value="댓글쓰기"  onclick="document.boardUpDelForm.submit();">-->
		</center>
		<!--------------------------------------------------- -->
		<!-- [수정/삭제] 버튼 클릭하면 <form name="boardUpDelForm" ~> 태그에 설정한
					정보를 이용하여 WAS 에 접속하기 -->
		<!--------------------------------------------------- -->
		<form name="adminNoticeboardUpDelForm"
			action="/adminNoticeboardUpDelForm.do" method="post">
			<input type="hidden" name="b_no"value="${requestScope.communityDTO.b_no}">
		</form>



	</c:if>



	<!-- <p><input type="submit" name="submit" value="가입">&nbsp;<input type="reset" name="reset" value="초기화">
            &nbsp;<a href="loginForm.html">[로그인화면으로]</a></p> -->

</body>
</html>