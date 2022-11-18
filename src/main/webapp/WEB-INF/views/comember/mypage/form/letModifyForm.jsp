<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="let" value="${letter}" />

<tbody>
	<c:if test="${empty letter}">
		<tr>
			<td class="text-center fw-700" colspan="5">선택한 자기소개서에 대한 정보가 없습니다.</td>
		</tr>
	</c:if>
	<tr class="w-100">
		</td>
		<td class="text-center">
			<div class="form-group">
				<div class="input-group-append">
					<input type="hidden" class="form-control" id="letSeqno" name="letSeqno" value="${let.letSeqno}">
					<select class="custom-select" style="width:150px;"
						id="letNo" name="letNo">
						<option value="${let.letNo}">현재 순번: ${let.letNo}</option>
						<option value="1">변경: 1</option>
						<option value="2">변경: 2</option>
						<option value="3">변경: 3</option>
						<option value="4">변경: 4</option>
						<option value="5">변경: 5</option>
						<option value="6">변경: 6</option>
						<option value="7">변경: 7</option>
						<option value="8">변경: 8</option>
						<option value="9">변경: 9</option>
						<option value="10">변경: 10</option>
					</select>
					<input id="letTitle" name="letTitle" type="text" class="form-control"
						aria-label="Example text with two button addons"
						aria-describedby="button-addon3" value="${let.letTitle}">
					<select class="custom-select" style="width:150px;"
						id="letIsnav" name="letIsnav">
						<option value="${let.letIsnav}">공개여부</option>
						<option value="1">공개</option>
						<option value="0">비공개</option>
					</select>
					<button class="btn btn-outline-success waves-effect waves-themed" style="width:150px;"
			       			type="button" name="letModifySubmit" id="letModifySubmit" onclick="modify_submit('letForm')">제출하기</button>
				</div>
			</div>
		</td>
	</tr>
	<tr class="w-100">
		<td class="text-center" colspan="6">
			<div class="form-group">
				<div class="input-group">
					<textarea class="custom-scroll form-control" id="letContent" name="letContent"
						aria-label="With textarea" style="height: 335px;">${let.letContent}</textarea>
				</div>
			</div>
		<td>
	</tr>
</tbody>

<!-- <table class="w-100">
<form class="needs-validation" novalidate="" method="post" id="letForm">
	<tbody>
		<tr>
			<td class="text-center">
				<label class="form-label" for="">
					<b>게시 순번</b><span class="text-danger">*</span>
				</label>
				<select class="custom-select"
					id="eduDep" name="eduDep">
					<option>순번 선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
			</td>
			<td class="text-center">
				<div class="form-group">
					<label class="form-label" for="">
						<b>제목</b><span class="text-danger">*</span>
					</label>
					<div class="input-group">
						<input id="button-addon3" type="text" class="form-control"
							placeholder="두괄식으로 명료하게 제목을 표현해보세요."
							aria-label="Example text with two button addons"
							aria-describedby="button-addon3">
						<div class="input-group-append">
							<button class="regist_load btn btn-outline-default waves-effect waves-themed"
									name="letForm" type="button">제출하기</button>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td class="text-center" colspan="2">
				<div class="form-group">
					<label class="form-label" for="">
						<b>내용</b><span class="text-danger">*</span>
					</label>
					<div class="input-group">
						<textarea class="custom-scroll form-control" id="" name="" aria-label="With textarea" style="height:290px;"
								  placeholder="글자 수 제한은 없습니다. 마음껏 자신을 표현하세요."></textarea>
					</div>
				</div>
			<td>
		</tr>
	</tbody>
</form>
</table> -->
<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>