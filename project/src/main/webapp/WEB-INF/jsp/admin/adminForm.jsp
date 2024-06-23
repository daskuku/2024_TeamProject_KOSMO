<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFormTitle</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>



<script>



$(document).ready(function() {
    $(".rowCntPerPage").val("10");
    search();

    
    

    
  
});







// 	function goAdminMemberDetailForm(m_no) {
// 	    // m_no와 함께 player_record_no 파라미터 추가
// 	    $("[name='adminMemberDetailForm'] [name='m_no']").val(m_no);
// 	    //$("[name='memberDetailForm'] [name='player_record_no']").val(player_record_no);
	    
//     // memberDetailForm 폼 submit
//     document.adminMemberDetailForm.submit();
// }


	
	function search() {
		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='adminSearchForm']");

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 
		  
		var keyword2Obj = boardSearchFormObj.find(".keyword2");
		
		var minGames_playedObj = boardSearchFormObj.find(".minGames_played"); 
		  
		var maxGames_playedObj = boardSearchFormObj.find(".maxGames_played");
		
		
		
		
		var keyword1 = keyword1Obj.val();
		  
	    var keyword2 = keyword2Obj.val();
	    
	    
	    var minGames_played = minGames_playedObj.val();
		  
	    var maxGames_played = maxGames_playedObj.val();
	    
	    
	  
	    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
		
		
	
	    


		
		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/adminForm.do"
					//-------------------------------
					// WAS 로 접속하는 방법 설정. get 또는 post
					//-------------------------------
					,
					type : "post"

					,
					data : boardSearchFormObj.serialize()

					,
					success : function(responseHtml) {

						var obj = $(responseHtml);

	
						
						$(".adminFormContainer").html(obj.filter(".adminFormContainer").html());
						
						

						
						$(".pagingNos").html(obj.find(".pagingNos").html());
						


					}

					,
					error : function() {

						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}

				});

	}

	function searchWithSort(sort) {
	    $("[name='adminSearchForm']").find("[name='sort']").val(sort);
	    $(".searchBtn").click();
	}
	
	
	
	 function searchAll() {
	        var boardSearchFormObj = $("[name='adminSearchForm']");
	        boardSearchFormObj.find(".keyword1").val("");
	        boardSearchFormObj.find(".keyword2").val("");
	        boardSearchFormObj.find(".sort").val("");
	        boardSearchFormObj.find("#minDate").val("");
	        boardSearchFormObj.find("#maxDate").val("");
	        boardSearchFormObj.find(".selectPageNo").val("1");
	        boardSearchFormObj.find(".searchType1").val("all");
	        boardSearchFormObj.find(".gender").prop("checked", false);
	        boardSearchFormObj.find(".ageRange").prop("checked", false);
	        boardSearchFormObj.find(".sido").val("0");
	        boardSearchFormObj.find(".sigungu").val("0");
		    boardSearchFormObj.find(".sigungu").empty();
		    boardSearchFormObj.find(".sigungu").append('<option value="0">군/구 선택</option>');
	        boardSearchFormObj.find(".minGames_played").val("0");
	        boardSearchFormObj.find(".maxGames_played").val("0");
	        boardSearchFormObj.find(".minWin").val("0");
	        boardSearchFormObj.find(".maxWin").val("0");
	        boardSearchFormObj.find(".minDraws").val("0");
	        boardSearchFormObj.find(".maxDraws").val("0");
	        boardSearchFormObj.find(".minLoss").val("0");
	        boardSearchFormObj.find(".maxLoss").val("0");
	        boardSearchFormObj.find(".minGoals").val("0");
	        boardSearchFormObj.find(".maxGoals").val("0");
	        boardSearchFormObj.find(".minAssists").val("0");
	        boardSearchFormObj.find(".maxAssists").val("0");

	        search();
	    }

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
	// 쪼개서 보여주기.
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function pageNoClick(clickPageNo) {
		//alert(clickPageNo);
		//---------------------------------------------
		// name='selectPageNo' 를 가진 태그의 value 값에 
		// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
		// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
		// value 값에 [클릭한 페이지 번호]를 저장하기
		//---------------------------------------------
		$("[name='adminSearchForm']").find(".selectPageNo").val(clickPageNo)

		search()

	}

	function checkDate() {
		$(function() {
		    // minDatepicker 설정
		    $("#minDate").datepicker({
		        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		        showOtherMonths: true, // 다른 달의 날짜도 표시
		        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
		        changeYear: true, // 년도 선택 가능
		        changeMonth: true, // 월 선택 가능
		        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
		        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
		        buttonImageOnly: true, // 아이콘 이미지만 표시
				
		        buttonText: "날짜 선택", // 버튼 텍스트 설정
		        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
		        minDate: "-5Y", // 최소 날짜 설정
		        maxDate: 0, // 최대 날짜 설정
		        onClose: function(selectedDate) {
		            if (selectedDate) {
		                $("#maxDate").datepicker("option", "minDate", selectedDate);
		            } else {
		                // 사용자가 입력을 취소했을 때 maxDate의 minDate를 기본값으로 재설정
		                $("#maxDate").datepicker("option", "minDate", "-5Y");
		            }
		        }
		    });

		    // maxDatepicker 설정
		    $("#maxDate").datepicker({
		        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		        showOtherMonths: true, // 다른 달의 날짜도 표시
		        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
		        changeYear: true, // 년도 선택 가능
		        changeMonth: true, // 월 선택 가능
		        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
		        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
		        buttonImageOnly: true, // 아이콘 이미지만 표시
		        buttonText: "날짜 선택", // 버튼 텍스트 설정
		        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
		        minDate: "-5Y", // 최소 날짜 설정
		        maxDate: 0, // 최대 날짜 설정
		        onClose: function(selectedDate) {
		            if (selectedDate) {
		                $("#minDate").datepicker("option", "maxDate", selectedDate);
		            } else {
		                // 사용자가 입력을 취소했을 때 minDate의 maxDate를 오늘 날짜로 재설정
		                $("#minDate").datepicker("option", "maxDate", new Date());
		            }
		        }
		    });

		});

	}
	
	
	function goMemberDetail(m_no){

		
	    $("[name='memberDetailUpDelForm'] [name='m_no']").val(m_no);
		
		
		document.memberDetailUpDelForm.submit();
		
		

	}
	
	function settingOpen() {
        var modal = document.querySelector(".settingModal");
        modal.style.display = "block";
    }

    // 모달 닫기
    function settingClose() {
        var modal = document.querySelector(".settingModal");
        modal.style.display = "none";
    }
	
   
    function saveSettings() {
    	
    	var settingForm = $("[name='settingForm']");
       
    	
     	alert(settingForm.serialize())
//     	console.log(settingFormObj.serialize())
    	 
    	$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/MemberSettingProc.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,
			type : "post"

			,
			data : settingForm.serialize()

			,
			success : function(response) {
				
				settingClose()
				alert("저장되었습니다.")

				location.reload(true);

			}

			,
			error : function() {

				alert("수정실패! 관리자에게 문의 바랍니다.");
			}

		});
        
    }
    
    let order = 1; // 초기 순서를 1로 설정
    const orderDisplay = document.getElementById('orderDisplay'); // 순서 표시를 위한 DOM 요소
    const activeOrderButtons = []; // 활성화된 순서 버튼들을 담는 배열

    let sidoOrder = 1; // 초기 시도 순서를 1로 설정
    const sidoOrderDisplay = document.getElementById('sidoOrderDisplay'); // 시도 순서 표시를 위한 DOM 요소
    const activeSidoOrderButtons = []; // 활성화된 시도 순서 버튼들을 담는 배열

    document.addEventListener('DOMContentLoaded', () => {
        // 페이지가 로드되면 실행될 초기화 함수
        // data-order 속성이 있는 버튼들을 활성화 상태로 설정
        document.querySelectorAll('.orderNumBtn[data-order]').forEach(btn => {
            const orderValue = parseInt(btn.dataset.order, 10); // 버튼의 data-order 값을 정수로 파싱
            if (!isNaN(orderValue) && orderValue !== 0) { // 유효한 숫자이고 0이 아닌 경우
                btn.classList.add('activeOrderNumBtn'); // 활성화 클래스 추가
                btn.textContent = orderValue; // 버튼 텍스트 설정
                activeOrderButtons.push(btn); // 배열에 버튼 추가
                if (orderValue >= order) {
                    order = orderValue + 1; // 현재 순서 갱신
                }
            }
        });

        document.querySelectorAll('.orderSidoNumBtn[data-order]').forEach(btn => {
            const orderValue = parseInt(btn.dataset.order, 10); // 버튼의 data-order 값을 정수로 파싱
            if (!isNaN(orderValue) && orderValue !== 0) { // 유효한 숫자이고 0이 아닌 경우
                btn.classList.add('activeOrderSidoNumBtn'); // 활성화 클래스 추가
                btn.textContent = orderValue; // 버튼 텍스트 설정
                activeSidoOrderButtons.push(btn); // 배열에 버튼 추가
                if (orderValue >= sidoOrder) {
                    sidoOrder = orderValue + 1; // 현재 시도 순서 갱신
                }
            }
        });

        // 순서가 변경될 때마다 hidden input의 값을 업데이트하고 순서 표시 갱신
        updateHiddenInputs();
        updateOrderDisplay();
        updateSidoOrderDisplay();
    });

    function clearOrderNum() {
        document.querySelectorAll('.orderNumBtn').forEach(btn => {
            btn.classList.remove('activeOrderNumBtn'); // 활성화 클래스 제거
            btn.textContent = ''; // 버튼 텍스트 초기화
            btn.removeAttribute('data-order'); // data-order 속성 제거
            btn.dataset.order = '0'; // data-order를 '0'으로 설정
        });

//         document.querySelectorAll('.orderSidoNumBtn').forEach(btn => {
//             btn.classList.remove('activeOrderSidoNumBtn'); // 활성화 클래스 제거
//             btn.textContent = ''; // 버튼 텍스트 초기화
//             btn.removeAttribute('data-order'); // data-order 속성 제거
//             btn.dataset.order = '0'; // data-order를 '0'으로 설정
//         });
		
        // 순서 변수 초기화
        order = 1;
        sidoOrder = 1;

        // 활성화된 순서 버튼 배열 초기화
        activeOrderButtons.length = 0;
        activeSidoOrderButtons.length = 0;

        // 숨겨진 입력값 및 순서 표시 업데이트
        updateHiddenInputs();
        updateOrderDisplay();
        updateSidoOrderDisplay();
    }

    
    
    
    
    
    // 순서 버튼을 클릭할 때 호출되는 함수
    function orderNumChange(element) {
        if (element.classList.contains('activeOrderNumBtn')) { // 버튼이 활성화된 상태라면
            element.classList.remove('activeOrderNumBtn'); // 활성화 클래스 제거
            element.textContent = ''; // 버튼 텍스트 초기화
            element.removeAttribute('data-order'); // data-order 속성 제거

            // 순서 재조정
            const index = activeOrderButtons.indexOf(element); // 배열에서 해당 버튼의 인덱스 찾기
            if (index > -1) {
                activeOrderButtons.splice(index, 1); // 배열에서 제거
            }
            activeOrderButtons.forEach((btn, i) => {
                btn.dataset.order = i + 1; // 남은 버튼들의 순서 다시 설정
                btn.textContent = i + 1; // 버튼 텍스트 순서로 업데이트
            });
            order--; // 전체 순서 갱신
        } else { // 버튼이 비활성화된 상태라면
            element.classList.add('activeOrderNumBtn'); // 활성화 클래스 추가
            element.dataset.order = order++; // 순서를 할당하고 현재 순서 증가
            element.textContent = element.dataset.order; // 버튼 텍스트 순서로 업데이트
            activeOrderButtons.push(element); // 배열에 버튼 추가
        }

        // 순서가 변경될 때마다 hidden input의 값을 업데이트하고 순서 표시 갱신
        updateHiddenInputs();
        updateOrderDisplay();
    }

    // 순서대로 hidden input의 값을 업데이트하는 함수
    function updateHiddenInputs() {
        // 모든 버튼을 조회하여 hidden input의 값을 업데이트
        document.querySelectorAll('.orderNumBtn').forEach((btn, i) => {
            const hiddenInput = btn.parentNode.querySelector('input[type="hidden"]'); // 해당 버튼의 부모에서 hidden input 요소 선택
            if (hiddenInput) {
                // 활성화된 버튼인 경우에만 data-order 값을 설정
                if (btn.classList.contains('activeOrderNumBtn')) {
                    hiddenInput.value = btn.dataset.order;
                } else {
                    hiddenInput.value = '0'; // 비활성화된 버튼은 값을 '0'으로 설정
                }
            }
        });

        
    }

    // 순서 표시 업데이트하는 함수
    function updateOrderDisplay() {
        const orderTexts = activeOrderButtons.map(btn => btn.dataset.order).join(', '); // 활성화된 버튼들의 순서 텍스트 배열을 문자열로 변환
        orderDisplay.textContent = `클릭된 순서: ${orderTexts}`; // 순서 표시 업데이트
    }

    

    
    function settingSidoOpen() {
        var modal = document.querySelector(".settingSidoModal");
        modal.style.display = "block";
    }
    
    function settingSidoClose() {
        var modal = document.querySelector(".settingSidoModal");
        modal.style.display = "none";
    }
    
    

    

   
    let lastClickedElement = null;

    function toggleButtons(element) {
        const buttons = element.nextElementSibling;
        
        if (lastClickedElement && lastClickedElement !== buttons) {
            lastClickedElement.style.display = 'none';
            lastClickedElement.previousElementSibling.classList.remove('focusOn');
        }

        if (buttons.style.display === 'block') {
            buttons.style.display = 'none';
            element.classList.remove('focusOn');
        } else {
            buttons.style.display = 'block';
            element.classList.add('focusOn');
        }

        lastClickedElement = buttons;
    }

//     function moveUp(button) {
//         const item = button.closest('li');
//         const prevItem = item.previousElementSibling;
//         if (prevItem) {
//             item.parentNode.insertBefore(item, prevItem);
//             updateOrderValues();
//         }
//     }

//     function moveDown(button) {
//         const item = button.closest('li');
//         const nextItem = item.nextElementSibling;
//         if (nextItem) {
//             item.parentNode.insertBefore(nextItem, item);
//             updateOrderValues();
//         }
//     }
    
    
    function moveUpSido() {
        const selectedLi = document.querySelector('li .focusOn');
        if (selectedLi && selectedLi.closest('li').previousElementSibling) {
            selectedLi.closest('li').parentNode.insertBefore(selectedLi.closest('li'), selectedLi.closest('li').previousElementSibling);
            updateOrderValues();
        }
    }

    function moveDownSido() {
        const selectedLi = document.querySelector('li .focusOn');
        if (selectedLi && selectedLi.closest('li').nextElementSibling) {
            selectedLi.closest('li').parentNode.insertBefore(selectedLi.closest('li').nextElementSibling, selectedLi.closest('li'));
            updateOrderValues();
        }
    }

    function updateOrderValues() {
        const items = document.querySelectorAll('#sidoList li');
        items.forEach((item, index) => {
            const hiddenInput = item.querySelector('input[type="hidden"]');
            const sidoId = item.getAttribute('data-sido-id'); // data-sido-id 값을 읽어옵니다.
            hiddenInput.value = sidoId + '_' +  (index + 1); // sidoId와 인덱스를 결합하여 값을 설정합니다.
        });
    }



    function saveSidoSettings() {
        const items = document.querySelectorAll('#sidoList li');
        const order = [];
        items.forEach((item, index) => {
            const name = item.querySelector('.sidoName').textContent.trim();
            const orderValue = item.querySelector('input[type="hidden"]').value;
            order.push({ name: name, order: orderValue });
        });
        console.log('Order to save:', order);
        // Here you would typically send this order to the server via an AJAX request
    }

//     function clearOrderSidoNum() {
//         const list = document.getElementById('sidoList');
//         while (list.firstChild) {
//             list.removeChild(list.firstChild);
//         }
//     }

    // Initialize the order values on page load
    document.addEventListener('DOMContentLoaded', (event) => {
        updateOrderValues();
    });





   
   
   
   
   
   
   
   
   
   
   
   
function saveSidoSettings() {
    	
    	var sidoSettingForm = $("[name='sidoSettingForm']");
       
    	
     	alert(sidoSettingForm.serialize())
//     	console.log(settingFormObj.serialize())
    	 
    	$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/SidoSettingProc.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,
			type : "post"

			,
			data : sidoSettingForm.serialize()

			,
			success : function(response) {
				
				settingClose()
				alert("저장되었습니다.")

				location.reload(true);

			}

			,
			error : function() {

				alert("수정실패! 관리자에게 문의 바랍니다.");
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
	#setting {
		position: absolute;
		width: 3%;
		right: 15%;
		border-radius: 50%;
		opacity: 0.7;
		border:3px solid #999999;
  	}
  	#setting:hover {
	/* 마우스 가져다 대면 외각 색설정 */
	cursor:pointer;
	/* 효과시간  */
	transition: 0.3s;
	/* 크기 확대 */
	transform: scale(1.1);
	}

	 /* 스타일은 여기에 추가하세요 */
    .settingModal {
        display: none;
        position: absolute;
        z-index: 1;
        left: 50%;
        top: 20%;
        width: 600px;
        height: 100%;
        overflow: auto;
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        border-radius: 10px;
    }

    /* 닫기 버튼 스타일 */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    body{
    	position: relative;
    }
    
    .adminSearchFormTable th{
    	width: 60px;
    }
    
    .orderNumBtn{
    	width: 20px;
    	height: 20px;
    	border: 1px solid #999999;
    	border-radius: 50%;
    	cursor: pointer;
    }
    
    .activeOrderNumBtn{
    	width: 20px;
    	height: 20px;
    	border: 1px solid #999999;
    	border-radius: 50%;
    	background-color: #999999;
    	text-align: center;
    	color: #FFFFFF;
    	cursor: pointer;
    }
    
    
    
    
    #sidoSetting{
    	width: 20px;
    	height: 20px;
    	cursor: pointer;
    }
    
  
    
    
    .settingSidoModal {
        display: none;
        position: absolute;
        z-index: 1;
        left: 29%;
        top: 22.5%;
        width: 400px;
        /* height: 100%; */
        height: 750px;
    }

    .modal-sido-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        border-radius: 10px;
        height: 610px;
    }
    
    .sidoSettingClose {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .sidoSettingClose:hover,
    .sidoSettingClose:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    .focusOn{
    	background-color: #999999;
    }
    
    .listOrderBtn{
    	width: 40px;
    	height: 40px;
    	background: #c59246e0;
    	border-radius: 10px;
    	border: none;
    	color: #FFFFFF;
    	cursor: pointer;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<p class="titleBackgoundText">관리자 페이지</p>
	</div>
	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>

	 <div >
        <img src="image/adminSettingIcon.png" id="setting" onclick="settingOpen()">
        
    </div>

    <div id="settingModal" class="settingModal">
    <div class="modal-content">
        <span class="close" onclick="settingClose()">X</span>
        <div class="adminSetting" align="center">
            <!-- 여기에 모달 내용 추가 -->
      <form name="settingForm" onsubmit="return false">
      	<div style="display: flex; justify-content: center;">
      		<div style="margin-right: 100px;">
      			<strong style="font-size: 20px;">선택 항목</strong>
      		</div>
      		<ul>
      			<li>
      				<div style="margin-bottom: 30px;">
      					<strong style="font-size: 20px;">메뉴 설정</strong>
      				</div>
      			</li>
      			<c:forEach var="showHide" items="${requestScope.memberShowHideSettingList}">
      			
      			 <c:if test="${showHide.search_condition_type == 'gender'}">
	      		  <li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
                     <div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
                  </div>
                  <div>
                     <p>성별</p>
                  </div>
                  <input type="hidden" name="genderSetting" id = "genderSetting" value="">
                  </div>
		      	</li>
		      	</c:if>
		      	
		      	
		      	<c:if test="${showHide.search_condition_type == 'age_group'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>연령대</p>
						</div>
						<input type="hidden" name="ageRangeSetting" id = "ageRangeSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'city'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div style="display: flex; vertical-line: middle;">
							<p>시/도</p>
							<div style="border:1px solid #999999; border-radius: 50%; margin-left: 10px;">
								<img src="image/adminSettingIcon.png" id="sidoSetting" onclick="settingSidoOpen()">
							</div>
							<input type="hidden" name="sidoSetting" id = "sidoSetting" value="">
							
						</div>
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'join_date'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>가입일</p>
						</div>
						<input type="hidden" name="joinDateSetting" id = "joinDateSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'game_count'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>경기수</p>
						</div>
						<input type="hidden" name="gameCountSetting" id = "gameCountSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'win_count'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>승리수</p>
						</div>
						<input type="hidden" name="winCountSetting" id = "winCountSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'draw_count'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>무승부</p>
						</div>
						<input type="hidden" name="drawCountSetting" id = "drawCountSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'loss_count'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>패배</p>
						</div>
						<input type="hidden" name="lossCountSetting" id = "lossCountSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'goals'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>골</p>
						</div>
						<input type="hidden" name="goalCountSetting" id = "goalCountSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	
		      	<c:if test="${showHide.search_condition_type == 'assists'}">
		      	<li style="margin-bottom: 10px;">
		      		<div style="display: flex;">
		      			<div class="orderNumBtn" data-order="${showHide.display_position}" onClick="orderNumChange(this)" style="margin-right: 10px;">
						</div>
						<div>
							<p>어시스트</p>
						</div>
						<input type="hidden" name="assistsCountSetting" id = "assistsCountSetting" value="">
		      		</div>
		      	</li>
		      	</c:if>
		      	</c:forEach>
		    </ul>
      	</div>
          <%-- <table>
          	<c:forEach var="list" items="${requestScope.memberSearchSettingList}">
          		 <c:if test="${list.search_condition_type == 'gender'}">
          		<tr>
          			<td>
          				<div id="orderDisplay">클릭된 순서: </div>
          			</td>
          		</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="genderSetting" value="show"  <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="genderSetting" value="hide"  <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'age_group'}">
				<tr>
					<th >연령대</th>
					<td >
						<input type="radio" name="ageRangeSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="ageRangeSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'city'}">
				<tr>
					<th >시/도</th>
					<td >
						<input type="radio" name="sidoSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="sidoSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'join_date'}">
				<tr>
					<th >가입일</th>
					<td >
						<input type="radio" name="joinDateSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="joinDateSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'game_count'}">
				<tr>
					<th >경기수</th>
					<td >
						<input type="radio" name="gameCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="gameCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'win_count'}">
				<tr>
					<th >승리수</th>
					<td >
						<input type="radio" name="winCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="winCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'draw_count'}">
				<tr>
					<th >무승부</th>
					<td >
						<input type="radio" name="drawCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="drawCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'loss_count'}">
				<tr>
					<th >패배</th>
					<td >
						<input type="radio" name="lossCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="lossCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'goals'}">
				<tr>
					<th >골</th>
					<td >
						<input type="radio" name="goalCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="goalCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'assists'}">
				<tr>
					<th >어시스트</th>
					<td >
						<input type="radio" name="assistsCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="assistsCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
					<td>
						<div class="orderNumBtn" data-order="" onClick="orderNumChange(this)">
						</div>
					</td>
				</tr>
				</c:if>
				
		</c:forEach>
			</table>	 --%>
			
		</form>
			<input type="button" class="boardRegBtn" value="저장" onclick="saveSettings()">
			<input type="button" class="boardEmptyBtn" value="비우기" onclick="clearOrderNum()">
            
        </div>
    </div>
</div>




	<div id="settingSidoModal" class="settingSidoModal">
    <div class="modal-sido-content" style="text-align: center;">
        <span class="sidoSettingClose" onclick="settingSidoClose()">X</span>
        <strong style="font-size: 20px; text-align: center; margin: 0 auto; justify-content: center;">시 이름</strong>
        <form name="sidoSettingForm" onsubmit="return false">
           <ul id="sidoList" style="text-align: center; margin-top: 20px; ">
			    <c:forEach var="sidolist" items="${requestScope.sidoShowHideSettingList}">
			        <li data-sido-id="${sidolist.sido_id}" style="margin-bottom: 10px;">
			            <div style="display: flex; align-items: center;">
			                <div class="sidoName" onclick="toggleButtons(this)" style="cursor: pointer; text-align: center; width: 100px; border: 1px solid #999999; border-radius:10px; margin-right: 30px;">
			                    ${sidolist.name}
			                </div> 
				            <div style="display: flex;">
				            	<div style="margin-right: 20px;">
									<input type="radio" name="assistsCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >사용
								</div>
								<div>
									<input type="radio" name="assistsCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >미사용
								</div>
			                </div>
<!-- 			                <div style="display: none;"> -->
<!-- 			                    <button type="button" onclick="moveUp(this)">▲</button> -->
<!-- 			                    <button type="button" onclick="moveDown(this)">▼</button> -->
<!-- 			                </div> -->
			                <input type="hidden" name="sidoOrder" value="">
			            </div>
			        </li>
			    </c:forEach>
			</ul>
				<div>
			                    <button type="button" class="listOrderBtn" onclick="moveUpSido(event)" style="margin-right: 10px;">▲</button>
			                    <button type="button" class="listOrderBtn" onclick="moveDownSido(event)">▼</button>
			                    <input type="button" class="boardRegBtn" value="저장" onclick="saveSidoSettings()" style="margin-left: 60px;">
			    </div>

        </form>
<!--         <input type="button" class="boardRegBtn" value="저장" onclick="saveSidoSettings()"> -->
    </div>
</div>






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	<form name="adminSearchForm" class="adminSearchForm" onsubmit="return false">

		<table class="adminSearchFormTable" align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
				<tr>
					<td style="border-bottom: none;">
					
						<table cellpadding="5" cellspacing="0"
							style="border-collapse: collapse;" align="center">
							<c:forEach var="setting" items="${requestScope.memberSearchSettingList}">
							
							<c:if test="${setting.display_position > 0 }">
						
							<tr class="${setting.search_condition_type}">
                                <th style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">
                                
                                    <c:if test="${setting.search_condition_type == 'gender'}">성별
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center; " >
											<label style="display: flex; align-items: center; margin-right: 50px;">
												<input type="checkbox" name="gender" value="남" class="gender" style="zoom:2.0; margin-right: 5px;">남
											</label>
											<label style="display: flex; align-items: center;">
												<input type="checkbox" name="gender" value="여" class="gender" style="zoom:2.0; margin-right: 5px;">여
											</label>
										</td>
										<tr><td style="border-bottom: none;"></td></tr>                                   
                                    </c:if>
                                    
                                    
                                    <c:if test="${setting.search_condition_type == 'age_group'}">연령대
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="10대" class="ageRange" style="zoom:2.0; margin-right: 5px;">10대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="20대" class="ageRange" style="zoom:2.0; margin-right: 5px;">20대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="30대" class="ageRange" style="zoom:2.0; margin-right: 5px;">30대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="40대" class="ageRange" style="zoom:2.0; margin-right: 5px;">40대
									</label>
								</td>
								<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="50대" class="ageRange" style="zoom:2.0; margin-right: 5px;">50대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="60대" class="ageRange" style="zoom:2.0; margin-right: 5px;">60대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="70대" class="ageRange" style="zoom:2.0; margin-right: 5px;">70대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="80대" class="ageRange" style="zoom:2.0; margin-right: 5px;">80대
									</label>
								</td>
								<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                   
                                    <c:if test="${setting.search_condition_type == 'city'}">시/도
                                    	<td colspan="5" style="text-align: center; border-bottom: none; display: flex; align-items: center;"><select name="sido" id="" class="sido"
												onchange="categoryChange(this)">
									
										<option value="0">시/도 선택</option>
									<c:forEach var="sidoSetting" items="${requestScope.sidoSearchSettingList}">
									<c:if test="${sidoSetting.display_position > 0 }">
										<option value="${sidoSetting.sido_id}">${sidoSetting.name}</option>
									</c:if>
									</c:forEach>
								</select> 
								
								
								
								<select name="sigungu" id="state" class="sigungu">
										<option value="0">군/구 선택</option>
								</select></td>
								<tr><td style="border-bottom: none;"></td></tr>  
                                   </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'join_date'}">가입일
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
                                    	<input type="text" name="minDate" id="minDate"readonly="readonly">&nbsp;~&nbsp;
                                    	<input type="text" name="maxDate" id="maxDate" readonly="readonly">
                                    	<tr><td style="border-bottom: none;"></td></tr>  
                                    	</td>
		                                    
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'game_count'}">경기수
										<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minGames_played"
									class="minGames_played" value="0">&nbsp;~&nbsp;<input
									type="number" name="maxGames_played" class="maxGames_played"
									value="0"></td>    
									<tr><td style="border-bottom: none;"></td></tr>                                  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'win_count'}">승리수
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
                                    	<input type="number" name="minWin" class="minWin"value="0">&nbsp;~&nbsp;
                                    	<input type="number" name="maxWin"class="maxWin" value="0"></td>
                                    	<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'draw_count'}">무승부
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minDraws" class="minDraws"
									value="0">&nbsp;~&nbsp;<input type="number" name="maxDraws"
									class="maxDraws" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'loss_count'}">패배
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minLoss" class="minLoss"
									value="0">&nbsp;~&nbsp;<input type="number" name="maxLoss"
									class="maxLoss" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'goals'}">골
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minGoals" class="minGoals"
									value="0">&nbsp;~&nbsp;<input type="number" name="maxGoals"
									class="maxGoals" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                   
                                    </c:if>
                                    	
                                    
                                    <c:if test="${setting.search_condition_type == 'assists'}">어시스트
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minAssists"
									class="minAssists" value="0">&nbsp;~&nbsp;<input type="number"
									name="maxAssists" class="maxAssists" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                    
                                    </c:if>
                                </th>
							</tr>
							
							
							
							
							
							
							
						
							</c:if>	
						</c:forEach>
						</table>
						<div class="search">
							<select name="searchType1" class="searchType1">
								<option value="all">전체</option>
								<option value="name">이름</option>
								<option value="mid">아이디</option>
								<option value="nickname">별명</option>
								<option value="phone">전화번호</option>
								<option value="email">이메일</option>
							</select>
							<input type="text" name="keyword1" class="keyword1"> 
							<select name="orand" class="orAnd">
								<option value="or">or
								<option value="and">and
							</select>
							<input type="text" name="keyword2" class="keyword2">
						</div>
						<div class="searchBtnDiv">
							<input type="button" value="검색" class="searchBtn" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;">
							<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">   
						</div>
					</td>
				</tr>
					
					
	
			</table>
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">

	</form>














	<div class="adminFormTopContents">
			<span class="fontLightGray" id="adminFormAllCount">Total. ${requestScope.memberListAllCnt}개</span>
			<div class="adminFormRowCntPerPage">
				<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
					<option value="10">10개씩 보기
					<option value="15">15개씩 보기
					<option value="20">20개씩 보기
				</select>
			</div>
		</div>
		
	<div class="adminFormContainer">
			<div class="adminListDiv" style="margin-bottom: 20px;">
				<table class="adminListTable" cellpadding="7" align="center"
					style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
					<tr>
<!-- 					<th style="width: 30px;" >번호</th> -->
					
					<c:if test="${param.sort!='m_no asc' and param.sort!='m_no desc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('m_no desc')">번호</th>
					</c:if>

					<c:if test="${param.sort=='m_no desc'}">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('m_no asc')">번호▼</th>
					</c:if>

					<c:if test="${param.sort=='m_no asc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('')">번호▲</th>
					</c:if>
					
					


					<c:if test="${param.sort!='mid asc' and param.sort!='mid desc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('mid desc')">아이디</th>
					</c:if>

					<c:if test="${param.sort=='mid desc'}">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('mid asc')">아이디▼</th>
					</c:if>

					<c:if test="${param.sort=='mid asc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('')">아이디▲</th>
					</c:if>







					<c:if
						test="${param.sort!='m.name asc' and param.sort!='m.name desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('m.name desc')">이름</th>
					</c:if>

					<c:if test="${param.sort=='m.name desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('m.name asc')">이름▼</th>
					</c:if>

					<c:if test="${param.sort=='m.name asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">이름▲</th>
					</c:if>


					<c:if
						test="${param.sort!='nickname asc' and param.sort!='nickname desc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('nickname desc')">별명</th>
					</c:if>

					<c:if test="${param.sort=='nickname desc'}">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('nickname asc')">별명▼</th>
					</c:if>

					<c:if test="${param.sort=='nickname asc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('')">별명▲</th>
					</c:if>









					<c:if
						test="${param.sort!='reg_date asc' and param.sort!='reg_date desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date desc')">가입일</th>
					</c:if>

					<c:if test="${param.sort=='reg_date desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date asc')">가입일▼</th>
					</c:if>

					<c:if test="${param.sort=='reg_date asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">가입일▲</th>
					</c:if>



					<c:if test="${param.sort!='age asc' and param.sort!='age desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('age desc')">나이</th>
					</c:if>

					<c:if test="${param.sort=='age desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('age asc')">나이▼</th>
					</c:if>

					<c:if test="${param.sort=='age asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">나이▲</th>
					</c:if>





				</tr>





				<c:forEach var="admin" items="${requestScope.memberList}"
					varStatus="status">
					<tr style="cursor: pointer"
						onClick="goMemberDetail(${admin.m_no});">
						<td align="center">${requestScope.memberMap.begin_serialNo_asc + status.index}</td>
						<td align="center">${admin.mid}</td>
						<td align="center">${admin.name}</td>
						<td align="center">${admin.nickname}</td>
						<td align="center">${admin.reg_date}</td>
						<td align="center">${admin.age}</td>


					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty requestScope.memberList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>

	<div class="adminFormPaging">
			<span class="pagingNos">
				<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.memberMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
				<c:forEach var="pageNo" begin="${requestScope.memberMap.begin_pageNo}" end="${requestScope.memberMap.end_pageNo}">
					<c:if test="${requestScope.memberMap.selectPageNo==pageNo}">
			            <p class="activePageNo">${pageNo}</p>
			        </c:if>
					<c:if test="${requestScope.memberMap.selectPageNo!=pageNo}">
						<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
					</c:if>
				</c:forEach>
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.memberMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
			</span>
		</div>
<!-- 	<form name="adminMemberDetailForm" action="/adminMemberDetailForm.do" -->
<!-- 		method="post"> -->
<!-- 		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 --> 
<!-- 		<input type="hidden" name="m_no"> <input type="hidden" -->
<!-- 			name="player"> -->

<!-- 	</form> -->
	
	<form name="memberDetailUpDelForm" action="/memberDetailUpDelForm.do"
			method="post">
			<input type="hidden" name="m_no" value="${requestScope.memberDTO.m_no}"> 
			
		</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>