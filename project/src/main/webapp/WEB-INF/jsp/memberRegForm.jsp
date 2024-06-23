<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberRegForm</title>
<link href="/style/memberRegFormStyle.css" rel="stylesheet">


<script>


loginCheckCnt = 0;

function checkmid()
{
	var midobj = $(".mid");
	if(midobj.val().trim() == '') {
        alert("아이디를 입력해주세요.");
        midobj.val("");
        return;
    }
	
	if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(midobj.val()) == false)
	{	

		alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다./5~20자 이내")
		midobj.val("");
		return;
	}
	
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 비동기방식으로 "/boardRegProc.do" 주소로 접속하고 
	// 게시판 입력 결과를 받아서
	// 성공했으면 경고하고 게시판 목록화면으로 이동하고
	// 실패했으면 경고하기
	//-----------------------------------------------------
	$.ajax({
		//----------------------------------------------------------
		//WAS 에 접속할 URL 주소 지정
		//----------------------------------------------------------
		url   : "/midFindProc.do" 
		//----------------------------------------------------------
		//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
		//----------------------------------------------------------
		,type : "post"
		//----------------------------------------------------------
		//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
		//----------------------------------------------------------
		,data : midobj.serialize()
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
			
		,success : function(memberCnt){
			if(memberCnt == 1)
			{
				alert("중복된 아이디입니다.");
				midobj.val("");
			}
			

			else
			{
				alert("가입 가능한 아이디입니다.");
				loginCheckCnt++;
			}
			
		}			
		,error 	 : function(){alert("입력 실패 / 관리자에게 문의 바람");}
		
	})
}



function regMember()
{

	var midobj = $(".mid");
	var pwdobj = $(".password");
	var checkpwdobj = $(".checkpwd");
	var nameobj = $(".name");
	var emailObj = $(".email");
	var nicknameObj = $(".nickname");
	var phone1Obj = $(".phone1");
	var phone2Obj = $(".phone2");
	var phone3Obj = $(".phone3");
	var addressObj = $(".detail_address")
	var formobj = $("[name='memRegForm']")
	
	
	
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
	
	if(new RegExp(/^[가-힣]{2,15}$/).test(nameobj.val()) == false)
	{	
		alert("이름은 2~15자의 한글이어야 합니다.");
		nameobj.val("");
		return;
	}
	
	if(new RegExp(/^[가-힣a-zA-Z0-9]{2,15}$/).test(nicknameObj.val()) == false)
	{	
		alert("닉네임은 2~15자 특수문자를 제외한 한글,영어,숫자로만 입력 가능합니다.");
		nicknameObj.val("");
		return;
	}
	
	if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(midobj.val()) == false)
	{	

		alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다./5~20자 이내")
		midobj.val("");
		return;
	}
	
	
	if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false)
	{
		alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내")
		pwdobj.val("");
		return;		
	}
	
	if(new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/).test(emailObj.val()) == false)
	{
		alert("올바른 이메일 형식을 입력해주세요");
		emailObj.val("");
		return;
	}
	
	
	if(pwdobj.val() != checkpwdobj.val())
	{
		alert("암호와 암호확인 문자가 동일하지 않습니다.")
		return;		
	}
	
	if(loginCheckCnt == 0)
	{
		alert("아이디 중복확인 해주세요")
		return;
	}
	else if(loginCheckCnt == 1)
	{
		loginCheckCnt--;
	}
	
	
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 비동기방식으로 "/boardRegProc.do" 주소로 접속하고 
	// 게시판 입력 결과를 받아서
	// 성공했으면 경고하고 게시판 목록화면으로 이동하고
	// 실패했으면 경고하기
	//-----------------------------------------------------
	$.ajax({
		//----------------------------------------------------------
		//WAS 에 접속할 URL 주소 지정
		//----------------------------------------------------------
		url   : "/memberRegProc.do" 
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
				alert("회원가입 성공.");
				location.href='/loginForm.do';
			}

			else
			{
				alert("모든 입력란을 채워주셔야합니다.");
				
			}
			
		}			
		,error 	 : function(){alert("가입 실패 / 관리자에게 문의 바람");}
		
	})
}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="memberRegFormContainer">
    	<div class="memberRegTitle">
    		<p>회원가입</p>
    	</div>
		<form name="memRegForm">
			<table class="memberRegFormTable" align="center" style="margin-bottom: 10px; margin-top: 10px;">
				<tr>
					<th class="memberRegFormMidTh">아이디</th>
					<td>
						<input type="text" name="mid" class="mid" size="27" maxlength="30" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
						<input type="button" onclick="checkmid()" value="중복 확인" style="width: 100px; height: 35px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-left: 10px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormNameTh">이름</th>
					<td>
						<input type="text" name="name" class="name" size="40" maxlength="30" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormPasswordTh">비밀번호</th>
					<td>
						<input type="password" name="password" class="password" size="40"  maxlength="30" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormPasswordCheckTh">비밀번호 확인</th>
					<td>
						<input type="password" name="checkpwd" class="checkpwd" size="40" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormNicknameTh">닉네임</th>
					<td>
						<input type="text" name="nickname" class="nickname" size="40" maxlength="30" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormEmailTh">이메일</th>
					<td>
						<input type="text" name="email" class="email" size="40" maxlength="100" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormBirthdayTh">생년월일</th>
					<td>
						<input type="date" name="birthday" class="birthday" size="40" maxlength="30" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormPhoneTh">전화번호</th>
					<td>
						<input type="tel" name="phone1" class="phone1" size="3" maxlength="3" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">-<input type="tel" name="phone2" class="phone2" size="3" maxlength="4" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">-<input type="tel" name="phone3" class="phone3" size="3" maxlength="4" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th class="memberRegFormGenderTh">성별</th>
					<td>
						<label style="margin-right: 50px;">
				            <input type="radio" name="gender" class="gender" value="남" style="zoom:1.5; margin-right: 10px; vertical-align: middle;">남
				        </label>
				        <label>
				            <input type="radio" name="gender" class="gender" value="여" style="zoom:1.5; margin-right: 10px; vertical-align: middle;">여
				        </label>
					</td>
				</tr>
				<tr>
					<th class="memberRegFormRegionTh">주소</th>
					<td colspan="5">
			            <select name="sido_id" id="" onchange="categoryChange(this)" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
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
			            <select name="sigungu_id" id="state" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
			              <option value ="0">군/구 선택</option>
			            </select>
					</td>
				</tr>
				<tr>
					<th class="memberRegFormAdressTh">상세주소</th>
					<td>
			           <input type="text" name="detail_address" class="detail_address" size="40" maxlength="50" style="border-radius: 10px; border: 1px solid #c59246e0; height: 30px; padding: 5px 15px;">
					</td>
				</tr>
			</table>
			<div class="regConfirmBtnDiv">
				<input type="button" class="regConfirmBtn" value="회원가입" onclick="regMember()">
				<input type="button" class="moveLoginPage" value="로그인 화면" onClick="location.replace('/loginForm.do')">
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>