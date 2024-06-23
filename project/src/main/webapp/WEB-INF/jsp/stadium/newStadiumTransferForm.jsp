	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>NewStadiumTransferForm</title>
	<link href="/style/newStadiumTransferFormStyle.css" rel="stylesheet">
	<script src="/js/newStadiumTransferFormScript.js"></script>
	<script>
	
	function loadDate() {
	    var stadiumId = $("select[name='MyStadium']").val();
	    var m_no = $("input[name='m_no']").val(); // m_no의 값을 가져옵니다
	    
	    // 확인을 위해 alert으로 m_no 값 출력
	   // alert("m_no 값: " + m_no);
	
	    if (stadiumId === "선택") {
	        $("select[name='MyDate']").html('<option value="선택">날짜</option>');
	        return;
	    }
	
	    $.ajax({
	        url: '/myStadiumRentDate.do',
	        method: 'POST',
	        data: {
	            stadium_no: stadiumId,
	            m_no: m_no // 데이터 객체에 m_no 추가
	        },
	        success: function(json) {
	            var RentDate = json; // 시간 범위를 JSON으로 받음
	            
	            var dateOptions = '<option value="선택">날짜</option>';
	            
	            for (var i = 0; i < RentDate.length; i++) {
	            	dateOptions += '<option value="' + RentDate[i].booking_date + '">' + RentDate[i].booking_date + '</option>';
	            }
	            
	            $("select[name='MyDate']").html(dateOptions); // 시간 범위를 select 요소에 추가
	        },
	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });
	}
	
	
	
	function loadTimeRanges() {
	    var bookingDate = $("select[name='MyDate']").val();
	    var stadiumId = $("select[name='MyStadium']").val();
	    var m_no = $("input[name='m_no']").val(); // m_no의 값을 가져옵니다
	    
	    if (bookingDate === "선택") {
	        $("select[name='MyTimeRange']").html('<option value="0">시간</option>');
	        return;
	    }
	
	    // 정규식을 사용하여 날짜 부분 추출
	    var Date = bookingDate.replace(/^([0-9]{4}-[0-9]{2}-[0-9]{2})((\s?).*)$/, "$1");
	    //alert(Date); 
	
	    $.ajax({
	        url: '/myStadiumRentTime.do',
	        method: 'POST',
	        data: {
	            stadium_no: stadiumId,
	            booking_date: Date, // 추출된 날짜를 전송
	            m_no: m_no
	        },
	        success: function(json) {
	            var timeRanges = json;
	            var timeOptions = '<option value="0">시간</option>';
	            for (var i = 0; i < timeRanges.length; i++) {
	                timeOptions += '<option value="' + timeRanges[i].time_slot + '">' + timeRanges[i].time_range + '</option>';
	            }
	            $("select[name='MyTimeRange']").html(timeOptions);
	        },
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });
	}
	
	
	
	
	
	
	
	
	
	
	function TransferForm(){
		
		
		var formObj = $("[name='newStadiumTransferForm']");
	    var subjectObj = formObj.find(".title");
	    var contentObj = formObj.find(".content");
	    var stadiumValue = $("select[name='MyStadium']").val();
	    var bookingDate = $("select[name='MyDate']").val();
	    var timeRangeValue = $("select[name='MyTimeRange']").val();
	    
	    
	    if (stadiumValue === "선택") {
	        alert("경기장을 선택해 주세요.");
	        return;
	    }
	    
	    if (bookingDate === "선택") {
	        alert("날짜를 선택해 주세요.");
	        return;
	    }
	    if (timeRangeValue === "0") {
	        alert("시간을 선택해 주세요.");
	        return;
	    }
	    
	    
	
	    var bookingDate = $("select[name='MyDate']").val();
	    var extractedDate = bookingDate.match(/^([0-9]{4}-[0-9]{2}-[0-9]{2})/)[0];
	    
	    
	    var formData = {
	        title: formObj.find("input[name='title']").val(),
	        writer: formObj.find("input[name='writer']").val(),
	        MyStadium: formObj.find("select[name='MyStadium']").val(),
	        MyDate: extractedDate,
	        MyTimeRange: formObj.find("select[name='MyTimeRange']").val(),
	        content: formObj.find("textarea[name='content']").val(),
	        m_no: formObj.find("input[name='m_no']").val()
	    };
	    
	    
		
	    //alert(JSON.stringify(formData));
	    
		console.log(JSON.stringify(formData));
		
		
		
		
		
		var sessionPwd = "<%= session.getAttribute("password") %>";
		
		if(new RegExp(/^.{2,100}$/).test(subjectObj.val())==false){
			alert("제목은 2~100자 한글입니다.");
			subjectObj.val("");
			return;
		}
		
		if (contentObj.val().trim().length==0||contentObj.val().trim().length>1000){
			alert("내용은 1~1000자 입력해야 합니다.");
			contentObj.val("");
			return;
		}
		
	    function checkPwd() {
	    	var pwdInsert = prompt("계정 비밀번호를 입력해주세요.");
			
			if (pwdInsert == null) { 
		        return;
		    }
			
	        if (sessionPwd != pwdInsert) {
	        	
	            alert("계정 비밀번호를 정확히 입력해주세요.");
	            
	            checkQnABoardRegForm();
	            
	        } else {
	            if(confirm("작성하시겠습니까?") == true){
	            	
	            	
	            	
	            	
	            	
	            	
	            	
	       
	                 
	            	$.ajax({
	        			
	    				url:"/stadiumTransferProc.do",
	    					
	    				type:"post",
	    					
	    				data:formData ,
	    					
	    				success:function(json){
	    					var result = json["result"];
	    					
	    					if(result == 1){
	    						alert("작성 성공");
	    						location.href = '/stadiumTransferForm.do';
	    						
	    					}else if(result == 2){
	    						
	    						alert("이미 같은날과 시간에 양도신청한 경기장이있습니다.");
	    						return;
	
	    					}else if(result == 3){
	    						
	    						alert("현재 작성한 경기장은 이용불가 상태입니다.");
	    						return;
		
	    					}else if(result == 4){
	    						
	    						alert("이미 매치 신청한 경기장입니다.");
								return;
	
	    					}else {
	    						alert("작성 실패");
	    						return;
	    					}
	    				},
	    				
	    				error:function(){"작성 실패"}
	    			})
	            }
	        }
		}
	
	    checkPwd();
	}
	
	
	
	
	
	
	
	
	</script>
	
	
	
	
	
	
	
	</head>
	<body>
	    <%@ include file="/WEB-INF/jsp/header.jsp" %>
	    <div class="newStadiumTransferFormTitle">
	    	<p class="titleBackgoundText">경기장 양도 등록</p>
	    </div>
	    
	    
	    
	    
	    
	    
	    <div class="newStadiumTransferFormContainer">
			<form name="newStadiumTransferForm">
				<table class="newStadiumTransferFormRegTable" align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<input type="text" name="title" class="title" size="115" maxlength="100" style="padding: 5px 15px;">
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<%= session.getAttribute("nickname") %>
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">경기장</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<select name="MyStadium" class="MyStadium" onchange="loadDate()" style="width: 200px;">
					        <option value="선택" >경기장 선택</option>
					        <c:forEach var="myStadium" items="${requestScope.myStadiumList}" varStatus="status" >
					        	<option value="${myStadium.stadium_no}">${myStadium.stadium_name}</option>
					        </c:forEach>
					       
					    </select>
					    <select name="MyDate" class="MyDate"onchange="loadTimeRanges()" style="width: 200px;">
					        <option value="선택">날짜</option>
					       
					    </select>
					    <select name="MyTimeRange" class="MyTimeRange" style="width: 200px;">
					        <option value="0">시간</option>
					       
					    </select>
					</td>
				</tr>
				<tr>
					<th style="border-bottom: 1px solid #FFFFFF;">내용</th>
					<td style="border-bottom: 1px solid #c59246e0;">
						<textarea name="content" class="content" rows="20" cols="118" maxlength="1000" style="resize:none; padding: 5px 15px;"></textarea>
					</td>
				</tr>
				</table>
				<div class="newStadiumTransferFormBtnDiv">
					<div class="resetBtnDiv">
						<input type="reset" class="boardResetBtn"value="다시 작성">
					</div>
					<div class="boardRegAndMoveList">
						<input type="button" class="boardRegBtn" value="저장" onClick="TransferForm();">
						<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/stadiumTransferForm.do')">
					</div>
				</div>
				<input type="hidden" name="m_no" value="<%= request.getSession().getAttribute("m_no") %>">
			</form>
		</div>
		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
	</html>