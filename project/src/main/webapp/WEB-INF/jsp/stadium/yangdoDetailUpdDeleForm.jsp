<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YangdoDetailUpDeleForm</title>
<link href="/style/yangdoDetailUpDeleFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>




<script>





// $(document).ready(function() {

// 	loadDate()
// 	loadTimeRanges()
	
// });

















function loadDate() {
	var formObj = $("[name='yangdoDetailUpdDeleForm']");
    var stadiumId = $("select[name='MyStadium']").val();
    var m_no = formObj.find("input[name='m_no']").val(); // m_no의 값을 가져옵니다 

    // 확인을 위해 alert으로 m_no 값 출력
    //alert("m_no 값: " + m_no);
    
    
    

    if (stadiumId === 0) {
        $("select[name='MyDate']").html('<option value="선택">날짜</option>');

        return;
    }

    $.ajax({
        url: '/myStadiumYangdoDate.do',
        method: 'POST',
        data: {
            stadium_no: stadiumId,
            m_no: m_no // 데이터 객체에 m_no 추가
        },
        success: function(json) {
            var yangdoDate = json; // 시간 범위를 JSON으로 받음
            
            var dateOptions = '<option value="선택">날짜</option>';
            
            for (var i = 0; i < yangdoDate.length; i++) {
            	
//                 var selected = '';
                
//                 if (yangdoDate[i].booking_date == "${requestScope.yangdoDTO.yangdo_date}") {
                	
//                     selected = 'selected';
                    
                    
                    
//                 }
                dateOptions += '<option value="' + yangdoDate[i].booking_date + '" >' + yangdoDate[i].booking_date + '</option>';


            }
           

            $("select[name='MyDate']").html(dateOptions); 
            
        },
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });
}





function loadTimeRanges() {
    var bookingDate = $("select[name='MyDate']").val();
    var formObj = $("[name='yangdoDetailUpdDeleForm']");
    var stadiumId = $("select[name='MyStadium']").val();
    var m_no = formObj.find("input[name='m_no']").val(); // m_no의 값을 가져옵니다 
    
    if (bookingDate === "선택") {
        $("select[name='MyTimeRange']").html('<option value=0>시간</option>');
        return;
    }

    // 정규식을 사용하여 날짜 부분 추출
    var Date = bookingDate.replace(/^([0-9]{4}-[0-9]{2}-[0-9]{2})((\s?).*)$/, "$1");
    //alert(Date); 

    $.ajax({
        url: '/myStadiumYangdoTime.do',
        method: 'POST',
        data: {
            stadium_no: stadiumId,
            booking_date: Date, // 추출된 날짜를 전송
            m_no: m_no
        },
        success: function(json) {
            var yangdotimeRanges = json; // JSON으로 받은 시간 범위 데이터
            var timeOptions = '<option value="0">시간</option>'; // 기본 옵션
            
            // 받아온 JSON 데이터를 반복하여 옵션을 생성
            for (var i = 0; i < yangdotimeRanges.length; i++) {
            	 
              
                timeOptions += '<option value="' + yangdotimeRanges[i].time_slot + '" >' + yangdotimeRanges[i].time_range + '</option>';
            }
            
            // 생성된 옵션을 해당 select 요소에 추가
            $("select[name='MyTimeRange']").html(timeOptions);
        }
    });
}


































	function checkYangdoUpForm() {

		 var formObj = $("[name='yangdoDetailUpdDeleForm']");
 		//var writerObj = formObj.find(".writer");
 		var subjectObj = formObj.find(".title");
 		var contentObj = formObj.find(".content");



		if (subjectObj.val().trim() == "") {
	        alert("제목을 입력해주세요");
	        return;
	    }
	    
	    if (contentObj.val().trim().length == 0) {
	        alert("내용을 1자 이상 입력해주세요.");
	        contentObj.val("");
	        return;
	    }
	    



		var stadiumSelected = $("select[name='MyStadium']").val();
		
		 var bookingDate = $("select[name='MyDate']").val();
		 var timeRangeValue = $("select[name='MyTimeRange']").val();
		 
		 
		 if (stadiumSelected !== "0" && (bookingDate === "선택" || bookingDate === null || bookingDate === '')) {
		        alert("날짜를 선택해주세요.");
		        return;
		    }
		 
		 
		 if (stadiumSelected !== "0" && bookingDate !== "선택" && (timeRangeValue === "0" || timeRangeValue === null || timeRangeValue === '')) {
			    alert("시간을 선택해 주세요.");
			    return;
			}
		 
		 
		 
		 
		 var extractedDate = null; 
		 if (bookingDate !== null && bookingDate !== '' ) {
		        var matchResult = bookingDate.match(/^([0-9]{4}-[0-9]{2}-[0-9]{2})/);
		        if (matchResult !== null) {
		            extractedDate = matchResult[0];
		        } else {
		            // Handle invalid date format if needed
		        }
		    }
		 	
		var formData = {
	        title: formObj.find("input[name='title']").val(),
	        stadium_no: formObj.find("select[name='MyStadium']").val(),
	        booking_date : extractedDate,
	        time_slot: formObj.find("select[name='MyTimeRange']").val(),
	        content: formObj.find("textarea[name='content']").val(),
	        m_no: formObj.find("input[name='m_no']").val(),
	        yangdo_no: formObj.find("input[name='yangdo_no']").val()
	    };




		//alert(JSON.stringify(formData));

 		if (confirm("정말수정하시겠습니까?") == false) {
 			return;		}	

	
 		var stadiumName = $("select[name='MyStadium'] option:selected").text();
		
		$.ajax({
			url : "/yangdoUpProc.do",
			type : "post",
			data : formData,
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 양도입니다.");
					location.href = "/stadiumTransferForm.do";
					return;
				}else if ( result == 5){
					
					alert("현재 선택한 경기장"+"( "+ stadiumName + " )"+"은 이용불가 상태입니다.");
						return;
				}else if ( result == 6){
					
					alert("삭제된 경기장입니다");
					location.href = "/stadiumTransferForm.do";
						return;
				}
				
				else if (result == 3){
					alert("이미 같은조건의 게시글이있음")
					
					return;
				}
				else if ( result ==7){
					
				alert("이미 양도한 글입니다.")
				return;
					
				}
				else {
					alert("양도 수정 성공입니다.");
					location.href = "/stadiumTransferForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
	
	
	
	
	
	function checkYangdoDelForm() {
	    var formObj = $("[name='yangdoDetailUpdDeleForm']");
	    if (!confirm("정말 삭제하시겠습니까?")) {
	        return;
	    }

	    $.ajax({
	        url: "/yangdoDelProc.do",
	        type: "post",
	        data: formObj.serialize(),
	        success: function(json) {
	            var result = json.result;
	            if (result == 0) {
	                alert("삭제된 양도입니다.");
	            } else if (result == 8) {
	                if (${sessionScope.mid eq 'admin'}) {
	                var xxx = confirm("이미 양도완료한 글입니다. 정말로 삭제하시겠습니까?")
	                   if (xxx){
	                	adminDelete();
	                   }
	                } else {
	                    alert("이미 양도완료한 글입니다.");
	                }
	            }else {
	                alert("양도 삭제 성공입니다.");
	                location.href = "/stadiumTransferForm.do";
	            }
	        }
	    });

	    
	    
	    function adminDelete() {
	        $.ajax({
	            url: "/yangdoAdminDelProc.do",
	            type: "post",
	            data: formObj.serialize(),
	            success: function(json) {
	                var result = json.result;
	                if (result == 1) {
	                    alert("성공적으로 삭제되었습니다.");
	                } else {
	                    alert("삭제 실패했습니다.");
	                    return;
	                }
	                location.href = "/stadiumTransferForm.do";
	            }
	        });
	    }
	}

	
	function goMemberDetail(m_no){
		
		document.memberDetailUpDelForm.submit()

		
	}
	
	
	
	
	
	
	
	
</script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<p class="titleBackgoundText">양도수정</p>
	</div>




	<form name="yangdoDetailUpdDeleForm">
		<table align="center" cellpadding=7 style="border-collapse: collapse; margin-top: 50px; width: 1100px;">
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">제목</th>
				<td style="border-bottom: 1px solid #c59246e0;"><input type="text" name="title" class="title" size="113"
					maxlength="30" value="${requestScope.yangdoDTO.title}" style="padding: 5px 15px;"></td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">글쓴이</th>
				<c:if test="${sessionScope.mid ne 'admin'}">
				<td style="border-bottom: 1px solid #c59246e0;">${ requestScope.yangdoDTO.nickname }</td>
				</c:if>
				<c:if test="${sessionScope.mid eq 'admin'}">
				<td style="border-bottom: 1px solid #c59246e0; cursor: pointer;" onclick="goMemberDetail('${requestScope.yangdoDTO.writer}')" >${ requestScope.yangdoDTO.nickname }</td>
				</c:if>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">경기장</th>
				<td>
					${requestScope.yangdoDTO.yangdo_stadium} - ${requestScope.yangdoDTO.yangdo_date} - ${requestScope.yangdoDTO.yangdo_time}<br>
				   <c:if test="${sessionScope.mid eq 'admin' and requestScope.yangdoDTO.status ne'양도완료'}">
				    <select name="MyStadium" class="MyStadium" onchange="loadDate()" style="margin-top: 10px;">
					    <option value=0>경기장선택</option>
					    <c:forEach var="myStadium" items="${requestScope.myStadiumList}">
					        <option value="${myStadium.stadium_no}">
					            ${myStadium.stadium_name}
					        </option>
					    </c:forEach>
					</select>
					</c:if>
					<c:if test="${sessionScope.mid ne 'admin' and requestScope.yangdoDTO.status ne'양도완료'}">
				    <select name="MyStadium" class="MyStadium" onchange="loadDate()" style="margin-top: 10px;">
					    <option value=0>경기장선택</option>
					    <c:forEach var="myStadium" items="${requestScope.myStadiumList}">
					        <option value="${myStadium.stadium_no}">
					            ${myStadium.stadium_name}
					        </option>
					    </c:forEach>
					</select>
					</c:if>
					
					
					<c:if test="${sessionScope.mid eq 'admin' and requestScope.yangdoDTO.status ne'양도완료'}">
				    <select name="MyDate" class="MyDate"onchange="loadTimeRanges()">
				        <option value="선택">날짜</option>
				       
				    </select>
				     </c:if>
				    <c:if test="${sessionScope.mid ne 'admin' and requestScope.yangdoDTO.status ne'양도완료'}">
				    <select name="MyDate" class="MyDate"onchange="loadTimeRanges()">
				        <option value="선택">날짜</option>
				       
				    </select>
				    </c:if>
				    
				    
				    
				  
				    <c:if test="${sessionScope.mid eq 'admin' and requestScope.yangdoDTO.status ne'양도완료'}">
				    <select name="MyTimeRange" class="MyTimeRange">
				        <option value=0>시간</option>
				       
				    </select>
				    </c:if>
				    <c:if test="${sessionScope.mid ne 'admin' and requestScope.yangdoDTO.status ne'양도완료'}">	
				    <select name="MyTimeRange" class="MyTimeRange">
				        <option value=0>시간</option>
				       
				    </select>
				    </c:if>
				    
				    
				</td>
			</tr>
			<tr>
				<th style="border-bottom: 1px solid #FFFFFF;">내 용</th>
				<td style="border-bottom: 1px solid #c59246e0;"><textarea name="content" class="content" rows="20" cols="115" maxlength="500" style="resize: none; padding: 5px 15px;">${requestScope.yangdoDTO.content}</textarea>
			</tr>

		</table>
		<input type="hidden" name="yangdo_no"
			value="${requestScope.yangdoDTO.yangdo_no}">
		<input type="hidden" name="m_no" value="${requestScope.yangdoDTO.writer}">
		
	</form>
	<div class="yangdoDetailUpDelBtnDiv">
		<div class="moveListBtnDiv">
			<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/stadiumTransferForm.do')">
		</div>
		<div class="boardRegAndMoveList">
			<input type="button" class="checkBoardUpBtn" value="수정" onClick="checkYangdoUpForm();">
			<input type="button" class="checkBoardDelBtn" value="삭제" onClick="checkYangdoDelForm();">
		</div>
	</div>
	
	<form name="memberDetailUpDelForm" action="/memberDetailUpDelForm.do"
			method="post">
			<input type="hidden" name="m_no"
				value="${requestScope.yangdoDTO.writer}">
	</form>
	
	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>