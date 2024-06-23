<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html><html>
<head>
	<meta charset="UTF-8">
	<title>adminCommunityFreeBoardDetailForm</title>
	<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
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
					url 	:	 "/adminCommunityFreeBoardDetailCommentList.do"
				,	type 	:	 "post"
				,	data 	:	 serialize
				,	success :	 function(responseHtml) {	ajaxSuccess(responseHtml);	}
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
					url 	:	 "/adminCommunityFreeBoardDetailCommentOfCommentInsertProc.do"
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
					url 	:	 "/adminCommunityFreeBoardDetailCommentOfCommentUpdateProc.do"
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
					url 	:	 "/adminCommunityFreeBoardDetailCommentOfCommentDeleteProc.do"
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
					url 	:	 "/adminCommunityFreeBoardDetail.do"
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
			var comment_div_filter = obj.filter(".comment_div").html();							
			$(".comment_div").html(comment_div_filter);
			
			var comment_page_div_filter = obj.filter(".comment_page_div").html();							
			$(".comment_page_div").html(comment_page_div_filter);
			
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
		
		<p class="titleBackgoundText">관리자 자유게시판</p>
	</div>
	
	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<table border="1" bordercolor="gray" align="center" cellpadding="7">
		<caption>[관리자 자유게시판 상세글 보기]</caption>
		<tr>
			<th bgColor="lightgray">글쓴이</th>
			<td>${ requestScope.freeBoardDetail.nickname }</td>
		</tr>
		<tr>
			<th bgColor="lightgray">제 목</th>
			<td>${ requestScope.freeBoardDetail.subject }</td>
		</tr>
		<tr>
			<th bgColor="lightgray">조회수</th>
			<td>${ requestScope.freeBoardDetail.readcount }</td>
		</tr>
		<tr>
			<th bgColor="lightgray">내 용</th>
			<td>
				<textarea style="border:none;" name="content" class="content" rows="13" cols="40" maxlength="500" readonly>${ requestScope.freeBoardDetail.content }</textarea>
			</td>
		</tr>
		<tr>
			<th bgColor="lightgray">댓글쓰기</th>
			<td>
				<form name="freeBoardDetailFormComment" id="freeBoardDetailFormComment" onsubmit="return false;">
					<%= session.getAttribute("nickname") %>
					<input type="hidden" name="nick_name" class="nick_name" value="<%= session.getAttribute("nickname") %>">
					<input type="text" name="content" class="content">
					<input type="button" value="댓글쓰기" onclick="comment();">
					<input type="hidden" name="b_no" value="${ requestScope.detailDTO.b_no }">
					<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
					<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="10">
				</form>		
			</td>
		</tr>
		
		<c:if test="${ !empty requestScope.sampleDetailCommentList }">
			<tr>
				<td colspan="2">[댓글]</td>
			</tr>
			
			<c:forEach var="comment" items="${ requestScope.sampleDetailCommentList }" varStatus="status">
				<tr>
					<td>${ comment.writer } (${ comment.reg_date })</td>
					<td>
						<textarea style="border:none;" rows="1" cols="40" maxlength="500" readonly>${ comment.content }</textarea>
					</td>
				</tr>
			</c:forEach>	
		</c:if>
	</table>	
	
	<div style="height:5px;"></div>
	
	<center>
		<span style="cursor: pointer" 
			onclick="location.replace('/adminFreeBoardForm.do')">
			 [목록 화면으로] 
		</span>
		
		<input type="button" value="수정/삭제" onclick="document.freeBoardDetailForm.submit();" />
		
	</center>
	
	
	<div class="comment_div">
		<c:if test="${ !empty requestScope.freeBoardDetailCommentList }">
		
			<table border="0" bordercolor="gray" align="center" cellpadding="7">
				<tr>
					<td colspan="2" width="600">[댓글]</td>
				</tr>
				
				<c:forEach var="comment" items="${ requestScope.freeBoardDetailCommentList }" varStatus="status">
					<tr>
						<td>
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
							<input type="button" value="답글" onclick="showOrHideCommentOfComment('trCommentOfComment${ comment.comment_no }');">							
						</td>
					</tr>
					<tr id="trCommentOfComment${ comment.comment_no }" class="trCommentOfComment" style="display: none;">
						<td>
							<!-- value="홍길동${ status.index }" value="안녕하세요${ status.index }"-->
							<input type="hidden" name="nick_name" class="nick_name" id="nick_name${ status.index }" value="<%= session.getAttribute("nickname") %>">
							<input type="text" name="content" class="content" id="content${ status.index }" >
						</td>
						<td>							
							<input type="button" value="쓰기" onclick="insertCommentOfComment('${ status.index }', '${ comment.comment_no }');">							
							<input type="button" value="수정" onclick="updateCommentOfComment('${ status.index }', '${ comment.comment_no }');">
							<input type="button" value="삭제" onclick="deleteCommentOfComment('${ status.index }', '${ comment.comment_no }');">														
						</td>
					</tr>						
				</c:forEach>
				
				<c:forEach var="empty_row" begin="${ requestScope.freeBoardDetailCommentListSize + 1 }" end="${ requestScope.pageMap.rowCntPerPage }">
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</c:forEach>	
			</table>
		</c:if>		
			
	</div>
	
	<div class="comment_page_div">
		<c:if test="${ !empty requestScope.freeBoardDetailCommentList }">		
			<div style="height:5px;"></div>
			<center>
				<span class="pagingNos">
					<span style="cursor:pointer;" onClick="pageNoClick( 1 );">[처음]</span>
					<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.pageMap.selectPageNo } - 1 );">[이전]</span>
					&nbsp;&nbsp;
					
					<c:forEach var="pageNo" begin="${ requestScope.pageMap.begin_pageNo }" end="${ requestScope.pageMap.end_pageNo }">
						<c:if test="${ requestScope.pageMap.selectPageNo == pageNo }">
							<span style="cursor:pointer" onClick="pageNoClick(${ pageNo });"><b><u>${ pageNo }</u></b></span>
						</c:if>
			
						<c:if test="${ requestScope.pageMap.selectPageNo != pageNo }">
							<span style="cursor:pointer" onClick="pageNoClick(${ pageNo });">[${ pageNo }]</span>
						</c:if>
					</c:forEach>
					&nbsp;&nbsp;
					
					<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.pageMap.selectPageNo } + 1 );">[다음]</span>
					<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.pageMap.last_pageNo } );">[마지막]</span>
				</span>
			</center>
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
	
	<form name="freeBoardDetailForm" id="freeBoardDetailForm" action="/adminCommunityFreeBoardUpDelForm.do" method="post">
		<input type="hidden" name="nick_name" class="nick_name">
		<input type="hidden" name="content" class="content">
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="0">
		<input type="hidden" name="b_no" class="b_no" value="0">
		<input type="hidden" name="comment_no" class="comment_no" value="0">			
	</form>
	
	<br><br><br><br><br><br><br>	

</body>
</html>