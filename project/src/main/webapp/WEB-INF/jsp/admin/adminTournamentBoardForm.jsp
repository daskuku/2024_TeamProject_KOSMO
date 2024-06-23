<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TournamentBoardForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>


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
	
	ing_or_end = "초기";
	select_region = "전체";
	
	function ing()
	{
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
	
		
		$.ajax({
			//----------------------------------------------------------
			//WAS 에 접속할 URL 주소 지정
			//----------------------------------------------------------
			url   : "/adminTournamentBoardForm.do" 
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
				
				$(".tournamentBoard").html(obj.find(".tournamentBoard").html()  );
				ing_or_end = "진행";
				
				
			}			
			
			,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
			
		}) 
	};
	
	
	
	function end()
	{
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
		$.ajax({
			//----------------------------------------------------------
			//WAS 에 접속할 URL 주소 지정
			//----------------------------------------------------------
			url   : "/adminTournamentBoardForm.do" 
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
				
				$(".tournamentBoard").html(obj.find(".tournamentBoard").html()  );
				ing_or_end = "끝";
				
				
		
				
	
			}			
			,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
			
		})
	};
	
	
	function search(text)
	{	
		$(".region1").click(function(){
			$(".region1").removeClass("selected1");
			$(this).addClass("selected1");
		});
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
		if(ing_or_end == "진행")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/adminTournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : "region=" + text + "&ing=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					
					select_region = text;
					
					
					
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
		
		else if(ing_or_end == "끝")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/adminTournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : "region=" + text + "&end=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					
					select_region = text;
					
			
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
			
	} 
	
	
	function goTournamentBoardDetail(list_no)
	{
	   $("[name='upDelTournament'] [name='list_no']").val(list_no); 
	   document.upDelTournament.submit();
	}
	
	
	function pageNoClick(clickPageNo) {
		
		$("[name='recruit_Team_mem']").find(".selectPageNo").val(clickPageNo);

		search_detail();

	}
	
	
	function search_detail() {

		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
		var boardSearchFormObj = $("[name='tournament_search']");

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

		var keyword1 = keyword1Obj.val();
		  
		if(typeof(keyword1)!='string' ){keyword1=""; }
	    
	    keyword1 = $.trim(keyword1);
	    
	 	if(ing_or_end == "진행")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/adminTournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : boardSearchFormObj.serialize() + "&ing=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					$(".pagingNos").html(obj.find(".pagingNos").html());
					
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
		
		else if(ing_or_end == "끝")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/adminTournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : boardSearchFormObj.serialize() + "&end=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					$(".pagingNos").html(obj.find(".pagingNos").html());
			
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		} 
	    
	}
	
	function enterkey()
	{
		
		if(window.event.keyCode == 13)
		{
			search_detail();
		}
	}
	
		
</script>
<style>
	#nav-item-tournament{
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
		<p class="titleBackgoundText">대회 일정 관리</p>
	</div>

	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>
	

		<form name="tournament_search" onsubmit="return false">
			<div class="adminTournamentSearch">
				<div class="searchSelectBox">
					<select name="searchType1" class="searchType1" style="width: 90px;">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
				</div>
				<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()" style="width: 400px;"> 
				<input type="button" onclick="search_detail()" class="searchBtn" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;" value="검색">
				<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			</div>
		</form>	
		
		<!-- <div style="height:25px;"></div>
		<br>
		<input type="button" class="new_RegBoard" style="cursor:pointer" onClick="location.href='/newTournamentBoard.do'" value="새 글쓰기">
		<div style="height:25px;"></div>
	 -->
		<div>
			<table align="center" class="adminTournamentCategoryTab">
				<tr>
					<td class="tournament onvalue" onclick="ing()" style="cursor: pointer;">
						진행중인 대회
					</td>
					<td class="tournament" onclick="end()" style="cursor: pointer;">
						마감된 대회
					</td>
				</tr>
			</table>
			
			
				
			<div class="region"> <!-- 지역 선택 Div -->
				<table align="center" style="border-collapse:collapse; width: 900px;">
					<tr>
						<td class="region1 selected1" onClick="search('전체')" style="border-bottom: none;">전체</td>
						<td class="region1" onClick="search('서울')" style="border-bottom: none;">서울</td>
						<td class="region1" onClick="search('경인')" style="border-bottom: none;">경인</td>
						<td class="region1" onClick="search('강원')" style="border-bottom: none;">강원</td>
						<td class="region1" onClick="search('충청')" style="border-bottom: none;">충청</td>
						<td class="region1" onClick="search('전라')" style="border-bottom: none;">전라</td>
						<td class="region1" onClick="search('경상')" style="border-bottom: none;">경상</td>
						<td class="region1" onClick="search('제주')" style="border-bottom: none;">제주</td>
					</tr>
				</table>
			
				
				<!-- ================================================================================================================================ -->
				<div class="tournamentBoard">
			         <table class="tournamentTable" cellpadding="7" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
			            <tr>
			               <th style="width:30px;">번호</th>
			               <th style="width:150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">제목</th>
			               <th style="width:80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">신청기간</th>
			               <th style="width:40px;">지역</th>
			                <th style="width:40px;">등록일</th>
			               <c:forEach var="gameList" items="${requestScope.tournamentList}" varStatus="status">
			                  <tr style="cursor:pointer" onClick="goTournamentBoardDetail(${gameList.list_no});">
			                     <td align="center" class="fontLightGray">${requestScope.tournamentMap.begin_serialNo_desc - status.index}</td>
			                     <td align="center">${gameList.subject}</td>
			                     <td align="center" class="fontLightGray">${gameList.regist_start} ~ ${gameList.regist_end}</td>
			                     <td align="center" class="fontLightGray">${gameList.region}</td>
			                     <td align="center" class="fontLightGray">${gameList.reg_date}</td>
			                  </tr>
			               </c:forEach>
			                  
			               
			         </table>
			         <c:if test="${empty requestScope.tournamentList}">
		                  <center>
		                  <br><br>
		                  <b>조건에 맞는 결과물이 없습니다.</b>
		                  </center>
		             </c:if>
			      </div>
			      
				<!-- ================================================================================================================================ -->	
			</div>
		</div>
		<div class="newCommunityFreeBoardFormBtnDiv">
			<input type="button" value="새 글 쓰기" class="newCommunityFreeBoardFormBtn" onClick="location.href='/newTournamentBoard.do'">
		</div>
		<div class="adminFormPaging">
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
			</span>
		</div>
    
    

    <form name="upDelTournament" action="/adminTournamentBoardUpForm.do" method="post">
		<input type="hidden" name="list_no" value="${requestScope.detail.list_no}">
	</form>
    
    
    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>