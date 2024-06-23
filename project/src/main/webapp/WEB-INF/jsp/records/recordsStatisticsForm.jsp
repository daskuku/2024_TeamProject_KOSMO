<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecordsStatisticsForm</title>
<link href="/style/records/recordsStatisticsFormStyle.css" rel="stylesheet">
<!-- <script src="/js/recordsStatisticsFormScript.js"></script> -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- 연도별 매칭 횟수 차트 함수 -->

<!-- <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsMatchingSuccessRateChart);

    function drawRecordsStatisticsMatchingSuccessRateChart() {
        var data = google.visualization.arrayToDataTable([
        ['연도', '매칭 횟수'],
        ['2013',  0],
        ['2014',  0],
        ['2015',  0],
        ['2016',  0]
        ]);

        var options = {
        };

        var chart = new google.visualization.AreaChart(document.getElementById('recordsStatisticsMatchingSuccessRate'));
        chart.draw(data, options);
    }
</script> -->

<!-- 연도별 등록 회원 차트 함수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsAnnualRegisteredMemberRatioChart);
    function drawRecordsStatisticsAnnualRegisteredMemberRatioChart() {
    var data = google.visualization.arrayToDataTable([
        ["연도", "회원 수", { role: "style" } ],
        <c:forEach var="annualRegisteredMember" items="${requestScope.annualRegisteredMember}" varStatus="status">
	        ["2000", ${annualRegisteredMember.count_2000}, "red"],
	        ["2005", ${annualRegisteredMember.count_2005}, "orange"],
	        ["2010", ${annualRegisteredMember.count_2010}, "yellow"],
	        ["2015", ${annualRegisteredMember.count_2015}, "green"],
	        ["2020", ${annualRegisteredMember.count_2020}, "blue"],
	        ["2024", ${annualRegisteredMember.count_2024}, "navy"]
		</c:forEach>
    ]);

    var options = {
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsAnnualRegisteredMemberRatio"));
    chart.draw(data, options);
    }
</script>

<!-- 지역 차트 함수 -->

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
            title: '지역별 이용자 수'
        };

        var chart = new google.visualization.GeoChart(document.getElementById('recordsStatisticsRegionRatio'));

        chart.draw(data, options);
    }
</script>

<!-- 성별 차트 함수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawRecordsStatisticsGenderRatioChart);
    function drawRecordsStatisticsGenderRatioChart() {
    var data = google.visualization.arrayToDataTable([
        ['Gender', '회원 수'],
        <c:forEach var="genderRatio" items="${requestScope.genderRatio}" varStatus="status">
	        ['남', ${genderRatio.count_men}],
	        ['여', ${genderRatio.count_women}]
	    </c:forEach>
    ]);

    var options = {
        is3D: true
    };

    var chart = new google.visualization.PieChart(document.getElementById('recordsStatisticsGenderRatio'));
    chart.draw(data, options);
    }
</script>

<!-- 연령별 차트 함수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsAgeRatioChart);
    function drawRecordsStatisticsAgeRatioChart() {
    var data = google.visualization.arrayToDataTable([
        ["연령대", "회원 수", { role: "style" } ],
        <c:forEach var="ageRatio" items="${requestScope.ageRatio}" varStatus="status">
	        ["10대", ${ageRatio.count_10}, "red"],
	        ["20대", ${ageRatio.count_20}, "orange"],
	        ["30대", ${ageRatio.count_30}, "yellow"],
	        ["40대", ${ageRatio.count_40}, "green"],
	        ["50대", ${ageRatio.count_50}, "blue"],
	        ["60대", ${ageRatio.count_60}, "navy"],
	        ["70대", ${ageRatio.count_70}, "purple"],
	        ["80대", ${ageRatio.count_80}, "blue"]
	   	</c:forEach>
    ]);

    var options = {
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsAgeRatio"));
    chart.draw(data, options);
    }
</script>

<!-- 팀 별 인원수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsNumberOfTeamMemberChart);
    function drawRecordsStatisticsNumberOfTeamMemberChart() {
    var data = google.visualization.arrayToDataTable([
        ["팀", "팀원 수"],
        <c:forEach var="teamMemberCnt" items="${requestScope.teamMemberCnt}" varStatus="status">
	        ["${teamMemberCnt.teamname}", ${teamMemberCnt.count_team}],
	    </c:forEach>
    ]);

    var options = {
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsNumberOfTeamMember"));
    chart.draw(data, options);
    }
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recordsStatisticsFormTitle">
    	<p class="titleBackgoundText">통계</p>
    </div>
    <!-- <div class="recordsStatisticsMatchingSuccessRateContainer">
        <div class="recordsStatisticsMatchingSuccessRateTitle"><p>연도별 매칭 횟수</p></div>
        <div id="recordsStatisticsMatchingSuccessRate" style="width: 100%; height: 500px;"></div>
    </div> -->
    <div class="recordsStatisticsAnnualRegisteredMemberRatioContainer">
        <div class="recordsStatisticsAnnualRegisteredMemberRatioTitle"><p style="padding-top: 10px;">연도별 회원 등록 비율</p></div>
        <div id="recordsStatisticsAnnualRegisteredMemberRatio" style="width: 50%; height: 300px; margin: 0 auto;"></div>
    </div>
    <div class="recordsStatisticsRegionRatioContainer">
        <div class="recordsStatisticsRegionRatioTitle"><p style="padding-top: 10px;">지역별 비율</p></div>
        <div id="recordsStatisticsRegionRatio" style="width: 50%; height: 500px; margin: 0 auto;"></div>
    </div>
    <div class="recordsStatisticsGenderRatioContainer">
        <div class="recordsStatisticsGenderRatioTitle"><p style="padding-top: 10px;">성별 비율</p></div>
        <div id="recordsStatisticsGenderRatio" style="width: 50%; height: 600px; margin: 0 auto; margin-left:580px;"></div>
    </div>
    <div class="recordsStatisticsAgeRatioContainer">
        <div class="recordsStatisticsAgeRatioTitle"><p style="padding-top: 10px;">연령별 비율</p></div>
        <div id="recordsStatisticsAgeRatio" style="width: 50%; height: 300px; margin: 0 auto;"></div>
    </div>
    <div class="recordsStatisticsNumberOfTeamMemberContainer">
        <div class="recordsStatisticsNumberOfTeamMemberTitle"><p style="padding-top: 10px;">팀원 수</p></div>
        <div id="recordsStatisticsNumberOfTeamMember" style="width: 50%; height: 300px; margin: 0 auto;"></div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>