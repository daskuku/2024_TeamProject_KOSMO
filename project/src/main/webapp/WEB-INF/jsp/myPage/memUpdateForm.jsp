<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFormTitle</title>
<link href="/style/memberUpdateFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>


<script>
function memUpdate()
{
	
	var formobj = $("[name='memRegForm']");
	var pwdobj = $(".password");
	var checkpwdobj = $(".checkpwd");
	var emailObj = $(".email");
	var nicknameObj = $(".nickname");
	var phone1Obj = $(".phone1");
	var phone2Obj = $(".phone2");
	var phone3Obj = $(".phone3");
	var addressObj = $(".detail_address")
	
	if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false)
	{
		alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내")
		pwdobj.val("");
		return;		
	}
	
	
	if(pwdobj.val() != checkpwdobj.val())
	{
		alert("암호와 암호확인 문자가 동일하지 않습니다.")
		return;		
	}
	
	if(new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/).test(emailObj.val()) == false)
	{
		alert("올바른 이메일 형식을 입력해주세요");
		emailObj.val("");
		return;
	}
	
	if(new RegExp(/^[가-힣a-zA-Z0-9]{2,15}$/).test(nicknameObj.val()) == false)
	{	
		alert("닉네임은 2~15자 특수문자를 제외한 한글,영어,숫자로만 입력 가능합니다.");
		nicknameObj.val("");
		return;
	}
	
	if(new RegExp(/^[a-zA-Z가-힣0-9\s]+$/).test(addressObj.val()) == false)
	{	
		alert("잘못된 주소형식입니다.");
		addressObj.val("");
		return;
	}

	if(new RegExp(/^[0-9]{3}$/).test(phone1Obj.val()) == false)
	{	
		alert("잘못된 전화번호형식입니다.");
		phone1Obj.val("");
		return;
	}
	
	if(new RegExp(/^[0-9]{4}$/).test(phone2Obj.val()) == false)
	{	
		alert("잘못된 전화번호형식입니다.");
		phone2Obj.val("");
		return;
	}
	
	if(new RegExp(/^[0-9]{4}$/).test(phone3Obj.val()) == false)
	{	
		alert("잘못된 전화번호형식입니다.");
		phone3Obj.val("");
		return;
	}
	
	$.ajax({
		//----------------------------------------------------------
		//WAS 에 접속할 URL 주소 지정
		//----------------------------------------------------------
		url   : "/memUpdateProc.do" 
		//----------------------------------------------------------
		//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
		//----------------------------------------------------------
		,type : "post"
		//----------------------------------------------------------
		//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
		//----------------------------------------------------------
		,data : formobj.serialize()
		//----------------------------------------------------------
		//WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
		//이때, 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
		//----------------------------------------------------------
			//--------------------------
			//WAS 의 응답물이
			//1행1열의 데이터라면 숫자 or 문자로 들어오고
			//1행n열의 데이터라면 JSON 으로 들어오고
			//n행1열의 데이터라면 Array 으로 들어오고
			//n행m열의 데이터라면 다량의 JSON 이 저장된 Array 객체로 들어온다.
			//--------------------------
			
		,success : function(json){
			var result = json["result"];
			if(result == 1)
			{
				alert("정보 수정 성공. 다시 로그인 해주세요");
				location.href='/logoutProc.do';
			}

			else
			{
				alert("정보 수정 실패, 관리자에게 문의 바람");
				
			}
			
		}			
		,error 	 : function(){alert("수정 실패 / 관리자에게 문의 바람");}
		
	}) 
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="memberUpdateTitle">
		<p class="titleBackgoundText">회원정보수정</p>
	</div>
	
	<form name="memRegForm">
		<table class="memberUpdateFormTable" align="center" style="margin-bottom: 10px; margin-top: 10px;">
			<tr>
				<th class="memberRegFormMidTh">아이디</th>
				<td>
					${requestScope.memberDTO.mid}
				</td>
			</tr>
			<tr>
				<th class="memberRegFormNameTh">이름</th>
				<td>
					${requestScope.memberDTO.name}
				</td>
			</tr>	
			<tr>
				<th class="memberRegFormPasswordTh">비밀번호</th>
				<td>
					<input type="password" name="password" class="password" size="40" maxlength="30" value="${requestScope.memberDTO.password}">
				</td>
			</tr>
			<tr>
				<th class="memberRegFormPasswordCheckTh">비밀번호 확인</th>
				<td>
					<input type="password" name="checkpwd" class="checkpwd" size="40" maxlength="30" value="${requestScope.memberDTO.password}">
				</td>
			</tr>
			<tr>
				<th class="memberRegFormNicknameTh">닉네임</th>
				<td>
					<input type="text" name="nickname" class="nickname" size="40" maxlength="30" value="${requestScope.memberDTO.nickname}">
				</td>
			</tr>
			<tr>
				<th class="memberRegFormEmailTh">이메일</th>
				<td>
					<input type="email" name="email" class="email" size="40" maxlength="100" value="${requestScope.memberDTO.email}">
				</td>
			</tr>
			<tr>
				<th class="memberRegFormPhoneTh">전화번호</th>
				<td>
					<input type="tel" name="phone1" class="phone1" size="3" maxlength="3" value="${requestScope.memberDTO.phone1}">-<input type="tel" name="phone2" class="phone2" size="3" maxlength="4" value="${requestScope.memberDTO.phone2}">-<input type="tel" name="phone3" class="phone3" size="3" maxlength="4" value="${requestScope.memberDTO.phone3}">
				</td>
			</tr>
			
			<tr>
				<th class="memberRegFormRegionTh">주소</th>
				<td colspan="5" align="center"> ${requestScope.memberDTO.sido} ${requestScope.memberDTO.sigungu} -> (수정)
		            <select name="sido_id" id="sido_id" onchange="categoryChange(this)">
		              <option value="0">시/도 선택</option>
		              <option value="1">강원</option>
		              <option value="2">경기</option>
		              <option value="3">경남</option>
		              <option value="4">경북</option>
		              <option value="5">광주</option>
		              <option value="6">대구</option>
		              <option value="7">대전</option>
		              <option value="8">부산</option>
		              <option value="9">서울</option>
		              <option value="10">울산</option>
		              <option value="11">인천</option>
		              <option value="12">전남</option>
		              <option value="13">전북</option>
		              <option value="14">제주</option>
		              <option value="15">충남</option>
		              <option value="16">충북</option>
		            </select>
		            <select name="sigungu_id" id="state">
		              <option value ="0">군/구 선택</option>
		            </select>
				</td>
			</tr>
			 <tr>
				<th class="memberRegFormAdressTh">상세주소</th>
				<td>
					<input type="text" name="detail_address" class="detail_address" size="40" maxlength="50" value="${requestScope.memberDTO.detail_address}">
				</td>
			</tr> 
		</table>
		<div class="upConfirmBtnDiv">
			<input type="button" class="upConfirmBtn" value="수정하기" onclick="memUpdate()" style="cursor:pointer;">
			<input type="button" class="moveLoginPage" value="메인 화면" onclick="location.href='/mainForm.do'" style="cursor:pointer;">
		</div>
		<input type="hidden" name="mid" value="${requestScope.memberDTO.mid}">
	</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>