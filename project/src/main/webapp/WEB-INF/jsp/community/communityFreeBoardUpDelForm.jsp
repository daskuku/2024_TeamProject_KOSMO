<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<c:if test="${requestScope.communityDTO.writer != sessionScope.m_no}">
	<script>
		alert("작성한 사용자가 아닙니다");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityFreeBoardUpDelForm</title>
<link href="/style/community/communityFreeBoardUpDelFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>


<script>
	function checkBoardUpForm() {
		
		var formObj = $("[name='communityFreeBoardUpDelForm']");
		var writerObj = formObj.find(".writer");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");
		
		var subject = $(".subject").val();
		var content = $(".content").val();
		
		if (subject.trim().length == 0) {
			alert("제목을 입력해야 합니다.");
			return;
		}
		
		if (content.trim().length == 0) {
			alert("내용을 입력해야 합니다.");
			return;
		}
		
		var serialize = formObj.serialize();
		
		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/communityFreeBoardUpdateProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/communityFreeBoardForm.do";
				} else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/communityFreeBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkBoardDelForm() {
		var formObj = $("[name='communityFreeBoardUpDelForm']");
		var serialize = formObj.serialize();
		
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/communityFreeBoardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/communityFreeBoardForm.do";
				} 
				else if (result == -1) {
					alert("댓글이 있으면 삭제하지 못합니다.")
				}
				else {
					alert("자유게시판 삭제 성공입니다.");
					location.href = "/communityFreeBoardForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>

</head>
<body>
	
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	
	<div class="communityFreeBoardFormTitle">
		<p class="titleBackgoundText">자유게시판 수정</p>
	</div>



	<form name="communityFreeBoardUpDelForm">
		<table align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="subject" class="subject" size="113"
					maxlength="30" value="${requestScope.communityDTO.subject}" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;"></td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.communityDTO.nickname}</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<textarea name="content" class="content" rows="20" cols="115" maxlength="500" style="resize: none; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;">${requestScope.communityDTO.content}</textarea>
				</td>
			</tr>

		</table>
		<input type="hidden" name="b_no" value="${requestScope.communityDTO.b_no}">
	</form>
	<div class="freeBoardUpDelBtnDiv">
		<div class="moveListBtnDiv">
			<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/communityFreeBoardForm.do')">
		</div>
		<div class="boardRegAndMoveList">
			<input type="button" class="checkBoardUpBtn" value="수정" onClick="checkBoardUpForm();">
			<input type="button" class="checkBoardDelBtn" value="삭제" onClick="checkBoardDelForm();">
		</div>
	</div>
</body>
</html>