<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StadiumRentDetailForm</title>
<link href="/style/stadiumDetailFormStyle.css"
	rel="stylesheet">
<!-- <script src="/js/community/communityNoticeBoardFormScript.js"></script> -->
<script>
	function checkReserveForm() {

		
			
		var formObj = $("[name='rentStadiumForm']");

		var dateObj = formObj.find("#date");
		
	    var timeSlotObj = formObj.find("[name='time_slot']"); // 수정된 부분

	    var selectedDate = dateObj.val();
	    var selectedTimeSlot = timeSlotObj.val(); // 수정된 부분
		
		
		var sessionMid = '<%=session.getAttribute("mid")%>';

		//alert(formObj.serialize())
		
		
		if (sessionMid == "" || sessionMid == 'null') {
		    alert('로그인이 필요한 서비스입니다.');
		    location.href = '/loginForm.do';
		    return;
		}

		
		if (selectedDate == "" || selectedDate == null) { // 수정된 부분
	        alert('날짜를 선택해주세요.'); // 수정된 부분
	        return;
	    }

		 if (selectedTimeSlot == "선택") { // 수정된 부분
		        alert('시간대를 선택해주세요.'); // 수정된 부분
		        return; // 수정된 부분
		    }
		
		$.ajax({
			url : "/rentStadiumProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				
				
				if(result ==3){
					
					alert("이미 예약되어있는 시간대입니다.");
					return;
					
					
				} 	else if (result == 4) {
					alert("예약은 최대 3개까지만 예약할수있습니다.");
					location.href = "/stadiumRentForm.do";
					
					
				}else {
					alert("예약 성공입니다.");
					location.href = "/stadiumRentForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	$(document).ready(function() {
	    $("#date").datepicker({
	        dateFormat: 'yy-mm-dd',
	        showOtherMonths: true,
	        showMonthAfterYear: true,
	        changeYear: true,
	        changeMonth: true,
	        showOn: "both",
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	        buttonImageOnly: true,
	        buttonText: "날짜 선택",
	        yearSuffix: "년",
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        showTime: false,
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        minDate: 0+1, // 오늘 이전 날짜 선택 불가능
	        beforeShowDay: function(date) {

	            var disabledDates = ${requestScope.fullRent};
	            var dateString = $.datepicker.formatDate('yy-mm-dd', date);
	            if (disabledDates.includes(dateString)) {
	                return [false];
	            }
	            return [true];
	        }
	    });

	    $('form').on('submit', function(e) {
	        var confirmSubmit = confirm('예약을 완료하시겠습니까?');
	        if (!confirmSubmit) {
	            e.preventDefault();
	        }
	    });
	});

</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="stadiumDetailFormTitle">
		<p class="titleBackgoundText">경기장 대관</p>
	</div>

	<c:if test="${empty requestScope.stadiumDTO}">
		<script>
			alert("경기장이 삭제됨.");
			location.replace("/stadiumRentForm.do");
		</script>
	</c:if>



    
    

	<c:if test="${!empty requestScope.stadiumDTO}">
		<div class="stadiumDiv">
			<div class="stadiumImgDiv">
				<c:if test="${requestScope.stadiumList.imagename != null}">
					<img src="/image/stadiumImg/${requestScope.stadiumList.imagename}" class="stadiumRentImage" style="width:250px; height:200px; border-radius: 15px;">
				</c:if>
				<c:if test="${requestScope.stadiumList.imagename == null}">
					<img src="/image/noImage.png" class="stadiumRentImage" style="width:250px; height:200px; border-radius: 15px;">
				</c:if>
				<form name="rentStadiumForm">

		<table class="rentStadiumTable" align="center" cellpadding="7" style="border-collapse: collapse; margin-top: 20px;">

			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">날짜</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" id="date" name="date"
					required="required" readonly="readonly"></td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">시간대</th>
				<td style="border-bottom: 1px solid #c59246e0;">

				<select name="time_slot" required="required" id="time_slot">
				<option value="선택">선택</option>
						<c:forEach var="time" items="${timeDTO}">
							<option value="${time.time_no}">${time.time_range}</option>
						</c:forEach>

				</select>

				</td>
			</tr>

			<!-- <tr>
				<td colspan="2" style="text-align: center;"><input
					type="button" value="예약하기" onclick="checkReserveForm();"></td>
			</tr> -->
		</table>
		<div class="stadiumDetailBtnDiv">
			<input type="button" value="예약" class="stadiumRegBtn" onclick="checkReserveForm();">
			<input type="button" value="목록" class="moveListBtn" onclick="location.replace('/stadiumRentForm.do')">
		</div>
		<input type="hidden" name="stadium_no"
			value="${requestScope.stadiumDTO.stadium_no}">
		
		<input type="hidden" name="m_no" value="<%= request.getSession().getAttribute("m_no") %>">
		
	</form>
			</div>
			<table class="stadiumDetailTable" align="center" cellpadding="7" style="border-collapse: collapse;">
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">경기장이름</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.stadiumDTO.stadium_name}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">지역</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.stadiumDTO.sido_name} - ${requestScope.stadiumDTO.sigungu_name}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">등록일</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.stadiumDTO.reg_date}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">상태</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.stadiumDTO.stadium_status}</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">비 고</th>
					<td style="border-bottom: 1px solid #c59246e0;">${requestScope.stadiumDTO.content}</td>
				</tr>
			</table>
		</div>
	</c:if>

	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>