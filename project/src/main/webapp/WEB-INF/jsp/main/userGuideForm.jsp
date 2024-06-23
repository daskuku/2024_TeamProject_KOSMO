<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserGuideForm</title>
<link href="/style/userGuideFormStyle.css" rel="stylesheet">
<!-- <script src="/js/main/loginFormScript.js"></script> -->

<script>
	$(function(){
		$('.userGuideCategoryTabContent > div').hide();
		$('.userGuideCategoryTabNav a').click(function(){
			$('.userGuideCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			$('.userGuideCategoryTabNav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="userGuideFormTitle">
		<p class="titleBackgoundText">사용가이드</p>
	</div>
    <div class="userGuideCategoryTab">
    	<ul class="userGuideCategoryTabNav">
    		<li><a href="#userGuideCategoryTabMatching">매칭 찾기</a></li>
    		<li><a href="#userGuideCategoryTabRecruit">모집</a></li>
    		<li><a href="#userGuideCategoryTabStadium">경기장</a></li>
    		<li><a href="#userGuideCategoryTabCommunity">커뮤니티</a></li>
    		<li><a href="#userGuideCategoryTabTournament">대회</a></li>
    		<li><a href="#userGuideCategoryTabRecord">기록실</a></li>
    		<li><a href="#userGuideCategoryTabCustomerService">고객센터</a></li>
    		<li><a href="#userGuideCategoryTabMyPage">마이페이지</a></li>
    	</ul>
    	<div class="userGuideCategoryTabContent" style="position: relative;">
    		<div id="userGuideCategoryTabMatching">
			    <div class="userGuideCategoryTabMatchingContainer">
			    	<div class="userGuideCategoryTabMatchingDivTitle_1">
			    		<strong class="strongTitle">매칭 찾기_목록</strong>
			    	</div>
			    	<div class="userGuideCategoryTabMatchingDiv_1">
			    		<div class="userGuideCategoryTabMatchingDiv_1_Img">
			    			<img src="/image/userGuideImg/matchingUiGuide_1.png" id="matchingUiGuide_1">
			    			<img src="/image/userGuideImg/matchingUiGuide_1_1.png" id="matchingUiGuide_1_1">
			    		</div>
			    		<div class="userGuideCategoryTabMatchingDiv_1_Text">
				    		<strong class="strongMargin">① 검색 조건 - 지역</strong>
				    		<p>시 / 도를 선택한 이후 군 / 구를 선택해야 합니다.</p>
				    		<strong class="strongMargin">② 검색 조건 - 날짜</strong>
				    		<p>날짜 입력칸 또는 달력 아이콘 클릭 시, 달력이 생성됩니다.</p>
				    		<p>키보드로 직접 입력할 수 있습니다.</p>
				    		<strong class="strongMargin">③ 검색 조건 - 시간</strong>
				    		<p>원하는 경기 시간을 선택할 수 있습니다.</p>
				    		<strong class="strongMargin">④ 검색</strong>
				    		<p>검색창 키워드를 통해 전체, 작성자, 제목, 내용으로 나누어 검색이 가능합니다.</p>
							<strong class="strongMargin">⑤ 초기화</strong>
				    		<p>모든 검색 기능 및 검색 내용이 초기화됩니다.</p>
				    		<strong class="strongMargin">⑥ 목록</strong>
				    		<p>게시글 클릭 시, 해당 게시글의 상세 페이지로 이동합니다.</p>
				    		<p>매칭이 수락될 경우, 게시 글 제목에 (매칭완료)가 추가됩니다.</p>
				    		<p>비회원의 경우 상세 페이지로 접속할 수 없습니다.</p>
				    		<strong class="strongMargin">⑦ 새 글 쓰기</strong>
				    		<p>예약, 대관한 경기장이 있는 팀장 계정에서만 노출됩니다.</p>
				    		<p>로그아웃 상태일 경우 페이지 이동이 불가능합니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabMatchingDivTitle_2">
			    		<strong class="strongTitle">매칭 찾기_상세 페이지</strong>
			    	</div>
			    	<div class="userGuideCategoryTabMatchingDiv_2">
			    		<div class="userGuideCategoryTabMatchingDiv_2_Img">
			    			<img src="/image/userGuideImg/matchingUiGuide_2.png" id="matchingUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabMatchingDiv_2_Text">
				    		<strong class="strongMargin">① 매칭 찾기 게시글 내용</strong>
				    		<p>매칭 신청 권한이 있는 팀장이 상세 페이지에 들어가는 경우 상세 페이지가 노출됩니다.</p>
				    		<strong class="strongMargin">② 경기 신청 버튼</strong>
				    		<p>매칭 신청 권한이 있는 팀장 계정에서만 노출됩니다.</p>
				    		<p>클릭 시, 매칭 신청 확인 경고창, 매칭 성공 경고창 생성 후 매칭 찾기 목록으로 이동합니다.</p>
				    		<p>이미 신청 내역이 있는 경우, 신청이 불가능합니다.</p>
				    		<p>용병 포함 팀원이 최소 11명이 되지 않으면 신청이 불가능합니다.
				    	</div>
			    	</div>
			    </div>
			    <div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabRecruit">
			    <div class="userGuideCategoryTabRecruitContainer">
			    	<div class="userGuideCategoryTabRecruitDivTitle_1">
			    		<strong class="strongTitle">모집_팀 / 팀원 목록</strong>
			    	</div>
			    	<div class="userGuideCategoryTabRecruitDiv_1">
			    		<div class="userGuideCategoryTabRecruitDiv_1_Img">
			    			<img src="/image/userGuideImg/recruitUiGuide_1.png" id="recruitUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabRecruitDiv_1_Text">
				    		<strong class="strongMargin">① 전체 / 팀 / 팀원 탭 메뉴</strong>
				    		<p>전체 탭의 경우, 팀과 팀원 게시글이 모두 나타나고,</p>
				    		<p>팀, 팀원 탭은 각 카테고리 별 내용이 나타납니다.</p>
				    		<strong class="strongMargin">② 검색 조건 - 지역</strong>
				    		<p>시 / 도를 선택한 이후 군 / 구를 선택해야 합니다.</p>
				    		<strong class="strongMargin">③ 검색 조건 - 요일</strong>
				    		<p>원하는 요일을 다중으로 선택할 수 있습니다.</p>
				    		<p>상관없음 버튼 클릭 시, 모든 요일의 체크가 해제됩니다.</p>
				    		<strong class="strongMargin">④ 검색 조건 - 시간</strong>
				    		<p>원하는 시간을 다중으로 선택할 수 있습니다.</p>
				    		<strong class="strongMargin">⑤ 검색 조건 - 포지션</strong>
				    		<p>팀 / 팀원의 원하는 포지션을 선택할 수 있습니다.</p>
				    		<p>하나의 포지션만 선택해야 합니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabRecruitDivTitle_2">
			    		<strong class="strongTitle">모집_새 글 쓰기</strong>
			    	</div>
			    	<div class="userGuideCategoryTabRecruitDiv_2">
			    		<div class="userGuideCategoryTabRecruitDiv_2_Img">
			    			<img src="/image/userGuideImg/recruitUiGuide_2.png" id="recruitUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabRecruitDiv_2_Text">
				    		<strong class="strongMargin">① 제목</strong>
				    		<p>임의의 문자 2 ~ 30자 입력 가능합니다.</p>
				    		<strong class="strongMargin">② 지역</strong>
				    		<p>시 / 도를 선택한 이후 군 / 구를 선택해야 합니다.</p>
				    		<strong class="strongMargin">③ 요일</strong>
				    		<p>원하는 요일을 다중으로 선택할 수 있습니다.</p>
				    		<p>최소 하나 이상 선택해야 합니다.</p>
				    		<strong class="strongMargin">④ 시간</strong>
				    		<p>원하는 시간을 다중으로 선택할 수 있습니다.</p>
				    		<p>최소 하나 이상 선택해야 합니다.</p>
				    		<strong class="strongMargin">⑤ 포지션</strong>
				    		<p>원하는 포지션을 다중으로 선택할 수 있습니다.</p>
							<p>최소 하나 이상 선택해야 합니다.</p>
				    		<strong class="strongMargin">⑥ 종류</strong>
				    		<p>팀이 없는 경우, 팀만 선택할 수 있습니다.</p>
				    		<p>팀이 있는 경우, 팀과 팀원 중 골라서 선택할 수 있습니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
				    <div class="userGuideCategoryTabRecruitDivTitle_3">
			    		<strong class="strongTitle">모집_상세 페이지</strong>
			    	</div>
				    <div class="userGuideCategoryTabRecruitDiv_3">
			    		<div class="userGuideCategoryTabRecruitDiv_3_Img">
			    			<img src="/image/userGuideImg/recruitUiGuide_3.png" id="recruitUiGuide_3">
			    		</div>
			    		<div class="userGuideCategoryTabRecruitDiv_3_Text">
				    		<strong class="strongMargin">① 수정 / 삭제</strong>
				    		<p>게시글을 작성한 계정과 일치하는 경우에만 노출됩니다.</p>
				    		<strong class="strongMargin">② 신청</strong>
				    		<p>팀에 가입되어 있지 않은 경우, 팀원 신청에 성공합니다.</p>
				    		<p>해당 팀의 팀장이 수락할 경우, 팀 가입에 성공합니다.</p>
				    		<p>이미 팀에 가입되어 있는 경우, 신청할 수 없습니다.</p>
				    	</div>
			    	</div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabStadium">
			    <div class="userGuideCategoryTabStadiumContainer">
			    	<div class="userGuideCategoryTabStadiumDivTitle_1">
			    		<strong class="strongTitle">경기장_대관 검색</strong>
			    	</div>
			    	<div class="userGuideCategoryTabStadiumDiv_1">
			    		<div class="userGuideCategoryTabStadiumDiv_1_Img">
			    			<img src="/image/userGuideImg/stadiumUiGuide_1.png" id="stadiumUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabStadiumDiv_1_Text">
				    		<strong class="strongMargin">① 지역</strong>
				    		<p>시 / 도를 선택한 이후 군 / 구를 선택해야 합니다.</p>
				    		<strong class="strongMargin">② 경기장 이름 검색</strong>
				    		<p>2가지 키워드를 검색할 수 있습니다.</p>
				    		<p>or는 2가지 키워드 중 하나라도 해당하는 검색 결과를 검색합니다.</p>
				    		<p>and는 2가지 키워드 모두에 해당하는 검색 결과를 검색합니다.</p>
				    		<strong class="strongMargin">③ n행 보기 설정</strong>
				    		<p>8 / 12개 씩 행 보기 선택을 제공합니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
				    <div class="userGuideCategoryTabStadiumDivTitle_2">
			    		<strong class="strongTitle">경기장_대관 상세보기</strong>
			    	</div>
			    	<div class="userGuideCategoryTabStadiumDiv_2">
			    		<div class="userGuideCategoryTabStadiumDiv_2_Img">
			    			<img src="/image/userGuideImg/stadiumUiGuide_2.png" id="stadiumUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabStadiumDiv_2_Text">
				    		<strong class="strongMargin">① 날짜 선택</strong>
				    		<p>날짜 입력칸 또는 달력 아이콘 클릭 시, 달력이 생성됩니다.</p>
				    		<p>지난 날짜, 당일은 선택이 불가능합니다.</p>
				    		<strong class="strongMargin">② 시간대 선택</strong>
				    		<p>원하는 경기장 대여 시간을 선택할 수 있습니다.</p>
				    		<p>예약 시간은 2시간 단위로 제공됩니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
				    <div class="userGuideCategoryTabStadiumDivTitle_3">
			    		<strong class="strongTitle">경기장_양도 검색</strong>
			    	</div>
			    	<div class="userGuideCategoryTabStadiumDiv_3">
			    		<div class="userGuideCategoryTabStadiumDiv_3_Img">
			    			<img src="/image/userGuideImg/stadiumUiGuide_3.png" id="stadiumUiGuide_3">
			    		</div>
			    		<div class="userGuideCategoryTabStadiumDiv_3_Text">
				    		<strong class="strongMargin">① 지역</strong>
				    		<p>시 / 도를 선택한 이후 군 / 구를 선택해야 합니다.</p>
				    		<strong class="strongMargin">② 양도 상태</strong>
				    		<p>양도 중인 게시글 / 양도 완료된 게시글을 선택할 수 있습니다.</p>
				    		<strong class="strongMargin">③ 경기장 이름 검색</strong>
				    		<p>2가지 키워드를 검색할 수 있습니다.</p>
				    		<p>or는 2가지 키워드 중 하나라도 해당하는 검색 결과를 검색합니다.</p>
				    		<p>or는 2가지 키워드 모두에 해당하는 검색 결과를 검색합니다.</p>
				    		<strong class="strongMargin">④ 양도 게시글</strong>
				    		<p>양도가 완료될 경우, 게시 글 제목에 (양도완료)가 추가됩니다.</p>
				    	</div>
			    	</div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabCommunity">
			    <div class="userGuideCategoryTabCommunityContainer">
			    	<div class="userGuideCategoryTabCommunityDivTitle_1">
			    		<strong class="strongTitle">커뮤니티_자유게시판</strong>
			    	</div>
			    	<div class="userGuideCategoryTabCommunityDiv_1">
			    		<div class="userGuideCategoryTabCommunityDiv_1_Img">
			    			<img src="/image/userGuideImg/communityUiGuide_1.png" id="communityUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabCommunityDiv_1_Text">
				    		<strong class="strongMargin">① 입력창 열기</strong>
				    		<p>클릭 시, 댓글 입력창과 쓰기 버튼이 노출됩니다.</p>
				    		<strong class="strongMargin">② 내 댓글</strong>
				    		<p>내 댓글의 경우 수정 / 삭제 버튼이 노출됩니다.</p>
				    		<p>입력 창에 내용을 입력하고 수정 버튼을 클릭할 경우 댓글의 내용이 수정됩니다.</p>
				    		<strong class="strongMargin">③ 다른 계정 댓글</strong>
				    		<p>입력창을 열고 텍스트를 입력해 답글을 등록할 수 있습니다.</p>
				    		<strong class="strongMargin">④ 삭제된 댓글</strong>
				    		<p>댓글이 삭제된 경우, '삭제된 댓글입니다.'라는 내용으로 수정됩니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
				    <div class="userGuideCategoryTabCommunityDivTitle_2">
			    		<strong class="strongTitle">커뮤니티_갤러리</strong>
			    	</div>
			    	<div class="userGuideCategoryTabCommunityDiv_2">
			    		<div class="userGuideCategoryTabCommunityDiv_2_Img">
			    			<img src="/image/userGuideImg/communityUiGuide_2.png" id="communityUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabCommunityDiv_2_Text">
				    		<strong class="strongMargin">① 검색 키워드</strong>
				    		<p>전체, 작성자, 제목, 내용별로 검색 가능합니다.</p>
				    		<strong class="strongMargin">② 게시물</strong>
				    		<p>게시물 클릭 시, 상세 페이지로 이동</p>
				    		<p>로그아웃 상태일 경우 페이지 이동이 불가능합니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
				    <div class="userGuideCategoryTabCommunityDivTitle_3">
			    		<strong class="strongTitle">커뮤니티_장터</strong>
			    	</div>
			    	<div class="userGuideCategoryTabCommunityDiv_3">
			    		<div class="userGuideCategoryTabCommunityDiv_3_Img">
			    			<img src="/image/userGuideImg/communityUiGuide_3.png" id="communityUiGuide_3">
			    		</div>
			    		<div class="userGuideCategoryTabCommunityDiv_3_Text">
				    		<strong class="strongMargin">① 전체 / 팝니다 / 무료나눔 탭</strong>
				    		<p>전체 탭 클릭 시, '팝니다'와 '무료나눔' 탭을 모두 합한 전체 게시물이 노출됩니다.</p>
				    		<p>'팝니다'와 '무료나눔' 탭은 각 탭에 해당하는 게시물이 노출됩니다.</p>
				    		<strong class="strongMargin">② 검색 키워드</strong>
				    		<p>전체, 작성자, 제목, 내용별 검색 가능합니다.</p>
				    		<strong class="strongMargin">③ 게시물</strong>
				    		<p>게시물 클릭 시, 상세 페이지로 이동합니다.</p>
				    		<p>로그아웃 상태일 경우 페이지 이동이 불가능합니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabTournament">
			    <div class="userGuideCategoryTabTournamentContainer">
			    	<div class="userGuideCategoryTabTournamentDivTitle_1">
			    		<strong class="strongTitle">대회 일정</strong>
			    	</div>
			    	<div class="userGuideCategoryTabTournamentDiv_1">
			    		<div class="userGuideCategoryTabTournamentDiv_1_Img">
			    			<img src="/image/userGuideImg/tournamentUiGuide_1.png" id="tournamentUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabTournamentDiv_1_Text">
				    		<strong class="strongMargin">① 진행 중인 대회 / 마감된 대회 탭</strong>
				    		<p>각 탭 클릭 시, 해당하는 대회 일정이 노출됩니다.</p>
				    		<strong class="strongMargin">② 지역 선택 탭</strong>
				    		<p>전체, 서울, 경인, 강원, 충청, 전라, 경상, 제주의 8가지 지역별 탭이 존재합니다.</p>
				    		<p>각 탭 클릭 시, 해당하는 대회 일정이 노출됩니다.</p>
				    		<strong class="strongMargin">③ 게시물</strong>
				    		<p>게시물 클릭 시, 상세 페이지로 이동합니다.</p>
				    	</div>
			    	</div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabRecord">
			    <div class="userGuideCategoryTabRecordContainer">
			    	<div class="userGuideCategoryTabRecordDivTitle_1">
			    		<strong class="strongTitle">랭킹</strong>
			    	</div>
			    	<div class="userGuideCategoryTabRecordDiv_1">
			    		<div class="userGuideCategoryTabRecordDiv_1_Img">
			    			<img src="/image/userGuideImg/recordUiGuide_1.png" id="recordUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabRecordDiv_1_Text">
				    		<strong class="strongMargin">① 전체 / 지역별 / 성별 / 연령대별 탭</strong>
				    		<p>전체 탭 클릭 시, 전체 회원의 랭킹이 노출됩니다.</p>
				    		<p>'지역별', '성별', '연령대별' 탭은 각 탭에 해당하는 랭킹이 노출됩니다.</p>
				    		<strong class="strongMargin">② 상위 랭킹</strong>
				    		<p>'최다 승',  '최다 득점', '최다 도움'은 전체 회원 중 상위 3명만 노출됩니다.</p>
				    		<strong class="strongMargin">③ 정렬</strong>
				    		<p>'경기수',  '승', '무', '패', '득점', '도움'을 클릭하면 정순 / 역순 정렬이 가능합니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabRecordDivTitle_2">
			    		<strong class="strongTitle">통계</strong>
			    	</div>
			    	<div class="userGuideCategoryTabRecordDiv_2">
			    		<div class="userGuideCategoryTabRecordDiv_2_Img">
			    			<img src="/image/userGuideImg/recordUiGuide_2.png" id="recordUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabRecordDiv_2_Text">
				    		<strong class="strongMargin">① 통계 제목</strong>
				    		<p>'연도별 등록 회원 비율', '지역별 비율', '성별 비율', '연령별 비율', '팀원 수'</p>
				    		<p>에 해당하는 각 통계가 노출됩니다.</p>
				    	</div>
			    	</div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabCustomerService">
			    <div class="userGuideCategoryTabCustomerServiceContainer">
			    	<div class="userGuideCategoryTabCustomerServiceDivTitle_1">
			    		<strong class="strongTitle">고객센터_FAQ</strong>
			    	</div>
			    	<div class="userGuideCategoryTabCustomerServiceDiv_1">
			    		<div class="userGuideCategoryTabCustomerServiceDiv_1_Img">
			    			<img src="/image/userGuideImg/customerServiceUiGuide_1.png" id="customerServiceUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabCustomerServiceDiv_1_Text">
				    		<strong class="strongMargin">① FAQ / QnA 탭</strong>
				    		<p>각 탭에 해당하는 게시물이 노출됩니다.</p>
				    		<strong class="strongMargin">② FAQ 하위 메뉴</strong>
				    		<p>각 탭에 해당하는 게시물이 노출됩니다.</p>
				    		<strong class="strongMargin">③ FAQ 질문</strong>
				    		<p>텍스트 클릭 시 해당하는 게시물의 답변이 노출됩니다.</p>
				    		<strong class="strongMargin">④ FAQ 답변</strong>
				    		<p>각 FAQ 질문에 따른 답변이 노출됩니다.</p>
				    	</div>
			    	</div>
				    <div class="contentCrossLine"></div>
				    <div class="userGuideCategoryTabCustomerServiceDivTitle_2">
			    		<strong class="strongTitle">고객센터_QnA</strong>
			    	</div>
			    	<div class="userGuideCategoryTabCustomerServiceDiv_2">
			    		<div class="userGuideCategoryTabCustomerServiceDiv_2_Img">
			    			<img src="/image/userGuideImg/customerServiceUiGuide_2.png" id="customerServiceUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabCustomerServiceDiv_2_Text">
				    		<strong class="strongMargin">① 게시글 목록</strong>
				    		<p>게시글 클릭 시, 상세 페이지로 이동합니다.</p>
				    		<p>로그아웃 상태일 경우, 게시글 작성자가 본인이 아닐 경우에는 이동이 불가능합니다.</p>
				    		<strong class="strongMargin">② 새 글 쓰기</strong>
				    		<p>FAQ에 없는 질문의 경우, 새 글 쓰기를 통해 1 대 1 문의를 할 수 있습니다.</p>
				    	</div>
			    	</div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
    		<div id="userGuideCategoryTabMyPage">
			    <div class="userGuideCategoryTabMyPageContainer">
			    	<div class="userGuideCategoryTabMyPageDivTitle_1">
			    		<strong class="strongTitle">마이페이지</strong>
			    	</div>
	<!-- 여기부터 -->	<div class="userGuideCategoryTabMyPageDiv_1">
			    		<div class="userGuideCategoryTabMyPageDiv_1_Img">
			    			<img src="/image/userGuideImg/myPageUiGuide_1.png" id="myPageUiGuide_1">
			    		</div>
			    		<div class="userGuideCategoryTabMyPageDiv_1_Text">
				    		<strong class="strongMargin">① 닉네임 / 내가 속한 팀 표시</strong>
				    		<p>닉네임과 내가 속한 팀을 표시합니다.</p>
				    		<p>소속팀이 있는 경우, 클릭하여 팀 정보를 볼 수 있고</p>
				    		<p>소속팀이 없는 경우, '없음'으로 표시됩니다.</p>
				    		<strong class="strongMargin">② 내 경기 기록</strong>
				    		<p>경기 수, 승, 무, 패, 골, 도움 스코어를 볼 수 있는 기록창입니다.</p>
				    		<p>내용은 관리자가 일괄적으로 기록합니다.</p>
				    		<strong class="strongMargin">③ 예약한 경기장</strong>
				    		<p>대관 페이지에서 예약하거나 양도 페이지에서 양도 받은 경우,</p>
				    		<p>경기장명, 날짜, 시간 정보를 표시합니다.</p>
				    		<strong class="strongMargin">④ 다음 예정 경기</strong>
				    		<p>매칭 성공한 경기의 경기장명, 일시, 시간, 상대팀 정보를 표시합니다.</p>
				    		<p>매칭이 성공한 양 팀의 팀장 / 팀원에게 모두 표시됩니다.</p>
							<strong class="strongMargin">⑤ 용병 관리</strong>
				    		<p>팀장에게만 노출되며 버튼 클릭 시, 용병 관리 팝업창이 보이게 됩니다.</p>
				    		<strong class="strongMargin">⑥ 레슨 관리</strong>
				    		<p>버튼 클릭 시, 레슨 관리 팝업창이 보이게 됩니다.</p>
				    		<strong class="strongMargin">⑦ 팀 관리</strong>
				    		<p>팀 생성 버튼 클릭 시, 팀 생성 팝업창이 보이게 됩니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabMyPageDivTitle_2">
			    		<strong class="strongTitle">용병 관리</strong>
			    	</div>
			    	<div class="userGuideCategoryTabMyPageDiv_2">
			    		<div class="userGuideCategoryTabMyPageDiv_2_Img">
			    			<img src="/image/userGuideImg/myPageUiGuide_2.png" id="myPageUiGuide_2">
			    		</div>
			    		<div class="userGuideCategoryTabMyPageDiv_2_Text">
				    		<strong class="strongMargin">① 용병 관리</strong>
				    		<p>용병 모집 페이지에서 글을 올린 팀의 팀장에게만 노출됩니다.</p>
				    		<p>신청자가 생기는 경우 신청한 회원의 정보가 노출됩니다.</p>
				    		<strong class="strongMargin">② 수락</strong>
				    		<p>선택된 신청 대기자 회원의 용병 신청이 성공해 팀 인원에 추가됩니다.</p>
				    		<strong class="strongMargin">③ 거절</strong>
				    		<p>선택된 신청 대기자 회원의 용병 신청이 취소됩니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabMyPageDivTitle_3">
			    		<strong class="strongTitle">레슨 관리</strong>
			    	</div>
			    	<div class="userGuideCategoryTabMyPageDiv_3">
			    		<div class="userGuideCategoryTabMyPageDiv_3_Img">
			    			<img src="/image/userGuideImg/myPageUiGuide_3.png" id="myPageUiGuide_3">
			    		</div>
			    		<div class="userGuideCategoryTabMyPageDiv_3_Text">
				    		<strong class="strongMargin">① 나의 레슨 인원</strong>
				    		<p>레슨을 신청한 회원의 정보가 노출됩니다.</p>
				    		<strong class="strongMargin">② 신청 대기자</strong>
				    		<p>레슨 모집 게시글에서 신청하기 버튼을 누른 회원의 정보가 노출됩니다.</p>
				    		<strong class="strongMargin">③ 수락</strong>
				    		<p>선택된 신청 대기자 회원의 레슨 신청이 성공해 레슨 인원에 추가됩니다.</p>
				    		<strong class="strongMargin">④ 거절</strong>
				    		<p>선택된 신청 대기자 회원의 레슨 신청이 취소됩니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabMyPageDivTitle_4">
			    		<strong class="strongTitle">회원정보 수정</strong>
			    	</div>
			    	<div class="userGuideCategoryTabMyPageDiv_4">
			    		<div class="userGuideCategoryTabMyPageDiv_4_Img">
			    			<img src="/image/userGuideImg/myPageUiGuide_4.png" id="myPageUiGuide_4">
			    		</div>
			    		<div class="userGuideCategoryTabMyPageDiv_4_Text">
				    		<strong class="strongMargin">① 아이디 / 이름 입력</strong>
				    		<p>회원가입 시 입력한 아이디와 이름입니다.</p>
				    		<p>회원이 임의로 수정할 수 없습니다.</p>
				    		<strong class="strongMargin">② 회원 정보 입력</strong>
				    		<p>비밀번호 : 5 ~ 20자의 영어 대/소문자와 숫자만 입력이 가능합니다.</p>
				    		<p>닉네임 : 2 ~ 15자의 특수 문자를 제외한 한글, 영어, 숫자만 입력이 가능합니다.</p>
				    		<p>이메일 : 올바른 이메일 형식으로 작성해야 합니다.</p>
				    		<p>전화번호 : 올바른 전화번호 형식으로 작성해야 합니다.</p>
				    		<p>주소 : 올바른 주소 형식으로 작성해야 합니다.</p>
				    		<p>상세주소 : 올바른 상세 주소 형식으로 작성해야 합니다.</p>
				    	</div>
			    	</div>
			    	<div class="contentCrossLine"></div>
			    	<div class="userGuideCategoryTabMyPageDivTitle_5">
			    		<strong class="strongTitle">회원 정보 찾기</strong>
			    	</div>
			    	<div class="userGuideCategoryTabMyPageDiv_5">
			    		<div class="userGuideCategoryTabMyPageDiv_5_Img">
			    			<img src="/image/userGuideImg/myPageUiGuide_5.png" id="myPageUiGuide_5">
			    		</div>
			    		<div class="userGuideCategoryTabMyPageDiv_5_Text">
				    		<strong class="strongMargin">① 이름</strong>
				    		<p>회원 가입할 때 입력한 회원의 이름을 입력해주세요.</p>
				    		<p>공백을 입력할 경우, 회원 정보를 찾을 수 없습니다.</p>
				    		<strong class="strongMargin">② 전화번호</strong>
				    		<p>회원 가입할 때 입력한 회원의 전화번호를 입력해주세요.</p>
				    		<p>-(하이픈)을 입력하거나 회원 정보가 일치하지 않을 경우 회원 정보를 찾을 수 없습니다.</p>
				    	</div>
			    	</div>
			    </div>
				<div style="position: absolute; left: -5%;">
			    	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			    </div>
			</div>
		</div>
    </div>
</body>
</html>
