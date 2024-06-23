<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitLessonBoardForm</title>
<link href="/style/recruitLessonBoardFormStyle.css" rel="stylesheet">
<link href="/style/sub.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
<script src="/js/common.js"></script>
<script>

//페이징처리_기본값10개로설정
$(document).ready(function() {
  $(".rowCntPerPage").val("10");
});


//페이징처리
function search() {
	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='recruit_lesson']");

  boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
	
	
	//값 들어오는지 확인
  //alert(boardSearchFormObj.serialize());


	//이거있어야함
	$.ajax({
				//--------------------------------------------
				// WAS 로 접속할 주소 설정
				//--------------------------------------------
				url : "/recruitLessonBoardForm.do"
				//--------------------------------------------
				// WAS 로 접속하는 방법 설정. get 또는 post
				//--------------------------------------------
				,
				type : "post"

				,
				data : boardSearchFormObj.serialize()

				,
				success : function(responseHtml) {

					var obj = $(responseHtml);


					//해당하는 페이지의 내용으로 덮어씌워라
					$(".recruitLessonBoard").html(obj.find(".recruitLessonBoard").html());
					
					

					//번호를 눌렀을 때 해당하는 페이지의 내용을 가지고 와라
					$(".pagingNos").html(obj.find(".pagingNos").html());
					


				}

				,
				error : function() {

					alert("검색 실패! 관리자에게 문의 바랍니다.");
				}

			});

}

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//[페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
//쪼개서 보여주기.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function pageNoClick(clickPageNo) {
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='recruit_lesson']").find(".selectPageNo").val(clickPageNo)

	search()

}

//엔터키작동
function enterkey()
{
   
   if(window.event.keyCode == 13)
   {
      search();
   }
}

/* //검색
function search() {

   //---------------------------------------------
   // 변수 boardSearchFormObj 선언하고 
   // name='recruit_lesson' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
   //---------------------------------------------
   var boardSearchFormObj = $("[name='recruit_lesson']");

   var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

   var keyword1 = keyword1Obj.val();
     
   if(typeof(keyword1)!='string' ){keyword1=""; }
    
    keyword1 = $.trim(keyword1);
    
    
   $.ajax({
      //-------------------------------
      // WAS 로 접속할 주소 설정
      //-------------------------------
      url : "/recruitLessonBoardForm.do"
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

         $(".recruitLessonBoard").html(obj.find(".recruitLessonBoard").html());
			
      }

      ,
      error : function() {

         alert("검색 실패! 관리자에게 문의 바랍니다.");
      }

   });
} */
   
	function searchAll(){
		
		var boardSearchFormObj = $("[name='recruit_lesson']");
		
		boardSearchFormObj.find("input[type=text]").val("");
	    boardSearchFormObj.find(".sido").val("0");
	    boardSearchFormObj.find(".sigungu").val("0");
	    boardSearchFormObj.find(".sigungu").empty();
	       boardSearchFormObj.find(".sigungu").append('<option value="0">군/구 선택</option>');
	    boardSearchFormObj.find("input[type=checkbox]").prop("checked", false);
	    boardSearchFormObj.find(".rowCntPerPage").val("10");
	    boardSearchFormObj.find(".SelectPageNo").val("1");
	
	    search();
	}
 

   function goRecruitLessonDetailForm(recruitment_no)
   {
      $("[name='recruitLessonBoardDetailForm'] [name='recruitment_no']").val(recruitment_no); 
      document.recruitLessonBoardDetailForm.submit();
   }

   
   function checkReserveForm() {

	   
	   var sessionMid = '<%=session.getAttribute("mid")%>';

	   if (sessionMid == "" || sessionMid == 'null') {
	       alert('로그인이 필요한 서비스입니다.');
	       location.href = '/loginForm.do';
	       return;
	   }
		else
		{
			location.href='/newRecruitLessonBoardForm.do'
		}
	   
   }
   
   //레슨페이지 sort 관련 함수
   function searchWithSort(sort)
   {
   	$("[name='recruit_lesson']").find("[name='sort_date']").val(sort);
   	search();
   	
   }
   
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitLessonBoardFormTitle">
       <p class="titleBackgoundText">레슨 모집</p>
    </div>
    <br>
   <div>
   <!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
		<form name="recruit_lesson" onsubmit="return false">
			<table align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
					<tr style="border-radius: 15px;">
						<td style="border-radius: 15px;">
							<table style="border-collapse: collapse; border-bottom: none; border-radius: 15px;" align="center">
								<tr class="area">
									<th class="item" style="border-radius: 10px; border-bottom: none;">지역</th>
									<td class="content" colspan="5" style="text-align: center; width:200px; border-bottom: none;"><select name="sido" class="sido" id=""
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
						    <th class="item" style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">요일</th>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="allweekday" id="workweekcdGroupA" onClick="setweekgroup1()" style="zoom:2.0; margin-right: 5px;">
						            평일(월, 화, 수, 목, 금)
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="allweekday" id="workweekcdGroupB" onClick="setweekgroup2()" style="zoom:2.0; margin-right: 5px;">
						            주말(토, 일)
						        </label>
						    </td>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="1" id="day1" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            월
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="2" id="day2" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            화
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="3" id="day3" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            수
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="4" id="day4" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            목 
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="5" id="day5" onClick="setweekDay()" style="zoom:2.0; margin-right: 5px;">
						            금
						        </label>
						    </td>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="day" value="6" id="day6" onClick="setweekEnd()" style="zoom:2.0; margin-right: 5px;">
						            토
						        </label>
						        <label style="display: flex; align-items: center;">
						            <input type="checkbox" name="day" value="7" id="day7" onClick="setweekEnd()" style="zoom:2.0; margin-right: 5px;">
						            일
						        </label>
						    </td>
						    <td class="content" style="text-align: left; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center;">
						            <input type="checkbox" name="day" value="0" id="day0" onClick="allday()" style="zoom:2.0; margin-right: 5px;">
						            상관없음
						        </label>
						    </td>
						</tr>
						<tr><td style="border-bottom: none;"></td></tr>
						<tr class="time">
						    <th class="item" style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">시간</th>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; justify-content: center; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="morning" onClick="timeset()" value="새벽" style="zoom:2.0; margin-right: 5px;">
						            새벽
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="am" onClick="timeset()" value="오전" style="zoom:2.0; margin-right: 5px;">
						            오전
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="pm" onClick="timeset()" value="오후" style="zoom:2.0; margin-right: 5px;">
						            오후
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="night" onClick="timeset()" value="야간" style="zoom:2.0; margin-right: 5px;">
						            야간
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="time" id="everytime" onClick="everyset()" value="상관없음" style="zoom:2.0; margin-right: 5px;">
						            상관없음
						        </label>
						    </td>
						</tr>
						<tr><td style="border-bottom: none;"></td></tr>
						<tr class="money">
						    <th class="item" style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">비용</th>
						    <td class="content" style="text-align: center; border-bottom: none; display: flex; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="money" id="free" onClick="moneycheck()" value="무료" style="zoom:2.0; margin-right: 5px;">
						            무료
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="money" id="paid" onClick="moneycheck()" value="유료" style="zoom:2.0; margin-right: 5px;">
						            유료
						        </label>
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="money" id="nomatter" onClick="everymoney()" value="상관없음" style="zoom:2.0; margin-right: 5px;">
						            상관없음
						        </label>
						    </td>
						</tr>
								
							</table>
						<div class="search">
							<div class="content">
								<select name="searchType1" class="searchSelect">
									<option value="all">전체</option>
									<option value="nickname">글작성자</option> 
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select> 
							</div>
							<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()">
							<input type="button" value="검색" class="item" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;">
							<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">   
						</div>
					</tr>
				</table>
			<!-- 페이징처리관련 밑에두줄-->
			<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			<input type="hidden" name="selectPageNo" class="selectPageNo"  value="1">
			<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			<input type="hidden" name="sort_date">
			<!-- 위에 한 줄은 sort 관련 -->
			
			
	 	</form>
		
  <!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->		

      <div class="recruitLessonBoard">
         <table class="boardListTable" cellpadding="7" align="center" style="border-collapse:collapse;">
            <tr>
               <th style="width:50px;">번호</th>
               <th style="width:300px;">제목</th>
               <th style="width:80px;">글쓴이</th>
               <th style="width:100px;">조회수</th>
			   <c:if test="${param.sort_date!='reg_date asc' and param.sort_date!='reg_date desc'}">
					<th width="100" onClick="searchWithSort('reg_date desc')" style="cursor:pointer">등록일</th>
					</c:if>
					<!--============================================================= -->
					<!-- 만약 파명 "sort" 의 파값이 'reg_date desc' 면 -->
					<!-- 즉 정렬 의지가 'reg_date desc' 면             -->
					<!--============================================================= -->
					<c:if test="${param.sort_date=='reg_date desc'}">
						<th width="100" onClick="searchWithSort('reg_date asc')" style="cursor:pointer">등록일▼</th>
					</c:if>	
					<!--============================================================= -->
					<!-- 만약 파명 "sort" 의 파값이 'reg_date asc' 면 -->
					<!-- 즉 정렬 의지가 'reg_date asc' 면             -->
					<!--============================================================= -->
					<c:if test="${param.sort_date=='reg_date asc'}">	
						<th width="100" onClick="searchWithSort('')" style="cursor:pointer">등록일▲</th>
					</c:if>
			 </tr>		
               <c:forEach var="list" items="${requestScope.boardList}" varStatus="status">
                  <tr style="cursor:pointer" onClick=" goRecruitLessonDetailForm(${list.recruitment_no});">
					 <td align="center" class="recruitLessonBoardFormFontLightGray">${requestScope.lessonMap.begin_serialNo_desc - status.index}</td>
                     <td align="center">${list.title}</td>
                     <td align="center" class="recruitLessonBoardFormFontLightGray">${list.nickname}</td>
                     <td align="center" class="recruitLessonBoardFormFontLightGray">${list.readcount}</td>
                     <td align="center" class="recruitLessonBoardFormFontLightGray">${list.reg_date}</td>
                  </tr>
               </c:forEach>
                  
               
         </table>
         <c:if test="${empty requestScope.boardList}">
                  <center>
                  <br><br><br><br>
                  <b>조건에 맞는 결과물이 없습니다.</b>
                  </center>
            </c:if>
      </div>
   </div>
   <div class="newRecruitLessonBoardBtnDiv">
		<input type="button" class="newRecruitLessonBoardBtn"
			value="새 글 쓰기"
			onClick="checkReserveForm();">
	</div>
	<div class="recruitLessonBoardPaging">
		<span class="pagingNos">
			<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.lessonMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
			<c:forEach var="pageNo" begin="${requestScope.lessonMap.begin_pageNo}" end="${requestScope.lessonMap.end_pageNo}">
				<c:if test="${requestScope.lessonMap.selectPageNo==pageNo}">
		            <p class="activePageNo">${pageNo}</p>
		        </c:if>
				<c:if test="${requestScope.lessonMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.lessonMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
			<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
		</span>
	</div>
      <form name="recruitLessonBoardDetailForm" action="/recruitLessonBoardDetailForm.do" method="post">
         <!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
         <input type="hidden" name="recruitment_no">
      </form>        
     <%@ include file="/WEB-INF/jsp/footer.jsp" %>
      
</body>
</html>