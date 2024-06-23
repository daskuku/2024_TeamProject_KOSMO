<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminNoticeBoardForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css"
	rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>




$(document).ready(function() { 		
		$(".rowCntPerPage").val("10");
		checkDate();

   
});


function goNadminNticeboardDetailForm(b_no) {
	
	
	//----------------------------------
	// name='boardDetailForm' 을 간 form 태그 후손중에 
	// name='b_no' 가진 태그에 매개변수로 들어온 게시판의 고유번호를 
	// 삽입하기
	//----------------------------------
	
	//location.replace("/boardDetailForm.do?b_no=" + b_no);
	
	$("[name='adminNoticeboardDetailForm'] [name='b_no']").val(b_no); 
	
	//----------------------------------
	// name='boardDetailForm' 을 가진 
	// form 태그의 action 에 설정된 URL 주소로 WAS 접속해서 
	// 얻은 새 HTML 를 웹브라우저 열기.
	// 즉 화면 이동하기.
	//----------------------------------
	
	document.adminNoticeboardDetailForm.submit();
		
	
	//alert($("[name='boardDetailForm'] [name='b_no']").val());
		
}





function search(){

	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	 boardSearchFormObj = $("[name='adminNoticeBoardSearchForm']");

	 boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val() );


	 //alert(boardSearchFormObj.serialize());
    

    $.ajax({
    	//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url      : "/adminNoticeBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,type    : "post"
		
		,data    : boardSearchFormObj.serialize( )
		
	
        
        ,success : function(responseHtml) {
        	

            var obj = $(responseHtml);
  
            $(".communityNoticeBoardFormContainer").html(obj.filter(".communityNoticeBoardFormContainer").html());
			
            $(".pagingNos").html(obj.find(".pagingNos").html());

            
            
            
        }

       , error : function() {
        	
            alert("검색 실패! 관리자에게 문의 바랍니다.");
        } 
       
    });
		
}



function searchWithSort(sort) {
    // sort 값을 form의 sort 필드에 설정합니다.
    $("[name='adminNoticeBoardSearchForm']").find("[name='sort']").val(sort);
    // 폼을 서브밋하여 결과를 업데이트합니다.
    search();
}









function searchAll() {

	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='adminNoticeBoardSearchForm']");
	boardSearchFormObj.find("#minDate").val("");
    boardSearchFormObj.find("#maxDate").val("");
	
	boardSearchFormObj.find(".selectPageNo").val("1")


	search();
    
}



//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
// 쪼개서 보여주기.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function pageNoClick( clickPageNo ){
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='adminNoticeBoardSearchForm']").find(".selectPageNo").val(clickPageNo)
	
	
	search()
	
}












function checkDate() {
	$(function() {
	    // minDatepicker 설정
	    $("#minDate").datepicker({
	        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
	        showOtherMonths: true, // 다른 달의 날짜도 표시
	        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
	        changeYear: true, // 년도 선택 가능
	        changeMonth: true, // 월 선택 가능
	        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
	        buttonImageOnly: true, // 아이콘 이미지만 표시
			
	        buttonText: "날짜 선택", // 버튼 텍스트 설정
	        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
	        minDate: "-5Y", // 최소 날짜 설정
	        maxDate: 0, // 최대 날짜 설정
	        onClose: function(selectedDate) {
	            if (selectedDate) {
	                $("#maxDate").datepicker("option", "minDate", selectedDate);
	            } else {
	                // 사용자가 입력을 취소했을 때 maxDate의 minDate를 기본값으로 재설정
	                $("#maxDate").datepicker("option", "minDate", "-5Y");
	            }
	        }
	    });

	    // maxDatepicker 설정
	    $("#maxDate").datepicker({
	        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
	        showOtherMonths: true, // 다른 달의 날짜도 표시
	        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
	        changeYear: true, // 년도 선택 가능
	        changeMonth: true, // 월 선택 가능
	        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
	        buttonImageOnly: true, // 아이콘 이미지만 표시
	        buttonText: "날짜 선택", // 버튼 텍스트 설정
	        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
	        minDate: "-5Y", // 최소 날짜 설정
	        maxDate: 0, // 최대 날짜 설정
	        onClose: function(selectedDate) {
	            if (selectedDate) {
	                $("#minDate").datepicker("option", "maxDate", selectedDate);
	            } else {
	                // 사용자가 입력을 취소했을 때 minDate의 maxDate를 오늘 날짜로 재설정
	                $("#minDate").datepicker("option", "maxDate", new Date());
	            }
	        }
	    });

	});

}



function goadminNoticeboardUpDelForm(b_no){
	 $("[name='adminNoticeboardUpDelForm'] [name='b_no']").val(b_no);
	document.adminNoticeboardUpDelForm.submit()

	
}


</script>
<style>
	#nav-item-notice{
		text-align: center;
		border: 1px solid #006666;
		border-radius: 30px;
		width: 150px;
		height: 50px;
		line-height: 3.3;
		margin-top: 30px;
		background-color: #006666;
		color: #FFFFFF;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
	
		<p class="titleBackgoundText">공지사항 관리</p>
	</div>

	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>
	<form name="adminNoticeBoardSearchForm" onsubmit="return false">

		<table class="adminSearchFormTable" align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
			<tr>
				<td style="border-bottom: none;">
					<table cellpadding="5" cellspacing="0"
						style="border-collapse: collapse" align="center">
						<tr>
							<th style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">날짜검색</th>
							<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="text" name="minDate" id="minDate"
								readonly="readonly">&nbsp;~&nbsp;<input type="text"
								name="maxDate" id="maxDate" readonly="readonly"></td>
						</tr>
						<tr><td style="border-bottom: none;"></td></tr>
					</table>
					<div class="search">
						<select name="searchType1" class="searchType1">
							<option value="all">전체</option>
							<option value="stadium_name">경기장이름</option>
							<option value="content">비고</option>
						</select>
						<input type="text" name="keyword1" class="keyword1"> 
						<select name="orand" class="orAnd">
							<option value="or">or
							<option value="and">and
						</select>
						<input type="text" name="keyword2" class="keyword2">
					</div>
					<div class="searchBtnDiv">
						<input type="button" value="검색" class="searchBtn" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;">
						<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">   
					</div>
				</td>
			</tr>

			<!-- <tr align="center">
				<td><input type="button" value="검색" class="searchBtn" onclick="search()">
					<input type="button" value="모두 검색" class="searchAllBtn" onclick="searchAll()">&nbsp;&nbsp;&nbsp;
					<input type="button" value="새글쓰기" 
					onclick="location.replace('/adminNoticeboardRegForm.do');">

				</td>
			</tr> -->
		</table>
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
	</form>

	<div class="adminFormTopContents" style="margin-top: 50px;">
		<span class="fontLightGray" id="adminFormAllCount">Total. ${requestScope.noticeBoardListAllCnt}개</span>
		<div class="adminFormRowCntPerPage">
			<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
				<option value="10">10개씩 보기
				<option value="15">15개씩 보기
				<option value="20">20개씩 보기
			</select>
		</div>
	</div>


	<div class="communityNoticeBoardFormContainer">

		<div class="adminListDiv" style="margin-bottom: 20px;">
			<table class="adminListTable" cellpadding="7" align="center"
					style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">제목</th>
					<th style="width: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">글쓴이</th>
					<c:if
						test="${param.sort!='readcount asc' and param.sort!='readcount desc' }">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('readcount desc')">조회수</th>
					</c:if>
					<!--                      만약 파명 "sort" 의 파값이 'readcount desc' 면 -->
					<!--                      즉 정렬 의지가 'readcount desc' 면 -->
					<c:if test="${param.sort=='readcount desc'}">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('readcount asc')">조회수▼</th>
					</c:if>
					<!--                      만약 파명 "sort" 의 팍밧이 'readcount asc' 면 -->
					<!--                      즉 정렬 의지가 'readcount asc' 면 -->
					<c:if test="${ param.sort=='readcount asc' }">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('')">조회수▲</th>
					</c:if>

					<c:if
						test="${param.sort!='reg_date asc' and param.sort!='reg_date desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date desc')">등록일</th>
					</c:if>

					<c:if test="${param.sort=='reg_date desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date asc')">등록일▼</th>
					</c:if>

					<c:if test="${param.sort=='reg_date asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">등록일▲</th>
					</c:if>

				</tr>

				<c:forEach var="noticeboard" items="${requestScope.noticeBoardList}"
					varStatus="status">

					<tr style="cursor: pointer"
						onclick="goadminNoticeboardUpDelForm(${noticeboard.b_no})">

						<td align="center" class="fontLightGray">${requestScope.noticeBoardMap.begin_serialNo_desc - status.index}</td>
						<td>${noticeboard.subject}</td>
						<td align="center" class="fontLightGray">${noticeboard.writer}</td>
						<td align="center" class="fontLightGray">${noticeboard.readcount}</td>
						<td align="center" class="fontLightGray">${noticeboard.reg_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty noticeBoardList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
	<div class="newCommunityFreeBoardFormBtnDiv">
		<input type="button" value="새 글 쓰기" class="newCommunityFreeBoardFormBtn" onclick="location.replace('/adminNoticeboardRegForm.do');">
	</div>
	<div class="adminFormPaging">
		<span class="pagingNos">
			<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
			<c:forEach var="pageNo" begin="${requestScope.noticeBoardMap.begin_pageNo}" end="${requestScope.noticeBoardMap.end_pageNo}">
				<c:if test="${requestScope.noticeBoardMap.selectPageNo==pageNo}">
		            <p class="activePageNo">${pageNo}</p>
		        </c:if>
				<c:if test="${requestScope.noticeBoardMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
		</span>
	</div>



	<!-- 이 form 태그를 /boardDetailForm.do로 WAS로 접속하기 위해 선언한다. -->
	<form name="adminNoticeboardUpDelForm"
			action="/adminNoticeboardUpDelForm.do" method="post">
			<input type="hidden" name="b_no"value="${requestScope.communityDTO.b_no}">
		</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>