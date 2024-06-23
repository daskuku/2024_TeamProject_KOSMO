<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MatchingForm</title>
<link href="/style/matchingFormStyle.css" rel="stylesheet">
<script src="/js/matchingFormScript.js"></script>
<script src="/js/common.js"></script>

<script>

	
	//로그인을 하지 않고 글을 쓰려고 하면 로그인창으로 돌려보냄
	function checkLogin() 
	{
	   
	   var sessionMid = '<%=session.getAttribute("mid")%>';
	
	   if (sessionMid == "" || sessionMid == 'null') {
	       alert('로그인이 필요한 서비스입니다.');
	       location.href = '/loginForm.do';
	       return;
	   }
   		// 주석
   		// 경기장 대관 확인
		var formObj = $("[name='newMatchingBoard']");
		var m_no = '${sessionScope.m_no}';

	    $.ajax({
	        url: '/machingStadiumSelectBoxLoad.do',
	        method: 'POST',
	        data: 'm_no=' + m_no,
	        success: function(json) {
	        	if (json[0] == null) {
	        		alert("경기장 대관을 먼저 해주어야 합니다.");
	        		return; 
				}
	        	else
	        	{
	        		document.newMatching.submit();
	        	}
	        	
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });
	}
	
	
	
	//검색
	function search() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='matching_table']");

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

		var keyword1 = keyword1Obj.val();
		  
		if(typeof(keyword1)!='string' ){keyword1=""; }
	    
	    keyword1 = $.trim(keyword1);
	    
		$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/matchingForm.do"
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

				$(".matchingFormBoard").html(obj.filter(".matchingFormBoard").html());
				$(".pagingNos").html(obj.find(".pagingNos").html());

			}

			,
			error : function() {

				alert("검색 실패! 관리자에게 문의 바랍니다.");
			}

		});

	}
	
	//엔터기로 검색 가능하게
	function enterkey()
	{
		
		if(window.event.keyCode == 13)
		{
			search();
		}
	}
	
	//게시물 상세보기페이지 넘어가기
	function goMatchDetail(match_no)
	{
		 var sessionMid = '<%=session.getAttribute("mid")%>';
			
		   if (sessionMid == "" || sessionMid == 'null') {
		       alert('로그인이 필요한 서비스입니다.');
		       location.href = '/loginForm.do';
		       return;
		   }
		
		$("[name='matchingDetail'] [name='match_no']").val(match_no); 
		document.matchingDetail.submit();
	}
	
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function pageNoClick( clickPageNo ){
		//alert(clickPageNo);
		//---------------------------------------------
		// name='selectPageNo' 를 가진 태그의 value 값에 
		// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
		// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
		// value 값에 [클릭한 페이지 번호]를 저장하기
		//---------------------------------------------
		 $("[name='matching_table']").find(".selectPageNo").val(clickPageNo);
		//---------------------------------------------
		// search 함수 호출하기
		//---------------------------------------------
		search();
	}
	
	function searchAll() {
        var boardSearchFormObj = $("[name='matching_table']");

        boardSearchFormObj.find("input[type=text]").val("");
        boardSearchFormObj.find(".sido").val("0");
        boardSearchFormObj.find(".sigungu").val("0");
        boardSearchFormObj.find("#date").val("");
        boardSearchFormObj.find("#matchingTime").val("0");
        boardSearchFormObj.find(".rowCntPerPage").val("10");
        boardSearchFormObj.find(".SelectPageNo").val("1");

        search();
    }
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="matchingFormTitle">
    	<p class="titleBackgoundText">매칭 찾기</p>
    </div>
   		<form name="matching_table" onsubmit="return false">
   			<table align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
					<tr>
						<td>
							<table style="border-collapse: collapse; border-bottom: none; text-align: center;" align="center">
								<tr class="area" style="text-align: center;">
									<th class="item" style="border-radius: 10px; border-bottom: none;">지역</th>
									<td class="content" colspan="5" style="justify-content: center; text-align: center; width:620px; border-bottom: none;"><select name="sido" class="sido" id=""
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
									</select> <select name="sigungu" class="sigungu" id="state" style="width:200px; text-align: center;">
											<option value="0">군/구 선택</option>
									</select></td>
								</tr>
								<tr><td style="border-bottom: none;"></td></tr>
								<tr class="day">
									<th class="item" style="border-radius: 10px; border-bottom: none;">날짜</th>
									<td class="content" colspan="5" style="justify-content: center; text-align: center; width:620px; border-bottom: none;">
										<input type="date" id="date" name="date">
									</td>
								</tr>
								<tr><td style="border-bottom: none;"></td></tr>
								<tr class="time">
	  								<th class="item" style="border-radius: 10px; border-bottom: none;">시간</th>
	  								<td class="content" colspan="5" style="justify-content: center; text-align: center; width:620px; border-bottom: none;">
	  									<select name="matchingTime" id="matchingTime" >
							              	<option value="0">시간 선택</option>
											<option value="1">AM06시~AM08시</option>
											<option value="2">AM08시~AM10시</option>
											<option value="3">AM10시~AM12시</option>
											<option value="4">PM12시~PM14시</option>
											<option value="5">PM14시~PM16시</option>
											<option value="6">PM16시~PM18시</option>
											<option value="7">PM18시~PM20시</option>
											<option value="8">PM20시~PM22시</option>
											<option value="9">PM22시~PM24시</option>
											<option value="10">AM02시~AM04시</option>
											<option value="11">AM04시~AM06시</option>
						            	</select>
	  								</td>
	  							</tr>
	  						</table>
	  						<div class="search">
								<div class="content">
									<select name="searchType1" class="searchSelect">
										<option value="all">전체</option>
										<option value="writer">글작성자</option> 
										<option value="subject">제목</option>
										<option value="content">내용</option>
									</select> 
								</div>
								<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()">
								<input type="button" value="검색" class="item" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;">
								<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">   
							</div>
						</td>
					</tr>
				</table>
	  			<!-- </dl>
				<dl class="search">
	 				<dt class="item">검 색</dt>
						<dd  class="content">
							<select name="searchType1">
								<option value="all">전체</option>
								<option value="writer">글작성자</option> 
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> 
							<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()"> 
						</dd>
	 			</dl> -->
	 			<!-- <dl class="area">
	 				<dt class="item">지 역</dt>
	 					<dd class="content">	
	 						<select name="sido" id="" onchange="categoryChange(this)">
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
			            	</select>
	
				            <select name="sigungu" id="state">
				              <option value="0">군/구 선택</option>
				            </select>
	 					</dd>
	 			</dl> -->
			<!-- </div>		
			
			<div class="middle">
				<dl class="day">
	  				<dt class="item">날 짜</dt>
	  					<dd class="content">
							<input type="date" id="date" name="date">
	  					</dd>
	  			</dl> -->
	  			<!-- <dl class="time">
	  				<dt class="item">시 간</dt>
	  					<dd class="content">
							<select name="matchingTime" id="" >
				              	<option value="0">시간 선택</option>
								<option value="1">AM06시~AM08시</option>
								<option value="2">AM08시~AM10시</option>
								<option value="3">AM10시~AM12시</option>
								<option value="4">PM12시~PM14시</option>
								<option value="5">PM14시~PM16시</option>
								<option value="6">PM16시~PM18시</option>
								<option value="7">PM18시~PM20시</option>
								<option value="8">PM20시~PM22시</option>
								<option value="9">PM22시~PM24시</option>
								<option value="10">AM02시~AM04시</option>
								<option value="11">AM04시~AM06시</option>
			            	</select>
	  					</dd>
	  			</dl>
			</div>	 -->
			
		<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
		<input type="hidden" name="selectPageNo" class="selectPageNo"  value="1">
		<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			
	 	</form>
   
   
   
   	<!-- 
  		 <br><br>
  		 	<div class="searchBtn">
			<dl class="searchBtn" >
 				<dt class="item" onclick="search()" class="searchBtn" style="cursor:pointer">검색</dt>
 			</dl>
		</div>
  		 <br><br><br> -->
		
		<div class="matchingFormBoard">
			<table class="boardListTable" cellpadding="7" align="center" style="border-collapse:collapse;">
				<tr>
					<th style="width:50px;">번호</th>
					<th style="width:300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">제목</th>
					<th style="width:80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">글쓴이</th>
					<th style="width:100px;">조회수</th>
					<th style="width:100px;">등록일</th>
					<c:forEach var="board" items="${requestScope.boardList}" varStatus="status">
														<!-- 클릭이 발생했을때 생기는 이벤트 -> goMatchDetail 함수 실행 / 매개변수로는 클릭한 게시물의 번호가 들어간다.-->
						<tr style="cursor:pointer" onClick="goMatchDetail(${board.match_no})">
							<td align="center" class="matchingFormFontLightGray">${requestScope.boardMap.begin_serialNo_desc - status.index}</td>
							<c:if test="${board.checking eq '매칭완료'}">
								<td align="center">${board.title}<b>(${board.checking})</b></td>
							</c:if>
							<c:if test="${board.checking eq '매칭대기중'}">
								<td align="center">${board.title}</td>
							</c:if>
							<td align="center" class="matchingFormFontLightGray">${board.nickname}</td>
							<td align="center" class="matchingFormFontLightGray">${board.readcount}</td>
							<td align="center" class="matchingFormFontLightGray">${board.reg_date}</td>
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.boardList}">
				<br>
				<center>
					조건에 맞는 검색 결과가 없습니다. 
				</center>
			</c:if>
		</div>
		<div class="newRecruitTeamMemBoardBtnDiv">
			<c:if test="${requestScope.myInfo.team_master eq sessionScope.m_no or sessionScope.m_no eq null}">
				<input type="button" class="newRecruitTeamBoardBtn" value="새 글 쓰기" onclick="checkLogin()">
			</c:if>
		</div>
		<div class="matchingBoardPaging">
			<span class="pagingNos">
				<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.boardMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
				<c:forEach var="pageNo" begin="${requestScope.boardMap.begin_pageNo}" end="${requestScope.boardMap.end_pageNo}">
					<c:if test="${requestScope.boardMap.selectPageNo==pageNo}">
			            <p class="activePageNo">${pageNo}</p>
			        </c:if>
					<c:if test="${requestScope.boardMap.selectPageNo!=pageNo}">
						<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
					</c:if>
				</c:forEach>
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.boardMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
				<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
			</span>
		</div>
		
		<%-- <span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.boardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.boardMap.begin_pageNo}"
				end="${requestScope.boardMap.end_pageNo}">

				<c:if test="${requestScope.boardMap.selectPageNo==pageNo}">
		            ${pageNo}
		         </c:if>

				<c:if test="${requestScope.boardMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.boardMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.boardMap.last_pageNo})">[마지막]</span>
		</span>  --%>

	
	<!-- 
	action? -> 폼태그안의 값을 보낼 주소를 적는곳
	method? -> 어떠한 방식으로 보낼지 ('get' or 'post')
	name은 당연히 폼태그의 이름
	 -->
	<form action="/matchingDetailForm.do" method="post" name="matchingDetail">
		<!-- 
		폼태그에 있는 액션주소로 넘어갈 값 
		name은 당연히 인풋태그의 이름 + 'match_no' 이름에 value값이 저장되어 갈거임. 
		하지만 지금 이곳에서는 그 값을 설정해주지않고 함수부분에서 어떠한 값을 넘길것인지 설정해줄거임.
		 -->
		<input type="hidden" name="match_no">
		<input type="hidden" name="m_no" value="${sessionScope.m_no}">
	</form>
	
	
	<form action="/newMatchingBoardForm.do" method="post" name="newMatching">
		<input type="hidden" name="m_no" value="${sessionScope.m_no}">
	</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>