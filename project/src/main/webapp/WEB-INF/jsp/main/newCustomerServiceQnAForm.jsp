<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewCustomerServiceQnAForm</title>
<link href="/style/main/newCustomerServiceQnAFormStyle.css" rel="stylesheet">
<!-- <script src="/js/main/newCustomerServiceQnAFormScript.js"></script> -->
<script>
	function checkQnABoardRegForm(){
	
		var formObj = $("[name='newCustomerServiceQnAForm']");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");
		
		var sessionPwd = "<%= session.getAttribute("password") %>";
		
		if(new RegExp(/^.{2,100}$/).test(subjectObj.val())==false){
			alert("제목은 2~100자 한글입니다.");
			subjectObj.val("");
			return;
		}
		
		if (contentObj.val().trim().length==0||contentObj.val().trim().length>1000){
			alert("내용은 1~1000자 입력해야 합니다.");
			contentObj.val("");
			return;
		}
		
	    function checkPwd() {
	    	var pwdInsert = prompt("계정 비밀번호를 입력해주세요.");
	    	
	    	//alert(formObj.serialize());
			
			if (pwdInsert == null) { 
		        return;
		    }
			
	        if (sessionPwd != pwdInsert) {
	        	
	            alert("계정 비밀번호를 정확히 입력해주세요.");
	            
	            checkQnABoardRegForm();
	            
	        } else {
	            if(confirm("작성하시겠습니까?") == true){
	            	$.ajax({
	        			
	    				url:"/QnABoardRegProc.do",
	    					
	    				type:"post",
	    					
	    				data:formObj.serialize(),
	    					
	    				success:function(json){
	    					var result = json["result"];
	    					
	    					if(result == 1){
	    						alert("작성 성공");
	    						location.href = '/customerServiceForm.do';
	    					} else {
	    						alert("작성 실패");
	    					}
	    				},
	    				
	    				error:function(){"작성 실패"}
	    			})
	            }
	        }
		}

	    checkPwd();
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newCustomerServiceQnAFormTitle">
	   	<p class="titleBackgoundText">QnA 등록</p>
 	</div>
    <div class="newCustomerServiceQnAFormContainer">
		<form name="newCustomerServiceQnAForm">
			<table class="newCustomerServiceQnAFormRegTable" align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
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
						<input type="hidden" name="writer" class="writer" value="<%= session.getAttribute("nickname") %>">
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">이메일</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<% out.println((String)session.getAttribute("email")); %>
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<textarea name="content" class="content" rows="20" cols="118" maxlength="1000" style="resize:none; padding: 5px 15px;"></textarea>
					</td>
				</tr>
			</table>
			<div class="newCustomerServiceQnAFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkQnABoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/customerServiceForm.do')">
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>