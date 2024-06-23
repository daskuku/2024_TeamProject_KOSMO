<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDetailUpDelForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<link href="/style/memberUpdateFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>




<script>
	function checkAdminMemberUpForm() {
		var formObj = $("[name='adminDetailUpDelForm']")
		var midobj = $(".mid");
		var pwdobj = $(".pwd");
		var checkpwdobj = $(".checkpwd");
		var nameobj = $(".name");
		var emailObj = $(".email");
		var nicknameObj = $(".nickname");
		var phone1Obj = $(".phone1");
		var phone2Obj = $(".phone2");
		var phone3Obj = $(".phone3");
		var addressObj = $(".detail_address")
		
		var sidoId = formObj.find("[name='sido_id']").val();
    	var sigunguId = formObj.find("[name='sigungu_id']").val();
		
		
		if(new RegExp(/^[가-힣]{2,15}$/).test(nameobj.val()) == false)
		{	
			alert("이름은 2~15자의 한글이어야 합니다.");
			//nameobj.val("");
			return;
		}
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(midobj.val()) == false)
		{	

			alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다./5~20자 이내")
			//midobj.val("");
			return;
		}
		

		if(new RegExp(/^[가-힣a-zA-Z0-9]{2,15}$/).test(nicknameObj.val()) == false)
		{	
			alert("닉네임은 2~15자 특수문자를 제외한 한글,영어,숫자로만 입력 가능합니다.");
			//nicknameObj.val("");
			return;
		}
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false)
		{
			alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내")
			//pwdobj.val("");
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
			//emailObj.val("");
			return;
		}
		
		
		
		

		if(new RegExp(/^[0-9]{3}$/).test(phone1Obj.val()) == false)
		{	
			alert("잘못된 전화번호형식입니다.");
			//phone1Obj.val("");
			return;
		}
		
		if(new RegExp(/^[0-9]{4}$/).test(phone2Obj.val()) == false)
		{	
			alert("잘못된 전화번호형식입니다.");
			//phone2Obj.val("");
			return;
		}
		
		if(new RegExp(/^[0-9]{4}$/).test(phone3Obj.val()) == false)
		{	
			alert("잘못된 전화번호형식입니다.");
			//phone3Obj.val("");
			return;
		}
		
		 if (sidoId !== "0" && (sigunguId === "0" || sigunguId === null || sigunguId === '')) {
		        alert("군구를 선택해주세요.");
		        return;
		    }
		
		
		
		
		if(formObj.find(".games_played").val() < 0 ||
				   formObj.find(".wins").val() < 0 ||
				   formObj.find(".draws").val() < 0 ||
				   formObj.find(".losses").val() < 0 ||
				   formObj.find(".goals_for").val() < 0 ||
				   formObj.find(".goals_assist").val() < 0) {
				    alert("기록은 0 미만으로 입력될 수 없습니다.");
				    return;
				}
		
		
		
	
		
// 		if(loginCheckCnt == 0)
// 		{
// 			alert("아이디 중복확인 해주세요")
// 			return;
// 		}
// 		else if(loginCheckCnt == 1)
// 		{
// 			loginCheckCnt--;
// 		}
		//alert(formObj.serialize());

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		//alert(formObj.serialize())
		
		$.ajax({
			url : "/adminMemberUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 회원입니다.");
					location.href = "/adminForm.do";
				} else {
					alert("회원정보 수정 성공입니다.");
					location.href = "/adminForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkAdiminDelForm() {
		var formObj = $("[name='adminDetailUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/adminMemberDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 회원입니다.");
					location.href = "/adminForm.do";
				} else {
					alert("회원 삭제 성공입니다.");
					location.href = "/adminForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>
<style>
	#nav-item-title{
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
	
	.divider {
		height: 770px;
		width:10px;
		border-left: 1px solid #c59246e0;
		margin-top: 15px;
		margin-left:10px;
		margin-right: -495px;
	}

	.adminPageContent {
		display: flex;
		align-items: flex-start;
	}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">회원 정보 수정</p>
	</div>

	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>

	<form name="adminDetailUpDelForm">
		<div class="adminPageContent" style="display: flex;position: relative; padding-bottom: 100px;">
		<table align="center" style="margin-bottom: 10px; margin-top: 10px; margin-right:0;">
			<tr>
				<th class="memberRegFormMidTh">이 름</th>
				<td><input type="text" name="name" class="name" size="40" maxlength="15" value="${requestScope.memberDTO.name}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th class="memberRegFormNameTh">아이디</th>
				<td><input type="text" name="mid" class="mid" size="40" maxlength="30" value="${requestScope.memberDTO.mid}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th class="memberRegFormNicknameTh">닉네임</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="nickname" class="nickname" size="40" maxlength="15" value="${requestScope.memberDTO.nickname}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th class="memberRegFormPasswordTh">비밀번호</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="password" class="pwd" size="40" maxlength="15" value="${requestScope.memberDTO.password}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th class="memberRegFormPasswordCheckTh">비밀번호 확인</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="checkpwd" class="checkpwd" size="40" maxlength="15" value="${requestScope.memberDTO.password}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th class="memberRegFormEmailTh">이메일</th>
				<td>
				<!-------------------------------------------------------->
				<input type="email" name="email" class="email" size="40" maxlength="50" value="${requestScope.memberDTO.email}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th class="memberRegFormPhoneTh">전화번호</th>
				<td>
				<!-------------------------------------------------------->
				<input type="tel" name="phone1" class="phone1" size="7" maxlength="3" value="${requestScope.memberDTO.phone1}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">-<input type="tel" name="phone2" class="phone2" size="7" maxlength="4" value="${requestScope.memberDTO.phone2}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">-<input type="tel" name="phone3" class="phone3" size="7" maxlength="4" value="${requestScope.memberDTO.phone3}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th class="memberRegFormRegionTh">주소</th>
				<td colspan="5" align="center"> ${requestScope.memberDTO.sido} ${requestScope.memberDTO.sigungu} -> (수정)
		            <select name="sido_id" id="" onchange="categoryChange(this)"  class ="sido_id">
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
		            <select name="sigungu_id" id="state" class="sigungu_id">
		              <option value ="0">군/구 선택</option>
		            </select>
				</td>
			</tr>
			<tr>
				<th class="memberRegFormRegionTh">성별</th>
				<td style="text-align: center; display: flex; align-items: center; height: 50px;">
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="gender" value="남"
						<c:if test="${requestScope.memberDTO.gender.contains ('남')}">checked</c:if> style="zoom:2.0; margin-right: 5px;">남
					</label>
					<label style="display: flex; align-items: center;">
						<input type="radio" name="gender" value="여"
						<c:if test="${requestScope.memberDTO.gender.contains ('여')}">checked</c:if> style="zoom:2.0; margin-right: 5px;">여
					</label>
				</td>
			</tr>
			 <tr>
				<th class="memberRegFormAdressTh">상세주소</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="detail_address" class="detail_address" size="40" maxlength="50" value="${requestScope.memberDTO.detail_address}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th class="memberRegFormTh">가입일</th>
				<td>${requestScope.memberDTO.reg_date}</td>
			</tr>

		</table>

<div class="divider"></div>


		<table align="center" cellpadding=7
			style="border-collpase: collpase; margin-top:10px;">
			<%-- <tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="name" class="name" size="10"
					maxlength="15" value="${requestScope.memberDTO.name}" disabled>
				</td>
			</tr> --%>
			<tr>
				<th class="memberRegFormTh">경기수</th>
				<td><input type="number" name="games_played" class="games_played"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.games_played}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th class="memberRegFormTh">승리수</th>
				<td><input type="number" name="wins" class="wins" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.wins}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>

			<tr>
				<th class="memberRegFormTh">무승부</th>
				<td><input type="number" name="draws" class="draws" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.draws}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th class="memberRegFormTh">패배수</th>
				<td><input type="number" name="losses" class="losses" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.losses}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th class="memberRegFormTh">골</th>
				<td><input type="number" name="goals_for" class="goals_for"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.goals_for}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th class="memberRegFormTh">어시스트</th>
				<td><input type="number" name="goals_assist" class="goals_assist"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.goals_assist}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>



		</table>









		<input type="hidden" name="m_no"
			value="${requestScope.memberDTO.m_no}"> <input type="hidden"
			name="player" value="${requestScope.playerRecordDTO.player}">
		<div class="adminMemberUpDel" style="position: absolute; bottom: 40%; left: 57%;">
			<input type="button" value="수정" class="adminMemberUpBtn" style="cursor:pointer" onclick="checkAdminMemberUpForm();">
			<input type="button" value="삭제" class="adminMemberDelBtn" style="cursor:pointer" onclick="checkAdiminDelForm();">
			<input type="button" value="목록" class="adminMemberMoveBtn" onclick="location.replace('/adminForm.do')">
		</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>