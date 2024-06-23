<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newAdminTournamentBoardForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
	function deleteBoard(){
		
		var formObj = $("[name='upDelTournament']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}

		
		$.ajax({
			url : "/deleteTournamentProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 1) {
					alert("삭제되었습니다.");
					location.href = "/adminTournamentBoardForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
		
	}

</script>


</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp"%>
   <div class="adminTournamentBoardDetailFormTitle">
    
      <p class="titleBackgoundText"></p>
   </div>

   <%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

      
         <table class="newAdminTournamentBoardFormRegTable" border="1" bordercolor="black">
            <tr>
               <th>제목</th>
               <td>
               		${requestScope.detail.subject}  	 
               </td>
            </tr>
            
            <!-- 오라클에 지역 갑이 문자가 아닌 숫자로 저장돼 지역의 value값을 숫자에서 문자로 변경하였음 -->
            
            <tr>
               <th>지역</th>
               <td>
                  	${requestScope.detail.region}
               </td>
            </tr>
            

            <tr>
            	<th bgColor="lightgray">신청기간</th>
                 <td>
                 	${requestScope.detail.regist_start} ~ ${requestScope.detail.regist_end}
                 </td> 
            </tr> 
         	<tr>
           		<th bgColor="lightgray">내 용</th>
	            <td>
	               <textarea name="content" class="content" rows="13" cols="40" maxlength="500" readonly>
	               ${requestScope.detail.content}
	               </textarea>
	            </td>
         	</tr>
      </table>


      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <span style="cursor: pointer"
            onclick="location.href='/adminTournamentBoardForm.do'"> [목록화면으로] </span>
         <input type="button" value="수정" style="cursor:pointer" onclick="document.upDelTournament.submit()">
         <input type="button" value="삭제" style="cursor:pointer" onclick="deleteBoard()">

	<form name="upDelTournament" action="/adminTournamentBoardUpForm.do" method="post">
		<input type="hidden" name="list_no" value="${requestScope.detail.list_no}">
	</form>

</body>
</html>