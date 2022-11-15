<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tbody>
	<tr class="w-100">
		</td>
		<td class="text-center">
			<div class="form-group">
				<div class="input-group-append">
					<select class="custom-select" style="width:150px;"
						id="letNo" name="letNo">
						<option>순번 선택</option>
						<option value="1">순번: 1</option>
						<option value="2">순번: 2</option>
						<option value="3">순번: 3</option>
						<option value="4">순번: 4</option>
						<option value="5">순번: 5</option>
						<option value="6">순번: 6</option>
						<option value="7">순번: 7</option>
						<option value="8">순번: 8</option>
						<option value="9">순번: 9</option>
						<option value="10">순번: 10</option>
					</select>
					<input id="letTitle" name="letTitle" type="text" class="form-control"
						placeholder="두괄식으로 명료하게 제목을 표현해보세요."
						aria-label="Example text with two button addons"
						aria-describedby="button-addon3">
					<select class="custom-select" style="width:150px;"
						id="letIsnav" name="letIsnav">
						<option>공개여부</option>
						<option value="1">공개</option>
						<option value="0">비공개</option>
					</select>
					<button class="regist_load btn btn-outline-success waves-effect waves-themed" style="width:150px;" 
			        name="letForm" type="button">제출하기</button>
				</div>
			</div>
		</td>
	</tr>
	<tr class="w-100">
		<td class="text-center" colspan="6">
			<div class="form-group">
				<div class="input-group">
					<textarea class="custom-scroll form-control" id="letContent" name="letContent"
						aria-label="With textarea" style="height: 335px;"
						placeholder="글자 수 제한은 없습니다. 마음껏 자신을 표현하세요."></textarea>
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
<%@ include file="/WEB-INF/views/indmember/indmember_js.jsp"%>