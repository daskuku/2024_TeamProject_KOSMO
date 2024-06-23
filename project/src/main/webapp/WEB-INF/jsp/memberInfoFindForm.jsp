<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInfoFindForm</title>
<link href="/style/memberInfoFindFormStyle.css" rel="stylesheet">
<script src="/js/main/loginFormScript.js"></script>
<script>
	function memberInfoFind(){
		
		var name = $(".name").val();
		var phone = $(".phone").val().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
		
		if(new RegExp(/^[가-힣]{2,15}$/).test(name) == false){	
			
			alert("이름은 2~15자의 한글이어야 합니다.");
			
			$(".name").val("");
			
			return;
		}
		
		if(new RegExp(/^[0-9]{11}$/).test($(".phone").val()) == false){	
			
			alert("전화번호는 '-' 를 제외하고 정확하게 입력해주세요.");
			
			$(".phone").val("");
			
			return;
		}
		
		$.ajax({
			
			url: "/memberInfoFindProc.do",
			
			type: "post",
			
			data: { name: name, phone: phone },
			
			success: function(response){
				
				if(response.success){
					
					$(".memberInfoFindFormContainer").remove();
					
					$(".memberInfoFindResultContainer").prepend(`
							<div class="memberInfoFindFormTitle">
					    		<p>회원 정보 찾기</p>
					    	</div>
							<form name="memberInfoFindResultForm">
								<input type="hidden" name="mid" class="mid" value=" ` + response.memberInfo.mid + ` ">
								<input type="hidden" name="password" class="password" value=" ` + response.memberInfo.password + ` ">
								<table class="memberInfoFindResultTable">
									<tr>
										<th class="membermemberInfoFindMidResultTh">아이디</th>
										<td class="memberInfoFindMidResult" style="text-align: left;">
											` + response.memberInfo.mid + `
										</td>
									</tr>
									<tr>
										<th class="membermemberInfoFindPasswordResultTh">새 비밀번호</th>
										<td class="memberInfoFindPasswordResult">
											<input type="password" name="pwd" class="pwd" size="50" maxlength="15" style="height: 30px; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;">
										</td>
									</tr>
									
									<tr>
										<th class="memberInfoFindPasswordCheckResultTh">비밀번호 확인</th>
										<td class="memberInfoFindPasswordCheckResult">
											<input type="password" name="checkpwd" class="checkpwd" size="50" maxlength="15" style="height: 30px; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;">
										</td>
									</tr>
								</table>
								<div class='changePwdMoveToLoginFormBtnDiv'>
									<div class='changePasswordBtnDiv'>
								        <input type='button' class='changePasswordBtn' value='비밀번호 변경' onclick="changePassword($('.mid').val(), $('.password').val())">
								    </div>
								    <div class='moveToLoginFormBtnDiv'>
								        <input type='button' class='moveToLoginFormBtn' value='로그인 화면' onclick="moveToLoginForm()">
								    </div>
								</div>
							</form>
						`);
				} else {
					alert("일치하는 회원 정보가 없습니다.")
				}
			},
			
			error: function(){alert("회원 정보 찾기 실패")}
		})
	}
	
	function moveToLoginForm(){
		location.href='/loginForm.do';
	}
	
	function changePassword(midValue, passwordValue){

		var pwd = $(".pwd");
		var checkpwd = $(".checkpwd");
		var originalPassword  = $(".password");
		var originalMid  = $(".mid");
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwd.val()) == false)
		{
			alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내");
			pwd.val("");
			return;		
		}
		
		
		if(pwd.val() != checkpwd.val())
		{
			alert("암호와 암호확인 문자가 동일하지 않습니다.");
			return;		
		}
		
		if(pwd.val().trim() == originalPassword.val().trim()){
			alert("이전 암호와 동일하게 변경할 수 없습니다.");
			return;
		}
		
		$.ajax({
			
			url   : "/changePasswordProc.do",
			
			type : "post",
			
			data : {pwd: pwd.val().trim(), mid: originalMid.val().trim()},

			success : function(json){
				
				var result = json["result"];
				
				if(result == 1) {
					alert("비밀번호 변경 성공");
					
					location.href='/loginForm.do';
					
				} else {
					alert(originalMid.val());
					alert(pwd.val());
					alert("비밀번호 변경 실패");
				}
				
			},			
			
			error : function(){
				alert(originalMid.val());
				alert(pwd.val());
				alert("비밀번호 변경 실패(error)");}
			
		})
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="memberInfoFindFormContainer">
    	<div class="memberInfoFindFormTitle">
    		<p>회원 정보 찾기</p>
    	</div>
		<form name="memberInfoFindForm" onsubmit="return false">
			<table class="memberInfoFindTable" align="center">
				<tr>
					<th class="memberInfoFindFormNameTh">이름</th>
					<td>
						<input type="text" name="name" class="name" style="width: 305px; height: 30px; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberInfoFindFormPhoneTh">전화번호</th>
					<td>
						<input type="text" name="phone" class="phone" style="width: 305px; height: 30px; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;">
					</td>
				</tr>
			</table>
			<div class="memberInfoFindFormBtn">
				<input type="button" value="회원 정보 찾기" class="memberInfoFindBtn" onclick="memberInfoFind()">
			</div>
		</form>
	</div>
	<div class="memberInfoFindResultContainer">
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
