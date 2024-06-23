<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminNoticeBoardUpDelForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>




<script>
	function checkNoticeBoardUpForm() {

		var formObj = $("[name='adminNoticeboardUpDelForm']");
		var writerObj = formObj.find(".writer");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");
		
		if (subjectObj.val().trim() == "") {
	        alert("제목을 입력해주세요");
	        return;
	    }
	    
	    if (contentObj.val().trim().length == 0) {
	        alert("내용을 1자 이상 입력해주세요.");
	        contentObj.val("");
	        return;
	    }
		
		
		
		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/adminNoticeboardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 공지사항입니다.");
					location.href = "/adminNoticeBoardForm.do";
				} else {
					alert("공지사항 수정 성공입니다.");
					location.href = "/adminNoticeBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkNoticeBoardDelForm() {
		var formObj = $("[name='adminNoticeboardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/adminNoticeboardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 공지사항입니다.");
					location.href = "/adminNoticeBoardForm.do";
				} else {
					alert("공지사항 삭제 성공입니다.");
					location.href = "/adminNoticeBoardForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>
<style>
	#nav-item-notice{
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
		
		<p class="titleBackgoundText">공지사항 수정</p>
	</div>
	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>

	<form name="adminNoticeboardUpDelForm">
		<table align="center" cellpadding=7
			style="border-collpase: collpase; margin: 0 auto; margin-top: 50px; width: 1000px; height: 400px; margin-left: 470px;">
			<tr>
				<th style="width: 80px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">글쓴이</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="writer" class="writer" size="103"
					maxlength="15" value="${requestScope.communityDTO.writer}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th style="width: 80px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="subject" class="subject" size="103"
					maxlength="30" value="${requestScope.communityDTO.subject}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th style="width: 80px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">조회수</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.communityDTO.readcount}</td>
			</tr>
			<tr>
				<th style="width: 80px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">등록일</th>
				<td style="border-bottom: 1px solid #c59246e0;">${requestScope.communityDTO.reg_date}</td>
			</tr>
			<tr>
				<th style="width: 80px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">내용</th>
				<td style="border-bottom: 1px solid #c59246e0;"><textarea name="content" class="content" rows="20"
						cols="105" maxlength="500" style="border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px; resize: none; height: 300px;">${requestScope.communityDTO.content}
            </textarea>
			</tr>

		</table>
		<input type="hidden" name="b_no"
			value="${requestScope.communityDTO.b_no}">
	</form>
	<div class="adminMemberUpDel" style="text-align: center; margin-top: 20px; padding-bottom: 100px;">
		<input type="button" value="수정" class="adminMemberUpBtn" style="cursor:pointer" onclick="checkNoticeBoardUpForm();">
		<input type="button" value="삭제" class="adminMemberDelBtn" style="cursor:pointer" onclick="checkNoticeBoardDelForm();">
		<input type="button" value="목록" class="adminMemberMoveBtn" onclick="location.replace('/adminNoticeBoardForm.do')">
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>