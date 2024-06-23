<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP 기술 Page Directive를 이용해 페이지 처리 방식 선언 -->

<%@ page import="java.util.List"%>

<%@ page import="java.util.Map"%>

<%@ page import="kosmo.team.project.dto.SampleDTO"%>

<%@ page import="kosmo.team.project.dto.CommunityDTO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- CustomTag를 사용하기 위한 조건 -->

<script src="/js/jquery-1.11.0.min.js"></script>

<script src="/js/common.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>




<script >

function setweekgroup1() {
      if ($("#workweekcdGroupA").is(":checked")) {
         $("#day1, #day2, #day3, #day4, #day5").prop("checked", true);
         $("#day0").prop("checked", false);
      } 
      else {
         $("#day1, #day2, #day3, #day4, #day5").prop("checked", false);
      }
};
   
 function setweekgroup2() {
      if ($("#workweekcdGroupB").is(":checked")) {
         $("#day6, #day7").prop("checked", true);
         $("#day0").prop("checked", false);
      } 
      else {
         $("#day6, #day7").prop("checked", false);
      }
};
   

     
     
   function setweekDay() {
   
      if ($("#day1").is(":checked") && $("#day2").is(":checked") && $("#day3").is(":checked") && $("#day4").is(":checked") && $("#day5").is(":checked")) {
         $("#workweekcdGroupA").prop("checked", true);
      }  
      else {
         $("#workweekcdGroupA").prop("checked", false);
      }
      
      if($("#day1").is(":checked") || $("#day2").is(":checked") || $("#day3").is(":checked") || $("#day4").is(":checked") || $("#day5").is(":checked")) 
      {
         $("#day0").prop("checked", false);
      }
      
     };

    function setweekEnd() {
      
      if ($("#day6").is(":checked") && $("#day7").is(":checked")) {
         $("#workweekcdGroupB").prop("checked", true);
         $("#day0").prop("checked", false);
         
      } 
      else {
         $("#workweekcdGroupB").prop("checked", false);
      }
      
      if($("#day6").is(":checked") || $("#day7").is(":checked"))
      {
         $("#day0").prop("checked", false);
      }
   };
   
   
   function allday()
   {
     if ($("#day0").is(":checked")) {
         $("#day1, #day2, #day3, #day4, #day5, #day6, #day7, #workweekcdGroupA, #workweekcdGroupB").prop("checked", false);
      }
   };

   
   //=============================================================================================================================================================================================
   
   function everyset()
   {
      if ($("#everytime").is(":checked")) {
            $("#morning, #am, #pm, #night").prop("checked", false);
       }

   }
   
   function timeset()
   {
	   if ($("#morning").is(":checked") && $("#am").is(":checked") && $("#pm").is(":checked") && $("#night").is(":checked")) {
  		 $("#everytime").prop("checked", true);
	       	 	$("#morning").prop("checked", false);
	       		$("#am").prop("checked", false);
  	        	$("#pm").prop("checked", false);
  	       		$("#night").prop("checked", false);
  	    } else {
  	    	$("#everytime").prop("checked", false);
  	    }
   }
   
	//=============================================================================================================================================================================================
    function setposition()
 	{
    	 if ($("#allPos").is(":checked")) {
             $("#st, #cm, #cb, #gk").prop("checked", false);
          }
 	}
   
    function positioncheck()
    	{
    	if ($("#st").is(":checked") && $("#cm").is(":checked") && $("#cb").is(":checked") && $("#gk").is(":checked")) {
    		 $("#allPos").prop("checked", true);
 	       	 	$("#st").prop("checked", false);
	       		$("#cm").prop("checked", false);
    	        $("#cb").prop("checked", false);
    	        $("#gk").prop("checked", false);
    	    } else {
    	    	$("#allPos").prop("checked", false);
    	    }
	
    	}
   
 	//=============================================================================================================================================================================================
    function everymoney()
  	{
     	 if ($("#nomatter").is(":checked")) {
              $("#free, #paid").prop("checked", false);
           }
  	}
    
    function moneycheck()
   	{
   	if ($("#free").is(":checked") && $("#paid").is(":checked")) {
   		 $("#nomatter").prop("checked", true);
   	        $("#free").prop("checked", false);
   	        $("#paid").prop("checked", false);
   	    } else {
   	    	$("#nomatter").prop("checked", false);
   	    }

   	}
    
   </script>
