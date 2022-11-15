<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="mentoringList" value="${dataMap.mentoringList }" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>
<%-- <c:set var="count" value="${dataMap.totalCnt }" /> --%>

<style>
img {
	height: 204px;
}


.card-body {
	display: block;
}

.card-title {
	width: 334px;
	height: 19.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.card-text {
	width: 334px;
	height: 19.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}


</style>

<main id="js-page-content" role="main" class="page-content">

	<div class="row">
		<div class="col-xl-12">
			<!-- Card decks -->
			<div id="panel-11" class="panel">
				<div class="panel-hdr">
					<h2>
						멘토링 <span class="fw-300"></span>
					</h2>
				</div>
				<div class="panel-container show">
					<div class="row" style="padding: 16px 32px 16px 32px;">
						<c:forEach items="${mentoringList}" var="mentoring">
							<div class="panel-content col-3">
								<div class="card-deck">
									<div class="card">
										<img src="<%=request.getContextPath()%>/resources/template/img/support/mentoring/회계.jpg" class="card-img-top" alt="...">
										<div class="card-body demo"style="height: 155.87px;">
											<h4 class="card-title" data-toggle="tooltip"
												data-placement="top" title=""
												data-original-title="${mentoring.menTitle }">${mentoring.menTitle }</h4>
											<div>
												<span class="card-text">
													멘토링 기간 : <fmt:formatDate value="${mentoring.menSdate }" pattern="yyyy-MM-dd" /> 
															~ <fmt:formatDate value="${mentoring.menEdate }" pattern="yyyy-MM-dd" />
												</span>
												<c:if
													test="${mentoring.menSdate > now}">
													<span class="badge badge-info badge-pill">모집중</span>
												</c:if>
												<c:if
													test="${mentoring.menSdate <= now and mentoring.menEdate >= now }">
													<span class="badge badge-success badge-pill">멘토링 진행중</span>
												</c:if>
												<c:if test="${mentoring.menEdate < now }">
													<span class="badge badge-secondary badge-pill">종료</span>
												</c:if>
											</div>
											<div style="text-align: center; ">
												<c:if test="${mentoring.menSdate > now }">
													<button class="btn btn-success btn-pills waves-effect waves-themed" type="button" id="detailBtn" onclick="OpenWindow('detail.do','멘토링 신청화면',990,920)">자세히 보기</button>
												</c:if>
											</div>
										</div>
										<div class="card-footer text-right">
											<div>
												<fmt:parseNumber value="${now.time /(1000*60*60*24) }" integerOnly="true" var="sysDate" />
												<fmt:parseNumber value="${(mentoring.menSdate.time /(1000*60*60*24)) }" integerOnly="true" var="menSD" />
												 <c:choose>
													<c:when test="${menSD-sysDate < 0 }">
														<span class="badge badge-secondary badge-pill">
															모집은 끝나써용!
														</span>
													</c:when>
													<c:when test="${menSD-sysDate == 0 }">
														<span class="badge badge-danger badge-pill">
															마감 D-day
														</span>
													</c:when>
													<c:when test="${menSD-sysDate < 4 and menSD-sysDate ne 0 }">
														<span class="badge badge-danger badge-pill">
															마감임박 D-${menSD-sysDate}
														</span>
													</c:when>
													<c:when test="${menSD-sysDate >= 4  }">
														<span class="badge badge-warning badge-pill">
															마감 D-${menSD-sysDate}
														</span>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
