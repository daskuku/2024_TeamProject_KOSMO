
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StadiumRentForm</title>
<link href="/style/stadiumRentFormStyle.css" rel="stylesheet">
<script src="/js/stadiumRentFormScript.js"></script>

<script>
	$(document).ready(function() {
	    $(".rowCntPerPage").val("8");
	    search();
	
	  
	});
	
	function goStadiumRentDetailForm(stadium_no) {
	    // m_no와 함께 player_record_no 파라미터 추가
	    $("[name='stadiumRentDetailForm'] [name='stadium_no']").val(stadium_no);
	    //$("[name='memberDetailForm'] [name='player_record_no']").val(player_record_no);
	    
    // memberDetailForm 폼 submit

    document.stadiumRentDetailForm.submit();
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function search() {
		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='StadiumSearchForm']");
	
		 boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
		
		
		console.log(boardSearchFormObj.serialize());
	    
	
		
		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/stadiumRentForm.do"
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
	
	
						
						$(".stadiumRentFormImageContainer").html(obj.filter(".stadiumRentFormImageContainer").html());
						
						
	
						
						$(".pagingNos").html(obj.find(".pagingNos").html());
						

					        
					        
					     
						
	
					}
	
					,
					error : function() {
	
						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}
	
				});
	
	}
	
	
	function searchAll() {
		
		 var boardSearchFormObj = $("[name='StadiumSearchForm']");
		 boardSearchFormObj.find(".sido").val("0");
		 boardSearchFormObj.find(".sigungu").val("0");
		 boardSearchFormObj.find(".sigungu").empty();
		 boardSearchFormObj.find(".sigungu").append('<option value="0">군/구 선택</option>');
		 boardSearchFormObj.find("input[type=text]").val("");
		 boardSearchFormObj.find(".rowCntPerPage").val("8");
		 boardSearchFormObj.find(".SelectPageNo").val("1")
        
        search();
    }

	
	
	
	
	
	
	
	
	
	
	
	function pageNoClick(clickPageNo) {
	    $("[name='StadiumSearchForm']").find(".selectPageNo").val(clickPageNo);
	    search();
	}
	
	
	
	
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="stadiumRentFormTitle">
		<p class="titleBackgoundText">경기장 대관</p>
	</div>

	<div class="stadiumRentFormContainer">
		<div class="stadiumRentFormConditionalSearch"></div>
	</div>

	<form name="StadiumSearchForm" onsubmit="return false">
		<table align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
			<tr>
				<td>
					<table align="center" style="border-collapse: collapse; border-bottom: none;">
						<tr>
							<th style="border-radius: 10px;">지역</th>
							<td colspan="5" style="text-align: center; width:200px;"><select name="sido" id="" class="sido"
								onchange="categoryChange(this)" style="width:200px; text-align: center;">
									<option value="0">시/도 선택</option>
									<option value="1">강원</option>
									<option value="2">경기</option>
									<option value="3">경남</option>
									<option value="4">경북</option>
									<option value="5">광주</option>
									<option value="6">대구</option>
									<option value="7">대전</option>
									<option value="8">부산</option>
									<option value="9">서울</option>
									<option value="10">울산</option>
									<option value="11">인천</option>
									<option value="12">전남</option>
									<option value="13">전북</option>
									<option value="14">제주</option>
									<option value="15">충남</option>
									<option value="16">충북</option>
							</select> <select name="sigungu" id="state" class="sigungu" style="width:200px; text-align: center;">
									<option value="0">군/구 선택</option>
							</select></td>
						</tr>
						<tr><td></td></tr>
						<tr>
							<th style="border-radius: 10px;">경기장이름</th>
							<td><input type="text" name="Stadiumkeyword1" class="Stadiumkeyword1">
								<select name="orand" class="orAnd" style="text-align: center;">
									<option value="or">or
									<option value="and">and
							</select> <input type="text" name="Stadiumkeyword2" class="Stadiumkeyword2"></td>
						</tr>
						<tr><td></td></tr>
					</table>
					
			</tr>
			<tr align="center" style="border-top: 1px solid #c59246e0;">
				<td style="border-top: 1px solid #c59246e0;"><input type="button" value="검색" class="searchBtn"
					onclick="search()"> <input type="button" value="초기화"
					class="searchAllBtn" onclick="searchAll()"></td>
			</tr>

		</table>
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
	</form>



	<div class="stadiumRentFormTopContents">
		<span class="stadiumRentFormFontLightGray" id="stadiumRentAllCount">Total. ${requestScope.StadiumListAllCnt}개</span>
		<div class="stadiumRentFormRowCntPerPage">
			<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
				<option value="8">8개씩 보기
				<option value="12">12개씩 보기
			</select>
		</div>
	</div>



	<div id="stadiumDiv" class="stadiumRentFormImageContainer">
		<c:forEach var="stadiumList" items="${requestScope.stadiumList}"
			varStatus="status">

			<div class="stadiumRentFormBoard" style="cursor: pointer;"
				onclick="goStadiumRentDetailForm(${stadiumList.stadium_no});">
				<c:if test="${stadiumList.imagename != null}">
					<div class="stadiumRentImageDiv">
						<img src="/image/stadiumImg/${stadiumList.imagename}" class="stadiumRentImage">
					</div>
				</c:if>
				<c:if test="${stadiumList.imagename == null}">
					<div class="stadiumRentImageDiv">
						<img src="/image/noImage.png" class="stadiumRentImage" style="width:250px; height:200px;">
					</div>
				</c:if>
				<div class="staus">
					${requestScope.StadiumMap.begin_serialNo_asc + status.index}</div>
				<div class="stadiumRentSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">경기장:${stadiumList.stadium_name}</div>
				<div class="stadiumRentWriter">지역:${stadiumList.sido_name}-${stadiumList.sigungu_name}</div>
			</div>
		</c:forEach>
		



		<c:if test="${empty requestScope.stadiumList}">
			<br>
			<center>조건에 맞는 검색 결과가 없습니다.</center>
		</c:if>
	</div>
	<div class="stadiumRentPaging">
			<span class="pagingNos">
				<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.StadiumMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
				<c:forEach var="pageNo" begin="${requestScope.StadiumMap.begin_pageNo}" end="${requestScope.StadiumMap.end_pageNo}">
					<c:if test="${requestScope.StadiumMap.selectPageNo==pageNo}">
			            <p class="activePageNo">${pageNo}</p>
			        </c:if>
					<c:if test="${requestScope.StadiumMap.selectPageNo!=pageNo}">
						<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
					</c:if>
				</c:forEach>
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.StadiumMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
				<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
			</span>
		</div>
		
	<form name="stadiumRentDetailForm" action="/stadiumRentDetailForm.do"
		method="post">
		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->



		<input type="hidden" name="stadium_no">
	</form>

	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>