<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberDetailForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>
<script>

</script>


</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">회원상세정보</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<c:if test="${empty requestScope.memberDTO}">
		<script>
			alert("회원이 삭제되었습니다.");
			location.replace("/adminForm.do");
		</script>
	</c:if>

	<c:if test="${!empty requestScope.memberDTO}">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">
			<caption>[회원 상세 보기]</caption>
			<tr>
				<th bgColor="lightgray">이름</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">아이디</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.mid}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">닉네임</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.nickname}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">이메일</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.email}</td>

			</tr>

			<tr>
				<th bgColor="lightgray">생일</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.birthday}</td>
			</tr>

			<tr>
				<th bgColor="lightgray">전화번호</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.phone1}-${requestScope.memberDTO.phone2}-${requestScope.memberDTO.phone3}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">성별</th>
				<td><input type="radio" name="gender" value="남"
					<c:if test="${requestScope.memberDTO.gender.contains ('남')}">checked</c:if>
					disabled>남 <input type="radio" name="gender" value="여"
					<c:if test="${requestScope.memberDTO.gender.contains ('여')}">checked</c:if>
					disabled>여</td>
			</tr>

			<tr>
				<th>시/도</th>
				<td>${requestScope.memberDTO.sido}-${requestScope.memberDTO.sigungu}</td>
			</tr>






			<tr>
				<th>상세주소</th>
				<td>${requestScope.memberDTO.detail_address}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${requestScope.memberDTO.reg_date}</td>
			</tr>


		</table>
	</c:if>

	<!-- ---------------------------------------------------------------------------------- -->

	<c:if test="${empty requestScope.playerRecordDTO}">
		<script>
			alert("기록이 삭제되었습니다.");
			location.replace("/adminForm.do");
		</script>
	</c:if>

	<c:if test="${!empty requestScope.playerRecordDTO}">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">
			<caption>[기록 보기]</caption>
			<tr>
				<th bgColor="lightgray">이름</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.memberDTO.name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">경기수</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.playerRecordDTO.games_played}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">승리수</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.playerRecordDTO.wins}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">무승부</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.playerRecordDTO.draws}</td>

			</tr>

			<tr>
				<th bgColor="lightgray">패배수</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.playerRecordDTO.losses}</td>
			</tr>

			<tr>
				<th bgColor="lightgray">골</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.playerRecordDTO.goals_for}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">어시스트</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.playerRecordDTO.goals_assist}</td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<center>
			<!--------------------------------------------------- -->
			<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
			<!--------------------------------------------------- -->
			<span style="cursor: pointer"
				onclick="location.replace('/adminForm.do')"> [목록 화면으로] </span> <input
				type="button" value="수정/삭제"
				onclick="document.memberDetailUpDelForm.submit();">








			<!-- Form 에 설정된  액션 값 URL 주소로 이동 -->


			<!-- <input type="button" value="댓글쓰기"  onclick="document.boardUpDelForm.submit();">-->
		</center>
		<!--------------------------------------------------- -->
		<!-- [수정/삭제] 버튼 클릭하면 <form name="boardUpDelForm" ~> 태그에 설정한
					정보를 이용하여 WAS 에 접속하기 -->
		<!--------------------------------------------------- -->
		<form name="memberDetailUpDelForm" action="/memberDetailUpDelForm.do"
			method="post">
			<input type="hidden" name="m_no"
				value="${requestScope.memberDTO.m_no}"> <input type="hidden"
				name="player" value="${requestScope.playerRecordDTO.player}">
		</form>
	</c:if>


</body>
</html>