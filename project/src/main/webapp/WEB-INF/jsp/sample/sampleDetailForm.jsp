<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html><html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
		<title>상세글</title>
	</head>



	<body>
		<c:if test="${ empty requestScope.sampleDTO }">
			<script>
				alert("게시판 글이 삭제되었습니다.");
				location.replace('/sampleList.controller');
			</script>
		</c:if>
	
		<c:if test="${ !empty requestScope.sampleDTO }">
			<table border="1" bordercolor="gray" align="center" cellpadding="7">
				<caption>[게시판 상세글 보기]</caption>
				<tr>
					<th bgColor="lightgray">이 름</th>
					<td>${ requestScope.sampleDTO.writer }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">제 목</th>
					<td>${ requestScope.sampleDTO.subject }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">조회수</th>
					<td>${ requestScope.sampleDTO.readcount }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">이메일</th>
					<td>${ requestScope.sampleDTO.email }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">내 용</th>
					<td>
						<textarea style="border:none;" name="content" class="content" rows="13" cols="40" maxlength="500" readonly>${ requestScope.sampleDTO.content }</textarea>
					</td>
				</tr>
				
				<c:if test="${ !empty requestScope.sampleDetailCommentList }">
					<tr>
						<td colspan="2">[댓글]</td>
					</tr>
					
					<c:forEach var="comment" items="${ requestScope.sampleDetailCommentList }" varStatus="status">
						<tr>
							<td>${ comment.writer } (${ comment.reg_date })</td>
							<td>
								<textarea style="border:none;" rows="1" cols="40" maxlength="500" readonly>${ comment.content }</textarea>
							</td>
						</tr>
					</c:forEach>	
				</c:if>
			</table>			
			
			<div style="height:5px;"></div>
			
			<center>
				<span style="cursor: pointer;" onclick="location.replace('/sampleList.controller')">[목록 화면으로]</span>
				<input type="button" value="수정/삭제" onclick="document.sampleDetailUpdateDeleteForm.submit();">
				<input type="button" value="댓글쓰기" onclick="document.sampleRegisterForm.submit();">
			</center>
			
			<form name="sampleDetailUpdateDeleteForm" action="/sampleDetailUpdateDeleteForm.controller" method="post">
				<input type="hidden" name="b_no" value="${ requestScope.sampleDTO.b_no }">
			</form>
			
			<form name="sampleRegisterForm" action="/sampleRegisterForm.controller" method="post">
				<input type="hidden" name="b_no" value="${ requestScope.sampleDTO.b_no }">
			</form>
		</c:if>
		
	</body>
</html>