<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html><html>
<head>
	<meta charset="UTF-8">
	<title>communityGallaryUpDelForm</title>
	<link href="/style/community/communityNoticeBoardFormStyle.css" rel="stylesheet">
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
				url : "/adminCommunityGallaryUpProc.do",
				type : "post",
				data : formObj.serialize(),
				success : function(json) {
					var result = json["result"];
					
					if (result == 0) {
						alert("관리자 삭제된 갤러리 입니다.");
						location.href = "/adminGallaryForm.do";
					} else {
						alert("관리자 갤러리 수정 성공입니다.");
						location.href = "/adminGallaryForm.do";
					}
				},
				error : function() {
					alert("관리자 수정 실패! 관리자에게 문의 바랍니다.");
				}
			});
		}
	
		function checkBoardDelForm() {
			var formObj = $("[name='communityGallaryUpDelForm']");
			
			if (confirm("정말 삭제하시겠습니까?") == false) {
				return;
			}
			
			$.ajax({
				url : "/adminCommunityGallaryDelProc.do",
				type : "post",
				data : formObj.serialize(),
				success : function(json) {
					var result = json["result"];
					if (result == 0) {
						alert("관리자 삭제된 갤러리입니다.");
						location.href = "/adminGallaryForm.do";
					} else {
						alert("관리자 갤러리 삭제 성공입니다.");
						location.href = "/adminGallaryForm.do";
					}
				},
				error : function() {
					alert("관리자 삭제 실패! 관리자에게 문의 바랍니다.");
				}
			});
		}
	</script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">갤러리</p>
	</div>
	
   	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
   	
	<form name="communityGallaryUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7 style="border-collpase: collpase">
			<caption>[갤러리 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td>${requestScope.communityDTO.nickname}</td>
			<tr>
				<th bgColor="lightgray">제 목</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.communityDTO.subject}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">조회수</th>
				<td>${requestScope.communityDTO.readcount}</td>
			</tr>

			<tr>
				<th bgColor="lightgray">내 용</th>
				<td>
					<textarea name="content" class="content" rows="13" cols="40" maxlength="500">${requestScope.communityDTO.content}</textarea>
			</tr>

		</table>
		<input type="hidden" name="b_no" value="${requestScope.communityDTO.b_no}">
	</form>

	<div style="height: 5px"></div>
	
	<center>
		<span style="cursor: pointer" onclick="location.replace('/adminGallaryForm.do')">[목록화면으로]</span>
	</center>
	
	<center>
		<input type="button" value="수정" onclick="checkBoardUpForm();">
		<input type="button" value="삭제" onclick="checkBoardDelForm();">
	</center>

</body>
</html>