<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMarketplaceBoardDetailForm</title>
<link href="/style/community/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>

<script>
	function checkBoardUpForm() {

		var formObj = $("[name='marketplaceboardUpDelForm']");
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
			url : "/adminMarketplaceboardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				
				if (result == 0) {
					alert("삭제된 장터 입니다.");
					location.href = "/adminMarketplaceBoardForm.do";
				} else {
					alert("관리자 장터 수정 성공입니다.");
					location.href = "/adminMarketplaceBoardForm.do";
				}
			},
			error : function() {
				alert("관리자 수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkBoardDelForm() {
		var formObj = $("[name='marketplaceboardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/adminMarketplaceBoardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("관리자 삭제된 장터입니다.");
					location.href = "/adminMarketplaceBoardForm.do";
				} else {
					alert("관리자 장터 삭제 성공입니다.");
					location.href = "/adminMarketplaceBoardForm.do";
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
		
		<p class="titleBackgoundText">장터</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<form name="marketplaceboardUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[장터 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td>${requestScope.communityDTO.nickname}</td>
			</tr>
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
				<td><textarea name="content" class="content" rows="13"
						cols="40" maxlength="500">${requestScope.communityDTO.content}
            </textarea>
			</tr>

		</table>
		<input type="hidden" name="b_no" value="${requestScope.communityDTO.b_no}">
		<input type="hidden" name="table_name" value="${requestScope.communityDTO.table_name}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/adminMarketplaceBoardForm.do')">[목록화면으로]
		</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkBoardUpForm();">
		<input type="button" value="삭제" onclick="checkBoardDelForm();">
	</center>


</body>
</html>