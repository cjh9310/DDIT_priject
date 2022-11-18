<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="letMap" value="${letMap}" />
<c:set var="letterList" value="${letMap.letterList}" />

<style>
.custom-scrollbar {
	width: 100%;
	height: 431px;
	overflow: auto;
}
</style>

<div id="panel-1" class="panel">
	<div class="panel-hdr">
		<h2>문서 관리 중</h2>
		<div class="panel-toolbar ml-2">
			<button onclick="registForm_load('attRegistForm')"
				class="btn btn-xs btn-icon width-1 fs-xl btn-info ml-auto waves-effect waves-themed">
				<i class="fal fa-plus"></i>
			</button>
			<button
				onclick="location.href='<%=request.getContextPath()%>/indmember/mypage/resume.do'"
				class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-1 waves-effect waves-themed">
				<i class="fal fa-reply"></i>
			</button>
		</div>
	</div>
	<div>
		<div class="col-xl-12 panel panel-content" style="padding: 0px;">
			<div class="custom-scroll">
				<div class="p-3">
					<form class="needs-validation" novalidate="" method="post" id="letForm">
						<table class="table" id="letForm_section">
							<thead>
								<tr>
									<th class="text-center border-top-0 table-scale-border-bottom fw-700">번호</th>
									<th class="text-center border-top-0 table-scale-border-bottom fw-700">제목</th>
									<th class="text-center border-top-0 table-scale-border-bottom fw-700">첨부파일</th>
									<th class="text-center border-top-0 table-scale-border-bottom fw-700">등록일</th>
									<th class="text-center border-top-0 table-scale-border-bottom fw-700">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty docList}">
									<tr>
										<td class="text-center fw-700" colspan="5">등록된 문서가
											없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${letterList}" var="let">
									<tr>
										<td class="text-center">${let.letNo}</td>
										<td class="text-center">${let.letTitle}</td>
										<td class="text-center">
											<c:if test="${let.letIsnav == 0}">
												<span class="badge badge-danger">비공개</span>
											</c:if> <c:if test="${let.letIsnav == 1}">
												<span class="badge badge-info">공개중</span>
											</c:if></td>
										<td class="text-center">
											<button type="button" value="${let.letSeqno}" id="letModify"
												name="letModifyForm"
												class="modifyForm_load btn btn-xs btn-icon width-1 fs-xl btn-success ml-1 waves-effect waves-themed">
												<i class="fal fa-pen"></i>
											</button>
											<button type="button" value="${let.letSeqno}" id="letRemove"
												name="letManage"
												class="remove_load btn btn-xs btn-icon width-1 fs-xl btn-danger ml-1 waves-effect waves-themed">
												<i class="fal fa-times"></i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>
