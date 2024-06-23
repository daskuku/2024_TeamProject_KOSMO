<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecordsRankingForm</title>
<link href="/style/records/recordsRankingFormStyle.css" rel="stylesheet">
<!-- <script src="/js/recordsRankingFormScript.js"></script> -->
<script>
// Category 선택 

	$(function(){
		$('.recordsRankingFormCategoryTabContent > div, .recordsRankingFormCategoryTabSelectDiv').hide();
		$('.recordsRankingFormCategoryTabNav a').click(function(){
			
			var index = $(this).parent().index();
			
			$('.recordsRankingFormCategoryTabSelectDiv').hide();
			
	        $(this).parent().find('.recordsRankingFormCategoryTabSelectDiv').show();
			
			$('.recordsRankingFormCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			
			$('.recordsRankingFormCategoryTabNav a').removeClass('active');
			
			$(this).addClass('active');
			
			return false;
			
		}).filter(':eq(0)').click();
		
		// 각 탭 초기화
		
		$('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabRegion"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0) .region').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0) .region:first').addClass('selected');
	        searchRegion(9);
	    });
	    
	    $('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabGender"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1) .gender').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1) .gender:first').addClass('selected');
	        searchGender('남');
	    });
	    
	    $('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabAge"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2) .age').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2) .age:first').addClass('selected');
	        searchAge('10대');
	    });
	});
	
// 전체 카테고리 선택

	function clickToSortTabAll(sortTabAll) {
		
	    var sortTabAllObj = $("[name='recordsRankingFormTabAll']");
	    
	    sortTabAllObj.find("[name='sortTabAll']").val(sortTabAll);

	    recordsRankingFormTabAll(sortTabAllObj);
	}
	
	function searchAll() {
		
	    var tabAllObj = $("[name='recordsRankingFormTabAll']");
	   
	    recordsRankingFormTabAll(tabAllObj);
	}
	
	function recordsRankingFormTabAll(sortTabAllObj){
		
		$.ajax({
			
	        url: "/recordsRankingForm.do",
	        
	        type: "post",
	        
	        data: sortTabAllObj.serialize(),
	        
	        success: function(responseHtml) {
	        	
	            var obj = $(responseHtml);
	            
	            $("[name='recordsRankingFormTabAll']").html(obj.find("[name='recordsRankingFormTabAll']").html());
	        
	        },
	        error: function() {alert("전체 정렬 실패");}
	    });
	}
	
// 지역 카테고리 선택

	$(document).ready(function() {
	    $(".region").click(function() {
	        $(".region").removeClass("selected");
	        $(this).addClass("selected");
	    });
	});

	function clickToSortTabRegion(sortTabRegion) {
		
	    var sortTabRegionObj = $("[name='recordsRankingFormTabRegion']");
	    var tabRegionObj = $("[name='recordsRankingFormSelectTabRegion']");
	    
	    sortTabRegionObj.find("[name='sortTabRegion']").val(sortTabRegion);
	    
	    tabRegionObj.find("[name='sortTabRegion']").val(sortTabRegion);
	    
	    recordsRankingFormTabRegion(sortTabRegionObj, tabRegionObj);
	}

	function searchRegion(sido_id) {
		
	    var sortTabRegionObj = $("[name='recordsRankingFormTabRegion']");
	    var tabRegionObj = $("[name='recordsRankingFormSelectTabRegion']");
	    
	    sortTabRegionObj.find("[name='sido_id']").val(sido_id);
	    
	    tabRegionObj.find("[name='sido_id']").val(sido_id);
	    
	    recordsRankingFormTabRegion(sortTabRegionObj, tabRegionObj);
	}


	function recordsRankingFormTabRegion(sortTabRegionObj, tabRegionObj) { 
		
		var formData = {
		        sortTabRegion: sortTabRegionObj.find("[name='sortTabRegion']").val(),
		        sido_id: tabRegionObj.find("[name='sido_id']").val()
		    };
		
	    $.ajax({
	    	
	        url: "/recordsRankingForm.do",
	        
	        type: "post",
	        
	        data: formData,
	        
	        success: function(responseHtml) {
	        	
	            var obj = $(responseHtml);
	            
	            $(".recordsRankingFormTabRegionWinRating").html(obj.find(".recordsRankingFormTabRegionWinRating").html());
	            $(".recordsRankingFormTabRegionGoalRating").html(obj.find(".recordsRankingFormTabRegionGoalRating").html());
	            $(".recordsRankingFormTabRegionAssistRating").html(obj.find(".recordsRankingFormTabRegionAssistRating").html());
	            
	            $("[name='recordsRankingFormTabRegion']").html(obj.find("[name='recordsRankingFormTabRegion']").html());
	        },
	        error: function() {
	            alert("지역 변경 실패");
	        }
	    });
	}
	
// 성별 카테고리 선택
	
	$(document).ready(function() {
	    $(".gender").click(function() {
	        $(".gender").removeClass("selected");
	        $(this).addClass("selected");
	    });
	});

	function clickToSortTabGender(sortTabGender) {
		
	    var sortTabGenderObj = $("[name='recordsRankingFormTabGender']");
	    var tabGenderObj = $("[name='recordsRankingFormSelectTabGender']");
	    
	    sortTabGenderObj.find("[name='sortTabGender']").val(sortTabGender);
	    
	    tabGenderObj.find("[name='sortTabGender']").val(sortTabGender);
	    
	    recordsRankingFormTabGender(sortTabGenderObj, tabGenderObj);
	}

	function searchGender(gender) {
		
	    var sortTabGenderObj = $("[name='recordsRankingFormTabGender']");
	    var tabGenderObj = $("[name='recordsRankingFormSelectTabGender']");
	    
	    sortTabGenderObj.find("[name='gender']").val(gender);
	    
	    tabGenderObj.find("[name='gender']").val(gender);
	    
	    recordsRankingFormTabGender(sortTabGenderObj, tabGenderObj);
	}


	function recordsRankingFormTabGender(sortTabGenderObj, tabGenderObj) { 
		
		var formData = {
		        sortTabGender: sortTabGenderObj.find("[name='sortTabGender']").val(),
		        gender: tabGenderObj.find("[name='gender']").val()
		    };
		
	    $.ajax({
	    	
	        url: "/recordsRankingForm.do",
	        
	        type: "post",
	        
	        data: formData,
	        
	        success: function(responseHtml) {
	        	
	            var obj = $(responseHtml);
	            
	            $(".recordsRankingFormTabGenderWinRating").html(obj.find(".recordsRankingFormTabGenderWinRating").html());
	            $(".recordsRankingFormTabGenderGoalRating").html(obj.find(".recordsRankingFormTabGenderGoalRating").html());
	            $(".recordsRankingFormTabGenderAssistRating").html(obj.find(".recordsRankingFormTabGenderAssistRating").html());
	            
	            $("[name='recordsRankingFormTabGender']").html(obj.find("[name='recordsRankingFormTabGender']").html());
	        },
	        error: function() {
	            alert("지역 변경 실패");
	        }
	    });
	}
	
// 연령대 카테고리 선택

	$(document).ready(function() {
	    $(".age").click(function() {
	        $(".age").removeClass("selected");
	        $(this).addClass("selected");
	    });
	});

	function clickToSortTabAge(sortTabAge) {
		
	    var sortTabAgeObj = $("[name='recordsRankingFormTabAge']");
	    var tabAgeObj = $("[name='recordsRankingFormSelectTabAge']");
	    
	    sortTabAgeObj.find("[name='sortTabAge']").val(sortTabAge);
	    
	    tabAgeObj.find("[name='sortTabAge']").val(sortTabAge);
	    
	    recordsRankingFormTabAge(sortTabAgeObj, tabAgeObj);
	}

	function searchAge(age) {
		
	    var sortTabAgeObj = $("[name='recordsRankingFormTabAge']");
	    var tabAgeObj = $("[name='recordsRankingFormSelectTabAge']");
	    
	    sortTabAgeObj.find("[name='age']").val(age);
	    
	    tabAgeObj.find("[name='age']").val(age);
	    
	    recordsRankingFormTabAge(sortTabAgeObj, tabAgeObj);
	}


	function recordsRankingFormTabAge(sortTabAgeObj, tabAgeObj) { 
		
		var formData = {
		        sortTabAge: sortTabAgeObj.find("[name='sortTabAge']").val(),
		        age: tabAgeObj.find("[name='age']").val()
		    };
		
	    $.ajax({
	    	
	        url: "/recordsRankingForm.do",
	        
	        type: "post",
	        
	        data: formData,
	        
	        success: function(responseHtml) {
	        	
	            var obj = $(responseHtml);
	            
	            $(".recordsRankingFormTabAgeWinRating").html(obj.find(".recordsRankingFormTabAgeWinRating").html());
	            $(".recordsRankingFormTabAgeGoalRating").html(obj.find(".recordsRankingFormTabAgeGoalRating").html());
	            $(".recordsRankingFormTabAgeAssistRating").html(obj.find(".recordsRankingFormTabAgeAssistRating").html());
	            
	            $("[name='recordsRankingFormTabAge']").html(obj.find("[name='recordsRankingFormTabAge']").html());
	        },
	        error: function() {
	            alert("지역 변경 실패");
	        }
	    });
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recordsRankingFormTitle">
    	<p class="titleBackgoundText">랭킹</p>
    </div>
    <div class="recordsRankingFormCategoryTab">
    	<ul class="recordsRankingFormCategoryTabNav">
	    	<li><a href="#recordsRankingFormCategoryTabAll" onClick="searchAll()" class="searchAll">전체 순위</a></li>
	    	<li><a href="#recordsRankingFormCategoryTabRegion">지역별 순위</a> <!-- ajax로 지역 구분 -->
	    		<form name="recordsRankingFormSelectTabRegion">
				    <input type="hidden" name="sido_id">
		    		<div class="recordsRankingFormCategoryTabSelectDiv">
				    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse;">
				    		<tr align="center">
				    			<td class="region" onClick="searchRegion(9)">서울</td>
				    			<td class="region" onClick="searchRegion(2)">경기/인천</td>
				    			<td class="region" onClick="searchRegion(1)">강원</td>
				    			<td class="region" onClick="searchRegion(7)">충청</td>
				    		</tr>
				    		<tr align="center">
				    			<td class="region" onClick="searchRegion(5)">전라</td>
				    			<td class="region" onClick="searchRegion(3)">경상</td>
				    			<td class="region" onClick="searchRegion(14)">제주</td>
				    		</tr>
				    	</table>
				    </div>
				</form>
		    </li>
	    	<li><a href="#recordsRankingFormCategoryTabGender">성별 순위</a> <!-- ajax로 남/녀 구분 -->
	    		<form name="recordsRankingFormSelectTabGender">
				    <input type="hidden" name="gender">
		    		<div class="recordsRankingFormCategoryTabSelectDiv">
				    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse; width: 100%;">
				    		<tr>
				    			<td class="gender" onClick="searchGender('남')" style="width: 50%; text-align: center;">남</td>
				    			<td class="gender" onClick="searchGender('여')" style="width: 50%; text-align: center;">여</td>
				    		</tr>
				    	</table>
				    </div>
				</form>
		    </li>
	    	<li><a href="#recordsRankingFormCategoryTabAge">연령대별 순위</a> <!-- ajax로 연령대 구분 -->
	    		<form name="recordsRankingFormSelectTabAge">
				    <input type="hidden" name="age">
		    		<div class="recordsRankingFormCategoryTabSelectDiv">
				    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse">
				    		<tr>
				    			<td class="age" onClick="searchAge('10대')">10대</td>
				    			<td class="age" onClick="searchAge('20대')">20대</td>
				    			<td class="age" onClick="searchAge('30대')">30대</td>
				    			<td class="age" onClick="searchAge('40대')">40대</td>
				    		</tr>
				    		<tr>
				    			<td class="age" onClick="searchAge('50대')">50대</td>
				    			<td class="age" onClick="searchAge('60대')">60대</td>
				    			<td class="age" onClick="searchAge('70대')">70대</td>
				    			<td class="age" onClick="searchAge('80대')">80대</td>
				    		</tr>
				    	</table>
				    </div>
				</form>
		    </li>
	    </ul>
	    <div class="recordsRankingFormCategoryTabContent">
	    	<div id="recordsRankingFormCategoryTabAll">
			    <div class="recordsRankingFormTabAllRating">
				    <table class="recordsRankingFormTabAllGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 승</th>
				    	</tr>
				    	<c:forEach var="recordsGoalRatingTabAll" items="${requestScope.recordsWinRatingTabAll}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsGoalRatingTabAll.nickname}</td>
					    		<td>${recordsGoalRatingTabAll.wins} 승</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAllWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 득점</th>
				    	</tr>
				    	<c:forEach var="recordsWinRatingTabAll" items="${requestScope.recordsGoalRatingTabAll}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsWinRatingTabAll.nickname}</td>
					    		<td>${recordsWinRatingTabAll.goals_for} 골</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAllAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 도움</th>
				    	</tr>
				    	<c:forEach var="recordsAssistRatingTabAll" items="${requestScope.recordsAssistRatingTabAll}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsAssistRatingTabAll.nickname}</td>
					    		<td>${recordsAssistRatingTabAll.goals_assist} 회</td>
					    	</tr>
					    </c:forEach>
				    </table>
				</div>
			    <form name="recordsRankingFormTabAll">
				    <input type="hidden" name="sortTabAll">
				    <div class="recordsRankingFormTabAllTableDiv">
				    	<table class="recordsRankingFormTabAllTable" cellpadding="7" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr style="background-color: #c59246e0;">
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">선수(닉네임)</th>
				    			<c:if test="${param.sortTabAll!='games_played asc' and param.sortTabAll != 'games_played desc'}">
				    				<th onClick="clickToSortTabAll('games_played desc')"style="width:50px; cursor:pointer;">경기수</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'games_played desc'}">
				    				<th onClick="clickToSortTabAll('games_played asc')"style="width:50px; cursor:pointer;">경기수 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'games_played asc'}">
				    				<th onClick="clickToSortTabAll('')"style="width:50px; cursor:pointer;">경기수 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll!='wins asc' and param.sortTabAll != 'wins desc'}">
				    				<th onClick="clickToSortTabAll('wins desc')"style="width:50px; cursor:pointer;">승</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'wins desc'}">
				    				<th onClick="clickToSortTabAll('wins asc')"style="width:50px; cursor:pointer;">승 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll =='wins asc'}">
				    				<th onClick="clickToSortTabAll('')"style="width:50px; cursor:pointer;">승 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll!='draws asc' and param.sortTabAll != 'draws desc'}">
				    				<th onClick="clickToSortTabAll('draws desc')"style="width:50px; cursor:pointer;">무</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'draws desc'}">
				    				<th onClick="clickToSortTabAll('draws asc')"style="width:50px; cursor:pointer;">무 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll =='draws asc'}">
				    				<th onClick="clickToSortTabAll('')"style="width:50px; cursor:pointer;">무 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll!='losses asc' and param.sortTabAll != 'losses desc'}">
				    				<th onClick="clickToSortTabAll('losses desc')"style="width:50px; cursor:pointer;">패</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'losses desc'}">
				    				<th onClick="clickToSortTabAll('losses asc')"style="width:50px; cursor:pointer;">패 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll =='losses asc'}">
				    				<th onClick="clickToSortTabAll('')"style="width:50px; cursor:pointer;">패 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll!='goals_for asc' and param.sortTabAll != 'goals_for desc'}">
				    				<th onClick="clickToSortTabAll('goals_for desc')"style="width:50px; cursor:pointer;">득점</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'goals_for desc'}">
				    				<th onClick="clickToSortTabAll('goals_for asc')"style="width:50px; cursor:pointer;">득점 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll =='goals_for asc'}">
				    				<th onClick="clickToSortTabAll('')"style="width:50px; cursor:pointer;">득점 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll!='goals_assist asc' and param.sortTabAll != 'goals_assist desc'}">
				    				<th onClick="clickToSortTabAll('goals_assist desc')"style="width:50px; cursor:pointer;">도움</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll == 'goals_assist desc'}">
				    				<th onClick="clickToSortTabAll('goals_assist asc')"style="width:50px; cursor:pointer;">도움 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAll =='goals_assist asc'}">
				    				<th onClick="clickToSortTabAll('')"style="width:50px; cursor:pointer;">도움 △</th>
				    			</c:if>
				    		</tr>
				    	</table>
				    	<div class="recordsRankingFormTabAllTableScrollDiv" style="height: 600px; width:1050px; overflow-x: hidden; overflow-y: auto; margin: 0 auto; padding-left: 15px;">
				    		<table class="recordsRankingFormTabAllScrollTable" cellpadding="7" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    			<c:forEach var="recordsRankingTabAll" items="${requestScope.recordsRankingTabAll}" varStatus="status">
									<tr style="border-bottom: 1px solid #c59246e0;">
										<c:if test="${sessionScope.nickname.equals(recordsRankingTabAll.nickname)}">
											<td align="center" style="width: 60px; background: yellow;">${status.count}</td>
											<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
											<td align="center" style="width: 250px; background: yellow;">${recordsRankingTabAll.nickname}</td>
											<td align="center" style="width: 140px; background: yellow;">${recordsRankingTabAll.games_played}</td>
											<td align="center" style="width: 130px; background: yellow;">${recordsRankingTabAll.wins}</td>
											<td align="center" style="width: 130px; background: yellow;">${recordsRankingTabAll.draws}</td>
											<td align="center" style="width: 130px; background: yellow;">${recordsRankingTabAll.losses}</td>
											<td align="center" style="width: 130px; background: yellow;">${recordsRankingTabAll.goals_for}</td>
											<td align="center" style="width: 130px; background: yellow;">${recordsRankingTabAll.goals_assist}</td>
										</c:if>
										<c:if test="${!sessionScope.nickname.equals(recordsRankingTabAll.nickname)}">
										    <td align="center" style="width: 60px;">${status.count}</td>
										    <!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										    <td align="center" style="width: 250px;">${recordsRankingTabAll.nickname}</td>
										    <td align="center" style="width: 140px;">${recordsRankingTabAll.games_played}</td>
										    <td align="center" style="width: 130px;">${recordsRankingTabAll.wins}</td>
										    <td align="center" style="width: 130px;">${recordsRankingTabAll.draws}</td>
										    <td align="center" style="width: 130px;">${recordsRankingTabAll.losses}</td>
										    <td align="center" style="width: 130px;">${recordsRankingTabAll.goals_for}</td>
										    <td align="center" style="width: 130px;">${recordsRankingTabAll.goals_assist}</td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
				    	</div>
				    </div>
				</form>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- --------------------------------------------지      역      별      순      위----------------------------------------------- -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<div id="recordsRankingFormCategoryTabRegion">
			    <div class="recordsRankingFormTabRegionRating">
				    <table class="recordsRankingFormTabRegionWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 승</th>
				    	</tr>
				    	<c:forEach var="recordsGoalRatingTabRegion" items="${requestScope.recordsWinRatingTabRegion}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsGoalRatingTabRegion.nickname}</td>
					    		<td>${recordsGoalRatingTabRegion.wins} 승</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabRegionGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 득점</th>
				    	</tr>
				    	<c:forEach var="recordsWinRatingTabRegion" items="${requestScope.recordsGoalRatingTabRegion}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsWinRatingTabRegion.nickname}</td>
					    		<td>${recordsWinRatingTabRegion.goals_for} 골</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabRegionAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 도움</th>
				    	</tr>
				    	<c:forEach var="recordsAssistRatingTabRegion" items="${requestScope.recordsAssistRatingTabRegion}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsAssistRatingTabRegion.nickname}</td>
					    		<td>${recordsAssistRatingTabRegion.goals_assist} 회</td>
					    	</tr>
					    </c:forEach>
				    </table>
				</div>
			    <form name="recordsRankingFormTabRegion">
				    <input type="hidden" name="sortTabRegion">
				    <div class="recordsRankingFormTabRegionTableDiv">
				    	<table class="recordsRankingFormTabRegionTable" cellpadding="7" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr style="background-color: #c59246e0;">
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
				    			<c:if test="${param.sortTabRegion!='games_played asc' and param.sortTabRegion != 'games_played desc'}">
				    				<th onClick="clickToSortTabRegion('games_played desc')"style="width:50px; cursor:pointer;">경기수</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'games_played desc'}">
				    				<th onClick="clickToSortTabRegion('games_played asc')"style="width:50px; cursor:pointer;">경기수 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'games_played asc'}">
				    				<th onClick="clickToSortTabRegion('')"style="width:50px; cursor:pointer;">경기수 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion!='wins asc' and param.sortTabRegion != 'wins desc'}">
				    				<th onClick="clickToSortTabRegion('wins desc')"style="width:50px; cursor:pointer;">승</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'wins desc'}">
				    				<th onClick="clickToSortTabRegion('wins asc')"style="width:50px; cursor:pointer;">승 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion =='wins asc'}">
				    				<th onClick="clickToSortTabRegion('')"style="width:50px; cursor:pointer;">승 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion!='draws asc' and param.sortTabRegion != 'draws desc'}">
				    				<th onClick="clickToSortTabRegion('draws desc')"style="width:50px; cursor:pointer;">무</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'draws desc'}">
				    				<th onClick="clickToSortTabRegion('draws asc')"style="width:50px; cursor:pointer;">무 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion =='draws asc'}">
				    				<th onClick="clickToSortTabRegion('')"style="width:50px; cursor:pointer;">무 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion!='losses asc' and param.sortTabRegion != 'losses desc'}">
				    				<th onClick="clickToSortTabRegion('losses desc')"style="width:50px; cursor:pointer;">패</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'losses desc'}">
				    				<th onClick="clickToSortTabRegion('losses asc')"style="width:50px; cursor:pointer;">패 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion =='losses asc'}">
				    				<th onClick="clickToSortTabRegion('')"style="width:50px; cursor:pointer;">패 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion!='goals_for asc' and param.sortTabRegion != 'goals_for desc'}">
				    				<th onClick="clickToSortTabRegion('goals_for desc')"style="width:50px; cursor:pointer;">득점</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'goals_for desc'}">
				    				<th onClick="clickToSortTabRegion('goals_for asc')"style="width:50px; cursor:pointer;">득점 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion =='goals_for asc'}">
				    				<th onClick="clickToSortTabRegion('')"style="width:50px; cursor:pointer;">득점 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion!='goals_assist asc' and param.sortTabRegion != 'goals_assist desc'}">
				    				<th onClick="clickToSortTabRegion('goals_assist desc')"style="width:50px; cursor:pointer;">도움</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion == 'goals_assist desc'}">
				    				<th onClick="clickToSortTabRegion('goals_assist asc')"style="width:50px; cursor:pointer;">도움 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabRegion =='goals_assist asc'}">
				    				<th onClick="clickToSortTabRegion('')"style="width:50px; cursor:pointer;">도움 △</th>
				    			</c:if>
				    		</tr>
			    			<c:forEach var="recordsRankingTabRegion" items="${requestScope.recordsRankingTabRegion}" varStatus="status">
								<tr class="recordsRankingTabRegion" style=" border-bottom: 1px solid #c59246e0;">
									<td align="center">${status.count}</td>
									<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
									<td align="center">${recordsRankingTabRegion.nickname}</td>
									<td align="center">${recordsRankingTabRegion.games_played}</td>
									<td align="center">${recordsRankingTabRegion.wins}</td>
									<td align="center">${recordsRankingTabRegion.draws}</td>
									<td align="center">${recordsRankingTabRegion.losses}</td>
									<td align="center">${recordsRankingTabRegion.goals_for}</td>
									<td align="center">${recordsRankingTabRegion.goals_assist}</td>
								</tr>
							</c:forEach>
				    	</table>
				    	<c:if test="${empty requestScope.recordsRankingTabAge}">
							<tr class="recordsRankingTabAge" style="border-bottom: 1px solid #c59246e0;">
								<br>
								<center>조건에 맞는 검색 결과가 없습니다.</center>
							</tr>
						</c:if>
				    </div>
				</form>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- -------------------------------------------------성      별      순      위------------------------------------------------- -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<div id="recordsRankingFormCategoryTabGender">
			    <div class="recordsRankingFormTabGenderRating">
				    <table class="recordsRankingFormTabGenderWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 승</th>
				    	</tr>
				    	<c:forEach var="recordsGoalRatingTabGender" items="${requestScope.recordsWinRatingTabGender}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsGoalRatingTabGender.nickname}</td>
					    		<td>${recordsGoalRatingTabGender.wins} 승</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabGenderGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 득점</th>
				    	</tr>
				    	<c:forEach var="recordsWinRatingTabGender" items="${requestScope.recordsGoalRatingTabGender}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsWinRatingTabGender.nickname}</td>
					    		<td>${recordsWinRatingTabGender.goals_for} 골</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabGenderAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 도움</th>
				    	</tr>
				    	<c:forEach var="recordsAssistRatingTabGender" items="${requestScope.recordsAssistRatingTabGender}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsAssistRatingTabGender.nickname}</td>
					    		<td>${recordsAssistRatingTabGender.goals_assist} 회</td>
					    	</tr>
					    </c:forEach>
				    </table>
				</div>
			    <form name="recordsRankingFormTabGender">
				    <input type="hidden" name="sortTabGender">
				    <div class="recordsRankingFormTabGenderTableDiv">
				    	<table class="recordsRankingFormTabGenderTable" cellpadding="7" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr style="background-color: #c59246e0;">
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
				    			<c:if test="${param.sortTabGender!='games_played asc' and param.sortTabGender != 'games_played desc'}">
				    				<th onClick="clickToSortTabGender('games_played desc')"style="width:50px; cursor:pointer;">경기수</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'games_played desc'}">
				    				<th onClick="clickToSortTabGender('games_played asc')"style="width:50px; cursor:pointer;">경기수 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'games_played asc'}">
				    				<th onClick="clickToSortTabGender('')"style="width:50px; cursor:pointer;">경기수 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender!='wins asc' and param.sortTabGender != 'wins desc'}">
				    				<th onClick="clickToSortTabGender('wins desc')"style="width:50px; cursor:pointer;">승</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'wins desc'}">
				    				<th onClick="clickToSortTabGender('wins asc')"style="width:50px; cursor:pointer;">승 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender =='wins asc'}">
				    				<th onClick="clickToSortTabGender('')"style="width:50px; cursor:pointer;">승 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender!='draws asc' and param.sortTabGender != 'draws desc'}">
				    				<th onClick="clickToSortTabGender('draws desc')"style="width:50px; cursor:pointer;">무</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'draws desc'}">
				    				<th onClick="clickToSortTabGender('draws asc')"style="width:50px; cursor:pointer;">무 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender =='draws asc'}">
				    				<th onClick="clickToSortTabGender('')"style="width:50px; cursor:pointer;">무 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender!='losses asc' and param.sortTabGender != 'losses desc'}">
				    				<th onClick="clickToSortTabGender('losses desc')"style="width:50px; cursor:pointer;">패</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'losses desc'}">
				    				<th onClick="clickToSortTabGender('losses asc')"style="width:50px; cursor:pointer;">패 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender =='losses asc'}">
				    				<th onClick="clickToSortTabGender('')"style="width:50px; cursor:pointer;">패 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender!='goals_for asc' and param.sortTabGender != 'goals_for desc'}">
				    				<th onClick="clickToSortTabGender('goals_for desc')"style="width:50px; cursor:pointer;">득점</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'goals_for desc'}">
				    				<th onClick="clickToSortTabGender('goals_for asc')"style="width:50px; cursor:pointer;">득점 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender =='goals_for asc'}">
				    				<th onClick="clickToSortTabGender('')"style="width:50px; cursor:pointer;">득점 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender!='goals_assist asc' and param.sortTabGender != 'goals_assist desc'}">
				    				<th onClick="clickToSortTabGender('goals_assist desc')"style="width:50px; cursor:pointer;">도움</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender == 'goals_assist desc'}">
				    				<th onClick="clickToSortTabGender('goals_assist asc')"style="width:50px; cursor:pointer;">도움 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabGender =='goals_assist asc'}">
				    				<th onClick="clickToSortTabGender('')"style="width:50px; cursor:pointer;">도움 △</th>
				    			</c:if>
				    		</tr>
			    			<c:forEach var="recordsRankingTabGender" items="${requestScope.recordsRankingTabGender}" varStatus="status">
								<tr class="recordsRankingTabGender" style="border-bottom: 1px solid #c59246e0;">
									<td align="center">${status.count}</td>
									<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
									<td align="center">${recordsRankingTabGender.nickname}</td>
									<td align="center">${recordsRankingTabGender.games_played}</td>
									<td align="center">${recordsRankingTabGender.wins}</td>
									<td align="center">${recordsRankingTabGender.draws}</td>
									<td align="center">${recordsRankingTabGender.losses}</td>
									<td align="center">${recordsRankingTabGender.goals_for}</td>
									<td align="center">${recordsRankingTabGender.goals_assist}</td>
								</tr>
							</c:forEach>
				    	</table>
				    </div>
				</form>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- --------------------------------------------연      령      별      순      위----------------------------------------------- -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<div id="recordsRankingFormCategoryTabAge">
			    <div class="recordsRankingFormTabAgeRating">
				    <table class="recordsRankingFormTabAgeWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 승</th>
				    	</tr>
				    	<c:forEach var="recordsGoalRatingTabAge" items="${requestScope.recordsWinRatingTabAge}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsGoalRatingTabAge.nickname}</td>
					    		<td>${recordsGoalRatingTabAge.wins} 승</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAgeGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 득점</th>
				    	</tr>
				    	<c:forEach var="recordsWinRatingTabAge" items="${requestScope.recordsGoalRatingTabAge}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsWinRatingTabAge.nickname}</td>
					    		<td>${recordsWinRatingTabAge.goals_for} 골</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAgeAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px;">최다 도움</th>
				    	</tr>
				    	<c:forEach var="recordsAssistRatingTabAge" items="${requestScope.recordsAssistRatingTabAge}" varStatus="status" begin="0" end="2">
					    	<tr style="border-bottom: 1px solid #c59246e0;">
					    		<td>${recordsAssistRatingTabAge.nickname}</td>
					    		<td>${recordsAssistRatingTabAge.goals_assist} 회</td>
					    	</tr>
					    </c:forEach>
				    </table>
				</div>
			    <form name="recordsRankingFormTabAge">
				    <input type="hidden" name="sortTabAge">
				    <div class="recordsRankingFormTabAgeTableDiv">
				    	<table class="recordsRankingFormTabAgeTable" cellpadding="7" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr style="background-color: #c59246e0;">
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
				    			<c:if test="${param.sortTabAge!='games_played asc' and param.sortTabAge != 'games_played desc'}">
				    				<th onClick="clickToSortTabAge('games_played desc')"style="width:50px; cursor:pointer;">경기수</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'games_played desc'}">
				    				<th onClick="clickToSortTabAge('games_played asc')"style="width:50px; cursor:pointer;">경기수 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'games_played asc'}">
				    				<th onClick="clickToSortTabAge('')"style="width:50px; cursor:pointer;">경기수 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge!='wins asc' and param.sortTabAge != 'wins desc'}">
				    				<th onClick="clickToSortTabAge('wins desc')"style="width:50px; cursor:pointer;">승</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'wins desc'}">
				    				<th onClick="clickToSortTabAge('wins asc')"style="width:50px; cursor:pointer;">승 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge =='wins asc'}">
				    				<th onClick="clickToSortTabAge('')"style="width:50px; cursor:pointer;">승 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge!='draws asc' and param.sortTabAge != 'draws desc'}">
				    				<th onClick="clickToSortTabAge('draws desc')"style="width:50px; cursor:pointer;">무</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'draws desc'}">
				    				<th onClick="clickToSortTabAge('draws asc')"style="width:50px; cursor:pointer;">무 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge =='draws asc'}">
				    				<th onClick="clickToSortTabAge('')"style="width:50px; cursor:pointer;">무 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge!='losses asc' and param.sortTabAge != 'losses desc'}">
				    				<th onClick="clickToSortTabAge('losses desc')"style="width:50px; cursor:pointer;">패</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'losses desc'}">
				    				<th onClick="clickToSortTabAge('losses asc')"style="width:50px; cursor:pointer;">패 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge =='losses asc'}">
				    				<th onClick="clickToSortTabAge('')"style="width:50px; cursor:pointer;">패 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge!='goals_for asc' and param.sortTabAge != 'goals_for desc'}">
				    				<th onClick="clickToSortTabAge('goals_for desc')"style="width:50px; cursor:pointer;">득점</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'goals_for desc'}">
				    				<th onClick="clickToSortTabAge('goals_for asc')"style="width:50px; cursor:pointer;">득점 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge =='goals_for asc'}">
				    				<th onClick="clickToSortTabAge('')"style="width:50px; cursor:pointer;">득점 △</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge!='goals_assist asc' and param.sortTabAge != 'goals_assist desc'}">
				    				<th onClick="clickToSortTabAge('goals_assist desc')"style="width:50px; cursor:pointer;">도움</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge == 'goals_assist desc'}">
				    				<th onClick="clickToSortTabAge('goals_assist asc')"style="width:50px; cursor:pointer;">도움 ▽</th>
				    			</c:if>
				    			<c:if test="${param.sortTabAge =='goals_assist asc'}">
				    				<th onClick="clickToSortTabAge('')"style="width:50px; cursor:pointer;">도움 △</th>
				    			</c:if>
				    		</tr>
			    			<c:forEach var="recordsRankingTabAge" items="${requestScope.recordsRankingTabAge}" varStatus="status">
								<tr class="recordsRankingTabAge" style="border-bottom: 1px solid #c59246e0;">
									<td align="center">${status.count}</td>
									<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
									<td align="center">${recordsRankingTabAge.nickname}</td>
									<td align="center">${recordsRankingTabAge.games_played}</td>
									<td align="center">${recordsRankingTabAge.wins}</td>
									<td align="center">${recordsRankingTabAge.draws}</td>
									<td align="center">${recordsRankingTabAge.losses}</td>
									<td align="center">${recordsRankingTabAge.goals_for}</td>
									<td align="center">${recordsRankingTabAge.goals_assist}</td>
								</tr>
							</c:forEach>
				    	</table>
				    	<c:if test="${empty requestScope.recordsRankingTabAge}">
							<tr class="recordsRankingTabAge" style="border-bottom: 1px solid #c59246e0;">
								<br>
								<center>조건에 맞는 검색 결과가 없습니다.</center>
							</tr>
						</c:if>
				    </div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>