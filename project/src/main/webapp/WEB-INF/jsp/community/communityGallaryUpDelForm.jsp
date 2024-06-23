<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!DOCTYPE html><html>
<head>
	<meta charset="UTF-8">
	<title>communityGallaryUpDelForm</title>
	<link href="/style/community/communityGallaryUpDelFormStyle.css" rel="stylesheet">
	<script src="/js/community/communityNoticeBoardFormScript.js"></script>

	<script>
		function checkBoardUpForm() {
	
			var formObj = $("[name='communityGallaryUpDelForm']");
			var subjectObj = formObj.find(".subject");
			var contentObj = formObj.find(".content");
			
			if (subjectObj.val().trim().length == 0) {
				alert("제목을 입력해야 합니다.");
				return;
			}
			
			if (contentObj.val().trim().length == 0) {
				alert("내용을 입력해야 합니다.");
				return;
			}
	
			if (confirm("정말수정하시겠습니까?") == false) {
				return;
			}
	
			$.ajax({
				url : "/communityGallaryUpProc.do",
				type : "post",
				data : formObj.serialize(),
				success : function(json) {
					var result = json["result"];
					
					if (result == 0) {
						alert("삭제된 갤러리 입니다.");
						location.href = "/communityGallaryForm.do";
					} else {
						alert("갤러리 수정 성공입니다.");
						location.href = "/communityGallaryForm.do";
					}
				},
				error : function() {
					alert("수정 실패! 관리자에게 문의 바랍니다.");
				}
			});
		}
	
		function checkBoardDelForm() {
			var formObj = $("[name='communityGallaryUpDelForm']");
			
			if (confirm("정말 삭제하시겠습니까?") == false) {
				return;
			}
			
			$.ajax({
				url : "/communityGallaryDelProc.do",
				type : "post",
				data : formObj.serialize(),
				success : function(json) {
					var result = json["result"];
					if (result == 0) {
						alert("삭제된 갤러리입니다.");
						location.href = "/communityGallaryForm.do";
					} else {
						alert("갤러리 삭제 성공입니다.");
						location.href = "/communityGallaryForm.do";
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
	<div class="communityNoticeBoardFormTitle">
		<p class="titleBackgoundText">갤러리 수정</p>
	</div>

	<form name="communityGallaryUpDelForm">
		<table align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="subject" class="subject" size="115"
					maxlength="30" value="${requestScope.communityDTO.subject}" style="padding: 5px 15px;"></td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.communityDTO.nickname}</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<textarea name="content" class="content" rows="20" cols="118" maxlength="500" style="resize: none; padding: 5px 15px;">${requestScope.communityDTO.content}</textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="b_no" value="${requestScope.communityDTO.b_no}">
	</form>
	<div class="gallaryUpDelBtnDiv">
		<div class="moveListBtnDiv">
			<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/communityGallaryForm.do')">
		</div>
		<div class="boardRegAndMoveList">
			<input type="button" class="checkBoardUpBtn" value="수정" onClick="checkBoardUpForm();">
			<input type="button" class="checkBoardDelBtn" value="삭제" onClick="checkBoardDelForm();">
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>