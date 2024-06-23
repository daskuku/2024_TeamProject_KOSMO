<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html><html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
		<title>샘플 게시판</title>
		<script>
		
			$(function() {
				$(".keyword1,.keyword2").on('keypress', function(e) {
					if (e.keyCode == 13) {
						//$('.xxx').trigger('click');
						search();
					}
				});
			});
		
			function pageNoClick( clickPageNo ) {
				$("[name='sampleSearchForm']").find(".selectPageNo").val( clickPageNo );
				
				search();
			}
		
			function searchAll() {
				var sampleSearchFormObj 	= $("[name='sampleSearchForm']");
				sampleSearchFormObj.find(".keyword1,.keyword2").val("");
				sampleSearchFormObj.find(".date").prop("checked", false);
				sampleSearchFormObj.find(".sort").val("");
				sampleSearchFormObj.find(".selectPageNo").val("1");
				
				search();
			}
			
			function searchWithSort(sort) {
				$("[name='sampleSearchForm']").find("[name='sort']").val(sort);
				$(".searchButton").click();
			}
		
			function search() {
				var sampleSearchFormObj 	= $("[name='sampleSearchForm']");
				var keyword1Obj 		= sampleSearchFormObj.find(".keyword1");
				var keyword1 			= keyword1Obj.val();
				
				if ( typeof( keyword1 ) != 'string' ) { keyword1 = ""; }
				
				keyword1 = $.trim( keyword1 );
				keyword1Obj.val( keyword1 );
				
				var keyword2Obj 		= sampleSearchFormObj.find(".keyword2");
				var keyword2 			= keyword2Obj.val();
				
				if ( typeof( keyword2 ) != 'string' ) { keyword2 = ""; }
				
				keyword2 = $.trim( keyword2 );
				keyword2Obj.val( keyword2 );
				
				// 10, 15, 20 행 보기 
				var selectedRowCntPerPage = $("select").filter(".rowCntPerPage").val();
				var hiddenRowCntPerPageObj = sampleSearchFormObj.find(".rowCntPerPage");		
				hiddenRowCntPerPageObj.val( selectedRowCntPerPage );		
				
				$.ajax( {
						url 	:	 "/sampleList.controller"
					,	type 	:	 "post"
					,	data 	:	 sampleSearchFormObj.serialize( )
					,	success :	 function(responseHtml) {
							var obj = $(responseHtml);
							$(".sampleListDiv").html(obj.filter(".sampleListDiv").html());
							$(".listCounts").html(obj.find(".listCounts").html());
							$(".pagingNos").html(obj.find(".pagingNos").html());
						}
					,	error 	: 	function() {
							alert("검색 실패! 관리자에게 문의 바랍니다.");
						}
				} );
			}
			
			function goSampleDetailForm( b_no ) {
				$("[name='sampleDetailForm']").find("[name='b_no']").val( b_no );
				document.sampleDetailForm.submit();
			}
			
		</script>
	</head>
	
	<body>

		<form name="sampleSearchForm" onsubmit="return false;">
			<table align="center">
				<tr>
					<td>
						<table border="1" cellpadding="5" cellspacing="0">
							<caption><b>[검색조건]</b></caption>
							<tr>
								<th>키워드</th>
								<td>
									<input type="text" name="keyword1" class="keyword1" >
									<select name="orand">
										<option value="or">or</option>
										<option value="and">and</option>
									</select>
									<input type="text" name="keyword2" class="keyword2" >
								</td>
							</tr>						
						</table>
					</td>
				</tr>
				
				<tr align="center">
					<td>
						<input type="button" value="    검색    " class="searchButton" onclick="search( );">
						<input type="button" value="모두 검색" class="searchAllButton" onclick="searchAll( );">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="새글쓰기" onclick="location.replace('/sampleRegisterForm.controller');">					
						<div style="height: 10px;"></div>
					</td>
				</tr>
			</table>
	
			<input type="hidden" name="sort" class="sort" value="">
			<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" >
		</form>
		
		<center>
			<span class="listCounts">
				&nbsp;&nbsp;&nbsp;
				[${ requestScope.sampleListCount } / ${ requestScope.sampleListAllCount }] 개
			</span>

			&nbsp;&nbsp;
			<select name="rowCntPerPage" class="rowCntPerPage" onChange="search();">
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>&nbsp;행보기 &nbsp;&nbsp;&nbsp;
		</center>
			
		<div style="height:10px;"></div>	
		
		<div class="sampleListDiv">	
			<table class="sampleListTable" border="0" align="center" cellpadding="7">
				<tr>
					<th>번호</th>
					<th width="300">제목</th>
					<th width="150">글쓴이</th>

					<c:if test="${ param.sort != 'READCOUNT ASC' and param.sort != 'READCOUNT DESC' }">
						<th width="100" style="cursor: pointer;" onClick="searchWithSort('READCOUNT DESC');">조회수</th>
					</c:if>
									
					<c:if test="${ param.sort == 'READCOUNT DESC' }">				
						<th width="100" style="cursor: pointer;" onClick="searchWithSort('READCOUNT ASC');">조회수▼</th>
					</c:if>
									
					<c:if test="${ param.sort == 'READCOUNT ASC' }">				
						<th width="100" style="cursor: pointer;" onClick="searchWithSort('');">조회수▲</th>
					</c:if>
	
					<c:if test="${ param.sort != 'REG_DATE ASC' and param.sort != 'REG_DATE DESC' }">
						<th width="100" style="cursor: pointer;" onClick="searchWithSort('REG_DATE DESC');">등록일</th>
					</c:if>
					
					<c:if test="${ param.sort == 'REG_DATE DESC' }">				
						<th width="100" style="cursor: pointer;" onClick="searchWithSort('REG_DATE ASC');">등록일▼</th>
					</c:if>
					
					<c:if test="${ param.sort == 'REG_DATE ASC' }">				
						<th width="100" style="cursor: pointer;" onClick="searchWithSort('');">등록일▲</th>
					</c:if>				
				</tr>
				
				<c:if test="${ !empty requestScope.sampleList }">				
					<c:forEach var="sample" items="${ requestScope.sampleList }" varStatus="status">
						<tr style="cursor: pointer;" onClick="goSampleDetailForm( ${ sample.b_no } );">
							<td>${ requestScope.sampleMap.begin_serialNo_desc - status.index } </td>
							<td>${ sample.subject } [${ sample.comment_count }]</td>
							<td>${ sample.writer }</td>
							<td>${ sample.readcount }</td>
							<td>${ sample.reg_date }</td>
						</tr>
					</c:forEach>
					
					<c:forEach var="row" begin="${ requestScope.sampleShowListCount + 1 }" end="${ requestScope.sampleMap.rowCntPerPage }">
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</c:forEach>					
				</c:if>
				
				<c:if test="${ empty requestScope.sampleList }">
					<c:forEach var="row" begin="1" end="${ requestScope.sampleMap.rowCntPerPage }">
						<c:if test="${ requestScope.sampleMap.rowCntPerPage == 15 && row == 7 }">
							<tr>
								<td colspan="5" align="center">검색 조건에 맞는 결과물이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${ row == ( requestScope.sampleMap.rowCntPerPage / 2) }">
							<tr>
								<td colspan="5" align="center">검색 조건에 맞는 결과물이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:if test="${ row != ( requestScope.sampleMap.rowCntPerPage / 2) }">
							<tr>
								<td colspan="5">&nbsp;</td>
							</tr>
						</c:if>							
					</c:forEach>
				</c:if>
			</table>
			
			<div style="height:10px;"></div>
			
			<center>
				<span class="pagingNos">
					<span style="cursor:pointer;" onClick="pageNoClick( 1 );">[처음]</span>
					<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.sampleMap.selectPageNo } - 1 );">[이전]</span>
					&nbsp;&nbsp;
					
					<c:forEach var="pageNo" begin="${ requestScope.sampleMap.begin_pageNo }" end="${ requestScope.sampleMap.end_pageNo }">
						<c:if test="${ requestScope.sampleMap.selectPageNo == pageNo }">
							<span style="cursor:pointer" onClick="pageNoClick(${ pageNo });"><b><u>${ pageNo }</u></b></span>
						</c:if>
			
						<c:if test="${ requestScope.sampleMap.selectPageNo != pageNo }">
							<span style="cursor:pointer" onClick="pageNoClick(${ pageNo });">[${ pageNo }]</span>
						</c:if>
					</c:forEach>
					&nbsp;&nbsp;
					
					<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.sampleMap.selectPageNo } + 1 );">[다음]</span>
					<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.sampleMap.last_pageNo } );">[마지막]</span>
				</span>
			</center>
		</div>		
		
		<form name="sampleDetailForm" action="/sampleDetailForm.controller" method="post">
			<input type="hidden" name="b_no" >
		</form>
		
	</body>
</html>