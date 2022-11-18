<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="eduMap" value="${eduMap}" />
<c:set var="eduList" value="${eduMap.eduList }" />

<c:set var="crrMap" value="${crrMap}" />
<c:set var="crrList" value="${crrMap.crrList }" />

<c:set var="cerMap" value="${cerMap}" />
<c:set var="cerList" value="${cerMap.cerList }" />

<style>
.panel-content {
	width: 100%;
	height: 990px;
	overflow: hidden;
}
</style>

<div class="panel-content">
	<div>
		<div class="row">
			<div class="col-sm-12 d-flex">
				<div class="table-responsive" id="comManage" style="overflow: hidden">
					<div
						class="card-header py-2 d-flex align-items-center flex-wrap">
						<div class="card-title">기본정보</div>
						<button onclick="manage_rendering('comManage')"
							class="btn btn-xs btn-info ml-auto waves-effect waves-themed">
							나의 기본정보 수정하기</button>
					</div>
					<table class="table table-clean table-sm align-self-end" style="margin:40px 0px 40px 90px;">
						<tbody>
							<tr class="text-left">
								<td><strong>회사 이름:</strong></td>
								<td>${loginUser.coNm }</td>
								<td style="width: 100px;"></td>
								<td><strong>사업자 번호:</strong></td>
								<td>${loginUser.coRegNo }</td>
							</tr>
							<tr class="text-left">
								<td><strong>주소:</strong></td>
								<td>${loginUser.coAddr }</td>
								<td style="width: 100px;"></td>
								<td><strong>상세 주소:</strong></td>
								<td>${loginUser.coDeaddr }</td>
							</tr>
							<tr class="text-left">
								<td><strong>우편번호:</strong></td>
								<td>${loginUser.coAddrno}</td>
								<td style="width: 100px;"></td>
								<td><strong>홈페이지 주소:</strong></td>
								<td>${loginUser.coLink}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="table-responsive" id="licManage">
					<div
						class="card-header py-2 d-flex align-items-center flex-wrap">
						<div class="card-title">사업자등록증</div>
						<button onclick="manage_rendering('licManage')"
							class="btn btn-xs btn-info ml-auto waves-effect waves-themed">
							사업자 등록증 열람하기</button>
					</div>
				</div>
				<div class="table-responsive" id="autManage">
					<div class="card-header py-2 d-flex align-items-center flex-wrap">
						<div class="card-title">권한</div>
						<button onclick="manage_rendering('autManage')"
							class="btn btn-xs btn-info ml-auto waves-effect waves-themed">
							나의 권한 관리하기</button>
					</div>
					<table class="table" id="crrForm_section">
						<thead>
							<tr>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">업종</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">회사명</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">직무</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">직책</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">입사일</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">퇴사일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty crrList}">
								<tr>
									<td class="text-center fw-700" colspan="6">등록된 경력 정보가
										없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${crrList}" var="crr">
								<tr>
									<td class="text-center">${crr.crrSector}</td>
									<td class="text-center">${crr.crrCorname}</td>
									<td class="text-center">${crr.crrJob}</td>
									<td class="text-center">${crr.crrPosition}</td>
									<td class="text-center"><fmt:formatDate
											value="${crr.crrSdate }" pattern="yyyy-MM-dd" /></td>
									<td class="text-center"><fmt:formatDate
											value="${crr.crrEdate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="table-responsive" id="cerManage">
					<div class="card-header py-2 d-flex align-items-center flex-wrap">
						<div class="card-title">자격증</div>
						<button onclick="manage_rendering('cerManage')"
							class="btn btn-xs btn-info ml-auto waves-effect waves-themed">
							나의 자격증 관리하기</button>
					</div>
					<table class="table" id="cerForm_section">
						<thead>
							<tr>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">주최기관</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">자격증명</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">발급일</th>
								<th
									class="text-center border-top-0 table-scale-border-bottom fw-700">갱신일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty cerList}">
								<tr>
									<td class="text-center fw-700" colspan="4">등록된 자격증 정보가
										없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${cerList}" var="cer">
								<tr>
									<td class="text-center">${cer.cerHost}</td>
									<td class="text-center">${cer.cerName}</td>
									<td class="text-center"><fmt:formatDate
											value="${cer.cerSdate }" pattern="yyyy-MM-dd" /></td>
									<td class="text-center"><c:if
											test="${cer.cerEdate == null}">
											<span class="badge badge-info">유효기간없음</span>
										</c:if> <c:if test="${cer.cerEdate < today}">
											<span class="badge badge-danger"> 갱신기간만료</span>
										</c:if> <c:if test="${cer.cerEdate > today}">
											<fmt:formatDate value="${cer.cerEdate }" pattern="yyyy-MM-dd" />
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>
