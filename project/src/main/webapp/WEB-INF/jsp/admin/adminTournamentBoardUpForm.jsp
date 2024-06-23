<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminTournamentUpForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
	function checkTournamentUpForm() {
		
		var formObj = $("[name='updateAdminTournament']");
		
		if (confirm("정말 수정하시겠습니까?") == false) {
			return;
		}
	
		$.ajax({
			url : "/upTournamentBoardProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/adminTournamentBoardForm.do";
				} 
				else {
					alert("대회일정 수정 성공입니다.");
					location.href = "/adminTournamentBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>
<style>
	#nav-item-tournament{
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
   <div class="adminTournamentBoardDetailFormTitle">
      <p class="titleBackgoundText">대회 일정 수정</p>
   </div>
	<div class="adminPageSideBar">
   		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>

      <form name="updateAdminTournament">
         <table class="newAdminTournamentBoardFormRegTable" style="border-collpase: collpase; margin: 0 auto; margin-top: 50px; width: 1000px; height: 400px; margin-left: 470px;">
            <tr>
               <th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">제목</th>
               <td style="border-bottom: 1px solid #c59246e0;">
               		<input type="text" size="100" name="subject" value="${requestScope.detail.subject}" style="height: 35px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px;"> 	 
               </td>
            </tr>
            
            <!-- 오라클에 지역 갑이 문자가 아닌 숫자로 저장돼 지역의 value값을 숫자에서 문자로 변경하였음 -->
            
            <tr>
               <th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">지역</th>
               <td style="border-bottom: 1px solid #c59246e0;">
               		<select name="region" class="sido">
               			<option>지역선택</option>
               			<option value="서울">서울</option>
               			<option value="경인">경인</option>
               			<option value="강원">강원</option>
               			<option value="충청">충청</option>
               			<option value="전라">전라</option>
               			<option value="경상">경상</option>
               			<option value="제주">제주</option>
               		</select>
               </td>
            </tr>
            

            <tr>
            	<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">신청기간</th>
                 <td style="border-bottom: 1px solid #c59246e0;">
                 	<input type="date" id="minDate" name="regist_start" value="${requestScope.detail.regist_start}">
                 	~
                 	<input type="date" id="maxDate" name="regist_end" value="${requestScope.detail.regist_end}">
                 </td> 
            </tr> 
         	<tr>
           		<th style="width: 100px; height: 50px; border-bottom: 1px solid #FFFFFF; color: #000000; background-color: rgba(197, 146, 70, 0.4);">내 용</th>
	            <td style="border-bottom: 1px solid #c59246e0; height: 200px;">
	               <textarea name="content" class="content" rows="20" cols="103" maxlength="500" style="height: 300px; border-radius: 10px; border: 1px solid #c59246e0; padding: 0px 15px; resize: none;">${requestScope.detail.content}</textarea>
	            </td>
         	</tr>
     	 </table>
     	 
     	 <input type="hidden" name="list_no" value="${requestScope.detail.list_no}">
      </form>
<div class="adminMemberUpDel" style="text-align: center; margin-top: 20px; padding-bottom: 100px;">
		<input type="button" value="수정" class="adminMemberUpBtn" style="cursor:pointer" onclick="checkTournamentUpForm();">
		<input type="button" value="목록" class="adminMemberMoveBtn" onclick="location.href='/adminTournamentBoardForm.do'">
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>