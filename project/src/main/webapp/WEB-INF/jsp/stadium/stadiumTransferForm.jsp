<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StadiumTransferForm</title>
<link href="/style/stadiumTransferFormStyle.css" rel="stylesheet">
<script src="/js/stadiumTransferFormScript.js"></script>

<script>

$(document).ready(function() {
    $(".rowCntPerPage").val("10");
    search();

 
});



function goTransferDetailForm(yangdo_no) {
	 var sessionMid = '<%= session.getAttribute("mid") %>';

	    if (sessionMid == "" || sessionMid == 'null') {
	        alert('로그인이 필요한 서비스입니다.');
	        location.href = '/loginForm.do';
	        return;
	    } else {
	    	$("[name='stadiumTransferDetailForm'] [name='yangdo_no']").val(yangdo_no);

	    	document.stadiumTransferDetailForm.submit();
	        
	    }
	}
	
	
	
	








function stadiumTransferForm(){
    var sessionMid = '<%= session.getAttribute("mid") %>';

    if (sessionMid == "" || sessionMid == 'null') {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '/loginForm.do';
        return;
    } else {
        // 로그인 상태라면 새 글 쓰기 페이지로 이동하는 코드를 추가할 수 있습니다.
        location.href = '/newStadiumTransferForm.do'; // 이동할 페이지 URL을 수정해야 합니다.
    }
}


function search(){

	SearchFormObj = $("[name='stadiumTransferFormConditionalSearch']");

	//alert(SearchFormObj.serialize( ));
	

    SearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val() );
    

    $.ajax({
    	//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url      : "/stadiumTransferForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,type    : "post"
		
		,data    : SearchFormObj.serialize( )

        ,success : function(responseHtml) {
      	

            var obj = $(responseHtml);
  
            $(".stadiumTransferFormContainer").html(obj.filter(".stadiumTransferFormContainer").html());
			
            $(".pagingNos").html(obj.find(".pagingNos").html());

        }

       , error : function() {
        	
            alert("검색 실패! 관리자에게 문의 바랍니다.");
        } 
       
    });
		
}

function searchAll() {
    // Reset all search fields in the form
     var boardSearchFormObj = $("[name='stadiumTransferFormConditionalSearch']");
     boardSearchFormObj.find("input[type=text]").val("");
     boardSearchFormObj.find(".sido").val("0");
     boardSearchFormObj.find(".sigungu").val("0");
     boardSearchFormObj.find("input[type=checkbox]").prop("checked", false);
     boardSearchFormObj.find(".rowCntPerPage").val("10");
     boardSearchFormObj.find(".SelectPageNo").val("1");
    
    // Perform the search
    search();
}






function pageNoClick( clickPageNo ){
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='stadiumTransferFormConditionalSearch']").find(".selectPageNo").val(clickPageNo)
	
	
	search()
	
}

function goYangdoDetailUpdDeleForm(yangdo_no, m_no) {
    $("[name='yangdoDetailUpdDeleForm'] [name='yangdo_no']").val(yangdo_no);
    $("[name='yangdoDetailUpdDeleForm'] [name='m_no']").val(m_no);
    
    //alert(m_no)
    
    
    document.yangdoDetailUpdDeleForm.submit();
}




</script>
</head>
<body>


	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="stadiumTransferFormTitle">
		<p class="titleBackgoundText">경기장 양도</p>
	</div>
	

	
	<form name="stadiumTransferFormConditionalSearch" onsubmit="return false">

				<table align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
					<tr>
						<td>
							<table style="border-collapse: collapse; border-bottom: none;" align="center">
								<tr>
									<th style="border-radius: 10px; border-bottom: none;">지역</th>
									<td colspan="5" style="text-align: center; width:200px; border-bottom: none;"><select name="sido" id="" class="sido"
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
								<tr><td></td></tr>
						<tr>
						    <th style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">양도상태</th>
						    <td style="text-align: center; border-bottom: none; display: flex; justify-content: center; align-items: center;">
						        <label style="display: flex; align-items: center; margin-right: 50px;">
						            <input type="checkbox" name="status" value="양도중" class="양도중" style="zoom:2.0; margin-right: 5px;">
						            양도 중
						        </label>
						        <label style="display: flex; align-items: center;">
						            <input type="checkbox" name="status" value="양도완료" class="stadium_status" style="zoom:2.0; margin-right: 5px;">
						            양도 완료
						        </label>
						    </td>
						</tr>
						<tr><td></td></tr>
								<tr>
									<th style="border-radius: 10px; border-bottom: none; border-top: none; ">경기장이름</th>
									<td><input type="text" name="Stadiumkeyword1"
										class="Stadiumkeyword1"> <select name="orand" class="orAnd" style="text-align: center;">
											<option value="or">or
											<option value="and">and
									</select> <input type="text" name="Stadiumkeyword2"
										class="Stadiumkeyword2"></td>
								</tr>
								<tr><td></td></tr>
							</table>
					</tr>
					<tr align="center">
						<td style="border-top: 1px solid #c59246e0;"><input type="button" value="검색" class="searchBtn"
							onclick="search()"> <input type="button" value="초기화"
							class="searchAllBtn" onclick="searchAll()"></td>
					</tr>

				</table>




		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
</form>
<div class="stadiumTransferFormTopContents">
		<span class="stadiumTransferFormFontLightGray" id="stadiumTransferAllCount">Total. ${requestScope.StadiumYangdoListAllCnt}개</span>
		<div class="stadiumTransferFormRowCntPerPage">
			<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
				<option value="10">10개씩 보기
				<option value="15">15개씩 보기
				<option value="20">20개씩 보기
			</select>
		</div>
	</div>
	<div class="stadiumTransferFormContainer">

		<div class="stadiumTransferFormBoard">
			
			<table class="boardListTable" cellpadding="7" align="center"
				style="border-collapse: collapse;">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">제목</th>
					<th style="width: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">글쓴이</th>
					<th style="width: 100px;">조회수</th>
					<th style="width: 100px;">등록일</th>
					
					<c:forEach var="Yangdo" items="${requestScope.stadiumYangdoList}"
						varStatus="status">
						<tr  style="cursor: pointer" 
					        <c:if test="${sessionScope.mid eq 'admin'}">
					            onClick="goYangdoDetailUpdDeleForm(${Yangdo.yangdo_no},${Yangdo.writer});"
					        </c:if>
					        <c:if test="${sessionScope.mid ne 'admin'}">
					            onClick="goTransferDetailForm(${Yangdo.yangdo_no});"
					        </c:if> >
					        
					        
					        
   							<td align="center"  class="stadiumTransferFormFontLightGray">${requestScope.StadiumYangdoMap.begin_serialNo_desc - status.count + 1}</td>
						    <!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
						    <td align="center" >${Yangdo.title}</td>
						    <td align="center" class="stadiumTransferFormFontLightGray">${Yangdo.nickname}</td>
						    <td align="center" class="stadiumTransferFormFontLightGray">${Yangdo.readcount}</td>
						    <td align="center" class="stadiumTransferFormFontLightGray">${Yangdo.reg_date}</td>
						   
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.stadiumYangdoList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
	<div class="newStadiumTransferBoardBtnDiv">
		<input type="button" class="newStadiumTransferBoardBtn"
			value="새 글 쓰기"
			onClick="stadiumTransferForm();">
	</div>
	<div class="stadiumTransferPaging">
		<span class="pagingNos">
			<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.StadiumYangdoMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
			<c:forEach var="pageNo" begin="${requestScope.StadiumYangdoMap.begin_pageNo}" end="${requestScope.StadiumYangdoMap.end_pageNo}">
				<c:if test="${requestScope.StadiumYangdoMap.selectPageNo==pageNo}">
		            <p class="activePageNo">${pageNo}</p>
		        </c:if>
				<c:if test="${requestScope.StadiumYangdoMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
				</c:if>
			</c:forEach>
			<span style="cursor: pointer" onClick="pageNoClick(${requestScope.StadiumYangdoMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
			<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
		</span>
	</div>
	
	<form name="stadiumTransferDetailForm" action="/stadiumTransferDetailForm.do"
		method="post">
		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
		<input type="hidden" name="yangdo_no" >
	</form>
	
	
	<form name="yangdoDetailUpdDeleForm" action="/yangdoDetailUpdDeleForm.do" method="post">
				<input type="hidden" name="yangdo_no" value="${ requestScope.yangdoDTO.yangdo_no }">
				<input type="hidden" name="m_no" value="${ requestScope.yangdoDTO.writer }">
				
			</form>
	
	
	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>