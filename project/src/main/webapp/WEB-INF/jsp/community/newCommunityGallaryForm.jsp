<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewCommunityGallaryForm</title>

<link href="/style/community/newCommunityGallaryFormStyle.css" rel="stylesheet">
<!-- 이전 경로에 js 파일이 없어 주석처리. 
<script src="/js/community/newCommunityGallaryFormScript.js"></script>
-->

<script>
function checkGallaryBoardRegForm(){
	
	var formObj = $("[name='newCommunityGallaryForm']");
	
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
	
	
	
	$.ajax(
			{ 
				
				url    : "/communityGallaryProc.do"
					
				,type  : "post"
				
				,data  : serialize
				
				,success : function(json){
					var result = json["result"];
					if(result==1){
						alert("갤러리 등록 성공 입니다.");
						location.replace("/communityGallaryForm.do")
					}
					else{
						alert("갤러리 등록 실패입니다!");
					}
				}
				
				,error : function(){
					alert("갤러리 실패! 관리자에게 문의 바랍니다.");
				}
			}
		);
	
}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newCommunityGallaryFormTitle">
    	<p class="titleBackgoundText">갤러리 등록</p>
    </div>
    <div class="newCommunityGallaryFormContainer">
		<form name="newCommunityGallaryForm"> 
			<table class="newCommunityGallaryFormRegTable" align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<input type="text" name="subject" class="subject" size="115" maxlength="100" style="padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<% out.println((String)session.getAttribute("nickname")); %>
						<input type="hidden" name="writer" class="writer" size="40" maxlength="15" value="<%= session.getAttribute("nickname") %>">
						<input type="hidden" name="nickname" class="nickname" size="40" maxlength="15" value="<%= session.getAttribute("nickname") %>">
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<textarea name="content" class="content" rows="20" cols="118" maxlength="1000" style="resize:none; padding: 5px 15px;"></textarea>
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">파일 첨부</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<input type="file" name="imageFileAdd" class="imageFileAdd" accept="image/*" multiple>				
					</td>
				</tr>
				<!-- 
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40" maxlength="4">
					</td>
				</tr>
				 -->
			</table>
			<div class="newCommunityGallaryFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkGallaryBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/communityGallaryForm.do')">
				</div>
			</div>
		</form>
	</div>
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>