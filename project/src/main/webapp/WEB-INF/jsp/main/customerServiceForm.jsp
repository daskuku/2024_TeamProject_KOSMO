<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CustomerServiceForm</title>
<link href="/style/main/customerServiceFormStyle.css" rel="stylesheet">
<script src="/js/main/customerServiceFormScript.js"></script>
<script>
// FAQ / 질문과 답변 카테고리 선택 
	$(function(){
		$('.customerServiceCategoryTabContent > div').hide();
		$('.customerServiceCategoryTabNav a').click(function(){
			$('.customerServiceCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			$('.customerServiceCategoryTabNav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});

// FAQ 페이지
	$(document).ready(function() {
		
	    $(".customerServiceCategory").eq(0).addClass("active");
	
	    $(document).on("click", ".customerServiceCategory", function() {
	        $(".customerServiceCategory").removeClass("active");
	        $(this).addClass("active");
	
	        var category = $(this).text().trim();
	
	        $.ajax({
	            url: "/customerServiceForm.do",
	            type: "post",
	            data: { category: category },
	            success: function(responseHtml) {
	                var obj = $(responseHtml);
	                var filteredHtml = "";
	
	                obj.find(".customerServiceitem").each(function() {
	                    var itemCategory = $(this).find("span").text().trim();
	                    if (category === "전체" || itemCategory === category) {
	                        filteredHtml += $(this)[0].outerHTML;
	                    }
	                });
	                $("#list-area").html(filteredHtml);
	
	                $(".customerServiceitem").removeClass("active");
	                $(".customerServiceitem").eq(0).addClass("active");
	            },
	            error: function() {
	                alert("에러 발생")
	            }
	        });
	    });
	});
	
// 질문과 답변 페이지	

	function search() {

		var customerServicePagingFormObj = $("[name='customerServicePagingForm']");
		
		customerServicePagingFormObj.find(".rowCntPerPage").val("10");
	
		$.ajax({
				
			url : "/customerServiceForm.do",
			
			type : "post",
			
			data : customerServicePagingFormObj.serialize(),
			
			success : function(responseHtml) {
	
				var obj = $(responseHtml);
	
				$("#customerServiceCategoryTabQnA .customerServiceQnAFormContainer").html(obj.find("#customerServiceCategoryTabQnA .customerServiceQnAFormContainer").html());
	
				$(".pagingNos").html(obj.find(".pagingNos").html());
				
			},
			
			error : function() {
	
				alert(customerServicePagingFormObj.serialize());
			}
	
		});

	}

	function pageNoClick(clickPageNo) {
		
		$("[name='customerServicePagingForm']").find(".SelectPageNo").val(clickPageNo)

		search();
	}
	
	function submitDetailForm(b_no, mid) {
		
	    var sessionMid = '<%= session.getAttribute("mid") %>';
	    
		if (sessionMid == 'admin'){
			 $("[name='customerServiceDetailForm'] .b_no").val(b_no);
             document.customerServiceDetailForm.action = "/customerServiceQnADetailForm.do";
             document.customerServiceDetailForm.submit();
             return;
		} 
		
		if (mid == sessionMid) {
			$("[name='customerServiceDetailForm'] .b_no").val(b_no);
            document.customerServiceDetailForm.action = "/customerServiceQnADetailForm.do";
            document.customerServiceDetailForm.submit();
            
		} else if(sessionMid === 'null'){
			
			alert("로그인 후 이용해주세요.");
			
	    } else {
	    	
	    	alert("작성할 때 로그인 한 아이디와 다릅니다.");
	    	
	    }
	}


	function newCustomerServiceQnABoardBtnClick() {
		
	    var sessionMid = '<%= session.getAttribute("mid") %>'

	    if (sessionMid === 'null') {
	    	alert('로그인이 필요한 서비스입니다.');
	    	location.href = '/loginForm.do';
	    } else {
	    	location.href = '/newCustomerServiceQnAForm.do';
	    }
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="customerServiceFormTitle">
        <p class="titleBackgoundText">고객센터</p>
    </div>
    <form name="customerServicePagingForm" onsubmit="return false">
    	<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
    	<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
    </form>
    <form name="customerServiceDetailForm" class="customerServiceDetailForm" action="/customerServiceQnADetailForm.do" method="POST">
    	<input type="hidden" class="b_no" name="b_no">
    </form>
    <div class="customerServiceCategoryTab">
    	<ul class="customerServiceCategoryTabNav">
    		<li><a href="#customerServiceCategoryTabFAQ">FAQ</a></li>
    		<li><a href="#customerServiceCategoryTabQnA">QnA</a></li>
    	</ul>
    	<div class="customerServiceCategoryTabContent">
    		<div id="customerServiceCategoryTabFAQ">
			    <div class="customerServiceFormFAQContainer">
			        <div id="main-area">
			            <div id="category-area">
			                <ul id="category">
			                    <li class="customerServiceCategory"><span>전체</span></li>
			                    <c:forEach var="customerServiceCategoryList" items="${requestScope.customerServiceCategoryList}">
			                        <li class="customerServiceCategory">${customerServiceCategoryList.customerservice_categoryname}</li>
			                    </c:forEach>
			                </ul>
			            </div>
			            <div id="list-area">
			                <ul id="list">
			                    <c:forEach var="customerServiceList" items="${requestScope.customerServiceList}">
			                        <li class="customerServiceitem">
			                            <div class="text">
			                                <span>${customerServiceList.customerservice_categoryname}</span>${customerServiceList.customerservice_subject}
			                            </div>
			                            <div class="additional">
			                                ${customerServiceList.customerservice_content}
			                            </div>
			                        </li>
			                    </c:forEach> 
			                </ul>
			            </div>
			        </div>
			    </div>
			    <%@ include file="/WEB-INF/jsp/footer.jsp" %>
			</div>
			<div id="customerServiceCategoryTabQnA">
				<div class="customerServiceQnAFormContainer">
					<div class="customerServiceQnAFormBoard">
						<div class="customerServiceQnAFormFontLightGray" id="customerServiceQnABoardAllCount">Total. ${requestScope.customerServiceQnABoardListAllCnt}개</div>
						<table class="customerServiceQnABoardListTable" cellpadding="7" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
							<tr>
								<th style="width:50px;">번호</th>
								<th style="width:300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">제목</th>
								<th style="width:80px;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">작성자</th>
								<th style="width:100px;">등록일</th>
								<th style="width:100px;">조회수</th>
							</tr>
								<c:forEach var="customerServiceQnABoard" items="${requestScope.customerServiceQnABoardList}" varStatus="status">
									<tr style="cursor:pointer" onClick="submitDetailForm(${customerServiceQnABoard.b_no},'${customerServiceQnABoard.mid}')">
										<td class="customerServiceQnAFormFontLightGray" align="center">${requestScope.customerServiceQnABoardMap.begin_serialNo_desc - status.count + 1}</td>
										<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										<td>
											${customerServiceQnABoard.subject}
										</td>
										<td class="customerServiceQnAFormFontLightGray" align="center">${customerServiceQnABoard.writer}</td>
										<td class="customerServiceQnAFormFontLightGray" align="center">${customerServiceQnABoard.reg_date}</td>
										<td class="customerServiceQnAFormFontLightGray" align="center">${customerServiceQnABoard.readcount}</td>
									</tr>
								</c:forEach>
						</table>
						<c:if test="${empty requestScope.customerServiceQnABoardList}">
							<br>
							<center>
								조건에 맞는 검색 결과가 없습니다.
							</center>
						</c:if>
					</div>
				</div>
				<c:if test="${not sessionScope.mid.equals('admin')}">
				    <div class="newCustomerServiceQnABoardBtnDiv">
						<input type="button" class="newCustomerServiceQnABoardBtn" value="새 글 쓰기" onClick="newCustomerServiceQnABoardBtnClick()">
					</div>
				</c:if>
				<div class="customerServiceCategoryTabQnAPaging">
					<span class="pagingNos">
						<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
						<c:forEach var="pageNo" begin="${requestScope.customerServiceQnABoardMap.begin_pageNo}" end="${requestScope.customerServiceQnABoardMap.end_pageNo}">
							<c:if test="${requestScope.customerServiceQnABoardMap.selectPageNo==pageNo}">
					            <p class="activePageNo">${pageNo}</p>
					        </c:if>
							<c:if test="${requestScope.customerServiceQnABoardMap.selectPageNo!=pageNo}">
								<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
							</c:if>
						</c:forEach>
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
						<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
					</span>
				</div>
				<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			</div>
		</div>
	</div>
</body>
</html>