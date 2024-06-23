<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityFreeBoardForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
	$(document).ready(function() {
		$(".rowCntPerPage").val("10");

		search();

	});


	function search() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='communityFreeBoardSearchForm']");


		boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())

		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/communityFreeBoardForm.do"
					//-------------------------------
					// WAS 로 접속하는 방법 설정. get 또는 post
					//-------------------------------
					,
					type : "post"

					,
					data : boardSearchFormObj.serialize()

					,
					success : function(responseHtml) {

						var obj = $(responseHtml);

						$(".communityFreeBoardFormContainer").html(obj.filter(".communityFreeBoardFormContainer").html());

						$(".pagingNos").html(obj.find(".pagingNos").html());

					}

					,
					error : function() {

						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}

				});

	}

	function searchAll() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='communityFreeBoardSearchForm']");

		boardSearchFormObj.find(".selectPageNo").val("1")

		search();

	}

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
	// 쪼개서 보여주기.
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function pageNoClick(clickPageNo) {
		//alert(clickPageNo);
		//---------------------------------------------
		// name='selectPageNo' 를 가진 태그의 value 값에 
		// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
		// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
		// value 값에 [클릭한 페이지 번호]를 저장하기
		//---------------------------------------------
		$("[name='communityFreeBoardSearchForm']").find(".selectPageNo").val(clickPageNo)

		search()

	}
	
	function submitDetailForm(b_no) {
		
		var formObj = $("#detailForm");
		formObj.find("[name='b_no']").val(b_no);
		document.detailForm.submit();
		
	}
	
	function newCommunityFreeBoardFormBtnClick() {
	    
		var sessionMid = '<%= session.getAttribute("mid") %>'
	    
	    if (sessionMid === 'null') {
	    	alert('로그인이 필요한 서비스입니다.');
	    	location.href = '/loginForm.do';
	    } else {
	    	location.href = '/newCommunityFreeBoardForm.do';
	    }
	    
	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityFreeBoardFormTitle">
		<p class="titleBackgoundText">자유게시판</p>
	</div>


	<form name="communityFreeBoardSearchForm" onsubmit="return false">

		<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
	</form>

	<form name="detailForm" id="detailForm" action="/updateFreeBoardDetailReadCountPlusOne.do" method="post">
		<input type="hidden" name="b_no">
	</form>

	<div class="communityFreeBoardFormTopContents">
		<span class="communityFreeBoardFormFontLightGray" id="communityFreeBoardAllCount">Total. ${requestScope.freeBoardListAllCnt}개</span>
		<div class="communityFreeBoardFormRowCntPerPage">
			<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
				<option value="10">10개씩 보기
				<option value="15">15개씩 보기
				<option value="20">20개씩 보기
			</select>
		</div>
	</div>

	<div class="communityFreeBoardFormContainer">
		
		<div class="freeboardListDiv" style="margin-bottom: 20px;">
			<table class="freeboardListTable" cellpadding="7" align="center"
				style="border-collapse: collapse">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">제목</th>
					<th style="width: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" >글쓴이</th>
					<th style="width: 100px;">조회수</th>
					<th style="width: 100px;">등록일</th>
				</tr>
	
	
	
	
	
	
				<c:forEach var="freeboard" items="${requestScope.freeBoardList}"
					varStatus="status">
					<tr style="cursor: pointer" onClick="submitDetailForm( ${ freeboard.b_no } );">
						<td align="center" class="communityFreeBoardFormFontLightGray">${requestScope.freeBoardMap.begin_serialNo_desc - status.index}</td>
						<td style="text-align:left;">${freeboard.subject}</td>
						<td align="center" class="communityFreeBoardFormFontLightGray">${freeboard.nickname}</td>
						<td align="center" class="communityFreeBoardFormFontLightGray">${freeboard.readcount}</td>
						<td align="center" class="communityFreeBoardFormFontLightGray">${freeboard.reg_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty freeBoardList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
	<div class="newCommunityFreeBoardFormBtnDiv">
		<input type="button" value="새 글 쓰기" class="newCommunityFreeBoardFormBtn" onclick="newCommunityFreeBoardFormBtnClick()">
	</div>
	<div class="communityFreeBoardPaging">
		<span class="pagingNos">
			<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.freeBoardMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
			<c:forEach var="pageNo" begin="${requestScope.freeBoardMap.begin_pageNo}" end="${requestScope.freeBoardMap.end_pageNo}">
				<c:if test="${requestScope.freeBoardMap.selectPageNo==pageNo}">
		            <p class="activePageNo">${pageNo}</p>
		        </c:if>
				<c:if test="${requestScope.freeBoardMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.freeBoardMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
			<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
		</span>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>