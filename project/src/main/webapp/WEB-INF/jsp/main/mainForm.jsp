<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainForm</title>
<link href="/style/main/mainFormStyle.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0 "></script>
<script src="/js/main/mainFormScript.js"></script>
<!-- 지역 차트 함수 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {
    'packages':['geochart'],
    });
    google.charts.setOnLoadCallback(drawRecordsStatisticsRegionRatioChart);

    function drawRecordsStatisticsRegionRatioChart() {
        var data = google.visualization.arrayToDataTable([
            ['Region', 'Popularity'],
            <c:forEach var="regionRatio" items="${requestScope.regionRatio}" varStatus="status">
	            ['서울', ${regionRatio.count_seoul}],
	            ['경기도', ${regionRatio.count_gyeonggido}],
	            ['KR-28', ${regionRatio.count_gyeonggido}],
	            ['강원도', ${regionRatio.count_gangwondo}],
	            ['충청남도', ${regionRatio.count_chungcheongdo}],
	            ['충청북도', ${regionRatio.count_chungcheongdo}],
	            ['KR-30', ${regionRatio.count_chungcheongdo}],
	            ['전라남도', ${regionRatio.count_jeollado}],
	            ['전라북도', ${regionRatio.count_jeollado}],
	            ['KR-29', ${regionRatio.count_jeollado}],
	            ['경상남도', ${regionRatio.count_gyeongsangdo}],
	            ['경상북도', ${regionRatio.count_gyeongsangdo}],
	            ['KR-27', ${regionRatio.count_gyeongsangdo}],
	            ['KR-26', ${regionRatio.count_gyeongsangdo}],
	            ['KR-31', ${regionRatio.count_gyeongsangdo}],
	            ['제주도', ${regionRatio.count_jejudo}]
	    	</c:forEach>
        ]);

        var options = {
            region: 'KR',
            displayMode: 'regions',
            resolution: 'provinces',
            colorAxis: { minValue: 0 },
            title: '지역별 이용자 수',
            backgroundColor: "#F5F5F5"
        };

        var chart = new google.visualization.GeoChart(document.getElementById('recordsStatisticsRegionRatio'));

        chart.draw(data, options);
    }
</script>

<!-- 성별 차트 함수 -->

<script>
  var genderData = [
    <c:forEach var="genderRatio" items="${requestScope.genderRatio}">
      { label: '남', count: ${genderRatio.count_men} },
      { label: '여', count: ${genderRatio.count_women} }
      <c:if test="${!status.last}">,</c:if>
    </c:forEach>
  ];
</script>

<script>
  document.addEventListener('DOMContentLoaded', (event) => {
    // genderLabels와 genderCounts 배열을 생성합니다.
    const genderLabels = genderData.map(data => data.label);
    const genderCounts = genderData.map(data => data.count);

    const ctx1 = document.getElementById('recordsStatisticsGenderRatio').getContext('2d');
  
    const recordsStatisticsGenderRatio = new Chart(ctx1, {
      type: 'doughnut',
      data: {
        datasets: [{
          data: genderCounts, // 'count_men', 'count_women' 등의 값을 배열로 만듭니다.
          backgroundColor: [
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 99, 132, 0.6)'
          ],
          
          borderWidth: 1,
          hoverOffset: 50,
          datalabels: {
        	  align: 'center',
              anchor: 'center'
          }
        }]
      },
      options: {
    	 responsive: false,
        plugins: {
          legend: {
            display: true,
            position: 'right',
            labels: {
              color: 'black',
              font: {
                size: 14
              }
            }
          },
          tooltip: {
            enabled: true,
            backgroundColor: 'rgba(0, 0, 0, 0.7)',
            titleColor: 'white',
            bodyColor: 'white',
            borderColor: 'white',
            borderWidth: 1
          }
        },
        animation: {
          animateScale: true,
          animateRotate: true
        },
        layout: {
          padding: {
            left: 20,
            right: 20,
            top: 20,
            bottom: 20
          }
        }
      }
    });
  });
</script>

<!-- 연령별 차트 함수 -->

<script>
  var ageData = [
    <c:forEach var="ageRatio" items="${requestScope.ageRatio}">
      { label: '10대', count: ${ageRatio.count_10} },
      { label: '20대', count: ${ageRatio.count_20} },
      { label: '30대', count: ${ageRatio.count_30} },
      { label: '40대', count: ${ageRatio.count_40} },
      { label: '50대', count: ${ageRatio.count_50} },
      { label: '60대', count: ${ageRatio.count_60} },
      { label: '70대', count: ${ageRatio.count_70} },
      { label: '80대', count: ${ageRatio.count_80} }
      <c:if test="${!status.last}">,</c:if>
    </c:forEach>
  ];
</script>
<script>
  document.addEventListener('DOMContentLoaded', (event) => {
	const ageLabels = ageData.map(data => data.label);  
    const ageCounts = ageData.map(data => data.count);

    const ctx1 = document.getElementById('recordsStatisticsAgeRatio').getContext('2d');
  
    const recordsStatisticsAgeRatio = new Chart(ctx1, {
      type: 'bar',
      data: {
        labels: ageLabels, // 수정된 부분: labels 속성에는 데이터 레이블을 설정합니다.
        datasets: [{
          data: ageCounts,
          backgroundColor: [
            'red',
            'orange',
            'yellow',
            'green',
            'blue',
            'navy',
            'purple',
            'pink'
          ],
          borderWidth: 1,
          hoverOffset: 50
        }]
      },
      options: {
        responsive: false,
        plugins: {
          legend: {
            display: false,
            position: 'right',
            labels: {
              color: 'black',
              font: {
                size: 14
              }
            }
          },
          tooltip: {
            enabled: true,
            backgroundColor: 'rgba(0, 0, 0, 0.7)',
            titleColor: 'white',
            bodyColor: 'white',
            borderColor: 'white',
            borderWidth: 1
          }
        },
        animation: {
          animateScale: true,
          animateRotate: true
        },
        layout: {
          padding: {
            left: 20,
            right: 20,
            top: 20,
            bottom: 20
          }
        }
      }
    });
  });
</script>
</head>
<body>
<!-- push 테스트 -->
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="mainFormContainer">
		<div class="section" id="sectionMain">
			<div class="sectionMainTextDiv">
				<div class="sectionMainText" id="sectionMainText_1">FOOTBALL LEAGUE</div>
				<br>
				<div class="sectionMainText" id="sectionMainText_2">2024 생활체육 축구 매칭</div>
				<br>
				<div class="sectionMainText" id="sectionMainText_3">축구 매칭과 함께하는 내게 맞는 팀 구성</div>
				<br>
				<div class="sectionMainText" id="sectionMainText_4">"Coding 247"</div>
			</div>
			<div class="sectionMainImageDiv">
				<img src="/image/mainPageBackgroundImage.jpg">
			</div>
		</div>
		<div class="section" id="sectionStatistics">
			<div class="sectionStatisticsTitle">
				<strong>Statistics</strong>
			</div>
			<div class="sectionStatisticsContainer">
				<div class="recordsStatisticsRegionRatioContainer">
			        <div class="recordsStatisticsRegionRatioTitle"><p>지역별 비율</p></div>
			        <div id="recordsStatisticsRegionRatio" style="width: 500px; height: 500px;"></div>
			    </div>
			    <div class="recordsStatisticsGenderRatioContainer" style="position: relative;">
			        <div class="recordsStatisticsGenderRatioTitle"><p>성별 비율</p></div>
			        <!-- <div id="recordsStatisticsGenderRatio" style="width: 50%; height: 600px; margin: 0 auto; margin-left:580px;"></div> -->
			        <canvas id="recordsStatisticsGenderRatio" width="450" height="450" style="text-align: center; margin: 0 auto;"></canvas>
			        <div style="position: absolute; bottom: 32%; left: 62%; color: #FFFFFF; font-weight: bold; font-size: 16px;">
			        	<c:forEach var="genderRatio" items="${requestScope.genderRatio}" varStatus="status">
					        <script>
					            var menPercentage = ${(genderRatio.count_men / (genderRatio.count_men + genderRatio.count_women)) * 100};
					            menPercentage = parseFloat(menPercentage.toFixed(3));
					
					            document.write(menPercentage + "%");
					        </script>
					    </c:forEach>
			        </div>
			        <div style="position: absolute; bottom: 65%; left: 25%; color: #FFFFFF; font-weight: bold; font-size: 16px;">
			        	<c:forEach var="genderRatio" items="${requestScope.genderRatio}" varStatus="status">
					        <script>
					            var menPercentage = ${(genderRatio.count_women / (genderRatio.count_men + genderRatio.count_women)) * 100};
					            menPercentage = parseFloat(menPercentage.toFixed(3));
					
					            document.write(menPercentage + "%");
					        </script>
					    </c:forEach>
			        </div>
			        <div style="margin-left: 20px;">
				    	<div style="display: flex; justify-content: center;">
					    	<div style="width: 50px; height: 30px; background-color: rgba(54, 162, 235, 0.6); border-radius: 15px;"></div>
					    	<div style="align-content: center; padding-left: 10px; font-weight: bold; margin-right: 30px;">
					    		: 남자
					    	</div>
					    	<div style="width: 50px; height: 30px; background-color: rgba(255, 99, 132, 0.6); border-radius: 15px;"></div>
					    	<div style="align-content: center; padding-left: 10px; font-weight: bold;">
					    		: 여자
					    	</div>
					    </div>
				    </div>
			    </div>
			    <!-- <div>
			    	<div style="display: flex; justify-content: center;">
				    	<div style="width: 50px; height: 30px; background-color: rgba(54, 162, 235, 0.6); border-radius: 15px;"></div>
				    	<div style="align-content: center; padding-left: 10px; font-weight: bold; margin-right: 30px;">
				    		: 남자
				    	</div>
				    	<div style="width: 50px; height: 30px; background-color: rgba(255, 99, 132, 0.6); border-radius: 15px;"></div>
				    	<div style="align-content: center; padding-left: 10px; font-weight: bold;">
				    		: 여자
				    	</div>
				    </div>
			    	
			    </div> -->
			    <div class="recordsStatisticsAgeRatioContainer" style="position: relative;">
			        <div class="recordsStatisticsAgeRatioTitle"><p>연령별 비율</p></div>
			        <!-- <div id="recordsStatisticsAgeRatio" style="width: 50%; height: 300px; margin: 0 auto;"></div> -->
			        <canvas id="recordsStatisticsAgeRatio" width="600" height="400" style="text-align: center; margin: 0 auto;"></canvas>
			        <div style="position: absolute; color: black; font-weight: bold; font-size: 16px;">
			        	<c:forEach var="ageRatio" items="${requestScope.ageRatio}" varStatus="status">
					        <script>
					            var 10Percentage = ${(ageRatio.count_10 / (ageRatio.count_10 + ageRatio.count_20 + ageRatio.count_30 + ageRatio.count_40 + ageRatio.count_50 + ageRatio.count_60 + ageRatio.count_70 + ageRatio.count_80)) * 100};
					            10Percentage = parseFloat(10Percentage.toFixed(3));
					
					            document.write(10Percentage + "%");
					        </script>
					    </c:forEach>
			        </div>
			        <div style="position: absolute; color: #000000; font-weight: bold; font-size: 16px;">
			        	<c:forEach var="ageRatio" items="${requestScope.ageRatio}" varStatus="status">
					        <script>
					            var 20Percentage = ${(ageRatio.count_20 / (ageRatio.count_10 + ageRatio.count_20 + ageRatio.count_30 + ageRatio.count_40 + ageRatio.count_50 + ageRatio.count_60 + ageRatio.count_70 + ageRatio.count_80)) * 100};
					            20Percentage = parseFloat(20Percentage.toFixed(3));
					
					            document.write(20Percentage + "%");
					        </script>
					    </c:forEach>
			        </div>
			    </div>
			</div>
		</div>
		<div class="section" id="sectionRanking">
			<div class="sectionRankingTitle">
				<strong>Ranking</strong>
			</div>
			<div class="sectionRankingContiner">
				<div class="recordsRankingFormCategoryTab">
			    	<ul class="recordsRankingFormCategoryTabNav">
				    	<li><a href="#recordsRankingFormCategoryTabAll">전체 순위</a></li>
				    	<li><a href="#recordsRankingFormCategoryTabRegion">지역별 순위</a> <!-- ajax로 지역 구분 -->
				    		<div class="recordsRankingFormCategoryTabSelectDiv">
						    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse">
						    		<!-- <tr align="center">
						    			<td class="region selected" onClick="searchRegion(9)">서울</td>
						    			<td class="region" onClick="searchRegion(2, 11)">경기/인천</td>
						    			<td class="region" onClick="searchRegion(1)">강원</td>
						    			<td class="region" onClick="searchRegion(7, 15, 16)">충청</td>
						    		</tr>
						    		<tr align="center">
						    			<td class="region" onClick="searchRegion(5, 12, 13)">전라</td>
						    			<td class="region" onClick="searchRegion(3, 4, 6, 8, 10)">경상</td>
						    			<td class="region" onClick="searchRegion(14)">제주</td>
						    		</tr> -->
						    		<tr align="center">
						    			<td class="region selected" onClick="searchRegion(9)">서울</td>
						    			<td class="region" onClick="searchRegion(2)">경기/인천</td>
						    			<td class="region" onClick="searchRegion(1)">강원</td>
						    			<td class="region" onClick="searchRegion(7)">충청</td>
						    		</tr>
						    		<tr align="center">
						    			<td class="region" onClick="searchRegion(5)">전라</td>
						    			<td class="region" onClick="searchRegion(3)">경상</td>
						    			<td class="region" onClick="searchRegion(14)">제주</td>
						    		</tr>
						    	</table>
						    </div>
					    </li>
				    	<li><a href="#recordsRankingFormCategoryTabGender">성별 순위</a> <!-- ajax로 남/녀 구분 -->
				    		<div class="recordsRankingFormCategoryTabSelectDiv">
						    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse; width: 100%;">
						    		<tr>
						    			<td class="gender selected" onClick="searchGender('남')" style="width: 50%; text-align: center;">남</td>
						    			<td class="gender" onClick="searchGender('여')" style="width: 50%; text-align: center;">여</td>
						    		</tr>
						    	</table>
						    </div>
					    </li>
				    	<li><a href="#recordsRankingFormCategoryTabAge">연령대별 순위</a> <!-- ajax로 연령대 구분 -->
				    		<div class="recordsRankingFormCategoryTabSelectDiv">
						    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse">
						    		<tr>
						    			<td class="age selected" onClick="searchAge('10대')">10대</td>
						    			<td class="age" onClick="searchAge('20대')">20대</td>
						    			<td class="age" onClick="searchAge('30대')">30대</td>
						    			<td class="age" onClick="searchAge('40대')">40대</td>
						    		</tr>
						    		<tr>
						    			<td class="age" onClick="searchAge('50대')">50대</td>
						    			<td class="age" onClick="searchAge('60대')">60대</td>
						    			<td class="age" onClick="searchAge('70대')">70대</td>
						    			<td class="age" onClick="searchAge('80대')">80대</td>
						    		</tr>
						    	</table>
						    </div>
					    </li>
				    </ul>
				    <div class="recordsRankingFormCategoryTabContent">
				    	<div id="recordsRankingFormCategoryTabAll">
						    <div class="recordsRankingFormTabAllRating">
							    <table class="recordsRankingFormTabAllGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabAll" items="${requestScope.recordsWinRatingTabAll}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsGoalRatingTabAll.nickname}</td>
								    		<td>${recordsGoalRatingTabAll.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAllWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabAll" items="${requestScope.recordsGoalRatingTabAll}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsWinRatingTabAll.nickname}</td>
								    		<td>${recordsWinRatingTabAll.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAllAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabAll" items="${requestScope.recordsAssistRatingTabAll}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsAssistRatingTabAll.nickname}</td>
								    		<td>${recordsAssistRatingTabAll.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<!-- --------------------------------------------지      역      별      순      위----------------------------------------------- -->
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<div id="recordsRankingFormCategoryTabRegion">
						    <div class="recordsRankingFormTabRegionRating">
							    <table class="recordsRankingFormTabRegionWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabRegion" items="${requestScope.recordsWinRatingTabRegion}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsGoalRatingTabRegion.nickname}</td>
								    		<td>${recordsGoalRatingTabRegion.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabRegionGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabRegion" items="${requestScope.recordsGoalRatingTabRegion}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsWinRatingTabRegion.nickname}</td>
								    		<td>${recordsWinRatingTabRegion.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabRegionAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabRegion" items="${requestScope.recordsAssistRatingTabRegion}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsAssistRatingTabRegion.nickname}</td>
								    		<td>${recordsAssistRatingTabRegion.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<!-- -------------------------------------------------성      별      순      위------------------------------------------------- -->
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<div id="recordsRankingFormCategoryTabGender">
						    <div class="recordsRankingFormTabGenderRating">
							    <table class="recordsRankingFormTabGenderWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabGender" items="${requestScope.recordsWinRatingTabGender}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsGoalRatingTabGender.nickname}</td>
								    		<td>${recordsGoalRatingTabGender.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabGenderGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabGender" items="${requestScope.recordsGoalRatingTabGender}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsWinRatingTabGender.nickname}</td>
								    		<td>${recordsWinRatingTabGender.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabGenderAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabGender" items="${requestScope.recordsAssistRatingTabGender}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsAssistRatingTabGender.nickname}</td>
								    		<td>${recordsAssistRatingTabGender.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<!-- --------------------------------------------연      령      별      순      위----------------------------------------------- -->
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<div id="recordsRankingFormCategoryTabAge">
						    <div class="recordsRankingFormTabAgeRating">
							    <table class="recordsRankingFormTabAgeWinRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabAge" items="${requestScope.recordsWinRatingTabAge}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsGoalRatingTabAge.nickname}</td>
								    		<td>${recordsGoalRatingTabAge.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAgeGoalRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabAge" items="${requestScope.recordsGoalRatingTabAge}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsWinRatingTabAge.nickname}</td>
								    		<td>${recordsWinRatingTabAge.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAgeAssistRating" cellpadding="7" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2" style="background-color: #c59246e0; border-radius: 10px; color: #FFFFFF;">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabAge" items="${requestScope.recordsAssistRatingTabAge}" varStatus="status" begin="0" end="2">
								    	<tr style="border-bottom: 1px solid #c59246e0;">
								    		<td>${recordsAssistRatingTabAge.nickname}</td>
								    		<td>${recordsAssistRatingTabAge.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section" id="sectionSchedule">
			<div class="sectionScheduleTitle">
				<strong>Schedule</strong>
			</div>
			<div class="regionlist">
				<div class="sectionScheduleContainer">
					<c:forEach var="mainTournamentList" items="${requestScope.mainTournamentList}" varStatus="status">
						<c:if test="${mainTournamentList.imagename != null}">
							<div class="sectionScheduleFormBoard">
								<c:if test="${mainTournamentList.imagename != null}">
									<div class="sectionScheduleFormBoardImageDiv">
										<img src="/image/tournamentImg/${mainTournamentList.imagename}" class="sectionScheduleImage">
									</div>
								</c:if>
								<c:if test="${mainTournamentList.imagename == null}">
									<div class="sectionScheduleFormBoardImageDiv">
										<img src="/image/noImage.png" class="sectionScheduleImage" style="width:250px; height:200px;">
									</div>
								</c:if>
								<div class="sectionScheduleFormBoardSubject">${mainTournamentList.subject}</div>
								<div class="sectionScheduleFormBoardRegion"><b style="font-size: 16px; margin-right: 20px; text-decoration: underline; text-underline-position: under;">대회 지역</b>${mainTournamentList.region}</div>
								<div class="sectionScheduleFormBoardRegist"><b style="font-size: 16px; margin-right: 20px; text-decoration: underline; text-underline-position: under;">신청 기간</b>${mainTournamentList.regist_start} ~ ${mainTournamentList.regist_end}</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div> 
		</div>
		<div class="section" id="sectionMedia">
			<div class="sectionMediaGallaryTitle">
				<strong>Gallary</strong>
			</div>
			<div class="sectionMediaGallaryContainer">
				<c:forEach var="imageboard" items="${requestScope.imageBoardList}" varStatus="status">
					<div class="sectionMediaGallaryFormBoard">
						<c:if test="${imageboard.imagename != null}">
							<div class="sectionMediaGallaryImageDiv">
								<img src="/image/gallaryImg/${imageboard.imagename}" class="sectionMediaGallaryImage">
							</div>
						</c:if>
						<c:if test="${imageboard.imagename == null}">
							<div class="sectionMediaGallaryImageDiv">
								<img src="/image/noImage.png" class="sectionMediaGallaryImage" style="width:250px; height:200px;">
							</div>
						</c:if>
						<div class="sectionMediaGallarySubject">${imageboard.subject}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="section" id="sectionFooter">
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
		</div>
	</div>
</body>
</html>