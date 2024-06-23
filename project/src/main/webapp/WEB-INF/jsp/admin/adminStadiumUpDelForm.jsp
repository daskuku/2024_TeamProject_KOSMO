<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardDetailForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css"
	rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>




<script>
	function checkStadiumUpForm() {

	var		formObj = $("[name='adminStadiumUpDelForm']");
    var    stadiumName = formObj.find("[name='stadium_name']").val().trim();
    var    sidoId = formObj.find("[name='sido_id']").val();
    var    sigunguId = formObj.find("[name='sigungu_id']").val();
    var    detailAddress = formObj.find("[name='detail_address']").val().trim();
    var    stadiumStatus = formObj.find("[name='stadium_status']:checked").val();
     var   content = formObj.find("[name='content']").val().trim();
		
     if (stadiumName == "") {
         alert("경기장 이름을 입력해주세요.");
         return;
     }
     if (sidoId !== "0" && (sigunguId === "0" || sigunguId === null || sigunguId === '')) {
	        alert("군구를 선택해주세요.");
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

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}
		//alert(formObj.serialize());

		$.ajax({
			url : "/adminStadiumUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 경기장입니다.");
					location.href = "/adminStadiumForm.do";
				} else {
					alert("경기장 수정 성공입니다.");
					location.href = "/adminStadiumForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkStadiumDelForm() {
		var formObj = $("[name='adminStadiumUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/adminStadiumDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 경기장입니다.");
					location.href = "/adminStadiumForm.do";
				}else if(result == 4) {
					
					alert("이미있는 경기장 입니다.");
					location.href = "/adminStadiumForm.do"
					
				} 
				else {
					alert("경기장 삭제 성공입니다.");
					location.href = "/adminStadiumForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
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
		
		<p class="titleBackgoundText">경기장 수정</p>
	</div>

	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>
<div class="adminStadiumDiv" style="margin-left: 430px; display: flex;">
		<form name="adminStadiumUpDelForm">
			<div class="stadiumImgDiv" style="margin-right: 1150px; height: 0; margin-top: 20px;">
				<img src="/image/st.jpg" style="border-radius: 15px;">
				<div class="adminMemberUpDel" style="margin-left: 100px;">
					<input type="button" value="수정" class="adminMemberUpBtn" style="cursor:pointer" onclick="checkStadiumUpForm();">
					<input type="button" value="삭제" class="adminMemberDelBtn" style="cursor:pointer" onclick="checkStadiumDelForm();">
					<input type="button" value="목록" class="adminMemberMoveBtn" style="cursor:pointer" onclick="location.replace('/adminStadiumForm.do')">
				</div>
			</div>
				<table align="center" cellpadding=7 style="border-collpase: collpase; margin-top: 0;">
					<!-- <tr>
						<th bgColor="lightgray">사진</th>
						-------------------------------------------------
						HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의
						writer 라는 멤버변수 안의 데이터를 표현하기
						상세보기할 게시판의 이름 표현하기
						-------------------------------------------------
						<td><img src="/image/st.jpg"></td>
					</tr> -->
					<tr>
						<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">경기장이름</th>
						<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="stadium_name" class="stadium_name" size="40"
							maxlength="15" value="${requestScope.stadim2DTO.stadium_name}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
					</tr>
					<tr>
						<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">주소</th>
						<td colspan="5" align="center" style="border-bottom: 1px solid #c59246e0;">${requestScope.stadim2DTO.sido_name}-${requestScope.stadim2DTO.sigungu_name}->(수정)
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
						<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">상세주소</th>
						<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="detail_address"
							class="detail_address" size="40" maxlength="30"
							value="${requestScope.stadim2DTO.detail_address}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"></td>
					</tr>
		
					<tr>
						<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">등록일</th>
						<td style="border-bottom: 1px solid #c59246e0;">${requestScope.stadim2DTO.reg_date}</td>
					</tr>
					<tr>
						<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">상태</th>
						<td style="border-bottom: 1px solid #c59246e0;"><input type="radio" name="stadium_status" value="사용가능" style="zoom:2.0; margin-right: 5px;"
							<c:if test="${requestScope.stadim2DTO.stadium_status.contains ('사용가능')}">checked</c:if>>사용가능
		
							<input type="radio" name="stadium_status" value="이용불가" style="zoom:2.0; margin-right: 5px;"
							<c:if test="${requestScope.stadim2DTO.stadium_status.contains ('이용불가')}">checked</c:if>>이용불가</td>
					</tr>
					<tr>
						<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">비고</th>
						<td style="border-bottom: 1px solid #c59246e0;"><textarea name="content" class="content" rows="13"
								cols="40" maxlength="500" style="border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px; resize: none;">${requestScope.stadim2DTO.content}
		            </textarea>
					</tr>
		
				</table>
			<input type="hidden" name="stadium_no"
				value="${requestScope.stadim2DTO.stadium_no}">
		</form>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>