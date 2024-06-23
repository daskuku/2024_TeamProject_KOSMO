// Category 선택 

	$(function(){
		$('.recordsRankingFormCategoryTabContent > div, .recordsRankingFormCategoryTabSelectDiv').hide();
		$('.recordsRankingFormCategoryTabNav a').click(function(){
			
			var index = $(this).parent().index();
			
			$('.recordsRankingFormCategoryTabSelectDiv').hide();
			
	        $(this).parent().find('.recordsRankingFormCategoryTabSelectDiv').show();
			
			$('.recordsRankingFormCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			
			$('.recordsRankingFormCategoryTabNav a').removeClass('active');
			
			$(this).addClass('active');
			
			return false;
			
		}).filter(':eq(0)').click();
		
		// 각 탭 초기화
		
		$('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabRegion"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0) .region').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0) .region:first').addClass('selected');
	        searchRegion(9);
	    });
	    
	    $('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabGender"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1) .gender').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1) .gender:first').addClass('selected');
	        searchGender('남');
	    });
	    
	    $('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabAge"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2) .age').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2) .age:first').addClass('selected');
	        searchAge('10대');
	    });
	});

// 지역 카테고리 선택

	$(document).ready(function() {
		
	    $(".region").click(function() {
	    	
	        $(".region").removeClass("selected");
	        
	        $(this).addClass("selected");
	    });
	});

	function searchRegion(sido_id){
		
		$.ajax({

			url : "/mainForm.do",
			
			type : "post",
			
			data : "sido_id=" + sido_id,
			
			success : function(responseHtml){
			
						var obj = $(responseHtml);
						
						$(".recordsRankingFormTabRegionWinRating").html(obj.find(".recordsRankingFormTabRegionWinRating").html());
						$(".recordsRankingFormTabRegionGoalRating").html(obj.find(".recordsRankingFormTabRegionGoalRating").html());
						$(".recordsRankingFormTabRegionAssistRating").html(obj.find(".recordsRankingFormTabRegionAssistRating").html());
						
						$("[name='recordsRankingFormTabRegion']").html(obj.find("[name='recordsRankingFormTabRegion']").html());
					},
			
			error : function(){alert("지역 변경 오류")}
		});
	
	}
	
// 성별 카테고리 선택
	
	$(document).ready(function() {
		
	    $(".gender").click(function() {
	    	
	        $(".gender").removeClass("selected");
	        
	        $(this).addClass("selected");
	    });
	});
	
	function searchGender(text){
		
		$.ajax({

			url : "/mainForm.do",
			
			type : "post",
			
			data : "gender=" + text,
			
			success : function(responseHtml){
				
						var obj = $(responseHtml);
						
						$(".recordsRankingFormTabGenderWinRating").html(obj.find(".recordsRankingFormTabGenderWinRating").html());
						$(".recordsRankingFormTabGenderGoalRating").html(obj.find(".recordsRankingFormTabGenderGoalRating").html());
						$(".recordsRankingFormTabGenderAssistRating").html(obj.find(".recordsRankingFormTabGenderAssistRating").html());
						
						$("[name='recordsRankingFormTabGender']").html(obj.find("[name='recordsRankingFormTabGender']").html());
					},
			
			error : function(){alert("성별 변경 오류")}
		});
	
	}
	
// 연령대 카테고리 선택

	$(document).ready(function() {
		
	    $(".age").click(function() {
	    	
	        $(".age").removeClass("selected");
	        
	        $(this).addClass("selected");
	    });
	});
		
	function searchAge(text){
		
		$.ajax({

			url : "/mainForm.do",
			
			type : "post",
			
			data : "age=" + text,
			
			success : function(responseHtml){
			
						var obj = $(responseHtml);
						
						$(".recordsRankingFormTabAgeWinRating").html(obj.find(".recordsRankingFormTabAgeWinRating").html());
						$(".recordsRankingFormTabAgeGoalRating").html(obj.find(".recordsRankingFormTabAgeGoalRating").html());
						$(".recordsRankingFormTabAgeAssistRating").html(obj.find(".recordsRankingFormTabAgeAssistRating").html());
						
						$("[name='recordsRankingFormTabAge']").html(obj.find("[name='recordsRankingFormTabAge']").html());
					},
			
			error : function(){alert("연령대 변경 오류")}
		});
	
	}
	
