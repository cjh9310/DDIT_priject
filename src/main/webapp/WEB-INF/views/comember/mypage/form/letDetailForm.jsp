<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="let" value="${letter}" />

<tbody>
	<tr class="w-100">
		</td>
		<td class="text-center">
			<div class="form-group">
				<div class="input-group-append">
					<input readonly id="letTitle" name="letTitle" type="text" class="form-control"
						aria-label="Example text with two button addons"
						aria-describedby="button-addon3" placeholder="${let.letTitle}">
					<button style="width:37.1px;"
						onclick="location.href='<%=request.getContextPath()%>/indmember/mypage/resume.do'"
						class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-1 waves-effect waves-themed">
						<i class="fal fa-reply"></i>
					</button>
				</div>
			</div>
		</td>
	</tr>
	<tr class="w-100">
		<td class="text-center" colspan="6">
			<div class="form-group">
				<div class="input-group">
					<textarea readonly class="custom-scroll form-control" id="letContent" name="letContent"
						aria-label="With textarea" style="height: 335px;" placeholder="${let.letContent}"></textarea>
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