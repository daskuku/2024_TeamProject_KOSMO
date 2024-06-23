<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요합니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html><html>
<head>
	<meta charset="UTF-8">
	<title>communityFreeBoardDetailForm</title>
	<link href="/style/community/communityFreeBoardDetailFormStyle.css" rel="stylesheet">
	<script src="/js/community/communityFreeBoardFormScript.js"></script>

	<script>
		var pageNumber = 1;

		$(function(){
			init();
			//pageNoClick(1);
		});
		
		function init() {
			var b_no = ${ requestScope.detailDTO.b_no };
			$("#freeBoardDetailForm .b_no").val(b_no);
		}
		
		function comment() {
			
			var freeBoardDetailFormCommentObj = $("#freeBoardDetailFormComment");
			var content = freeBoardDetailFormCommentObj.find(".content").val();
			
			if (content.trim().length == 0) {
				alert("댓글 내용을 입력해야 합니다.");
				return;
			}
			
			if (content.trim().match('삭제된 댓글입니다')){
				alert("삭제된 댓글은 금지어 입니다");
				return;
			}
			
			if (confirm("댓글 입력하시겠습니까?") == false) {
				return;
			}
			
			var serialize = freeBoardDetailFormCommentObj.serialize( );
			
			$.ajax( {
					url 	:	 "/communityFreeBoardDetailCommentList.do"
				,	type 	:	 "post"
				,	data 	:	 serialize
				,	success :	 function(responseHtml) {	ajaxSuccess(responseHtml);	$("#freeBoardDetailFormComment").find(".content").val("");}
				,	error 	: 	function() {
						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}
			} );
		}
		
		function insertCommentOfComment(index, comment_no) {
			
			var commentOfCommentFormObj = $("#commentOfCommentForm");
			
			var nick_name = $("#nick_name" + index).val();
			var content = $("#content" + index ).val();
			
			if (content.trim().length == 0) {
				alert("댓글 내용을 입력해야 합니다.");
				return;
			}
			
			if (content.trim().match('삭제된 댓글입니다')){
				alert("삭제된 댓글은 금지어 입니다");
				return;
			}
			
			if (confirm("답글 입력하시겠습니까?") == false) {
				return;
			}			
			
			var hidden_nick_name = commentOfCommentFormObj.find(".nick_name");
			var hidden_content = commentOfCommentFormObj.find(".content");
			var hidden_comment_no = commentOfCommentFormObj.find(".comment_no");
			commentOfCommentFormObj.find(".selectPageNo").val( pageNumber );
			
			hidden_nick_name.val( nick_name );
			hidden_content.val( content );
			hidden_comment_no.val( comment_no );
			
			var serialize = commentOfCommentFormObj.serialize( );
			
			$.ajax( {
					url 	:	 "/communityFreeBoardDetailCommentOfCommentInsertProc.do"
				,	type 	:	 "post"
				,	data 	:	 serialize
				,	success :	 function(responseHtml) {	ajaxSuccess(responseHtml);	}
				,	error 	: 	function() {
						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}
			} );				
		}
		
		function updateCommentOfComment(index, comment_no) {
			var commentOfCommentFormObj = $("#commentOfCommentForm");
			
			var nick_name = $("#nick_name" + index).val();
			var content = $("#content" + index ).val();
			
			if (content.trim().length == 0) {
				alert("댓글 내용을 입력해야 합니다.");
				return;
			}
			
			if (content.trim().match('삭제된 댓글입니다')){
				alert("삭제된 댓글은 금지어 입니다");
				return;
			}
			
			if (confirm("답글 수정하시겠습니까?") == false) {
				return;
			}			
			
			var hidden_nick_name = commentOfCommentFormObj.find(".nick_name");
			var hidden_content = commentOfCommentFormObj.find(".content");
			var hidden_comment_no = commentOfCommentFormObj.find(".comment_no");
			commentOfCommentFormObj.find(".selectPageNo").val( pageNumber );
			
			hidden_nick_name.val( nick_name );
			hidden_content.val( content );
			hidden_comment_no.val( comment_no );
			
			var serialize = commentOfCommentFormObj.serialize( );
			
			$.ajax( {
					url 	:	 "/communityFreeBoardDetailCommentOfCommentUpdateProc.do"
				,	type 	:	 "post"
				,	data 	:	 serialize
				,	success :	 function(responseHtml) {	ajaxSuccess(responseHtml);	}
				,	error 	: 	function() {
						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}
			} );	
		}
		
		function deleteCommentOfComment(index, comment_no) {
			if (confirm("답글 삭제하시겠습니까?") == false) {
				return;
			}
			
			var commentOfCommentFormObj = $("#commentOfCommentForm");
			var nick_name = $("#nick_name" + index).val();
			var content = $("#content" + index ).val();			
			
			var hidden_nick_name = commentOfCommentFormObj.find(".nick_name");
			var hidden_content = commentOfCommentFormObj.find(".content");
			var hidden_comment_no = commentOfCommentFormObj.find(".comment_no");
			commentOfCommentFormObj.find(".selectPageNo").val( pageNumber );
			
			hidden_nick_name.val( nick_name );
			hidden_content.val( content );
			hidden_comment_no.val( comment_no );
			
			var serialize = commentOfCommentFormObj.serialize( );
			
			$.ajax( {
					url 	:	 "/communityFreeBoardDetailCommentOfCommentDeleteProc.do"
				,	type 	:	 "post"
				,	data 	:	 serialize
				,	success :	 function(responseHtml) {	ajaxSuccess(responseHtml);	}
				,	error 	: 	function() {
						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}
			} );
		}
		
		function pageNoClick( clickPageNo ) {
			
			pageNumber = clickPageNo;
			
			var commentPageFormObj = $("#commentPageForm");
			
			commentPageFormObj.find(".selectPageNo").val( clickPageNo );
			commentPageFormObj.find(".rowCntPerPage").val( 10 );
			
			
			var commentOfCommentFormObj = $("#commentOfCommentForm");
			commentOfCommentFormObj.find(".selectPageNo").val( clickPageNo );
			commentOfCommentFormObj.find(".rowCntPerPage").val( 10 );
			
			var freeBoardDetailFormCommentObj = $("[name='freeBoardDetailFormComment']");
			freeBoardDetailFormCommentObj.find(".selectPageNo").val( clickPageNo );
			freeBoardDetailFormCommentObj.find(".rowCntPerPage").val( 10 );				
			
			var serialize = commentPageFormObj.serialize( );
			
			$.ajax( {
					url 	:	 "/communityFreeBoardDetail.do"
				,	type 	:	 "post"
				,	data 	:	 serialize
				,	success :	 function(responseHtml) {	ajaxSuccess(responseHtml);	}
				,	error 	: 	function() {
						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}
			} );
		}
		
		function ajaxSuccess(responseHtml) {
			
			var obj = $(responseHtml);
			var freeBoardCommentDiv_filter = obj.filter(".freeBoardCommentDiv").html();							
			$(".freeBoardCommentDiv").html(freeBoardCommentDiv_filter);
			
			var comment_page_div_filter = obj.filter(".communityFreeBoardCommentPaging").html();							
			$(".communityFreeBoardCommentPaging").html(comment_page_div_filter);
			
		}
		
		function showOrHideCommentOfComment(trCommentOfCommentId) {
			
			var trClassObjects = $(".trCommentOfComment");
			var trIdObject = $("#" + trCommentOfCommentId);
			
			if(trIdObject.attr("style") == "display: none;"){ 
				trIdObject.show();
				trIdObject.prev().find("td input").val("입력창 숨기기");
			}  
			else {
				trIdObject.hide();
				trIdObject.prev().find("td input").val("답글");
			}			
		}
		
	</script>

</head>

<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	
	<div class="communityFreeBoardFormTitle">
		<p class="titleBackgoundText">자유게시판</p>
	</div>

	<table align="center" cellpadding="7" style="width:1100px; border-collapse: collapse; border-bottom: 1px solid #999999; margin-top: 50px;">
		<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
			<td colspan="2"><span>${ requestScope.freeBoardDetail.subject }</span><span style="float: right;"><span style="color: #999999; margin-top: 15px;">작성자&nbsp;</span>/&nbsp;${ requestScope.freeBoardDetail.nickname }<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${ requestScope.freeBoardDetail.readcount }</span></td>
		</tr>
		<tr style="width: 900px; height: 400px;">
			<td colspan="2">${ requestScope.freeBoardDetail.content }</td>
		</tr>
	</table>
	<div class="freeBoardDetailBtnDiv">
		<c:if test="${requestScope.freeBoardDetail.nickname == sessionScope.nickname}">
			<input type="button" value="수정/삭제" class="freeBoardUpDelBtn" onclick="document.freeBoardDetailForm.submit();">
		</c:if>
		<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/communityFreeBoardForm.do')">
	</div>
	<form name="freeBoardDetailFormComment" id="freeBoardDetailFormComment" onsubmit="return false;">
		<div class="freeBoardDetailCommentDiv">
			<div class="freeBoardDetailCommentTitle" style="text-decoration: underline; text-underline-position: under;">
				<strong>댓글쓰기</strong>
			</div>
			<div class="freeBoardDetailWriter">
				<div class="freeBoardDetailWriterTitle">
					작성자
				</div>
				<div>
					<%= session.getAttribute("nickname") %>
				</div>
			</div>
			<div class="freeBoardDetailTextAndBtn">
				<div class="freeBoardDetailTextAndBtn">
					<input type="text" name="content" class="content" style="width: 800px; align-content: left;">
					<input type="button" value="댓글쓰기" class="checkCommentBtn" onclick="comment();">
				</div>
			</div>
		</div>
		<input type="hidden" name="nick_name" class="nick_name" value="<%= session.getAttribute("nickname") %>">
		<input type="hidden" name="b_no" value="${ requestScope.detailDTO.b_no }">
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="10">
	</form>		
		<%-- <tr style="border-top: 1px solid #999999;">
			<th style="background-color:rgba(197, 146, 70, 0.4); color: #000000;">댓글쓰기</th>
			<td>
				<form name="freeBoardDetailFormComment" id="freeBoardDetailFormComment" onsubmit="return false;">
					<%= session.getAttribute("nickname") %>
					<input type="hidden" name="nick_name" class="nick_name" value="<%= session.getAttribute("nickname") %>">
					<input type="text" name="content" class="content" style="width: 500px;">
					<input type="button" value="댓글쓰기" class="checkCommentBtn" onclick="comment();">
					<input type="hidden" name="b_no" value="${ requestScope.detailDTO.b_no }">
					<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
					<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="10">
				</form>		
			</td>
		</tr> --%>
		<%-- <c:if test="${ !empty requestScope.sampleDetailCommentList }">
			<c:forEach var="comment" items="${ requestScope.sampleDetailCommentList }" varStatus="status">
				<tr>
					<td style="background-color:rgba(197, 146, 70, 0.4); color: #000000;">${ comment.writer } (${ comment.reg_date })</td>
					<td>
						<textarea style="border:none;" rows="1" cols="40" maxlength="500" readonly>${ comment.content }</textarea>
					</td>
				</tr>
			</c:forEach>	
		</c:if> --%>
	<div class="freeBoardCommentDivContainer">
		<c:if test="${ !empty requestScope.freeBoardDetailCommentList }">
			<c:forEach var="comment" items="${ requestScope.freeBoardDetailCommentList }" varStatus="status">
				<div class="freeBoardCommentDiv">
			         <div class="freeBoardCommentWriterAndRegDate" style="padding-left: ${comment.print_level * 40}px;">
			            <c:if test="${ comment.print_level > 0 }">ㄴ</c:if>${ comment.nick_name }
			            <span class="freeBoardCommentRegDate" style="color: #999999;">
			                ${ comment.reg_date }
			            </span>
			            <div class="freeBoardCommentText"> 
			            ${ comment.content }
				        </div>
				        <div class="freeBoardCommentBottomContent">
				        	<c:if test="${comment.content != '삭제된 댓글입니다.'}">
					            <div class="freeBoardCommentBtn">
					            	<div class="checkCommentReplyBtnDiv">
					               		<input type="button" value="입력창 열기" class="checkCommentReplyBtn" onclick="showOrHideCommentOfComment('trCommentOfComment${ comment.comment_no }');">
						            </div>
						            <c:if test="${comment.nick_name == sessionScope.nickname}">
						            	<div class="checkCommentUpDelBtnDiv" style="float: right;">
						                    <input type="button" value="수정" class="checkCommentUpBtn" onclick="updateCommentOfComment('${ status.index }', '${ comment.comment_no }');">
						                	<input type="button" value="삭제" class="checkCommentDelBtn" onclick="deleteCommentOfComment('${ status.index }', '${ comment.comment_no }');">
						                </div>
						            </c:if>
					            </div>
					            <div id="trCommentOfComment${ comment.comment_no }" class="trCommentOfComment" style="display: none;">
									<div>
										<input type="hidden" name="nick_name" class="nick_name" id="nick_name${ status.index }" value="<%= session.getAttribute("nickname") %>">
										<input type="text" name="content" class="content" id="content${ status.index }" style="width: 700px;">
									</div>
									<div>
										<c:if test="${comment.content != '삭제된 댓글입니다.'}">
											<input type="button" value="쓰기" class="checkCommentRegBtn" onclick="insertCommentOfComment('${ status.index }', '${ comment.comment_no }');">
										</c:if>							
									</div>
								</div>
					    	</c:if>
				        </div>
			        </div>
			    </div>
			</c:forEach>
			
			<%-- <table align="center" cellpadding="7" style="margin-top: 20px;">
				<c:forEach var="comment" items="${ requestScope.freeBoardDetailCommentList }" varStatus="status">
					<tr>
						<td style="background-color:rgba(197, 146, 70, 0.4); color: #000000;">
							${ comment.nick_name } (${ comment.reg_date })
							<br>
							<c:forEach var="n" begin="1" end="${ comment.print_level }">
								&nbsp;&nbsp;
							</c:forEach>
	
							<c:if test="${ comment.print_level > 0 }">
								▶
							</c:if>
							${ comment.content }
						</td>
						<td>
							<c:if test="${comment.content != '삭제된 댓글입니다.'}">
								<input type="button" value="답글" onclick="showOrHideCommentOfComment('trCommentOfComment${ comment.comment_no }');">
							</c:if>
						</td>
					</tr>
					<tr id="trCommentOfComment${ comment.comment_no }" class="trCommentOfComment" style="display: none;">
						<td>
							<!-- value="홍길동${ status.index }" value="안녕하세요${ status.index }"-->
							<input type="hidden" name="nick_name" class="nick_name" id="nick_name${ status.index }" value="<%= session.getAttribute("nickname") %>">
							<input type="text" name="content" class="content" id="content${ status.index }" >
						</td>
						<td>
							<c:if test="${comment.content != '삭제된 댓글입니다.'}">
								<input type="button" value="쓰기" onclick="insertCommentOfComment('${ status.index }', '${ comment.comment_no }');">
								<c:if test="${comment.nick_name == sessionScope.nickname}">
									<input type="button" value="수정" onclick="updateCommentOfComment('${ status.index }', '${ comment.comment_no }');">
									<input type="button" value="삭제" onclick="deleteCommentOfComment('${ status.index }', '${ comment.comment_no }');">
								</c:if>
							</c:if>							
						</td>
					</tr>						
				</c:forEach>
			</table> --%>
		</c:if>		
			
	</div>
	
	<div class="communityFreeBoardCommentPaging">
		<c:if test="${ !empty requestScope.freeBoardDetailCommentList }">		
			<span class="pagingNos">
				<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.pageMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
				<c:forEach var="pageNo" begin="${requestScope.pageMap.begin_pageNo}" end="${requestScope.pageMap.end_pageNo}">
					<c:if test="${requestScope.pageMap.selectPageNo==pageNo}">
			            <p class="activePageNo">${pageNo}</p>
			        </c:if>
					<c:if test="${requestScope.pageMap.selectPageNo!=pageNo}">
						<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
					</c:if>
				</c:forEach>
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.pageMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
				<%-- <span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span> --%>
			</span>
		</c:if>
	</div>
	<form name="commentOfCommentForm" id="commentOfCommentForm">
		<input type="hidden" name="nick_name" class="nick_name">
		<input type="hidden" name="content" class="content">
		<input type="hidden" name="selectPageNo" class="selectPageNo">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="10">
		<input type="hidden" name="b_no" value="${ requestScope.detailDTO.b_no }">
		<input type="hidden" name="comment_no" class="comment_no">			
	</form>
	
	<form name="commentPageForm" id="commentPageForm">
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" >
		<input type="hidden" name="b_no" value="${ requestScope.detailDTO.b_no }">
	</form>
	
	<form name="freeBoardDetailForm" id="freeBoardDetailForm" action="/communityFreeBoardUpDelForm.do" method="post">
		<input type="hidden" name="nick_name" class="nick_name">
		<input type="hidden" name="content" class="content">
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="0">
		<input type="hidden" name="b_no" class="b_no" value="0">
		<input type="hidden" name="comment_no" class="comment_no" value="0">			
	</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>