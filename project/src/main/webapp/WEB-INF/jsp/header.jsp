<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="/style/headerStyle.css" rel="stylesheet">
<script src="/js/headerScript.js"></script>
</head>
<header class="header">
	<div class="headerTitle">
		<a href="/mainForm.do">
        	<img src="/image/mainLogo.png" class="headerLogo" style="height:70px; width:150px;">
		</a>
	</div>
	<div class="headerMenu">
		<nav class="headerNav">
			<ul class="headerNavList">
				<!-- <li class="nav-item" id="nav-item-home"><a href="/mainForm.do">홈</a></li> -->
				<li class="nav-item"><a href="/matchingForm.do">매칭 찾기</a></li>
				<li class="nav-item"><a href="/recruitTeamMemBoardForm.do">모집</a>
					<ul class="navInner">
						<li class="navInner-item"><a href="/recruitTeamMemBoardForm.do">팀/팀원</a></li>
						<li class="navInner-item"><a
							href="/recruitHiredBoardForm.do">용병</a></li>
						<li class="navInner-item"><a
							href="/recruitLessonBoardForm.do">레슨</a></li>
					</ul></li>
				<li class="nav-item"><a href="/stadiumRentForm.do">경기장</a>
					<ul class="navInner">
						<li class="navInner-item"><a href="/stadiumRentForm.do">대관</a></li>
						<li class="navInner-item"><a href="/stadiumTransferForm.do">양도</a></li>
					</ul></li>
				<li class="nav-item"><a href="/communityNoticeBoardForm.do">커뮤니티</a>
					<ul class="navInner">
						<li class="navInner-item"><a
							href="/communityNoticeBoardForm.do">공지사항</a></li>
						<li class="navInner-item"><a
							href="/communityFreeBoardForm.do">자유게시판</a></li>
						<li class="navInner-item"><a href="/communityGallaryForm.do">갤러리</a></li>
						<li class="navInner-item"><a
							href="/communityMarketplaceBoardForm.do">장터</a></li>
					</ul></li>
				<li class="nav-item"><a href="/tournamentBoardForm.do">대회</a>
					<ul class="navInner">
						<li class="navInner-item"><a href="/tournamentBoardForm.do">대회일정</a></li>
					</ul></li>
				<li class="nav-item"><a href="/recordsRankingForm.do">기록실</a>
					<ul class="navInner">
						<li class="navInner-item"><a href="/recordsRankingForm.do">랭킹</a></li>
						<li class="navInner-item"><a
							href="/recordsStatisticsForm.do">통계</a></li>
					</ul></li>
				<li class="nav-item"><a href="/customerServiceForm.do">고객센터</a>
					<ul class="navInner">
						<li class="navInner-item"><a href="/customerServiceForm.do">고객센터</a></li>
						<li class="navInner-item"><a href="/userGuideForm.do">사용가이드</a></li>
					</ul>
				</li>
				<c:if test="${not empty sessionScope.mid}">
					<li class="nav-item" id="welcomeLogin">
				        <span>${sessionScope.nickname} 님 환영합니다!</span>
				        <ul class="navInner">
				        	<c:if test="${sessionScope.mid != 'admin'}">
				        	<li class="navInner-item" onclick="document.myPageForm.submit()" style="cursor: pointer;"><a>마이 페이지</a></li>
				        	</c:if>
				        </ul>
				    </li>
					<ul class="myPageAndLogout">
					    <%-- <li class="nav-item" id="welcomeLogin" onclick="document.myPageForm.submit()">
					        ${sessionScope.nickname} 님 환영합니다!
					    </li> --%>
				        <c:if test="${sessionScope.mid != 'admin'}">
				            <li class="nav-item" id="changeMemberData" onclick="document.memUpdateForm.submit()">회원정보 수정</li>
				        </c:if>
				        <c:if test="${sessionScope.mid == 'admin'}">
				            <li class="nav-item" id="adminPage" onClick="location.href = '/adminForm.do'">관리자페이지</li>
				        </c:if>
				        <li class="nav-item" id="logOut" onClick="location.href = '/logoutProc.do'">로그아웃</li>
				    </ul>
				</c:if>
				<c:if test="${empty sessionScope.mid}">
					<ul class="loginAndReg">
						<li class="nav-item" id="login" onClick="location.href = '/loginForm.do'">로그인</li>
						<li class="nav-item" id="register" onClick="location.href = '/memberRegForm.do'">회원가입</li>
					</ul>
				</c:if>
			</ul>
		</nav>
	</div>
	<div class="hd_bg"></div>
</header>

<form name="memUpdateForm" action="/memUpdateForm.do" method="post">
	<input type="hidden" name="mid" value="${sessionScope.mid}">
</form>
<form name="myPageForm" action="/myPageForm.do" method="post">
	<input type="hidden" name="mid" value="${sessionScope.mid}">
	<input type="hidden" name="m_no" value="${sessionScope.m_no}">
</form>
</html>