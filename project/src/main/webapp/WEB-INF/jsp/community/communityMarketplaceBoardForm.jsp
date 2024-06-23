<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityMarketplaceBoardForm</title>

<link href="/style/community/communityMarketplaceBoardFormStyle.css" rel="stylesheet">

<!-- 이전 경로에 js 파일이 없어 주석처리.
<script src="/js/community/communityMarketplaceBoardFormScript.js"></script>
-->

<script>
   // jsp 페이지 탭명 수정시 아래 상수값들도 동일하게 바꾼다.
   const TAB_ALL = "전체";
   const TAB_SALE= "팝니다";
   const TAB_FREE_SHARING = "무료나눔";
   
   // 현재 어떤 탭을 선택되었는지 구분하기 위해 사용하는 변수.
   var tabType = TAB_ALL;
   
   // 탭 마다 페이지 번호 저장하는 변수.
   var tabAllPage = 1;
   var tabSalePage = 1;
   var tabFreeSharing = 1;
   
   // form 태그
   var searchForm;   
   var formSelectPageNo;
   
   $(function() {
      
      searchForm = $("[name='boardSearchForm']");
      formSelectPageNo = searchForm.find(".selectPageNo");
      
      $('.communityMarketplaceCategoryTabNav a').click(function() {
         
         $('.communityMarketplaceCategoryTabContent > div').hide().filter(this.hash).fadeIn();
         $('.communityMarketplaceCategoryTabNav a').removeClass('active');
         $(this).addClass('active');         
         
         var tabText = $(this).text().trim();
         
         if (tabText === TAB_ALL) {
            tabType = TAB_ALL;
            $('#tabAll').show().fadeIn();
         }
         else if (tabText === TAB_SALE) {
            tabType = TAB_SALE;
            $('#tabSale').show().fadeIn();
         }
         else if (tabText === TAB_FREE_SHARING) {
            tabType = TAB_FREE_SHARING;
            $('#tabFreeSharing').show().fadeIn();            
         }
         
         return false;
      }).filter(':eq(0)').click();
      
   });   

   function newCommunityMarketplaceSaleBoardFormBtnClick() {
      
       var sessionMid = '<%= session.getAttribute("mid") %>'
   
       if (sessionMid === 'null') {
          alert('로그인이 필요한 서비스입니다.');
          location.href = '/loginForm.do';
       } else {
          location.href = '/newCommunityMarketplaceSaleBoardForm.do';
       }
   }
   
   function newCommunityMarketplaceFreeSharingBoardFormBtnClick() {
	      
       var sessionMid = '<%= session.getAttribute("mid") %>'
   
       if (sessionMid === 'null') {
          alert('로그인이 필요한 서비스입니다.');
          location.href = '/loginForm.do';
       } else {
          location.href = '/newCommunityMarketplaceFreeSharingBoarForm.do';
       }
   }
   
   function insertHiddenValue() {
      
      var formTabType = searchForm.find(".tabType");
      var formKeyword1 = searchForm.find(".keyword1");
      var formSearchType1 = searchForm.find(".searchType1");
            
      formTabType.val(tabType);

      if (tabType == TAB_ALL) {         
         var tagTab = $("#tabAll");         
         var searchType1 = tagTab.find("[name='searchType1']").val();
         var keyword1 = tagTab.find("[name='keyword1']").val();
         
         formKeyword1.val(keyword1);
         formSearchType1.val(searchType1);         
         formSelectPageNo.val(tabAllPage);
      }
      else if (tabType == TAB_SALE) {         
         var tagTab = $("#tabSale");
         var searchType1 = tagTab.find("[name='searchType1']").val();
         var keyword1 = tagTab.find("[name='keyword1']").val();
         
         formKeyword1.val(keyword1);
         formSearchType1.val(searchType1);         
         formSelectPageNo.val(tabSalePage);
      }
      else if (tabType == TAB_FREE_SHARING) {
         var tagTab = $("#tabFreeSharing");
         var searchType1 = tagTab.find("[name='searchType1']").val();
         var keyword1 = tagTab.find("[name='keyword1']").val();
         
         formKeyword1.val(keyword1);
         formSearchType1.val(searchType1);         
         formSelectPageNo.val(tabFreeSharing);
      }
   }
   
   function search() {
      
      insertHiddenValue();
      
      $.ajax({            
              url       : "/communityMarketplaceBoardForm.do"
            , type       : "post"
            , data       : searchForm.serialize()
            , success    : function(responseHtml) { ajaxSuccess(responseHtml); }
            , error    : function( )          { ajaxError( ); }
      });
   }
   
   function pageNoClick(clickPageNo) {   
      if (tabType == TAB_ALL) {
         tabAllPage = clickPageNo;
      }
      else if (tabType == TAB_SALE) {
         tabSalePage = clickPageNo;
      }
      else if (tabType == TAB_FREE_SHARING) {
         tabFreeSharing = clickPageNo;
      }

      search();
   }
   
   function ajaxSuccess(responseHtml) {
      
      var obj = $(responseHtml);
      
      var formKeyword1 = searchForm.find(".keyword1");
      var formSearchType1 = searchForm.find(".searchType1");
      
      if (tabType == TAB_ALL) {
         $("#allBoardDiv").html(obj.find("#allBoardDiv").html());
         $("#allPagingsDiv").html(obj.find("#allPagingsDiv").html());
         
         // 검색 조건 초기화 되어 hidden 값을 이용해 설정
         var tagTab = $("#tabAll");         
         tagTab.find("[name='searchType1']").val( formSearchType1.val() );
         tagTab.find("[name='keyword1']").val( formKeyword1.val() );
      }
      else if (tabType == TAB_SALE) {
         $("#saleBoardDiv").html(obj.find("#saleBoardDiv").html());
         $("#salePagingsDiv").html(obj.find("#salePagingsDiv").html());

         // 검색 조건 초기화 되어 hidden 값을 이용해 설정
         var tagTab = $("#tabSale");         
         tagTab.find("[name='searchType1']").val( formSearchType1.val() );
         tagTab.find("[name='keyword1']").val( formKeyword1.val() );      
      }
      else if (tabType == TAB_FREE_SHARING) {
         $("#freeSharingBoardDiv").html(obj.find("#freeSharingBoardDiv").html());
         $("#freeSharingPagingsDiv").html(obj.find("#freeSharingPagingsDiv").html());

         // 검색 조건 초기화 되어 hidden 값을 이용해 설정
         var tagTab = $("#tabFreeSharing");         
         tagTab.find("[name='searchType1']").val( formSearchType1.val() );
         tagTab.find("[name='keyword1']").val( formKeyword1.val() );      
      }
   }
   
   function ajaxError() {
      alert("ajaxError : " + searchForm.serialize());
   }
   
   function submitMarketplaceDetailForm(b_no, table_name) {
      
      $("[name='marketplaceDetailForm']").find("[name='b_no']").val( b_no );
      $("[name='marketplaceDetailForm']").find("[name='table_name']").val( table_name );
      document.marketplaceDetailForm.submit();
   }
   
   
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="communityMarketplaceBoardFormTitle">
		<p class="titleBackgoundText">장터</p>
    </div>    
   
   <form name="boardSearchForm" onsubmit="return false;">
      <input type="hidden" name="tabType" class="tabType" value=""> 
      <input type="hidden" name="keyword1" class="keyword1" value="">
      <input type="hidden" name="searchType1" class="searchType1" value="">
      
      <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
      <input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="8" >
   </form>
   
   <form name="marketplaceDetailForm" action="/communityMarketplaceDetailForm.do" method="post">
      <input type="hidden" name="b_no" value="12345" >
      <input type="hidden" name="table_name" >
   </form>
   
   <!-- [카테고리] 탭 -->
   <div class="communityMarketplaceCategoryTab">
       <ul class="communityMarketplaceCategoryTabNav">
          <li><a href="#communityMarketplaceCategoryTabAll">전체</a></li>
          <li><a href="#communityMarketplaceCategoryTabSell">팝니다</a></li>
          <li><a href="#communityMarketplaceCategoryTabSharing">무료나눔</a></li>
       </ul>   
         
         <!-- [탭] 콘텐츠 -->
         <div class="communityMarketplaceCategoryTabContent">            
            
            
            <div id="tabAll">
             <div class="communityMarketplaceFAQContainer">
               <div class="communityMarketplaceSearch">
					<div class="searchSelectBox">
						<select name="searchType1" class="searchSelect">
							<option value="all">전체</option>
							<option value="writer">글작성자</option> 
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
						</select> 
					</div>
					<input type="text" name="keyword1" placeholder=" 검색어를 입력하세요" class="keyword1" >
					<input type="button" value="    검색    " class="searchBtn" onclick="search()">          
				</div>
				<div class="communityMarketplaceFormTopContents">
					<span class="communityMarketplaceFormFontLightGray" id="communityMarketplaceAllCount">Total. ${requestScope.tabAllMarketplaceBoardListAllCnt}개</span>
				</div>
               
                 <div id="allBoardDiv" class="communityMarketplaceBoardFormContainer">
                  <c:forEach var="board" items="${requestScope.tabAllMarketplaceBoardList}" varStatus="status">
                     <div style="cursor: pointer;" class="communityMarketplaceBoardFormBoard" onClick="submitMarketplaceDetailForm('${ board.b_no }', '${ board.table_name }');">
                        <c:if test="${board.imagename != null}">
							<div class="communityMarketplaceBoardImageDiv">
								<img src="/image/marketPlaceImg/${board.imagename}" class="communityMarketplaceBoardImage">
							</div>
						</c:if>
						<c:if test="${board.imagename == null}">
							<div class="communityMarketplaceBoardImageDiv">
								<img src="/image/noImage.png" class="communityMarketplaceBoardImage" style="width:250px; height:200px;">
							</div>
						</c:if>
                        <div class="communityMarketplaceBoardSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.subject}</div>
                        <div class="communityMarketplaceBoardWriter" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.nickname}</div>
                        <div class="communityMarketplaceBoardRegDate" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.reg_date}</div>
                        <div class="communityMarketplaceBoardReadcount" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.readcount}</div>
                     </div>
                  </c:forEach>
               </div>               
             </div>
             <div class="communityMarketplaceAllPaingsDiv">
					<span id="allPagingsDiv" class="pagingNos">
						<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.tabAllMarketplaceBoardPageMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
						<c:forEach var="pageNo" begin="${requestScope.tabAllMarketplaceBoardPageMap.begin_pageNo}" end="${requestScope.tabAllMarketplaceBoardPageMap.end_pageNo}">
							<c:if test="${requestScope.tabAllMarketplaceBoardPageMap.selectPageNo==pageNo}">
					            <p class="activePageNo">${pageNo}</p>
					        </c:if>
							<c:if test="${requestScope.tabAllMarketplaceBoardPageMap.selectPageNo!=pageNo}">
								<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
							</c:if>
						</c:forEach>
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.tabAllMarketplaceBoardPageMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
						<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
					</span>
				</div>
				<%@ include file="/WEB-INF/jsp/footer.jsp" %>
         </div>   
    
         <div id="tabSale">
            <div class="communityMarketplaceQnAFormContainer">
            	<div class="communityMarketplaceSearch">
					<div class="searchSelectBox">
						<select name="searchType1" class="searchSelect">
							<option value="all">전체</option>
							<option value="writer">글작성자</option> 
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
						</select> 
					</div>
					<input type="text" name="keyword1" placeholder=" 검색어를 입력하세요" class="keyword1" >
					<input type="button" value="    검색    " class="searchBtn" onclick="search()">          
				</div>        
				<div class="communityMarketplaceFormTopContents">
					<span class="communityMarketplaceFormFontLightGray" id="communityMarketplaceAllCount">Total. ${ requestScope.tabSaleMarketplaceBoardListAllCnt }개</span>
				</div>
         
                 <div id="saleBoardDiv" class="communityMarketplaceBoardFormContainer">
                  <c:forEach var="board" items="${requestScope.tabSaleMarketplaceBoardList}" varStatus="status">
                     
                     <div style="cursor: pointer;" class="communityMarketplaceBoardFormBoard" onClick="submitMarketplaceDetailForm('${ board.b_no }', '${ board.table_name }');">
                        <c:if test="${board.imagename != null}">
							<div class="communityMarketplaceBoardImageDiv">
								<img src="/image/marketPlaceImg/${board.imagename}" class="communityMarketplaceBoardImage">
							</div>
						</c:if>
						<c:if test="${board.imagename == null}">
							<div class="communityMarketplaceBoardImageDiv">
								<img src="/image/noImage.png" class="communityMarketplaceBoardImage" style="width:250px; height:200px;">
							</div>
						</c:if>
                        <div class="communityMarketplaceBoardSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.subject}</div>
                        <div class="communityMarketplaceBoardWriter" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.nickname}</div>
                        <div class="communityMarketplaceBoardRegDate" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.reg_date}</div>
                        <div class="communityMarketplaceBoardReadcount" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.readcount}</div>
                     </div>
                  </c:forEach>
               </div>
                 <!-- end. container -->
            </div>  
            <div class="newCommunityMarketplaceSaleBoardFormBtnDiv">
                 <input type="button" class="newCommunityMarketplaceSaleBoardFormBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceSaleBoardFormBtnClick();">
              </div>
             <div class="communityMarketplaceSalePaingsDiv">
					<span id="salePagingsDiv" class="pagingNos">
						<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
						<c:forEach var="pageNo" begin="${requestScope.tabSaleMarketplaceBoardPageMap.begin_pageNo}" end="${requestScope.tabSaleMarketplaceBoardPageMap.end_pageNo}">
							<c:if test="${requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo==pageNo}">
					            <p class="activePageNo">${pageNo}</p>
					        </c:if>
							<c:if test="${requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo!=pageNo}">
								<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
							</c:if>
						</c:forEach>
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
						<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
					</span>
				</div> 
				<%@ include file="/WEB-INF/jsp/footer.jsp" %>
         </div>
         
         <div id="tabFreeSharing">
            <div class="communityMarketplaceQnAFormContainer">
         
               <div class="communityMarketplaceSearch">
					<div class="searchSelectBox">
						<select name="searchType1" class="searchSelect">
							<option value="all">전체</option>
							<option value="writer">글작성자</option> 
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
						</select> 
					</div>
					<input type="text" name="keyword1" placeholder=" 검색어를 입력하세요" class="keyword1" >
					<input type="button" value="    검색    " class="searchBtn" onclick="search()">          
				</div>   
               
               <div class="communityMarketplaceFormTopContents">
					<span class="communityMarketplaceFormFontLightGray" id="communityMarketplaceAllCount">Total. ${ requestScope.tabFreeSharingMarketplaceBoardListAllCnt }개</span>
				</div>
                 <div id="freeSharingBoardDiv" class="communityMarketplaceBoardFormContainer">
                  <c:forEach var="board" items="${requestScope.tabFreeSharingMarketplaceBoardList}" varStatus="status">
                     <div style="cursor: pointer;" class="communityMarketplaceBoardFormBoard" onClick="submitMarketplaceDetailForm('${ board.b_no }', '${ board.table_name }');">
                        <c:if test="${board.imagename != null}">
							<div class="communityMarketplaceBoardImageDiv">
								<img src="/image/marketPlaceImg/${board.imagename}" class="communityMarketplaceBoardImage">
							</div>
						</c:if>
						<c:if test="${board.imagename == null}">
							<div class="communityMarketplaceBoardImageDiv">
								<img src="/image/noImage.png" class="communityMarketplaceBoardImage" style="width:250px; height:200px;">
							</div>
						</c:if>
                        <div class="communityMarketplaceBoardSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.subject}</div>
                        <div class="communityMarketplaceBoardWriter" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.nickname}</div>
                        <div class="communityMarketplaceBoardRegDate" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.reg_date}</div>
                        <div class="communityMarketplaceBoardReadcount" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.readcount}</div>
                     </div>
                  </c:forEach>             
               </div>
                 <!-- end. container -->
               
            </div>   
            <div class="newCommunityMarketplaceFreeSharingBoardFormBtnDiv">
                  <input type="button" class="newCommunityMarketplaceFreeSharingBoardFormBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceFreeSharingBoardFormBtnClick();">
               </div>
               <div class="communityMarketplaceFreeSharingPaingsDiv">
					<span id="freeSharingPagingsDiv" class="pagingNos">
						<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
						<c:forEach var="pageNo" begin="${requestScope.tabFreeSharingMarketplaceBoardPageMap.begin_pageNo}" end="${requestScope.tabFreeSharingMarketplaceBoardPageMap.end_pageNo}">
							<c:if test="${requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo==pageNo}">
					            <p class="activePageNo">${pageNo}</p>
					        </c:if>
							<c:if test="${requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo!=pageNo}">
								<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
							</c:if>
						</c:forEach>
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
						<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
					</span>
				</div>
				<%@ include file="/WEB-INF/jsp/footer.jsp" %> 
         </div>
         
      
      </div>   <!-- 끝. [탭] 콘텐츠 -->
    
   </div>   <!-- 끝. [카테고리] 탭 -->
   
</body>
</html>