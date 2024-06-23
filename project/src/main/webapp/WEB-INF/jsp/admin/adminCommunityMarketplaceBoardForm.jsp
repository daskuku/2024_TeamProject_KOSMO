<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminCommunityMarketplaceBoardForm</title>

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
          location.href = '/adminNewCommunityMarketplaceSaleBoardForm.do';
       }
   }
   
   function newCommunityMarketplaceFreeSharingBoardFormBtnClick() {
	      
       var sessionMid = '<%= session.getAttribute("mid") %>'
   
       if (sessionMid === 'null') {
          alert('로그인이 필요한 서비스입니다.');
          location.href = '/loginForm.do';
       } else {
          location.href = '/adminNewCommunityMarketplaceFreeSharingBoarForm.do';
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
              url       : "/adminMarketplaceBoardForm.do"
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
         $("#allPaingsDiv").html(obj.find("#allPaingsDiv").html());
         
         // 검색 조건 초기화 되어 hidden 값을 이용해 설정
         var tagTab = $("#tabAll");         
         tagTab.find("[name='searchType1']").val( formSearchType1.val() );
         tagTab.find("[name='keyword1']").val( formKeyword1.val() );
      }
      else if (tabType == TAB_SALE) {
         $("#saleBoardDiv").html(obj.find("#saleBoardDiv").html());
         $("#salePaingsDiv").html(obj.find("#salePaingsDiv").html());

         // 검색 조건 초기화 되어 hidden 값을 이용해 설정
         var tagTab = $("#tabSale");         
         tagTab.find("[name='searchType1']").val( formSearchType1.val() );
         tagTab.find("[name='keyword1']").val( formKeyword1.val() );      
      }
      else if (tabType == TAB_FREE_SHARING) {
         $("#freeSharingBoardDiv").html(obj.find("#freeSharingBoardDiv").html());
         $("#freeSharingPaingsDiv").html(obj.find("#freeSharingPaingsDiv").html());

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
     
       <p class="titleBackgoundText">관리자 장터</p>
    </div>    
    
    <%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
      	
   <form name="boardSearchForm" onsubmit="return false;">
      <input type="hidden" name="tabType" class="tabType" value=""> 
      <input type="hidden" name="keyword1" class="keyword1" value="">
      <input type="hidden" name="searchType1" class="searchType1" value="">
      
      <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
      <input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="8" >
   </form>
   
   <form name="marketplaceDetailForm" action="/adminCommunityMarketplaceDetailForm.do" method="post">
      <input type="hidden" name="b_no" value="" >
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
                  <table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
                     <tr>
                        <th>
                           검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
                        </th>
                        <td>
                           <select name="searchType1">
                              <option value="all">전체</option>
                              <option value="writer">글작성자</option> 
                              <option value="subject">제목</option>
                              <option value="content">내용</option>
                              <!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
                           </select> 
                           <input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" >
                           <input type="button" value="    검색    " onclick="search()"> 
                        </td>
                     </tr>
                  </table>               
               </div>
               
                 <div id="allBoardDiv" class="communityMarketplaceBoardFormContainer">
                  <c:forEach var="board" items="${requestScope.tabAllMarketplaceBoardList}" varStatus="status">
                     <div style="cursor: pointer;" class="communityMarketplaceBoardFormBoard" onClick="submitMarketplaceDetailForm('${ board.b_no }', '${ board.table_name }');">
                        <div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
                           <img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">
                        </div>
                        <div class="communityMarketplaceBoardSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.subject}</div>
                        <div class="communityMarketplaceBoardWriter" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.nickname}</div>
                        <div class="communityMarketplaceBoardRegDate">${board.reg_date}</div>
                        <div class="communityMarketplaceBoardReadcount">${board.readcount}</div>
                     </div>
                  </c:forEach>
                  
                  <c:forEach var="empty_row" begin="${ requestScope.tabAllMarketplaceBoardListSize + 1 }" end="${ requestScope.tabAllMarketplaceBoardPageMap.rowCntPerPage }">
                     <div class="communityMarketplaceBoardFormBoard">
                        <div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
                           <!-- <img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">  -->
                        </div>
                        <div class="communityMarketplaceBoardSubject">&nbsp;</div>
                        <div class="communityMarketplaceBoardWriter">&nbsp;</div>
                        <div class="communityMarketplaceBoardRegDate">&nbsp;</div>
                        <div class="communityMarketplaceBoardReadcount">&nbsp;</div>
                     </div>
                  </c:forEach>
                  
                  <span id="allPaingsDiv" class="pagingNos">
                     <span style="cursor:pointer;" onClick="pageNoClick( 1 );">[처음]</span>
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabAllMarketplaceBoardPageMap.selectPageNo } - 1 );">[이전]</span>
                     &nbsp;&nbsp;
                     
                     <c:forEach var="pageNo" begin="${ requestScope.tabAllMarketplaceBoardPageMap.begin_pageNo }" end="${ requestScope.tabAllMarketplaceBoardPageMap.end_pageNo }">
                        <c:if test="${ requestScope.tabAllMarketplaceBoardPageMap.selectPageNo == pageNo }">
                           <span style="cursor:pointer" onClick="pageNoClick(${ pageNo });"><b><u>${ pageNo }</u></b></span>
                        </c:if>
               
                        <c:if test="${ requestScope.tabAllMarketplaceBoardPageMap.selectPageNo != pageNo }">
                           <span style="cursor:pointer" onClick="pageNoClick(${ pageNo });">[${ pageNo }]</span>
                        </c:if>
                     </c:forEach>
                     &nbsp;&nbsp;
                     
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabAllMarketplaceBoardPageMap.selectPageNo } + 1 );">[다음]</span>
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabAllMarketplaceBoardPageMap.last_pageNo } );">[마지막]</span>
                     
                     &nbsp;&nbsp;&nbsp;
                     [${ requestScope.tabAllMarketplaceBoardListCnt } / ${ requestScope.tabAllMarketplaceBoardListAllCnt }] 개
                  </span>
               </div>               
                 <!-- end. container -->
                 
             </div>
         </div>   
    
         <div id="tabSale">
            <div class="communityMarketplaceQnAFormContainer">
         
                 <div class="newCommunityMarketplaceBtnDiv">
                  <input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceSaleBoardFormBtnClick();">
               </div>

               <div class="communityMarketplaceSearch">
                  <table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
                     <tr>
                        <th>
                           검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
                        </th>
                        <td>
                           <select name="searchType1">
                              <option value="all">전체</option>
                              <option value="writer">글작성자</option> 
                              <option value="subject">제목</option>
                              <option value="content">내용</option>
                              <!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
                           </select> 
                           <input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" >
                           <input type="button" value="    검색    " onclick="search()"> 
                        </td>
                     </tr>
                  </table>               
               </div>
               
                 <div id="saleBoardDiv" class="communityMarketplaceBoardFormContainer">
                  <c:forEach var="board" items="${requestScope.tabSaleMarketplaceBoardList}" varStatus="status">
                     
                     <div style="cursor: pointer;" class="communityMarketplaceBoardFormBoard" onClick="submitMarketplaceDetailForm('${ board.b_no }', '${ board.table_name }');">
                        <div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
                           <img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">
                        </div>
                        <div class="communityMarketplaceBoardSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.subject}</div>
                        <div class="communityMarketplaceBoardWriter" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.nickname}</div>
                        <div class="communityMarketplaceBoardRegDate">${board.reg_date}</div>
                        <div class="communityMarketplaceBoardReadcount">${board.readcount}</div>
                     </div>
                  </c:forEach>
                  
                  <c:forEach var="empty_row" begin="${ requestScope.tabSaleMarketplaceBoardListSize + 1 }" end="${ requestScope.tabSaleMarketplaceBoardPageMap.rowCntPerPage }">
                     <div class="communityMarketplaceBoardFormBoard">
                        <div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
                           <!-- <img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">  -->
                        </div>
                        <div class="communityMarketplaceBoardSubject">&nbsp;</div>
                        <div class="communityMarketplaceBoardWriter">&nbsp;</div>
                        <div class="communityMarketplaceBoardRegDate">&nbsp;</div>
                        <div class="communityMarketplaceBoardReadcount">&nbsp;</div>
                     </div>
                  </c:forEach>
                  
                  <span id="salePaingsDiv" class="pagingNos">
                     <span style="cursor:pointer;" onClick="pageNoClick( 1 );">[처음]</span>
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo } - 1 );">[이전]</span>
                     &nbsp;&nbsp;
                     
                     <c:forEach var="pageNo" begin="${ requestScope.tabSaleMarketplaceBoardPageMap.begin_pageNo }" end="${ requestScope.tabSaleMarketplaceBoardPageMap.end_pageNo }">
                        <c:if test="${ requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo == pageNo }">
                           <span style="cursor:pointer" onClick="pageNoClick(${ pageNo });"><b><u>${ pageNo }</u></b></span>
                        </c:if>
               
                        <c:if test="${ requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo != pageNo }">
                           <span style="cursor:pointer" onClick="pageNoClick(${ pageNo });">[${ pageNo }]</span>
                        </c:if>
                     </c:forEach>
                     &nbsp;&nbsp;
                     
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabSaleMarketplaceBoardPageMap.selectPageNo } + 1 );">[다음]</span>
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabSaleMarketplaceBoardPageMap.last_pageNo } );">[마지막]</span>
                     
                     &nbsp;&nbsp;&nbsp;
                     [${ requestScope.tabSaleMarketplaceBoardListCnt } / ${ requestScope.tabSaleMarketplaceBoardListAllCnt }] 개
                  </span>                  
               </div>
                 <!-- end. container -->
               
            </div>   
         </div>
         
         <div id="tabFreeSharing">
            <div class="communityMarketplaceQnAFormContainer">
         
                 <div class="newCommunityMarketplaceBtnDiv">
                  <input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceFreeSharingBoardFormBtnClick();">
               </div>

               <div class="communityMarketplaceSearch">
                  <table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
                     <tr>
                        <th>
                           검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
                        </th>
                        <td>
                           <select name="searchType1">
                              <option value="all">전체</option>
                              <option value="writer">글작성자</option> 
                              <option value="subject">제목</option>
                              <option value="content">내용</option>
                              <!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
                           </select> 
                           <input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" >
                           <input type="button" value="    검색    " onclick="search()"> 
                        </td>
                     </tr>
                  </table>               
               </div>
               
                 <div id="freeSharingBoardDiv" class="communityMarketplaceBoardFormContainer">
                  <c:forEach var="board" items="${requestScope.tabFreeSharingMarketplaceBoardList}" varStatus="status">
                     <div style="cursor: pointer;" class="communityMarketplaceBoardFormBoard" onClick="submitMarketplaceDetailForm('${ board.b_no }', '${ board.table_name }');">
                        <div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
                           <img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">
                        </div>
                        <div class="communityMarketplaceBoardSubject" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.subject}</div>
                        <div class="communityMarketplaceBoardWriter" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${board.nickname}</div>
                        <div class="communityMarketplaceBoardRegDate">${board.reg_date}</div>
                        <div class="communityMarketplaceBoardReadcount">${board.readcount}</div>
                     </div>
                  </c:forEach>
                  
                  <c:forEach var="empty_row" begin="${ requestScope.tabFreeSharingMarketplaceBoardListSize + 1 }" end="${ requestScope.tabFreeSharingMarketplaceBoardPageMap.rowCntPerPage }">
                     <div class="communityMarketplaceBoardFormBoard">
                        <div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
                           <!-- <img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">  -->
                        </div>
                        <div class="communityMarketplaceBoardSubject">&nbsp;</div>
                        <div class="communityMarketplaceBoardWriter">&nbsp;</div>
                        <div class="communityMarketplaceBoardRegDate">&nbsp;</div>
                        <div class="communityMarketplaceBoardReadcount">&nbsp;</div>
                     </div>
                  </c:forEach>
                  
                  <span id="freeSharingPaingsDiv" class="pagingNos">
                     <span style="cursor:pointer;" onClick="pageNoClick( 1 );">[처음]</span>
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo } - 1 );">[이전]</span>
                     &nbsp;&nbsp;
                     
                     <c:forEach var="pageNo" begin="${ requestScope.tabFreeSharingMarketplaceBoardPageMap.begin_pageNo }" end="${ requestScope.tabFreeSharingMarketplaceBoardPageMap.end_pageNo }">
                        <c:if test="${ requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo == pageNo }">
                           <span style="cursor:pointer" onClick="pageNoClick(${ pageNo });"><b><u>${ pageNo }</u></b></span>
                        </c:if>
               
                        <c:if test="${ requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo != pageNo }">
                           <span style="cursor:pointer" onClick="pageNoClick(${ pageNo });">[${ pageNo }]</span>
                        </c:if>
                     </c:forEach>
                     &nbsp;&nbsp;
                     
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabFreeSharingMarketplaceBoardPageMap.selectPageNo } + 1 );">[다음]</span>
                     <span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.tabFreeSharingMarketplaceBoardPageMap.last_pageNo } );">[마지막]</span>
                     
                     &nbsp;&nbsp;&nbsp;
                     [${ requestScope.tabFreeSharingMarketplaceBoardListCnt } / ${ requestScope.tabFreeSharingMarketplaceBoardListAllCnt }] 개
                  </span>                  
               </div>
                 <!-- end. container -->
               
            </div>   
         </div>
         
      
      </div>   <!-- 끝. [탭] 콘텐츠 -->
    
   </div>   <!-- 끝. [카테고리] 탭 -->
   
   
</body>
</html>