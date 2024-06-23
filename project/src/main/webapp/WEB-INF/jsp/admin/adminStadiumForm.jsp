
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminStadium</title>
<link href="/style/community/communityFreeBoardFormStyle.css"
	rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>


<script>
	
	
	
	$(document).ready(function() {
	    $(".rowCntPerPage").val("10");
	    search();
	    
	    
	    
	    checkDate();
	    
	
	
	    
	  
	});
	
	
	
	
	
	
	
		function goAdminStadiumDetailForm(stadium_no) {
		    // m_no와 함께 player_record_no 파라미터 추가
		    $("[name='adminStadiumDetailForm'] [name='stadium_no']").val(stadium_no);
		    //$("[name='memberDetailForm'] [name='player_record_no']").val(player_record_no);
		    
	    // memberDetailForm 폼 submit
	   // alert("stadium_no :  " + stadium_no);
	    document.adminStadiumDetailForm.submit();
	}
	
	
		
		function search() {
			//---------------------------------------------
			// 변수 boardSearchFormObj 선언하고 
			// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
			//---------------------------------------------
			var boardSearchFormObj = $("[name='adminStadiumSearchForm']");
	
			var keyword1Obj = boardSearchFormObj.find(".keyword1"); 
			  
			var keyword2Obj = boardSearchFormObj.find(".keyword2");
			
	
			
			
			
			
			var keyword1 = keyword1Obj.val();
			  
		    var keyword2 = keyword2Obj.val();
		    
		    
		  
		    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
			
			
			//console.log(boardSearchFormObj.serialize());
		    
	
			
			$.ajax({
						//-------------------------------
						// WAS 로 접속할 주소 설정
						//-------------------------------
						url : "/adminStadiumForm.do"
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
	
		
							
							$(".adminFormContainer").html(obj.filter(".adminFormContainer").html());
							
							
	
							
							$(".pagingNos").html(obj.find(".pagingNos").html());
							
	
	
						}
	
						,
						error : function() {
	
							alert("검색 실패! 관리자에게 문의 바랍니다.");
						}
	
					});
	
		}
	
		function searchWithSort(sort) {
		    $("[name='adminStadiumSearchForm']").find("[name='sort']").val(sort);
		    $(".searchBtn").click();
		}
		
		
		
		function searchAll() {
	        var boardSearchFormObj = $("[name='adminStadiumSearchForm']");
	        boardSearchFormObj.find(".keyword1").val("");
	        boardSearchFormObj.find(".keyword2").val("");
	        boardSearchFormObj.find(".sort").val("");
	        boardSearchFormObj.find("#minDate").val("");
	        boardSearchFormObj.find("#maxDate").val("");
	        boardSearchFormObj.find(".selectPageNo").val("1");
	        boardSearchFormObj.find(".searchType1").val("all");
	        boardSearchFormObj.find(".stadium_status").prop("checked", false);
	        boardSearchFormObj.find(".sido").val("0");
	        boardSearchFormObj.find(".sigungu").val("0");
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
			$("[name='adminStadiumSearchForm']").find(".selectPageNo").val(clickPageNo)
	
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
	
		function goAdminStadiumUpDelForm(stadium_no){
			 $("[name='adminStadiumUpDelForm'] [name='stadium_no']").val(stadium_no);
			document.adminStadiumUpDelForm.submit()

			
		}
		
		
	</script>
	<style>
	#nav-item-stadium{
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

	<div class="communityFreeBoardFormTitle">
		
		<p class="titleBackgoundText">경기장 관리</p>

	</div>

	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>




	<form name="adminStadiumSearchForm" onsubmit="return false">

		<table class="adminSearchFormTable" align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
			<tr>
				<td style="border-bottom: none;">
					<table cellpadding="5" cellspacing="0"
						style="border-collapse: collapse" align="center">
						<tr>
							<th style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">시/도</th>
							<td colspan="5" style="text-align: center; border-bottom: none; display: flex; align-items: center;"><select name="sido" id="" class="sido"
								onchange="categoryChange(this)">
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
							</select> <select name="sigungu" id="state" class="sigungu">
									<option value="0">군/구 선택</option>
							</select></td>
						</tr>
						<tr><td style="border-bottom: none;"></td></tr>
						<tr>
							<th style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">경기장 상태</th>
							<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
								<label style="display: flex; align-items: center; margin-right: 50px;">
									<input type="checkbox" name="stadium_status" value="사용가능" class="stadium_status" style="zoom:2.0; margin-right: 5px;">사용가능
								</label>
								<label style="display: flex; align-items: center;">
									<input type="checkbox" name="stadium_status" value="이용불가" class="stadium_status" style="zoom:2.0; margin-right: 5px;">이용불가
								</label>
							</td>
						</tr>
						
						<!-- <tr>
							<th>키워드</th>

							<td><select name="searchTypeStadium" class="searchType1">
									<option value="all">전체</option>
									<option value="stadium_name">경기장이름</option>
									<option value="content">비고</option>

									추가적인 검색 조건을 샐렉트 박스에 추가
							</select> <input type="text" name="keyword1" class="keyword1"> <select
								name="orand" class="orAnd">
									<option value="or">or
									<option value="and">and
							</select> <input type="text" name="keyword2" class="keyword2"></td>
						</tr>
						<tr>
							<th>시/도</th>
							<td colspan="5"><select name="sido" id="" class="sido"
								onchange="categoryChange(this)">
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
							</select> <select name="sigungu" id="state" class="sigungu">
									<option value="0">군/구 선택</option>
							</select></td>
						</tr>
						<tr>
							<th>경기장상태</th>
							<td><input type="checkbox" name="stadium_status" value="사용가능"
								class="stadium_status">사용가능 
								<input type="checkbox" name="stadium_status" value="이용불가"
								class="stadium_status">이용불가</td>
						</tr> -->














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
				<td><input type="button" value="검색" class="searchBtn"
					onclick="search()"> <input type="button" value="모두 검색"
					class="searchAllBtn" onclick="searchAll()">&nbsp;&nbsp;&nbsp;
					<input type="button" value="새글쓰기"
					onclick="location.replace('/adminStadiumRegForm.do');"></td>
			</tr> -->

		</table>
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">

	</form>











<div class="adminFormTopContents">
		<span class="fontLightGray" id="adminFormAllCount">Total. ${requestScope.StadiumListAllCnt}개</span>
		<div class="adminFormRowCntPerPage">
			<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
				<option value="10">10개씩 보기
				<option value="15">15개씩 보기
				<option value="20">20개씩 보기
			</select>
		</div>
	</div>

	<div class="adminFormContainer">
		<div class="adminListDiv" style="margin-bottom: 20px;">
			<table class="adminListTable" cellpadding="7" align="center"
				style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
				<tr>
					<th style="width: 50px;">번호</th>

					<th style="width: 500px;">경기장 이름</th>

					<th style="width: 200px; ">시/도</th>

					<th style="width: 200px;">시/군/구</th>



				</tr>





				<c:forEach var="stadium" items="${requestScope.stadiumList}"
					varStatus="status">
					<tr style="cursor: pointer"
						onclick="goAdminStadiumUpDelForm(${stadium.stadium_no});">
						<td align="center">${requestScope.StadiumMap.begin_serialNo_asc + status.index}</td>
						<td align="center" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${stadium.stadium_name}</td>
						<td align="center">${stadium.sido_name}</td>
						<td align="center">${stadium.sigungu_name}</td>
					</tr>
				</c:forEach>


			</table>
			<c:if test="${empty requestScope.stadiumList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
<div class="newCommunityFreeBoardFormBtnDiv">
		<input type="button" value="새 글 쓰기" class="newCommunityFreeBoardFormBtn" onclick="location.replace('/adminStadiumRegForm.do');">
	</div>
	<div class="adminFormPaging">
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
		</span>
	</div>


	<form name="adminStadiumUpDelForm"action="/adminStadiumUpDelForm.do" method="post">
			<input type="hidden" name="stadium_no" value="${requestScope.stadim2DTO.stadium_no}">
		</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>