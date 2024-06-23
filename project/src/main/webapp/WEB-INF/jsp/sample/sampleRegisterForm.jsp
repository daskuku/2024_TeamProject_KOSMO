<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html><html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
	<title>새 글쓰기</title>
	
	<script>
	
		function checkSampleRegisterForm() {
			
			var formObj = $("[name='sampleRegisterForm']");
	
			var writerObj = formObj.find(".writer");
			var subjectObj = formObj.find(".subject");
			var emailObj = formObj.find(".email");
			var contentObj = formObj.find(".content");
			var pwdObj = formObj.find(".pwd");
			
			if (new RegExp(/^[가-힣]{2,15}$/).test(writerObj.val()) == false) {
				alert("작성자는 2~15자 한글이어야 합니다.");
				writerObj.val("");
				return;
			}
	
			if (new RegExp(/^.{2,30}$/).test(subjectObj.val()) == false) {
				alert("제목은 임의 문자 2~30자 입력해야 합니다.");
				subjectObj.val("");
				return;
			}
	
			if (new RegExp(
					/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/)
					.test(emailObj.val()) == false) {
				alert("이메일 형식이 아닙니다. 재입력 바랍니다.");
				emailObj.val("");
				return;
			}
	
			if (contentObj.val().trim().length == 0
					|| contentObj.val().trim().length > 500) {
				alert("내용은 임의 문자 1~500자 입력해야 합니다.");
				return;
			}
	
			if (pwdObj.val().trim().length == 0) {
				alert("암호를 입력하십시요");
				pwdObj.val("");
				return;
			}
	
			if (confirm("정말 입력 하시겠습니까?") == false) {
				return;
			}
	
			$.ajax({
				url : "/sampleRegisterProcedure.controller",
				type : "post",
				data : formObj.serialize(),
				success : function(json) {
					var result = json["result"];
	
					if (result == 1) {
						alert("게시판 입력 성공입니다.");
						location.replace('/sampleList.controller');
					} else {
						alert("게시판 입력 실패입니다. 관리자에게 문의 바람!");
					}
				},
				error : function() {
					alert("입력 실패! 관리자에게 문의 바랍니다.");
				}
			});
			
		}
		
	</script>
	
</head>

<body>
	<form name="sampleRegisterForm">
		<c:if test="${ empty param.b_no }">
			<input type="hidden" name="b_no" value="0">
		</c:if>
		
		<c:if test="${ !empty param.b_no }">
			<input type="hidden" name="b_no" value="${ param.b_no }">
		</c:if>

		<table border="1" bordercolor="gray" align="center" cellpadding="7">
			<c:if test="${ empty param.b_no }">
				<caption>[새글 쓰기]</caption>
			</c:if>
			
			<c:if test="${ !empty param.b_no }">
				<caption>[댓글 쓰기]</caption>
			</c:if>
			
			<tr>
				<th>이 름</th>
				<td><input type="text" name="writer" class="writer" size="10"
					maxlength="15"></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" class="email" size="40"
					maxlength="50"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name="content" class="content" rows="13"
						cols="40" maxlength="500"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" class="pwd" size="8"
					maxlength="4"></td>
			</tr>
		</table>

		<div style="height: 5px;"></div>

		<center>
			<input type="button" value="저장" onClick="checkSampleRegisterForm();">
			<input type="reset" value="다시작성"> <span
				style="cursor: pointer" onClick="location.replace('/sampleList.controller');">[목록보기]</span>
		</center>
	</form>
</body>
</html>