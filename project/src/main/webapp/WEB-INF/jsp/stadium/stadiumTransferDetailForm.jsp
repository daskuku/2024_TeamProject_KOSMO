<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양도</title>
<link href="/style/yangdoDetailFormStyle.css"
	rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>




<script>

function checkRedirect() {
    var status = "${requestScope.yangdoDTO.status}";
    var writer = "${requestScope.yangdoDTO.writer}";
    var transferredTo = "${requestScope.yangdoDTO.transferred_to}";
    var currentUser = "<%= request.getSession().getAttribute("m_no") %>";

    if (status !== "양도중" && currentUser !== writer && currentUser !== transferredTo) {
        alert("양도 완료된 글입니다.");
        window.location.href = "/stadiumTransferForm.do";
    }
}
checkRedirect();






function yangdoSincheongForm(yangdo_no, m_no,booking_no){
// 	alert(yangdo_no)
// 	alert(booking_no)
// 	alert(m_no)

	var stadium = "${requestScope.yangdoDTO.yangdo_stadium}";
	
	$.ajax({
		//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url : "/yangdoSincheongProc.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,
		type : "post"

		,
		data: {
            yangdo_no: yangdo_no,
            m_no: m_no,
            booking_no: booking_no
        },

		success : function(json) {
			var result = json["result"];
			if (result == 0) {
				alert("실패.");
				return;
			}else if (result == 9){
				
				alert("현재 경기장 (" + stadium + ")은 이용불가상태입니다.")
				location.href = "/stadiumTransferForm.do"; 
				
			}
			
			else {
				alert("성공.");
				location.href = "/stadiumTransferForm.do";
			}
		},
		error : function() {
			alert("수정 실패! 관리자에게 문의 바랍니다.");
		}
	});
}




</script>
</head>



	<body>
		<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<p class="titleBackgoundText"> 경기장 양도</p>
	</div>
	
	
		<c:if test="${empty requestScope.yangdoDTO}">
			<script>
				alert("게시판 글이 삭제되었습니다.");
				location.replace('/stadiumTransferForm');
			</script>
		</c:if>
	
		<c:if test="${!empty requestScope.yangdoDTO}">
			<table align="center" cellpadding="7" style="width:1100px; border-collapse: collapse; margin-top: 50px;">
				<tr style="border-bottom: 1px solid rgba(197, 146, 70, 0.4); border-top: 1px solid rgba(197, 146, 70, 0.4); background-color:rgba(197, 146, 70, 0.4); height: 70px;">
					
					<td colspan="2"><span>${ requestScope.yangdoDTO.title }</span><span style="float: right;"><span style="color: #999999; margin-top: 15px;">작성자&nbsp;</span>/&nbsp;${ requestScope.yangdoDTO.nickname }<span style="color: #999999; margin-left: 20px;">등록일&nbsp;</span>/&nbsp;${ requestScope.yangdoDTO.reg_date }<span style="color: #999999; margin-left: 20px;">조회수&nbsp;</span>/&nbsp;${ requestScope.yangdoDTO.readcount }</span></td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; border-top: 1px solid #FFFFFF; width: 100px; color: #000000">경기장</th>
					<td style="border-bottom: 1px solid #c59246e0;">${ requestScope.yangdoDTO.yangdo_stadium }</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; width: 100px; color: #000000">지역</th>
					<td style="border-bottom: 1px solid #c59246e0;">${ requestScope.yangdoDTO.yangdo_sido }-${ requestScope.yangdoDTO.yangdo_sigungu }</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF; width: 100px; color: #000000">날짜/시간</th>
					<td style="border-bottom: 1px solid #c59246e0;">${ requestScope.yangdoDTO.yangdo_date }/${ requestScope.yangdoDTO.yangdo_time }</td>
				</tr>
					
				<tr>
					<th style="border-bottom: 1px solid #999999; width: 100px; height:250px; color: #000000">내 용</th>
					<td style="border-bottom: 1px solid #999999;">
						${ requestScope.yangdoDTO.content }
					</td>
				</tr>
				<c:if test="${not empty sessionScope.m_no and requestScope.yangdoDTO.writer ne sessionScope.m_no}">
					<c:if test="${requestScope.yangdoDTO.status ne '양도완료'}">
						<tr>
							<td colspan="2" style="text-align: center; border-top: 1px solid #999999;">
								<input type="button" class="yangdoSincjeongBtn" value="신청" onclick="yangdoSincheongForm('${requestScope.yangdoDTO.yangdo_no}', '<%=request.getSession().getAttribute("m_no") %>','${requestScope.yangdoDTO.booking_no}');">
							</td>
						</tr>
					</c:if>
				</c:if>
				<c:if test="${requestScope.yangdoDTO.status eq '양도완료'}">
        			<tr>
            			<th style="border-top: 1px solid #FFFFFF; background-color:rgba(197, 146, 70, 0.4); width: 50px; color: #000000;">상태</th>
           				<td style="border-top: 1px solid #c59246e0; border-bottom: 1px solid #c59246e0;">양도완료</td>
       				</tr>
    			</c:if>
				
				
			</table>			
			<div class="yangdoDetailBtnDiv">
				<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/stadiumTransferForm.do')">
				<c:if test="${requestScope.yangdoDTO.status ne '양도완료' and requestScope.yangdoDTO.writer eq sessionScope.m_no}">
					<input type="button" value="수정/삭제" class="yangdoDetailUpDelBtn" onclick="document.yangdoDetailUpdDeleForm.submit();">
				</c:if>
			</div>
			<form name="yangdoDetailUpdDeleForm" action="/yangdoDetailUpdDeleForm.do" method="post">
				<input type="hidden" name="yangdo_no" value="${ requestScope.yangdoDTO.yangdo_no }">
				<input type="hidden" name="m_no" value="${ requestScope.yangdoDTO.writer }">
			</form>
			<form name="yangdoSincheongFormNo" >
				<input type="hidden" name="yangdo_no" value="${ requestScope.yangdoDTO.yangdo_no }">
				<input type="hidden" name="m_no" value="<%= request.getSession().getAttribute("m_no") %>">
			</form>
			
		</c:if>
		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
	
</html>