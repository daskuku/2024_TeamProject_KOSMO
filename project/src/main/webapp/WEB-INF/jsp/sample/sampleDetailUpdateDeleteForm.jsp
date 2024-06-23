<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
	
<!DOCTYPE html><html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
		<title>수정/삭제</title>
		
		<script>
		
			function checkSampleUpdateForm() {
				
				var formObj = $("[name='sampleDetailUpdateDeleteForm']");
				var writerObj = formObj.find(".writer");
				var subjectObj = formObj.find(".subject");
				var emailObj = formObj.find(".email");
				var contentObj = formObj.find(".content");
				var pwdObj = formObj.find(".pwd");
				
				if ( new RegExp(/^[가-힣]{2,15}$/).test( writerObj.val( ) ) == false ) {
					alert( "작성자는 2~15자 한글이어야 합니다." );
					writerObj.val("");
					return;
				}
				 
				if ( new RegExp(/^.{2,30}$/).test( subjectObj.val( ) ) == false ) {
					alert( "제목은 임의 문자 2~30자 입력해야 합니다." );
					subjectObj.val("");
					return;
				}
				
				if ( new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/).test( emailObj.val( ) ) == false ) {
					alert( "이메일 형식이 아닙니다. 재입력 바랍니다." );
					emailObj.val("");
					return;
				}
		
				if ( contentObj.val().trim().length == 0 || contentObj.val().trim().length > 500 ) {			
					alert( "내용은 임의 문자 1~500자 입력해야 합니다." );
					return;
				}
		
				if ( pwdObj.val( ).trim().length == 0 ) {
					alert( "암호를 입력하십시요" );
					pwdObj.val("");
					return;
				}	
				
				if ( confirm("정말 수정 하시겠습니까?") == false ) { return; }
				
				$.ajax( {
						url : "/sampleDetailUpdateProcedure.controller"
					,	type : "post"
					,	data : formObj.serialize( )
					,	success : function(json) {
							var result = json["result"];
							
							if ( result == -1 ) {
								alert("암호가 틀립니다.");
								pwdObj.val("");
							}
							else if ( result == 0 ) {
								alert("삭제된 게시판 입니다.");
								location.replace('/sampleList.controller');
							}
							else {
								alert("게시판 수정 성공입니다.");
								location.replace('/sampleList.controller');
							}
						}
					,	error : function() {
							alert("수정 실패! 관리자에게 문의 바랍니다.");
						}
				} );
				
			}
			
			function checkSampleDeleteForm() {
				
				var formObj = $("[name='sampleDetailUpdateDeleteForm']");
				var pwdObj = formObj.find(".pwd");
				
				if ( pwdObj.val( ).trim().length == 0 ) {
					alert( "암호를 입력하십시요" );
					pwdObj.val("");
					return;
				}	
				
				if ( confirm("정말 삭제 하시겠습니까?") == false ) { return; }
				
				$.ajax( {
						url : "/sampleDetailDeleteProcedure.controller"
					,	type : "post"
					,	data : formObj.serialize( )
					,	success : function(json) {
							var result = json["result"];
							
							if ( result == -1 ) {
								alert("암호가 틀립니다.");
								pwdObj.val("");
							}
							else if ( result == 0 ) {
								alert("삭제된 게시판 입니다.");
								location.replace('/sampleList.controller');
							}
							else {
								alert("게시판 삭제 성공입니다.");
								location.replace('/sampleList.controller');
							}
						}
					,	error : function() {
							alert("삭제 실패! 관리자에게 문의 바랍니다.");
						}
				} );
				
			}
			
		</script>

</head>
<body>
	<form name="sampleDetailUpdateDeleteForm">
		<table border="1" bordercolor="gray" align="center" cellpadding="7">
			<caption>[게시판 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td>
					<input type="text" name="writer" class="writer" size="10" maxlength="15" value="${ requestScope.sampleDTO.writer }">
				</td>
			</tr>
			<tr>
				<th bgColor="lightgray">제 목</th>
				<td>
					<input type="text" name="subject" class="subject" size="40" maxlength="30" value="${ requestScope.sampleDTO.subject }">
				</td>
			</tr>
			<tr>
				<th bgColor="lightgray">조회수</th>
				<td>${ requestScope.sampleDTO.readcount }</td>
			</tr>
			<tr>
				<th bgColor="lightgray">이메일</th>
				<td>
					<input type="text" name="email" class="email" size="40" maxlength="50" value="${ requestScope.sampleDTO.email }">
				</td>
			</tr>
			<tr>
				<th bgColor="lightgray">내 용</th>
				<td>
					<textarea name="content" class="content" rows="13" cols="40" maxlength="500">${ requestScope.sampleDTO.content }</textarea>
				</td>
			</tr>
			<tr>
				<th bgColor="lightgray">비밀번호</th>
				<td>
					<input type="password" name="pwd" class="pwd" size="8" maxlength="4">
				</td>
			</tr>
		</table>
		
		<input type="hidden" name="b_no" value="${ requestScope.sampleDTO.b_no }">
	</form>
	
	<div style="height:5px;"></div>
	
	<center>
		<span style="cursor: pointer;" onclick="location.replace('/sampleList.controller')">[목록 화면으로]</span>
		<input type="button" value="수정" onclick="checkSampleUpdateForm();">
		<input type="button" value="삭제" onclick="checkSampleDeleteForm();">
	</center>
	
</body>
</html>