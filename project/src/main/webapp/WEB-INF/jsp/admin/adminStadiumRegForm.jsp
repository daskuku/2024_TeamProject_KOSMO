<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminStadiumRegForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css"
	rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
	//----------------------------------------
	// 저장 버튼을 클릭하면 호출되는 함수
	//----------------------------------------

	function checkAdminStadiumRegForm() {
		var formObj = $("[name='adminStadiumRegForm']");
        var stadiumName = formObj.find("[name='stadium_name']").val().trim();
        var sidoId = formObj.find("[name='sido_id']").val();
        var sigunguId = formObj.find("[name='sigungu_id']").val();
        var detailAddress = formObj.find("[name='detail_address']").val().trim();
        var stadiumStatus = formObj.find("[name='stadium_status']:checked").val();
        var content = formObj.find("[name='content']").val().trim();
        // 유효성 검사
        if (stadiumName == "") {
            alert("경기장 이름을 입력해주세요.");
            return;
        }
        if (sidoId == 0) {
            alert("시/도를 선택해주세요.");
            return;
        }
        if (sigunguId == 0) {
            alert("군/구를 선택해주세요.");
            return;
        }
        if (detailAddress == "") {
            alert("상세주소를 입력해주세요.");
            return;
        }
        if (!stadiumStatus) {
            alert("경기장 상태를 선택해주세요.");
            return;
        }
        if (content.length < 1) {
            alert("내용을 한 글자 이상 입력해주세요.");
            return;
        }

        if (confirm("정말 입력하시겠습니까?") == false) {
            return;
        }

		//-----------------------------------------------------
		// JQuery 객체의 [ajax 메소드]를 호출하여
		// WAS 에 비동기 방식 "/boardRegProc.do" 주소로 접속하고 
		// 게시판 입력 결과를 받아서
		// 성공했으면 경고하고 게시판 목록화면으로 이동하고
		// 실패했으면 경고하기
		//-----------------------------------------------------
		$.ajax({
			//--------------------------------------
			// WAS 에 접속할 URL 주소 지정
			//--------------------------------------
			url : "/adminStadiumRegProc.do"
			//--------------------------------------
			// 파라미터값을 보내는 방법 지정
			//--------------------------------------
			,
			type : "post"
			//--------------------------------------
			// WAS 에 보낼 파명과 파값을 설정하기. "파명=파값&파명=파값~"
			//--------------------------------------
			,
			data : formObj.serialize()
			//----------------------------------------------------------
			// WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			// 이때 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
			//----------------------------------------------------------
			,
			success : function(json) {
				var result = json["result"];
				if (result == 1) {
					alert("경기장 입력 성공입니다.");
					location.href = "/adminStadiumForm.do"
				}else if(result == 4) {
					
					alert("이미있는 경기장 입니다.");
					location.href = "/adminStadiumForm.do"
					
				}
				
				else {
					alert("경기장 입력 실패입니다. 관리자에게 문의 바람!");
					location.href = "/adminStadiumForm.do"
				}
			}
			//----------------------------------------------------------
			// WAS 의 응답이 실패했을 실행할 익명함수 설정.
			//----------------------------------------------------------
			,
			error : function() {
				alert("입력 실패! 관리자에게 문의 바람니다.");
			}
		});
	}
</script>
<style>
	#nav-item-stadium{
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
	
		<p class="titleBackgoundText">경기장 등록</p>
	</div>


	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>




	<form name="adminStadiumRegForm">
		<!------------------------------------------>
		<!-- 만약에 파명 b_no 의 파값이 없으면-->
		<!------------------------------------------>
		<c:if test="${empty param.stadium_no}">
			<!------------------------------>
			<!-- hidden 태그 선언하고0 저장하기-->
			<!------------------------------>
			<input type="hidden" name="stadium_no" value="0">
		</c:if>
		<!------------------------------------------>
		<!-- 만약에 파명 b_no 의 파값이 있으면-->
		<!------------------------------------------>
		<c:if test="${!empty param.stadium_no}">
			<!------------------------------>
			<!-- hidden 태그 선언하고 파명 b_no 의 파값 저장하기-->
			<!------------------------------>
			<input type="hidden" name="stadium_no" value="${param.stadium_no}">
		</c:if>

		<table align="center" cellpadding=7 style="border-collpase: collpase; border-bottom:0; margin: 0 auto; margin-top: 50px; width: 1000px; height: 400px; margin-left: 470px;">

			<c:if test="${empty param.stadium_no}">
			</c:if>
			<tr>
				<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">경기장 사진</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<input type="file" name="imageFileAdd" class="imageFileAdd" accept="image/*" multiple>				
				</td>
			</tr>
			<tr>
				<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">경기장 이름</th>
				<td style="border-bottom: 1px solid #c59246e0;">
					<input type="text" name="stadium_name" class="stadium_name" size="95" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;">
				</td>
			</tr>
			<tr>
				<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">지역</th>
				<td colspan="5" style="border-bottom: 1px solid #c59246e0;"><select name="sido_id" id="sido_id"
					onchange="categoryChange(this)">
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
				</select> <select name="sigungu_id" id="state">
						<option value="0">군/구 선택</option>
				</select></td>
			</tr>
			<tr>
				<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">상세주소</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="detail_address"
					class="detail_address" size="95" maxlength="30" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
			</tr>
			<tr>
				<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">상태</th>
				<td style="text-align: center; display: flex; align-items: center; border-bottom: 1px solid #c59246e0;">
					<label style="display: flex; align-items: center; margin-right: 50px;">
						<input type="radio" name="stadium_status" value="사용가능" class="stadium_status" style="zoom:2.0; margin-right: 5px;">사용가능
					</label>
					<label style="display: flex; align-items: center;">
						<input type="radio" name="stadium_status" value="이용불가" class="stadium_status" style="zoom:2.0; margin-right: 5px;">이용불가
					</label>
				</td>
			</tr>
			<tr>
				<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">비고</th>
				<td style="border-bottom: 1px solid #c59246e0;"><textarea name="content" class="content" rows="13"
						cols="40" maxlength="500" style="height: 300px; width: 830px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px; resize: none;"></textarea>
			</tr>









		</table>
		<div class="adminMemberUpDel" style="text-align: center; margin-top: 20px; padding-bottom: 100px;">
			<input type="reset" value="다시 작성" class="adminMemberUpBtn" style="cursor:pointer; width: 100px;">
			<input type="button" value="저장" class="adminMemberDelBtn" style="cursor:pointer" onClick="checkAdminStadiumRegForm();">
			<input type="button" value="목록" class="adminMemberMoveBtn" onClick="location.replace('/adminStadiumForm.do');">
		</div>
	</form>
<%@ include file="/WEB-INF/jsp/footer.jsp" %>

</body>
</html>