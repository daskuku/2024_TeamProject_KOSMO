<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TournamentBoardForm</title>
<link href="/style/tournamentBoardFormStyle.css" rel="stylesheet">
<!-- <script src="/js/tournamentBoardFormScript.js"></script> -->

<script>

   $(document).ready(function(){
      $(".tournament").click(function(){
         $(".tournament").removeClass("onvalue");
         $(this).addClass("onvalue");
      });
      
      $(".region1").click(function(){
         $(".region1").removeClass("selected1");
         $(this).addClass("selected1");
      });
      
      ing();
   }) 
   
   //진행/마감 초기설정
    ing_or_end = "초기";
   
    //지역선택 초기설정
    regionChoice = "초기"
    
   //현재 시간 잡기위한 함수
    function nowDate(date) {
       var year = date.getFullYear();
       var month = date.getMonth()+1;
       var day = date.getDate();
       return year + "-" + month + "-" + day;
   }
   
   function ing()
   {
      regionChoice = "전체";
       var now = new Date();
       var nowdate = nowDate(now);
   
      
      $.ajax({
         //----------------------------------------------------------
         //WAS 에 접속할 URL 주소 지정
         //----------------------------------------------------------
         url   : "/tournamentBoardForm.do" 
         //----------------------------------------------------------
         //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
         //----------------------------------------------------------
         ,type : "post"
         //----------------------------------------------------------
         //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
         //----------------------------------------------------------
         ,data : "ing=" + nowdate
            
         ,success : function(responseHtml){
            
            var obj = $(responseHtml);
            
            //alert( obj.find(".regionlist").length +" / "+obj.filter(".regionlist").length )
            
            $(".region").html(obj.find(".region").html()  );
            ing_or_end = "진행";
            
            
         }         
         
         ,error     : function(){alert("검색 실패 / 관리자에게 문의 바람");}
         
      }) 
   };
   
   
   
   function end()
   {
      regionChoice = "전체";
       var now = new Date();
       var nowdate = nowDate(now);
      
      $.ajax({
         //----------------------------------------------------------
         //WAS 에 접속할 URL 주소 지정
         //----------------------------------------------------------
         url   : "/tournamentBoardForm.do" 
         //----------------------------------------------------------
         //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
         //----------------------------------------------------------
         ,type : "post"
         //----------------------------------------------------------
         //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
         //----------------------------------------------------------
         ,data : "end=" + nowdate
            
         ,success : function(responseHtml){
            
            var obj = $(responseHtml);
            
            $(".region").html(obj.find(".region").html()  );
            ing_or_end = "끝";
            
            $(".boardList").find("#addTextLine").addClass("textLineDecoration");
               $(".pagingNos").html(obj.find(".pagingNos").html());

         }         
         ,error     : function(){alert("검색 실패 / 관리자에게 문의 바람");}
         
      })
   };

   
   function select(region)
   {
       if (region) 
       {
          regionChoice = region;
       }
       search();
   }
   
    function search()
   {   
      $(".region1").click(function(){
         $(".region1").removeClass("selected1");
         $(this).addClass("selected1");
      });
      var formObj = $("[name='regionchoice']")
         var choicedRegion = regionChoice;
         var now = new Date();
        var nowdate = nowDate(now);
      
      if(ing_or_end == "진행")
      {
         $.ajax({
            //----------------------------------------------------------
            //WAS 에 접속할 URL 주소 지정
            //----------------------------------------------------------
            url   : "/tournamentBoardForm.do" 
            //----------------------------------------------------------
            //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
            //----------------------------------------------------------
            ,type : "post"
            //----------------------------------------------------------
            //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
            //----------------------------------------------------------
            ,data : formObj.serialize() + "&region=" + choicedRegion + "&ing=" + nowdate
               
            ,success : function(responseHtml){
               
               var obj = $(responseHtml);
               
               $(".boardList").html( $(responseHtml).find(".boardList").html()  );
                  $(".pagingNos").html(  obj.find(".pagingNos").html()  );
               
               
      
            }         
            ,error     : function(){alert("검색 실패 / 관리자에게 문의 바람");}
            
         })
      }
      
      else if(ing_or_end == "끝")
      {
         $.ajax({
            //----------------------------------------------------------
            //WAS 에 접속할 URL 주소 지정
            //----------------------------------------------------------
            url   : "/tournamentBoardForm.do" 
            //----------------------------------------------------------
            //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
            //----------------------------------------------------------
            ,type : "post"
            //----------------------------------------------------------
            //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
            //----------------------------------------------------------
            ,data : formObj.serialize() +"&region=" + choicedRegion + "&end=" + nowdate
               
            ,success : function(responseHtml){
               
               var obj = $(responseHtml);
               
               $(".boardList").html( $(responseHtml).find(".boardList").html()  );
                  $(".pagingNos").html(obj.find(".pagingNos").html());
               $(".boardList").find("#addTextLine").addClass("textLineDecoration");
               
            }         
            ,error     : function(){alert("검색 실패 / 관리자에게 문의 바람");}
            
         })
      }
         
   } 
   
   
   function goTournamentBoardDetail(list_no)
   {
      $("[name='tournamentBoardDetail'] [name='list_no']").val(list_no); 
      document.tournamentBoardDetail.submit();
   }
   
   function pageNoClick(clickPageNo) {
      
      $("[name='regionchoice']").find(".selectPageNo").val(clickPageNo);

      search();

   }
</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="tournamentBoardFormTitle">
       <p class="titleBackgoundText">대회일정</p>
    </div>
   <div>
   <form name="regionchoice">
      <div class="tournamentCategoryTabNavDiv">
         <ul class="tournamentCategoryTabNav">
             <li class="tournament onvalue" onclick="ing()">진행중인 대회</li>
             <li class="tournament" onclick="end()">마감된 대회</li>
          </ul>
       </div>
      <div class="region"> <!-- 지역 선택 Div -->
         <table align="center" style="border-collapse:collapse; width: 900px;">
            <tr align="center">
               <td class="region1 selected1"  onClick="select('전체')" style="border-bottom: none;">전체</td>
               <td class="region1" onClick="select('서울')" style="border-bottom: none;">서울</td>
               <td class="region1" onClick="select('경인')" style="border-bottom: none;">경인</td>
               <td class="region1" onClick="select('강원')" style="border-bottom: none;">강원</td>
               <td class="region1" onClick="select('충청')" style="border-bottom: none;">충청</td>
               <td class="region1" onClick="select('전라')" style="border-bottom: none;">전라</td>
               <td class="region1" onClick="select('경상')" style="border-bottom: none;">경상</td>
               <td class="region1" onClick="select('제주')" style="border-bottom: none;">제주</td>
            </tr>
         </table> 
             <input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
      
         <div class="boardList">
         
            <table id="addTextLine" style="width: 700px; margin: 0 auto;">
               <c:forEach var="gameList" items="${requestScope.tournamentList}">
                  <tr style="cursor:pointer;" onClick="goTournamentBoardDetail(${gameList.list_no});">
                     <td rowspan="2" style="width: 250px;">
                        <c:if test="${gameList.imagename != null}">
							<div class="tournamentBoardImgDiv">
								<img src="/image/tournamentImg/${gameList.imagename}" class="tournamentBoardImg" style="width:250px; height:200px;">
							</div>
						</c:if>
						<c:if test="${gameList.imagename == null}">
							<div class="tournamentBoardImgDiv">
								<img src="/image/noImage.png" class="tournamentBoardImg" style="width:250px; height:200px;">
							</div>
						</c:if>
                     </td>
                     <td>
                        <b style="font-size: 18px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${gameList.subject}</b><p class="tournamentBoardFormFontLightGray" style="padding-top: 5px">${gameList.region}</p>
                     </td>
                  </tr>
                  <tr>
                     <td style="vertical-align: top;">
                        신청기간 : ${gameList.regist_start} ~ ${gameList.regist_end}
                     </td>
                  </tr>
               </c:forEach>
            </table>
            <c:if test="${empty requestScope.tournamentList}">
               
                  <br><br><br><br>
                  <div class="noneResult" style="text-align: center;">
                     <b>조건에 맞는 결과물이 없습니다.</b>
                  </div>
            </c:if>
         </div>
            
      </div>
      </form>   
   </div>
   <div class="tournamentPaging">
      <span class="pagingNos">
         <!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
         <span style="cursor: pointer" onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
         <c:forEach var="pageNo" begin="${requestScope.tournamentMap.begin_pageNo}" end="${requestScope.tournamentMap.end_pageNo}">
            <c:if test="${requestScope.tournamentMap.selectPageNo==pageNo}">
                  <p class="activePageNo">${pageNo}</p>
              </c:if>
            <c:if test="${requestScope.tournamentMap.selectPageNo!=pageNo}">
               <span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
            </c:if>
         </c:forEach>
         <span style="cursor: pointer" onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
         <%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
      </span>
   </div>
    
         <%-- <span class="pagingNos"> <span style="cursor: pointer"
            onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
            onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;
   
   
            <c:forEach var="pageNo"
               begin="${requestScope.tournamentMap.begin_pageNo}"
               end="${requestScope.tournamentMap.end_pageNo}">
   
               <c:if test="${requestScope.tournamentMap.selectPageNo==pageNo}">
               ${pageNo}
            </c:if>
   
               <c:if test="${requestScope.tournamentMap.selectPageNo!=pageNo}">
                  <span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
               </c:if>
            </c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
            onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}+1)">[다음]</span>
            <span style="cursor: pointer"
            onClick="pageNoClick(${requestScope.tournamentMap.last_pageNo})">[마지막]</span>
         </span>  --%>
    <form action="/tournamentBoardDetail.do" method="post" name="tournamentBoardDetail">
       <input type="hidden" name="list_no">
    </form>
    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>