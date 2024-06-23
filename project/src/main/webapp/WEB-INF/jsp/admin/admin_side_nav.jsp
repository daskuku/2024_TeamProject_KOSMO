<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="row-admin_side_nav" style="position:absolute; z-index: 999">
	<ul class="nav nav-pills flex-column">
		<!-- <li class="nav-item">관리자 메뉴</li> -->
		<li class="nav-item" id="nav-item-title" onClick="location.href = '/adminForm.do'" style="cursor: pointer;">회원관리</li>
		<li class="nav-item" id="nav-item-stadium" onClick="location.href = '/adminStadiumForm.do'" style="cursor: pointer;">경기장</li>
		<li class="nav-item" id="nav-item-notice" onClick="location.href = '/adminNoticeBoardForm.do'" style="cursor: pointer;">공지사항</li>
		<!-- <li class="nav-item" id="nav-item-freeboard" onClick="location.href = '/adminFreeBoardForm.do'" style="cursor: pointer;">자유게시판</li>
		<li class="nav-item" id="nav-item-gallary" onClick="location.href = '/adminGallaryForm.do'" style="cursor: pointer;">갤러리</li>
		<li class="nav-item" id="nav-item-marketplace" onClick="location.href = '/adminMarketplaceBoardForm.do'" style="cursor: pointer;">장터</li> -->
		<li class="nav-item" id="nav-item-tournament" onClick="location.href = '/adminTournamentBoardForm.do'" style="cursor: pointer;">대회일정</li>
	</ul>
</div>
